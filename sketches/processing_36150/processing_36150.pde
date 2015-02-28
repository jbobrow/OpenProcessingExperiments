
void setup(){
  size(500,500);
 

 }
  
  void draw(){
      background(0);
    smooth();
    noStroke();
    fill(255,0,0,50);
      
   
   triangle(0,50,pmouseY,mouseX,50,0); 
   triangle(450,0,500,50,mouseY,mouseX);
   triangle(0,450,mouseY,mouseX,50,500);
   triangle(mouseY,mouseX,500,450,450,500);
   triangle(0,225,mouseY,mouseX,0,275);
   triangle(mouseY,mouseX,275,500,225,500);
   triangle(mouseY,mouseX,500,225,500,275);
   triangle(225,0,275,0,mouseY,mouseX);
   fill(255,0,0,10);
   
   
   
   
   
   
    ellipse(mouseY,mouseX,1100,1100);
    ellipse(mouseY,mouseX,1050,1050); 
   ellipse(mouseY,mouseX,1000,1000); 
  ellipse(mouseY,mouseX,950,950);
  ellipse(mouseY,mouseX,900,900);
    ellipse(mouseY,mouseX,850,850);
    ellipse(mouseY,mouseX,800,800); 
   ellipse(mouseY,mouseX,750,750); 
  ellipse(mouseY,mouseX,700,700);
  ellipse(mouseY,mouseX,650,650);
      ellipse(mouseY,mouseX,600,600);
    ellipse(mouseY,mouseX,550,550); 
   ellipse(mouseY,mouseX,500,500); 
  ellipse(mouseY,mouseX,450,450);   
    ellipse(mouseY,mouseX,600,600);
    ellipse(mouseY,mouseX,550,550); 
   ellipse(mouseY,mouseX,500,500); 
  ellipse(mouseY,mouseX,450,450);
  ellipse(mouseY,mouseX,400,400);
  ellipse(mouseY,mouseX,350,350);
  ellipse(mouseY,mouseX,300,300);
  ellipse(mouseY,mouseX,250,250); 
   ellipse(mouseY,mouseX,200,200);
  ellipse(mouseY,mouseX,150,150);
    ellipse(mouseY,mouseX,100,100); 
    ellipse(mouseY,mouseX,50,50); 
    ellipse(mouseY,mouseX,10,10);

  
}

                
                
