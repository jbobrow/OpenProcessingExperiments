
//declaretion of variables
PImage img;
PImage img2;
PImage img3;
PImage img4;
int a = 30;

void setup(){
  size(550,375);
  smooth();
//load images
  img = loadImage("gnomeo 1.jpg");
  img2 = loadImage ("gnomeo 2.jpeg");
  img3 = loadImage ("gnomeo 3.jpeg");
  img4 = loadImage ("gnomeo 4.jpeg");}
  
void draw(){
//visualize img1   
  image(img,0,0);
//reaction mouse when it's on the img1  
  if (mouseX < width/2 && mouseX > 0) {
    if (mouseY > 0 && mouseY < height/2) {
      color c =img.get(mouseX, mouseY);
      noStroke();
      fill(c);
      rect(mouseX-a/2, mouseY-a/2, a, a); }}
 
//visualize img2         
  image(img2,width/2,0);
//reaction mouse when it's on the img2  
    if (mouseX > width/2 && mouseX< width) {
    if (mouseY > 0 && mouseY < height/2) {
      noStroke();
      blend(mouseX, mouseY-a, 30, 30, mouseX, mouseY-a, a, a, ADD);
      blend(mouseX-a, mouseY, 30, 30, mouseX-a, mouseY, a, a, MULTIPLY);
      blend(mouseX-a, mouseY-a, 30, 30, mouseX-a, mouseY-a, a, a, EXCLUSION);
      blend(mouseX, mouseY, 30, 30, mouseX, mouseY, a, a, SOFT_LIGHT);}}

//visualize img3    
  image(img3,0,height/2);
//reaction mouse when it cliclk on the img3  
    if (mousePressed){
      if (mouseX < width/2 && mouseX> 0  && mouseY < height &&  mouseY > height/2) {
        tint(0, 153, 204, 100); 
        image (img3, 0, height/2);}
      else
         {tint(255,255);}}
  
//visualize img4     
  image(img4,width/2,height/2);
//reaction mouse when it's on the img4    
    if (mousePressed){
    if (mouseX > width/2 && mouseX< width && mouseY > height/2 &&  mouseY < height) {
         blend(width/2,height/2, width, height,width/2,height/2, width, height, EXCLUSION); 
  }
    }
}

