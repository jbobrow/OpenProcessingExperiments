
int value = color(0, 0, 0);
 
void setup() {
  size(700, 600);
  background(255);
   
}
  
void draw() {
   noStroke();
  
  fill(255);
  rect(0,0,800,70);
  
  stroke(value);
  
  fill(255,0,0); //quadrat vermell
  rect (300,0,20,20);
   
  fill(0,0,0); // quadrat negre
  rect(300, 30, 20, 20);
  
  fill(20,110,250); //quadrat blau
  rect(80, 0, 20, 20);
   
  fill(0,255,0); //quadrat color verd
  rect(80,30,20,20);
  
  fill (150,150,150); // quadrat color gris 
  rect(485,0,20,20);
  
  fill(random(255),random(255),random(255)); // quadrat random
  rect (485,30,20,20);
   
  
  if(mousePressed == true) {
     if(mouseX < 505 && mouseX >485 && mouseY <50 && mouseY >30){
        background (255); //esborrar.
     }
    
     if(mouseX < 505 && mouseX >485 && mouseY <20 && mouseY >0){
        value = color(random(0,255),random(0,255),random(0,255)); // canvi de color no automatic
     }
    
     if(mouseX <320 && mouseX > 300 && mouseY < 20 && mouseY > 0){
        value = color(255,0,0); // canvi de color a vermell 
     }
    
     if (mouseX < 100 && mouseX > 80 && mouseY < 20 && mouseY > 0){
        value = color(0,0,255); // canvi de color a blau
     }
      
     if(mouseX < 100 && mouseX >80 && mouseY <50 && mouseY >30){
        value = color(0,255,0); //canvi color a verd 
     }
     
     if(mouseX < 320 && mouseX >300 && mouseY <50 && mouseY >30){
        value = color(0);//canvi de color a negre
     }
         
  fill(value);
  noStroke();
  ellipse(mouseX,mouseY, random(1,30),random(1,30)); // pinzell de dibuix i el seu tamany aleatori
   }
 }
  




