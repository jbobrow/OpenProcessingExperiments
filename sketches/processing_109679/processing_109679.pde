
//Declare variables
float r;
float g;
float b;
float a;

void setup(){
  //Set up the world  
  size (600,500);
  background(200);  
  smooth();  
}
 
void draw(){
    // Each time through draw(), new random value of RGB color are picked for a new ellipse.
    r = random(50);
    g = random(100);
    b = random(250);
    a = random(100);  
    
         
 // Use mousePressed, mouseButton and KeyPressed to draw different kinds of ellipses
 if(mousePressed && (mouseButton == LEFT)){  
     noFill(); 
     stroke(r,g,b,a);
     ellipse( mouseX, height/2, mouseX++, mouseY--);
     
   } else if (mousePressed && (mouseButton == RIGHT)){ 
               noFill(); 
               stroke(r,g,b,a);
               ellipse( mouseX, height/2, mouseX--, mouseY++);
 }
 
 else if (keyPressed) {
    if (key == 'a' || key == 'A') {
      noFill(); 
      stroke(r,g,b,a);
      ellipse( width/2, height/2, mouseX--, mouseY--);
    }
     if (key == 'b' || key == 'B') {
       noFill(); 
       stroke(r,g,b,a);
       ellipse( width/2, height/2, mouseX++, mouseY++);
      }
    } 
}

//Press "C" to clear all the patterns drawn
void keyPressed() {
  if (key == 'c' || key == 'C') {
  background(200);
  }
}



