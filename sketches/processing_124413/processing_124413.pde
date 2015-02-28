

PImage img1, img2, img3;
float a = 0;
int i;

void setup(){
  
  
  size(600,600);
  background(0);
  
  img1 = loadImage("01.png"); 
  img2 = loadImage("02.png"); 
  img3 = loadImage("03.png"); 
  
}

void draw() { 


  image(img1, 10,1); 
  image(img2, 1,300); 
  
   pushMatrix(); 
  translate(height/2, width/2); 
  rotate(a); 


  image(img1, 1,1); 
  image(img2, 50,50); 
  image(img3, 100,100); 
  for (int i = 0; i < 10; i++) { 
    image(img3, mouseX * i, mouseY * i); 
  } 
  popMatrix(); 
 a += 0.5; 

} 

void keyPressed(){ 
 if(keyCode == ENTER){ 
  save("image01.png"); 


  } 
}
