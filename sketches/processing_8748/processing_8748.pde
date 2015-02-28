
float increment = -11.5;
int lighter1 = 140;
float facemove = -9;
int darker2 = 0;
int lighter3 = 0;
int darker3= 100;
boolean button = false;
int x21 = 130;
int x22 = 370;
int x31 = 10;
int x32 =250;
int x33 = 490;
int y1 = 40;
int y2 = 229;
int y3 = 418;

void setup() {
  size(1000,800);
  smooth();
} 

void draw() {
  background(0);

  increment = constrain (increment, -11.5, 11.5);
  lighter1 = constrain(lighter1,0,120);
  darker2 = constrain(darker2,0,100);
  darker3 = constrain(darker3,0, 100);
  lighter3 = constrain(lighter3,0,120);

 if(button) {
    increment+=.2;  
    darker2+=1.5;
    lighter1-=1.5;
    darker3-=1.5;
    lighter3+=1.5;
  } 
  else {
    increment -=.2;
    darker2-=1.5;
    lighter1+=1.5;
    darker3+=1.5;
    lighter3-=1.5;
  }
  
//yellow/green
largeCube(x21,y1,1.0,   255,255,0+lighter1,  0+lighter1,255,0+lighter1,  255-darker2,250-darker2,0,   0,255-darker2,0,  255-darker3,255-darker3,0+lighter3,  0+lighter3,255-darker3,0+lighter3);
smallCube(x21+40,y1-34,-1.0,   255-darker2,255-darker2,0,  0,255-darker2,0,  255,250,0+lighter1,   0+lighter1,255,0+lighter1,  255-darker3,255-darker3,0+lighter3,  0+lighter3,255-darker3,0+lighter3);
  
//green/blue
largeCube(x31,y2,1.0,   0+lighter1,255,0+lighter1,  0+lighter1,0+lighter1,255,  0,250-darker2,0,   0,0,255-darker2,  0+lighter3,255-darker3,0+lighter3,  0+lighter3,0+lighter3,255-darker3);
smallCube(x31+40,y2-34,-1.0,   0,250-darker2,0,   0,0,255-darker2,  0+lighter1,255,0+lighter1,  0+lighter1,0+lighter1,255,  0+lighter3,255-darker3,0+lighter3,  0+lighter3,0+lighter3,255-darker3);

//blue/purple
largeCube(x33,y2,1.0,   0+lighter1,0+lighter1,255,  255,0+lighter1,255,   0,0,255-darker2,  255-darker2,0,250-darker2,  0+lighter3,0+lighter3,255-darker3,   255-darker3,0+lighter3,255-darker3);
smallCube(x33+40,y2-34,-1.0,   0,0,255-darker2,  255-darker2,0,250-darker2,  0+lighter1,0+lighter1,255,  255,0+lighter1,255,   0+lighter3,0+lighter3,255-darker3,   255-darker3,0+lighter3,255-darker3);

//purple/red
largeCube(x21,y3,1.0,  255,0+lighter1,255,  255,0+lighter1,0+lighter1,  255-darker2,0,250-darker2,   255-darker2,0,0,  255-darker3,0+lighter3,255-darker3,  255-darker3,0+lighter3,0+lighter3);
smallCube(x21+40,y3-34,-1.0,  255-darker2,0,250-darker2,   255-darker2,0,0,  255,0+lighter1,255,  255,0+lighter1,0+lighter1,  255-darker3,0+lighter3,255-darker3,  255-darker3,0+lighter3,0+lighter3);

//red/orange
largeCube(x32,y2,1.0,  255,0+lighter1,0+lighter1,  255,127+(lighter1/2),0+lighter1,  255-darker2,0,0,  255-darker2,127-(darker2/2),0,   255-darker3,0+lighter3,0+lighter3,  255-darker3,127+(lighter3/2),0+lighter3);
smallCube(x32+40,y2-34,-1.0,  255-darker2,0,0,  255-darker2,127-(darker2/2),0,   255,0+lighter1,0+lighter1,  255,127+(lighter1/2),0+lighter1,  255-darker3,0+lighter3,0+lighter3,  255-darker3,127+(lighter3/2),0+lighter3);

//orange/yellow
largeCube(x22,y1,1.0,  255,127+(lighter1/2),0+lighter1,  255,255,0+lighter1,  255-darker2,127-(darker2/2),0,   255-darker2,255-darker2,0,  255-darker3,127+(lighter3/2),0+lighter3,  255-darker3,255-darker3,0+lighter3);
smallCube(x22+40,y1-34,-1.0,  255-darker2,127-(darker2/2),0,   255-darker2,255-darker2,0,  255,127+(lighter1/2),0+lighter1,  255,255,0+lighter1,  255-darker3,127+(lighter3/2),0+lighter3,  255-darker3,255-darker3,0+lighter3);

//yellow/green
largeCube(x22,y3,1.0,   255,255,0+lighter1,  0+lighter1,255,0+lighter1,  255-darker2,250-darker2,0,   0,255-darker2,0,  255-darker3,255-darker3,0+lighter3,  0+lighter3,255-darker3,0+lighter3);
smallCube(x22+40,y3-34,-1.0,   255-darker2,255-darker2,0,  0,255-darker2,0,  255,250,0+lighter1,   0+lighter1,255,0+lighter1,  255-darker3,255-darker3,0+lighter3,  0+lighter3,255-darker3,0+lighter3);
}

void largeCube(int x, float y, float i, int pr1, int pg1, int pbl1, int br1, int bg1, int bbl1, int pr2, int pg2, int pbl2, int br2, int bg2, int bbl2, int pr3, int pg3, int pbl3, int br3, int bg3, int bbl3 ) {
   
color p1 = color(pr1,pg1,pbl1);
color b1 = color(br1, bg1, bbl1);
color p2 = color(pr2,pg2,pbl2);
color b2 = color(br2,bg2,bbl2);
color p3 = color(pr3,pg3,pbl3);
color b3 = color(br3,bg3,bbl3);

  pushMatrix();
  translate(x+280, y-7);
  rotate(PI/3.0);

  face3(110,230,130,-11.7,1,p3,b3);
  popMatrix();

  pushMatrix();
  translate(x+280, y-126);
  rotate(PI/3.0);

  face3(110,230,130,-11.4,1,p3,b3);
  popMatrix();
  
 pushMatrix();
 translate(x, y);
  face1(110,220,130,i,b1,p1);
  face2(110,220,250,i,p2,b2);
 popMatrix();


}

void smallCube(int x, float y, float i, int pr1, int pg1, int pbl1, int br1, int bg1, int bbl1, int pr2, int pg2, int pbl2, int br2, int bg2, int bbl2, int pr3, int pg3, int pbl3, int br3, int bg3, int bbl3 ) {
   
   if (button) {
     y+=9;
   }
   
color p1 = color(pr1,pg1,pbl1);
color b1 = color(br1, bg1, bbl1);
color p2 = color(pr2,pg2,pbl2);
color b2 = color(br2,bg2,bbl2);
color p3 = color(pr3,pg3,pbl3);
color b3 = color(br3,bg3,bbl3);

  pushMatrix();
  translate(x+283, y+1);
  rotate(PI/3.0);

  smface3(160,230,130,-11.7,1,p3,b3);
  popMatrix();

  pushMatrix();
  translate(x+283, y-79);
  rotate(PI/3.0);

  smface3(160,230,130,-11.4,1,p3,b3);
  popMatrix();
  
 pushMatrix();
 translate(x, y);
  smface1(160,220,130,i,b1,p1);
  smface2(160,220,170,i,p2,b2);
 popMatrix();


}



void face1(int f, int h, int x, float i, color c1, color c2 ) {
  row(f,h,x,0,x+20,i*increment,i*increment+20,20,c1,40);
  row(f+20,h,x,0,x+20,i*increment,i*increment+20,20,c2,40);
  row(f,h,x+20,i*increment,x+40,i*increment*2,20+i*increment*2,20+i*increment,c2,40);
  row(f+20,h,x+20,i*increment,x+40,i*increment*2,20+i*increment*2,20+i*increment,c1,40);
  row(f,h,x+40,i*increment*2,x+60,i*increment*3,20+i*increment*3,20+i*increment*2,c1,40);
  row(f+20,h,x+40,i*increment*2,x+60,i*increment*3,20+i*increment*3,20+i*increment*2,c2,40);
  row(f,h,x+60,i*increment*3,x+80,i*increment*4,20+i*increment*4,20+i*increment*3,c2,40);
  row(f+20,h,x+60,i*increment*3,x+80,i*increment*4,20+i*increment*4,20+i*increment*3,c1,40);
  row(f,h,x+80,i*increment*4,x+100,i*increment*5,20+i*increment*5,20+i*increment*4,c1,40);
  row(f+20,h,x+80,i*increment*4,x+100,i*increment*5,20+i*increment*5,20+i*increment*4,c2,40);
  row(f,h,x+100,i*increment*5,x+120,i*increment*6,20+i*increment*6,20+i*increment*5,c2,40);
  row(f+20,h,x+100,i*increment*5,x+120,i*increment*6,20+i*increment*6,20+i*increment*5,c1,40);
}

void face2(int f, int h, int x, float i, color c1, color c2 ) {
  row(f,h,x+100,i*increment,x+120,0,0+20,20+i*increment,c1,40);
  row(f+20,h,x+100,i*increment,x+120,0,0+20,20+i*increment,c2,40);
  row(f,h,x+80,i*increment*2,x+100,i*increment,20+i*increment,20+i*increment*2,c2,40);
  row(f+20,h,x+80,i*increment*2,x+100,i*increment,20+i*increment,20+i*increment*2,c1,40);
  row(f,h,x+60,i*increment*3,x+80,i*increment*2,20+i*increment*2,20+i*increment*3,c1,40);
  row(f+20,h,x+60,i*increment*3,x+80,i*increment*2,20+i*increment*2,20+i*increment*3,c2,40);
  row(f,h,x+40,i*increment*4,x+60,i*increment*3,20+i*increment*3,20+i*increment*4,c2,40);
  row(f+20,h,x+40,i*increment*4,x+60,i*increment*3,20+i*increment*3,20+i*increment*4,c1,40);
  row(f,h,x+20,i*increment*5,x+40,i*increment*4,20+i*increment*4,20+i*increment*5,c1,40);
  row(f+20,h,x+20,i*increment*5,x+40,i*increment*4,20+i*increment*4,20+i*increment*5,c2,40);
  row(f,h,x,i*increment*6,x+20,i*increment*5,20+i*increment*5,20+i*increment*6,c2,40);
  row(f+20,h,x,i*increment*6,x+20,i*increment*5,20+i*increment*5,20+i*increment*6,c1,40);
}

void face3(int f, int h, int x, float ang, float i, color c1, color c2 ) {
  row(f,h,x,0,x+20,i*ang,i*ang+26.5,26.5,c1,46);
  row(f+20,h,x,0,x+20,i*ang,i*ang+26.5,26.5,c2,46);
  row(f,h,x+20,i*ang,x+40,i*ang*2,26.5+i*ang*2,26.5+i*ang,c2,46);
  row(f+20,h,x+20,i*ang,x+40,i*ang*2,26.5+i*ang*2,26.5+i*ang,c1,46);
  row(f,h,x+40,i*ang*2,x+60,i*ang*3,26.5+i*ang*3,26.5+i*ang*2,c1,46);
  row(f+20,h,x+40,i*ang*2,x+60,i*ang*3,26.5+i*ang*3,26.5+i*ang*2,c2,46);
  row(f,h,x+60,i*ang*3,x+80,i*ang*4,26.5+i*ang*4,26.5+i*ang*3,c2,46);
  row(f+20,h,x+60,i*ang*3,x+80,i*ang*4,26.5+i*ang*4,26.5+i*ang*3,c1,46);
  row(f,h,x+80,i*ang*4,x+100,i*ang*5,26.5+i*ang*5,26.5+i*ang*4,c1,46);
  row(f+20,h,x+80,i*ang*4,x+100,i*ang*5,26.5+i*ang*5,26.5+i*ang*4,c2,46);
  row(f,h,x+100,i*ang*5,x+120,i*ang*6,26.5+i*ang*6,26.5+i*ang*5,c2,46);
  row(f+20,h,x+100,i*ang*5,x+120,i*ang*6,26.5+i*ang*6,26.5+i*ang*5,c1,46); 
}

void smface1(int f, int h, int x, float i, color c1, color c2 ) {
  row(f,h,x,0,x+20,i*increment,i*increment+20,20,c1,40);
  row(f+20,h,x,0,x+20,i*increment,i*increment+20,20,c2,40);
  row(f,h,x+20,i*increment,x+40,i*increment*2,20+i*increment*2,20+i*increment,c2,40);
  row(f+20,h,x+20,i*increment,x+40,i*increment*2,20+i*increment*2,20+i*increment,c1,40);
  row(f,h,x+40,i*increment*2,x+60,i*increment*3,20+i*increment*3,20+i*increment*2,c1,40);
  row(f+20,h,x+40,i*increment*2,x+60,i*increment*3,20+i*increment*3,20+i*increment*2,c2,40);
  row(f,h,x+60,i*increment*3,x+80,i*increment*4,20+i*increment*4,20+i*increment*3,c2,40);
  row(f+20,h,x+60,i*increment*3,x+80,i*increment*4,20+i*increment*4,20+i*increment*3,c1,40);
}

void smface2(int f, int h, int x, float i, color c1, color c2 ) {
  row(f,h,x+100,i*increment,x+120,0,0+20,20+i*increment,c1,40);
  row(f+20,h,x+100,i*increment,x+120,0,0+20,20+i*increment,c2,40);
  row(f,h,x+80,i*increment*2,x+100,i*increment,20+i*increment,20+i*increment*2,c2,40);
  row(f+20,h,x+80,i*increment*2,x+100,i*increment,20+i*increment,20+i*increment*2,c1,40);
  row(f,h,x+60,i*increment*3,x+80,i*increment*2,20+i*increment*2,20+i*increment*3,c1,40);
  row(f+20,h,x+60,i*increment*3,x+80,i*increment*2,20+i*increment*2,20+i*increment*3,c2,40);
  row(f,h,x+40,i*increment*4,x+60,i*increment*3,20+i*increment*3,20+i*increment*4,c2,40);
  row(f+20,h,x+40,i*increment*4,x+60,i*increment*3,20+i*increment*3,20+i*increment*4,c1,40);
}

void smface3(int f, int h, int x, float ang, float i, color c1, color c2 ) {
  row(f,h,x,0,x+20,i*ang,i*ang+26.5,26.5,c1,46);
  row(f+20,h,x,0,x+20,i*ang,i*ang+26.5,26.5,c2,46);
  row(f,h,x+20,i*ang,x+40,i*ang*2,26.5+i*ang*2,26.5+i*ang,c2,46);
  row(f+20,h,x+20,i*ang,x+40,i*ang*2,26.5+i*ang*2,26.5+i*ang,c1,46);
  row(f,h,x+40,i*ang*2,x+60,i*ang*3,26.5+i*ang*3,26.5+i*ang*2,c1,46);
  row(f+20,h,x+40,i*ang*2,x+60,i*ang*3,26.5+i*ang*3,26.5+i*ang*2,c2,46);
  row(f,h,x+60,i*ang*3,x+80,i*ang*4,26.5+i*ang*4,26.5+i*ang*3,c2,46);
  row(f+20,h,x+60,i*ang*3,x+80,i*ang*4,26.5+i*ang*4,26.5+i*ang*3,c1,46);
}


void row(int forv, int form, int x1, float y1, int x2, float y2, float y3, float y4, color c, int spacey ){
  for(int yspace = forv; yspace <=form; yspace+=spacey) {
    square(x1,yspace+y1,x2,yspace+y2, yspace+y3, yspace+y4, c);
  }
}

void square(int x1, float y1, int x2, float y2, float y3, float y4, color c) {
  noStroke();
  fill(c);
  quad(x1,y1,x2,y2,x2,y3,x1,y4);
}

void mousePressed() {
  button = !button;
}




