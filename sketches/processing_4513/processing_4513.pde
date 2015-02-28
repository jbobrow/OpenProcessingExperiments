
U u;
void draw(){u=new U();u.start();}
class U extends Thread{
void run(){byte b[]=loadBytes("http://"+r()+"."+r()+"."+r()+"."+r()+":80/don't_forget_me");}
int r(){return int(random(0,256));}
} 

