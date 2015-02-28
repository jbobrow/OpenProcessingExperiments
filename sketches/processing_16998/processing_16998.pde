
float theta = PI/16;
float rotaz = degrees(theta);
float r;
float g;
float b;

void setup(){
size(400,400);
smooth();
background(0);
}

void draw(){
fill(0,50);
rect(0,0,width,height);
translate(width/2, height/2);
r = random(0,255);
g = random(0,255);
b = random(0,255);
fill(r,g,b,50);
stroke(0,20);
float raggio = 10;
theta = theta + 0.0001;
for ( int angolo = 0; angolo < 360*60; angolo += 12){
     for ( float c = 5; c < 130 ; c = random(5, 140)){
float rad = degrees(angolo);
float x = (cos(rad)) * raggio;
float y = (sin(rad)) * raggio;
rotate(theta);
  ellipse ( x, y , angolo/c, angolo/c);
    raggio += 0.35;
  }
}
}

