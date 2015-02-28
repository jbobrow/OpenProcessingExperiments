
void setup(){
 size (400, 400);
 background (0);
 frameRate(30);
}

void draw () {

 
  if(mousePressed){
    noStroke();
    fill (0, 40);
    ellipse (mouseX, mouseY, 120, 120);
  }

noStroke();
  float anzahl = random (15);
  for (int i=0; i < anzahl; i = i + 25) {

    float posX = random (width);
    float posY = random (height);
 
    fill (255, 255, 255, 60);
    rect (posX+random(50), posY+random(50), random (width/5), random (height/5));
  }
  



}


