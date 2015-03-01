
int xPos, yPos; 
int xPos2, yPos2;
float dia1;
float dia2;
float opacity;
int speed;
boolean mouse;

void setup(){
  size(800, 800);
  background(0);
 // xPos = random (1, 20);
  //yPos = random (1, 20);
}

void draw(){
    xPos = pmouseX;
    yPos = pmouseY;
    xPos2 = (pmouseX + (width/4));
    yPos2 = (pmouseY + (height/4));
    dia1 = (random (1, 50));
    dia2 = (random (1, 50));
    opacity = (int(map((random(5, 40)), 0, 70, 0, 140)));
 // xPos2P = (pmouseX - (width/2));
  //yPos2P = (pmouseY - (height/2)); 
//mouse = (mousePressed == true);
 // strokeWeight(lineThickness);
     stroke(255, 255, 255,random (20, 45));
    if (mousePressed == true){
      ellipse(xPos, yPos, dia1, dia2);
      noStroke();
      fill (255, 255, 255, opacity*2);
    }
    if (mouseX > width/4 && pmouseX > width/4){
      ellipse(xPos2, yPos2, dia1, dia2);
      noStroke();
      fill (255, 255, 255, opacity);
   }
}    



