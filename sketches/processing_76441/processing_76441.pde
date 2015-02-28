
float  angle;
float radii;
int i ;
int y=0;

void setup() {
  
  size(800,800);
  smooth();
  background(255,141,54);
  angle=10;
  stroke(255); strokeWeight(.01);
  colorMode(HSB, 360,100,100,100);
  radii=20;
  
}

void draw (){

burgers();
drawSpiral();

}



 void drawSpiral() { 


float bgcolor= abs(255*sin(radians(angle)));
fill(36,30,10);
//background (bgcolor);
noStroke();
float x = radii*cos(radians(angle));
float y = radii*sin( radians(angle));

radii+= .5;
if (mousePressed) {
  
ellipse(width/2+x,height/2+y,20,20); 

}

else {
  fill(37,63,185);
  rect(width/2+x-10,height/2+y-10,20,20);
}
angle+=137.5;


beginShape();
for (int i=0; i <7;i++);
float angle = i+60;
endShape();


 }
 
 
 
 
 void burgers(){
   stroke(37,66,203);
   strokeWeight(1);
  line (0, y, width,y);
  y += 5;
  noStroke();
 
 }
   
   
 


