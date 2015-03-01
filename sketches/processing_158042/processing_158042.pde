
PImage photo;
PImage img;
void setup(){
  size(800,600);
   
  photo = loadImage("TEST3.jpg");
  photo.resize(100,100);
  
  img = loadImage("TEST2.jpg");
  background(img);
}
void draw(){
  
  rect(0,500,100,100);
  fill(255,255,255);
  rect(0,0,100,100);
  fill(255,255,255);
  rect(700,0,100,100);
  fill(255,255,255);
  rect(700,500,100,100);
  fill(255,255,255);
  image(photo,mouseX,mouseY);
  
    


}


