
int i=0,x=9;textFont(createFont("",x));byte[] s=loadBytes("../q.pde");for(;i<120;i++)text((char)s[i],i%16*6,(1+i/16)*x);
