
 float xoff = 10.10;
    void setup(){
size(500,500);
background(120); }


void draw(){noiseSeed(10);
  stroke(10, 10);
  strokeWeight(7);
  
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  line(n, 0, n, height);
float x=mouseX;
float y=mouseY;
smooth();
stroke(value,value,value);strokeWeight(7);
line(250,250,x,y);
noFill();
ellipse(x+10,y+10,x+100,y+100);
rect(x/2,y/2,x,y);
}
float  value = 0;


void mouseMoved() {
  value = value + 1;
  if (value > 255) {
    value = 0;
  }
}
if(x>20){value=random(value^255);
}







