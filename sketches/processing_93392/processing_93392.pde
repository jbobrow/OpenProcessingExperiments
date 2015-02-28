
PImage myImage;
PImage myImage2;
PImage myImage3;

void setup() {
  size(800,800);
   myImage = loadImage("Motif_1.png");
  myImage2 = loadImage("Motif_2.png");
  myImage3 = loadImage("Motif_3.png");
  frameRate(7);

}



void draw(){
  
 // tint(mouseX, mouseY, 255, 10);
 // image(myImage2, 0, 0, 800, 800); 
  //image(myImage, mouseX, mouseY, 200, 200);
   image(myImage, mouseX, mouseY, 400, 400); 
   image(myImage2, random (-50, 800), random (-40, 750), 400, 400); 
      image(myImage3, random (-50, 800), random (-40, 750), 400, 400); 
 // variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  
  
}

