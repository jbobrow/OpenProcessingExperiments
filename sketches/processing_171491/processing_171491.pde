
PFont Helvetica;

float x = 100;
float speedx = 3;
float y = 100;
float speedy = 3;

float a = 100;
float speeda = 3;
float b = 100;
float speedb = 3;

float c = 100;
float speedc = 3;
float d = 100;
float speedd = 3;

float e = 100;
float speede = 3;
float f = 100;
float speedf = 3;

float g = 100;
float speedg = 3;
float h = 100;
float speedh = 3;


void setup () {
  
  size (500,500); 
  
  Helvetica = loadFont("HelveticaNeue-Thin-50.vlw");

}

void draw () {
background(220);
textSize(40);

text("W",x,y);
text("O",a,b);
text("O",c,d);
text("O",e,f);
text("W",g,h);



x = x + speedx;
 y = y - speedy;

a = a + speeda;
 b = b - speedb;
 
 c = c + speedc;
 d = d - speedd;

 e = e + speede;
 f = f - speedf;

 g = g + speedg;
 h = h - speedh;

if(x<25){
  speedx = random(5);
}
if(x>475){
  speedx = -random(5);

}
if(y<25){
  speedy= -random(5);
}
if(y> 475){
  speedy = random(5);
}

if(a<25){
  speeda = random(5);
}
if(a>475){
  speeda = -random(5);

}
if(b<25){
  speedb= -random(5);
}
if(b> 475){
  speedb = random(5);
}

if(c<25){
  speedc = random(5);
}
if(c>475){
  speedc = -random(5);

}
if(d<25){
  speedd= -random(5);
}
if(d> 475){
  speedd = random(5);
}

if(e<25){
  speede = random(5);
}
if(e>475){
  speede = -random(5);

}
if(f<25){
  speedf= -random(5);
}
if(f> 475){
  speedf = random(5);
}

if(g<25){
  speedg = random(5);
}
if(g>475){
  speedg = -random(5);

}
if(h<25){
  speedh= -random(5);
}
if(h> 475){
  speedh = random(5);
}

if (mousePressed) {

  
  x = 180;
  y = 250;
  a = 200;
  b = 250;
  c = 220;
  d = 250;
  e = 240;
  f = 250;
  g = 260;
  h = 250;

} 


}
