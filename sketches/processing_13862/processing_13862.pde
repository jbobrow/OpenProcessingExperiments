
int[]x= new int[8];
int[]y= { 
  10,90,160,220,270,310,340,360
};
color[] tone=new color[8];


int diameter;
void setup(){
  x[0]=0;
  x[1]=0;
  x[2]=0;
  x[3]=0;
  x[4]=0;
  x[5]=0;
  x[6]=0;
  x[7]=0;
  diameter=290;
  size (800,400);
  tone[0]=color(118,115,16);
  tone[1]=color(14,118,81);
  tone[2]=color(14,102,118);
  tone[3]=color(70,15,160);
  tone[4]=color(91,13,160);
  tone[5]=color(199,0,255);
  tone[6]=color(255,0,200);
  tone[7]=color(10,1,8);
}


void draw (){
  background(28,10,242);



  for(int i = 0; i<8; i++){
    x[i]=400+i;
    fill(tone [i]);
    ellipse(x[i],y[i],diameter,diameter);


  }
}


