
PImage bear;
PImage pooh;
PImage tree1;
//desireecatala@yahoo.com
void setup (){
  size(1200, 500);
 
  
  // Images must be in the "data" directory to load correctly
  bear = loadImage("bear.png");
  pooh = loadImage("bear17.gif");
  tree1 = loadImage("tree.png");
}

void draw (){
   background (173, 204, 200);
   
   fill (66, 106, 79);
rect (0, 300, 1500, 200);

fill (53, 96, 64);
rect (0, 300, 1500, 100);

 
  
   image (tree1, -50, -50, 800, 650); 
   
 image (tree1, 400, -50, 500, 400);
 
 tint(100,150); 
 
 
 
 image (tree1, 900, 60, 325, 275);
 
 
 if(mousePressed){
  image(pooh,mouseX,mouseY);
//    image(pooh);
  } else {
    image(bear,mouseX,mouseY);
//    image(bear);
  }
   
  
}
    
  



