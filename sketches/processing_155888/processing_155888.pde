
PFont font;
float radius = 0;


void setup () {
  size (500, 800);
  background (255);
  font = loadFont ("MoonFlower-150.vlw");
  noCursor();
}

void draw () {
  
  noStroke();
  fill (random (255), random (255), random (255), random (100));
  ellipse ( mouseX, mouseY, radius, radius);
  mouseX++;
  
  if (radius > height/2) {
     textFont(font);
     text ("PARTY!", width/4, height/2);
  }
}
void mousePressed () {
  if (mousePressed == true) {
    radius = random (200);
  } else {
   radius = 0; 
  }
}


void keyPressed (){
 if (keyPressed = true){
  radius+=radius;
 } 

}


