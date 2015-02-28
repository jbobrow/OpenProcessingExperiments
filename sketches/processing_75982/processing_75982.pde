
// mettere un'immagine nel processo da internet
PImage img;
PImage img2;
PImage img3;
PImage img4;


void setup (){
  
 size (500, 500);
 background (0);
 img = loadImage ("img.png");
 img2= loadImage ("img2.png");
 img3= loadImage ("img3.png");
 img4= loadImage ("img4.png");
 
}

void draw (){
  //image(imageVariable, x, y);
  background (0);

image (img, mouseX, 20, mouseX, mouseY); 
image (img2, mouseY,20, mouseY, mouseX);
image (img3, mouseY,mouseY, 50, mouseX);
image (img4, mouseX,mouseX, mouseY, 50);

}


