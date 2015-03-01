
PImage img;

void setup() {
  size(500, 500);
 background(0);
 img = loadImage ("FolderButton.png");
}
void draw() {
  stroke(255);
  if(mousePressed==true) {
    image(img,pmouseX,pmouseY);
  }
 
} 



  



  


  

  
  


