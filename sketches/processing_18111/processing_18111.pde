
float posX;float posY;

void setup(){
size(250,250);
background(0);
}

void draw(){
if(mousePressed){
  stroke(random(255),random(70),random(100),50);
  smooth();
line(posX,posY,mouseX,mouseY);
}
}

void mousePressed(){
posX = mouseX;
posY= mouseY;
}
                                
