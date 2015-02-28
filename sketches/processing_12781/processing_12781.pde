
//Assignment #3
//Name: Janielle Vidal
//E-mail: jvidal@brynmawr.edu
//Date: September 23,2010

float x = 300;
float y = 100;
float w = 400;
float h = 400;
float a= 25;
float r= 50;
float b;
float c;
float s= 6;
float mouse1= mouseX;
float mouse2= mouseY;
float rd;
float g;
float t;
float al;

void setup(){
  size (600,600);
  smooth();
  frameRate(10);
  background(41,5,64);
}

//Adinkrahene
void drawAdinkrahene(float mouse1, float mouse2, float b, float c){
  rd=random(255);
  g=random(255);
  t=random(255);
  al=random(255);
  b= random(1,80);
  c= random(1,25);
  fill(rd,g,t,al);
  stroke(0,0,0,al);
  strokeWeight(10);
  ellipse(mouse1,mouse2,b,b);
  ellipse(mouse1,mouse2,b-(1.3*c),b-(1.3*c));
  ellipse(mouse1,mouse2,b-(2.6*c),b-(2.6*c));
}
void mousePressed(){
  drawAdinkrahene(mouseX,mouseY,b,c);
}

void draw() {
  // Osram Ne Nsoromma
  
      //Crescent
  fill(0);
  noStroke();
  arc(x,(2*y),w, h,0,PI);
  fill(41,5,64);
  arc(x,y+r+a,w,h-(2*a),0, PI);
      // Circles
  fill(0);
  ellipse(x,(2*y), w-x, h-x);
  fill(245,198,7);
  ellipse(x,(2*y),w -(x+a), h-(x+a));
  
      // Arms
  stroke(0);
  strokeWeight(5);  
  line(x-r,(2*y),x-(1.5*r),(2*y));
  line(x,(2*y)-r, x,(2*y)-(1.5*r));
  line((x+r),(2*y),(x+1.5*r),(2*y));
  line(x,(2*y)+r,x,(2*y)+(1.5*r));
  line((x-(1.5*a)),(1.65*y),(y+(2.8*r)),(y+2*a));
  line((x+(1.3*a)),(1.68*y),(x+(1.1*r)),(y+(1.8*a)));
  line((x+(0.6*r)),(2.3*y),(x+r),(2.55*y));
  line(((x-1.1*a)),(2.3*y),(x-(2*a)),(y+(6.25*a)));
  
  stroke(0,255,0);
  ellipse(x-(1.5*r),(2*y),s,s);
  stroke(255,0,0);
  ellipse(x,(2*y)-(1.5*r),s,s);
  stroke(0,255,0);
  ellipse((x+1.5*r),(2*y),s,s);
  stroke(255,0,0);
  ellipse(x,(2*y)+(1.5*r),s,s);
  stroke(0,255,0);
  ellipse(y+(2.8*r),(y+(2*a)),s,s);
  stroke(255,0,0);
  ellipse(x+(1.1*r),y+(1.8*a),s,s);
  stroke(0,255,0);
  ellipse(x+r,(2.55*y),s,s);
  stroke(255,0,0);
  ellipse((x-(2*a)),(y+(6.25*a)),s,s);
  noFill();
}


