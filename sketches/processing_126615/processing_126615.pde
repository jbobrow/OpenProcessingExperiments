
float r = 40;
float randfact = 5;

void setup() {
size(500,500);
background(255,255,255);
fill(0,0,0);
frameRate(150); 
}

void draw() {

  if ((mousePressed == true) && (mouseX <= width/2)) {
  ill(mouseX, mouseY, r);
  r += random(-randfact, randfact); 
  float xmir = (width/2)+((width/2)-mouseX);
  ill(xmir, mouseY, r);
  r += random(-randfact, randfact); 
   
  }
  if (mousePressed == false) {
  r = 5;  
  }
  
  if (keyPressed == true) {
  background(255,255,255);
  }

  if(r>70) {
  r-=5;  
  }
    if(r<15) {
  r+=5;  
  }

}

void ill(float xin, float yin, float rin) {
  ellipse(xin, yin, rin, rin);
  float chance = random(6);
  
  if (chance>5) {
  float rrand = random(0.4);
  ellipse(xin+rin+random(-3, 3), yin+rin+random(-3,3), r*rrand, r*rrand);
  
  
  }
}


