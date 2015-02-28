
void setup() {
size(500, 500);
smooth();
background(0);
strokeWeight(1);
stroke(0,255,255);
}

void draw(){
  
background(0);
float distanceX = 25;
 
for (float x = 0; x<=20; x++) {
    line(x*distanceX,0,mouseX,mouseY);
  }

float distanceY = 25;

  for (float y = 0; y<=20; y++){
    line(y*distanceY,500,mouseX,mouseY);
  }
}

