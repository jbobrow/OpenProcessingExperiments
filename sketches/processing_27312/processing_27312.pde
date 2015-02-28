
PImage img;
int hpc = 250;
int vpc = 250;
int pcs = 491;


void setup() {
  
  size(500,500);
  smooth();
  

  
  img = loadImage("crystal2.png");
}


void draw() {

imageMode(CENTER);
 background(255); 
 
 image(img, hpc,vpc,pcs,pcs);
  
   
  if(isOverImage((hpc-245), (vpc-245),img,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == LEFT))
   {
    hpc = hpc + (mouseX - pmouseX);
    vpc = vpc + (mouseY - pmouseY);
    
  }
  
  if(isOverImage((hpc-245),(vpc-245),img,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == RIGHT))
   {
    pcs = pcs + (mouseX-pmouseX);
    pcs = pcs + (mouseY-pmouseY);
  }
  

  
}







boolean isOverImage(int imgX, int imgY, PImage img, int x, int y, int tolerance) {
  
  

  img.loadPixels();

  int posX = x - imgX;
  int posY = y - imgY;

  if(posX < 0 || posX > img.width || posY < 0 || posY > img.height)
    return false;
  else {
    int i = posY*img.width+posX;
   println(alpha(img.pixels[i]));


    if(alpha(img.pixels[i]) > tolerance) {
      return true;
    }
    else {
      return false;
    }
  }
}


