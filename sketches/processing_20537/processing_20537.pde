
PImage img;
 
void setup(){
  size(300,300);
  img = loadImage("seurat1.jpg");
 
    background(0);
}
 
void draw(){
   
  int x = floor(random(0,img.width));
  int y = floor(random(0,img.height));

   
  color myColor = img.get(x,y);
  noStroke();
  fill(myColor);
  ellipse(x,y,random(5,10),7);
  
}



