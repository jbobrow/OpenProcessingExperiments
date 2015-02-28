

PImage trees;
PImage leaf;
PImage Falling;

void setup(){ 

  size(1100,900);
    trees = loadImage("bare-trees-bw-big.jpg");
   
    leaf = loadImage("Close-up-leaf-pattern.jpg");
 
    Falling = loadImage("falling.jpg");
     
}

void draw(){
  tint(mouseX,300,200,70);
  image(trees,mouseX,mouseY,367,300);
   tint(mouseX,mouseY,200,50);
  image(leaf,0,mouseY,1100,900);
   tint(mouseX,300,200,70);
  image(trees,mouseY,mouseX,367,300);
     tint(mouseX,mouseY,367,200);
  image(Falling,mouseY,320,367,300);
  


  
}


