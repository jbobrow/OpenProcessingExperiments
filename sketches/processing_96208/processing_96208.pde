
float mides=mouseY/2;
float dosmides=mouseX/2;
void setup() {
 size(255,255); 

 
 }

void draw() {
  
   background(mouseX+230,mouseY+100,150);
    float mides= mouseY/2;
    float dosmides= mouseX/2;
//Colors variant
   fill(mouseX+50,mouseY-100,35);
   stroke(mouseX-100, mouseY+50,35); 
   
 //Dibuix    
  //fill(255,0,0);
  //stroke(255);
  strokeWeight(3);
  line(mouseX,mouseY,mouseX+35,mouseY-30);
  line(mouseX,mouseY,mouseX-35,mouseY-30);
  line(mouseX,mouseY,mouseX-35,mouseY+30);
  line(mouseX,mouseY,mouseX+35,mouseY+30);
  
  //Verticals
    line(mouseX,mouseY,mouseX,mouseY+50);
    ellipse(mouseX,mouseY+50,mides,mides);
    
    line(mouseX,mouseY,mouseX,mouseY-50);
    ellipse(mouseX,mouseY-50,dosmides,dosmides);
  
 // Resta elipses
  strokeWeight(8);
  ellipse(mouseX, mouseY, 40,40);
 
  ellipse(mouseX+35,mouseY-30,15,15);
  ellipse(mouseX-35,mouseY-30,20,20);
  ellipse(mouseX-35,mouseY+30,25,25);
  ellipse(mouseX+35,mouseY+30,30,30);
  
   
  
  }


