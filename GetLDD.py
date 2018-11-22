#!/usr/bin/env python2.7
# 用来找程序的依赖链,写的时候为了制作一个执行程序的最小docker镜像
import commands
import Queue


class LibFind(object):
    def __init__(self, lib_list):
        self.q = Queue.Queue()
        self.used = {}
        for lib in lib_list:
            x = self._get_name(lib)
            # print(x)
            self.q.put([x,lib])
    
    def _get_name(self, lib_path):
        return lib_path.split("/")[-1].split(" ")[0]

    def get_ldd(self, lib_path):
        _name = self._get_name(lib_path)
        if self.used.get(_name, None) is not None:
            return
        self.used.update({_name:lib_path})
        cmd = "ldd {0}".format(lib_path)
        x = commands.getoutput(cmd)
        for i in x.split("\n"):
            if ("=>" not in i or "/" not in i):
                continue
            p = i.split(" => ")
            name = p[0][1::]
            path = p[1].split(" ")[0]

            self.q.put([name, path])
    
    def run(self):
        while not self.q.empty():
            lib = self.q.get()
            print(lib[-1])
            self.get_ldd(lib[-1])
        
        # print(self.used)
        commands.getoutput("touch /tmp/cp.sh /tmp/mv.sh")
        with open("/tmp/cp.sh", "w") as f:
            for i in self.used.keys():
                v = self.used.get(i)
                cmd = "cp {0} /tmp/lib/{1}\n".format(v,i)
                f.writelines(cmd)

        with open("/tmp/mv.sh", "w") as f:
            for i in self.used.keys():
                v = self.used.get(i)
                cmd = "cp {0} {1}\n".format(i,v)
                f.writelines(cmd)

if __name__ == "__main__":
    lib_list  = [x for x in commands.getoutput("ldd ~/docker/DynamicFusion4D").split("\n") if ("=>" in x and "/" in x)]
    p = []
    for x in lib_list:
        path = x.split(" => ")[1].split(" ")[0]
        p.append(path)
    


    p = LibFind(p)
    p.run()
            








