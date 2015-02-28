
void setup() {
  size(400, 400);
   
  smooth();
}
 
void draw() {
     
  noStroke();
  fill(200, 90);
  rect(0, 0, width, height);
  fill (250);
  
   //IF mouse presssed
  if (mousePressed){
      fill (250,50);
  rect (175,mouseX, 50,mouseX);
  rect (mouseX,150, mouseY,100);
  rect (175,mouseY, mouseX,100);
  rect (mouseY,150, 50,mouseY);    
  rect (mouseY,mouseY, mouseY,mouseY);   
  rect (mouseX,mouseX,mouseX,mouseX);
  rect (mouseX,270,mouseY,mouseX-200);
    rect (mouseY,250, 50,mouseY-100); 
  fill (0,50);
  rect (15,mouseX/2, 100,mouseX*2);
  rect (mouseX,mouseY*2, mouseY*6,mouseY);
  rect (75,mouseY*2, mouseY/4,10);
  rect (mouseY,150, 50,mouseY);    
  rect (mouseY/3,mouseY*2, mouseY/4,mouseY);   
  rect (mouseX,270,mouseX,mouseX);
  rect (mouseY/4,180, mouseX*6,mouseY/8);
  rect (300,mouseX/2, 100,mouseX*2);
  rect (mouseX,mouseY*5, mouseY*6,mouseY-200);
  rect (275,mouseY*2, mouseY/4,10);
   
  rect (mouseY/3,mouseY*4, mouseY/2,mouseY);   

  rect (mouseY/4,380, mouseX*4,mouseY/8);

  
  
   }
  

   
rect (mouseX-10, mouseY-10, 20,20);
  
  
  
  }
  



