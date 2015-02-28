
boolean button = false; 
float a = 0; 
float b = 0; 
float angle = 0; 


void setup () { 
  size(800,800); 
  background(0); 
  frameRate(15); 
} 
void draw() { 
   stroke(255); 
   
   /*translate(400, 400);
   rotate(radians(angle));
   stroke(random(100,200), random(50,255), random(25,75));
    line(a, b, -60, 10); 
    line(a, -b, 60, -10); 
    a += 0.2;
    b += 0.2; 
    angle += 5;
  //stroke(255); 
  //translate(width/2, height/2); 
  //rotate (radians(angle));
  //line(a, b, -60, 10); 
  //line(a, -b, 60, -10); 
  /*if (keyPressed) { 
    line(a, b, -60, 10); 
    line(a, -b, 60, -10); 
  } else line(75, -10, a, b); */
  
  if (mousePressed && (mouseButton == LEFT)){
   translate(mouseX, mouseY);
   rotate(radians(angle));
   stroke(random(100,200), random(50,255), random(25,75));
    line(a, b, -60, 10); 
    line(a, -b, 60, -10); 
    a += 0.2;
    b += 0.2; 
    angle += 5; 
    
  } else if (mousePressed && (mouseButton == RIGHT)) {
    background(0);
  }else {
    rect(0,0,10,10);
    }
  
 // if (mousePressed) {  
     
    
    
    //button ==button;
    //button = !button
  //}
     
    /*stroke(255); 
    translate(width/2, height/2); 
    rotate (radians(angle));
    line(a, b, -60, 10); 
    line(a, -b, 60, -10); */
  
  //
  /*if (button) {  
    a = 0; 
    b = 5; 
    angle = 0; 
    stroke(0);
    line(a, b, 60, -10); 
  } */
   
  //a += 0.1; 
  //b += 0.1; 
 } 
 
 void mouseMoved(){
   println("no hagas nada");
   }
   
  


