
/* @pjs preload="sketch04.jpg"; */
// Dropping Hot Pepper Flakes Sketch

PImage img;
ArrayList flakes;

void setup(){
  size(500, 375);
  frameRate(40);
  img = loadImage("sketch04.jpg");
  flakes = new ArrayList();
  flakes.add(new Flake(50, 50));
 
}

void draw(){
  image(img, 0, 0);
  for (int i = flakes.size() -1; i > 0; i--) {
    Flake flake = (Flake) flakes.get(i);
    flake.display();
    flake.fall();
  }
 
  
  
 
}

void mouseClicked(){
  flakes.add(new Flake(mouseX, mouseY));
  
}

void mouseDragged(){
  flakes.add(new Flake(mouseX, mouseY));
}

class Flake{
  float xpos; // Y position
  float ypos; // X position
  float w; // Width
  float h; // Height
  color c; // Color
  float speed; // How fast flakes fall
  float landing; // Where will the flake land?

  Flake(float tempxpos, float tempypos){
    xpos = tempxpos;
    ypos = tempypos;
    w = 3;
    h = 2;
    c = #cc0000;
    speed = random(1, 2);   
   if(xpos < 30){
     landing = 380;
   } else if (xpos < 80) {
     landing = random(200, 320);
   } else if (xpos < 140){
     landing = random(170, 300);
   } else if (xpos < 200) {
     landing = random(150, 350);
   } else if (xpos < 320){
     landing = random(130, 375);
   } else if (xpos < 390){
     landing = random(175, 320);
   } else if (xpos < 450) {
     landing = random(220, 320);
   } else {
     landing = 380;
   }
   
  }

  void display(){
    smooth();
    fill(c);
    noStroke();
    rect(xpos, ypos, w, h);
  }
  
  void fall(){
    if(ypos < landing){
      ypos+= speed;
      h = random(1, 4);
      xpos = random((xpos-1),(xpos+1));
    }
  }


}

