
PImage img;

void setup(){
  size (1000,500);
  background (255,165,0);
  
  img = loadImage ("processing.png");
  image (img,400,150);
  
}
void draw(){
   
  

   

   if (mousePressed && (mouseButton == LEFT)){
      strokeWeight (15);
      stroke (random (0,255),random (0,255),random (0,255));
      line (mouseX,mouseY,pmouseX,pmouseY);
   }
   if (mousePressed && (mouseButton == RIGHT)){
     frameRate(500);
      fill (255,255,255);
      stroke (255,255,255);
      ellipse (mouseX,mouseY,80,80); 
  }

   if (keyPressed){
     if (key == 'a'){
       strokeWeight (15); //linea negra
       stroke (0,0,0);
       line (mouseX,mouseY,pmouseX,pmouseY);
     } 
  }
   if (keyPressed){
     if (key == 's'){//ellipse color random i tamany random
     frameRate(500);
       strokeWeight (15);
       stroke (random (0,255),random (0,255),random(0,255));
       ellipse (mouseX,mouseY,random (0,40),random (0,40));
     } 
  }
   if (keyPressed){
     if (key == 'd'){  
       frameRate(500);
       fill (random (0,255),random (0,255),random (0,255));
       stroke (random (0,255),random (0,255),random(0,255));
       rect (mouseX,mouseY,random (0,40),random (0,40));
     } 
  }
   if (keyPressed){
     if (key == 'w'){
       background (random (0,255),random (0,255),random (0,255));
       image (img,400,150);
     } 
  }
  if (keyPressed){
     if (key == 'q'){
       frameRate (50);
       image (img,random (0,1000),random (0,1000));
       fill (random (0,255),random (0,255),random (0,255));
       stroke (random (0,255),random (0,255),random(0,255));
       rect (mouseX,mouseY,random (0,40),random (0,40));
       strokeWeight (abs(mouseX-pmouseX));
       stroke (random (0,255),random (0,255),random(0,255));
       ellipse (mouseX,mouseY,random (0,40),random (0,40));
       strokeWeight (abs(mouseX-pmouseX)); //linea negra
       stroke (0,0,0);
       line (mouseX,mouseY,pmouseX,pmouseY);
        strokeWeight (abs(mouseX-pmouseX));
      stroke (random (0,255),random (0,255),random (0,255));
      line (mouseX,mouseY,pmouseX,pmouseY);
     } 
  }
  
  
  
      
} 
    
    

    


  



