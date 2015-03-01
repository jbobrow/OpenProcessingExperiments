
void setup() {
  size(700,700);
colorMode(HSB);

}

void draw(){
for(float a=0; a<10;a++){
  background(0,0,0);
 fill(mouseX,mouseY,250);
  rect(random(height),random(width),25,25);

}
for(float a=0; a<10;a++){
 fill(random(255),random(255),205);
  ellipse(random(width),random(height),25,25);
}
}

