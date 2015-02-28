


void setup(){

size (700,400);
background (239,236,205);
  noFill();
  
}





void draw ()
{
   float haha=random(255);
 float hehe=random(80);




 if (mousePressed && (mouseButton == CENTER)) {
  
   fill (239,236,205);
    noStroke();
    ellipse (mouseX,mouseY,50,50);


  

  
 }
  if (mousePressed && (mouseButton == LEFT))  {
  noStroke();
 
   
  
  ellipse (mouseX,mouseY,20,20);
  fill(haha,hehe,hehe,40);
  smooth();
 }
if (mousePressed && (mouseButton == RIGHT))  {
  noStroke();
 
   
  
  ellipse (mouseX,mouseY,20,20);
  fill(hehe,haha,haha,40);
  smooth();

}
 

}
    



void keyPressed() {
  if (keyPressed==true );
 background (239,236,205);

}            
                
