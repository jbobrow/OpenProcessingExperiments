
float x=0;
float y=0;
float r=0;
float o=0;
float z=240;
void setup() {
size(600,600);
background(100);
colorMode(HSB);

}
void draw() {
translate(300,300);
rotate(o);
 
ellipse(0,0,r*100,10);
translate(0,0);
//fill(200,o,0);

//ellipse(100*sin(x*o)+100,0,20,10);
o= o - (PI/90);
//ellipse(100*(cos(x*o)+1),0,20,10);

//ellipse( function r=(o),0,w,h);

ellipse(100*(cos(x*o)+2),0,30,10);
}
void keyPressed(){
  //background(100);
  if(key=='0'){x=0;
fill(0,z,z);}
  if(key=='1'){x=1;
fill(16,z,z);}
  if(key=='2'){x=2;
fill(32,z,z);}
  if(key=='3'){x=3;
fill(48,z,z);}
  if(key=='4'){x=4;
fill(64,z,z);}
  if(key=='5'){x=5;
fill(80,z,z);}
  if(key=='6'){x=6;
fill(96,z,z);}
  if(key=='7'){x=7;
fill(112,z,z);}
  if(key=='8'){x=8;
fill(128,z,z);}
  if(key=='9'){x=9;
fill(144,z,z);}
  if(key==')'){x=10;
fill(160,z,z);}
  if(key=='!'){x=11;
fill(176,z,z);}
  if(key=='@'){x=12;
fill(192,z,z);}
  if(key=='#'){x=13;
fill(208,z,z);}
  if(key=='$'){x=14;
fill(224,z,z);}
  if(key=='%'){x=15;
fill(240,z,z);}
  
  if(key==' '){background(100);}
}
