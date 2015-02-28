
import ddf.minim.*;
import ddf.minim.signals.*;

int y1=600;
int y2=0;
int a=0;
int b=0;
int c=0;
int d=0;
int a1=-1;
int b1=1;
int c1=1;
int d1=1;
int sun=0;
int sun2=255;
int bang=-1;
int blink=0;

float valley;

void setup()
{

  size(600, 600);
  background(#81DCFF);
   frameRate(100);
   Minim miaudio; 

AudioPlayer miReproductor;
miaudio= new Minim(this);
miReproductor= miaudio.loadFile("Here Comes The Sun.wav");

miReproductor.play();

miaudio.stop();
}
void draw(){

//valley

valley+=.01;
for(int i=0;i<3;i++){
for(float x=1;x<width;x++){stroke(200-i*50);
stroke(random(0),random(255),random(70));
line(x,height,x,height-noise(10*i+valley+x/width)*(height-10*i));
}

  //guy1 blue
  fill(255,217,155);
  stroke(0);
ellipse(71,363,80,84);//cara
fill(0);
ellipse(71,351,10,10);//ojos
ellipse(98,351,10,10);
fill(0,0,255);
rect(50,400,46,98);//cuerpo
fill(255,217,155);
ellipse(31,453,25,25);//manitas
ellipse(112,450,25,25);
//girl1 pink
fill(255,217,155);
ellipse(157,365,80,84);//cara
ellipse(202,385,25,25);
fill(0,0,255);
ellipse(152,346,10,10);//ojos
ellipse(182,346,10,10);
fill(255,155,199);
rect(130,400,46,98);//cuerpo
triangle(134,329,108,333,126,353);
ellipse(143,321,22,22);
triangle(152,314,178,310,162,290);

 fill(#FA9B00);
  ellipse(a, b, c, d);
  sun=sun-bang;
  sun2=sun2+bang;
  a=a-a1;
  b=b+b1;
  c=c+c1;
  d=d+d1;
  if (b>600)
  {
    a1=-1;
  }
  if (a>300)
  {
    c1=-1;
    d1=-1;
    bang=1;
}

if (a<300)
  {
    c1=1;
    d1=1;
bang=-1;
  }
  if (a>600)
  {
    a1=1; 
    b1=-1;
  }
  if (a<0)
  {
    a1=-1;
    b1=1;
  }
  fill(#81DCFF);
  stroke(#81DCFF);
  ellipse(-30+a, -30+b, 30, 45-blink);
ellipse(30+a, -30+b, 30, 45);
bezier(-90+a, 50+b, -50+a, 100+b, 50+a, 100+b, 90+a, 50+b);


}
}
