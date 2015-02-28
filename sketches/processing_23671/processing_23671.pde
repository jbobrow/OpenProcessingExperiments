
float x, y, z, angle, radius;

void setup(){
  background(233);
  size(700,700);
  frameRate(30);
  smooth();
}

void draw(){ 
  constrain(x, 1, 700);
  constrain(y, 1, 700);
  constrain(angle, 0, 360);
x=sin(radians(angle))*100+width/2;
y= cos(radians(angle))*100 +height/2;

noFill();
ellipse(x, y, 10+radius, 10-angle+x);
beginShape();
vertex(x, y); 
vertex(angle+20, y+radius);
vertex(angle+y, radius+x);
 endShape();
  angle++;
radius+=.5;
if(x<=360){
  stroke(0, 44);
  ellipse(x, radius,20,30);
}
if(y%2==0)
stroke(255,255,25, 33);
fill(255, 63);
text("trigonometry", x-radius, radius+y);
}


