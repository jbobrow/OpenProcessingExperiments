
void setup() {
  size(300,300);
  colorMode(HSB,360,100,100);
}

void draw() {
  background(mouseY,mouseX,250);
  noStroke();
 
  for( int x=0; x<=300; x=x+50 ) {
    float y=sin(random(x+frameCount))*300*0.8+80;
    fill(mouseX,mouseY,random(150));
    triangle(150,0,0,300,300,300);
  }
 }


                
