
class Drop{
  int x,y,d,z,onde,d1,oldY;
  float acc;
  boolean s;

  Drop(int x,int y, int z, int d){ // x start, y start, y end ,width of ellipse
    this.x=x;
    this.y=y;
    this.d=d;
    this.z=z;
    onde=0;
    d1=d;
    acc=0;
    oldY=y;
    s=true;
  }

  void fall(){
    if(y>0)acc+=0.1;
    stroke(255,255,255,map(z,0,height,0,255));
    strokeWeight(2);
    if (y<z){
      y=int(y+2+acc);
      line(x,oldY,x,y);
      s=true;
      oldY=y;
    }
    else{
      noFill();
      stroke(255,255,255,255-map(onde,0,d,0,255));
      strokeWeight(map(onde,0,d,0,4));
      if(s==true){
        ch++;
        ch=ch%9;
        sc.channel(ch);
        sc.pan(int(map(x,0,width,left,right))); 
        sc.instrument(instr);
        sc.playNote(map(x,0,width,pitch,pitch+32), map(y,0,height,0,127), 0.2);
      }
      s=false;
      d=d1+(y-height)*4;
      ellipse(x,y,onde/5,onde/20);
      onde=onde+8;
      if(onde>d){
        onde=0;
        acc=0;
        x=int(random(width));
        y=-int(random(height*2));
        oldY=y;
        d=d1;
      }
    }
  }
}



