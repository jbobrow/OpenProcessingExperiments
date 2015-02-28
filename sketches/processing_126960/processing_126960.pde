
PImage img;
 
void setup() {
  size(450, 450);//size
  
  
}
  

 
void draw() {
  background(60,1500,525);
  img = loadImage("apple.gif");
 
   textSize(24);
  fill(0);
  text("apple",mouseX, mouseY);//text

}
  
  
  
  void mousePressed() {
  tint(0, 153, 204, 127);  
  image(img,50, 0);
  fill(0) ; 
  img = loadImage("apple.gif");
  image(img, width/2, height/2, width/2, height/2);//gazou
  
  image(img, width/6, height/2, width/4, height/4);//gazou
  
  image(img, width/6, height/2, width/8, height/4);//gazou
  }
  
void mouseReleased() { 
  tint(100); 
  img = loadImage("apple.gif");
  image(img, width/200, height/200, width/2, height/2);//gazou
  image(img, 10, 50); 
  image(img,50, 70); 
  
  image(img, width/100, height/100, width/5, height/5);//gazou
  
  image(img, width/20, 500, 50, height/5);//gazou
  }


 

  






void mouseDragged() { 
  for (int x = 0; x <= width; x +=60) { 
  for (int y = 0; y <= width; y += 50) { 
 
    image(img, 10, 50); 


    } 

 




  } 


} 











