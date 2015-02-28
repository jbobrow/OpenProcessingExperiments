
PImage img1;
PImage img2;
PImage img3;
PImage img4;

void setup(){
  size(1100, 1100);
  

  img1 = loadImage("castoro.jpg");
  img2 = loadImage("tasso.jpg");
  img3 = loadImage("panda.jpg");
  img4 = loadImage("procione.jpg");
}

void draw(){
   background(0);
   //img1 effetto blur
   noTint();
   image(img1, 520, 445, 500, 520);
   
   float r = map(mouseX, 0, 500, 0, 10);
   filter(BLUR, r);
   
   //img2 effetto tinta
   float g = map(mouseX, 0, 500, 0, 255);
   tint(100, g, 100);
   image(img2, 520, 0);
   
   //img3 ridimensionamento
   noTint();
   float h = map(mouseX, 0, 500, 0, 498);
   float m = map(mouseX, 0, 500, 0, 322);
   image(img3, 0, 520, h, m);
   
   //img4 pick color
   image(img4, 0, 0, 500, 450);
   //get color from the picture
   color c = img4.get(mouseX, mouseY);
  
   //fill the rectwith the picked color 
   fill(c);
   rect(0, 0, 50, 50);
   
   



   
   

}




