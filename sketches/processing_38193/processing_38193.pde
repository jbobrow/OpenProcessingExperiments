
void setup() {
  size (400, 400);
  smooth();
  stroke(0);
  background(220, 145, 18);
}

int a = 5;    //sets size and rotation variables                
int b = 100;                       

void draw() {
  pushMatrix();
 
    noFill();
    stroke(0,0,0,60); 
    translate(width/2, height/2); //shifts origin to center
    rotate(radians(a));            
    translate(100, 100);          
    rotate(radians(-b));  
    ellipse(0, 0, 20, 50); //black rotating ellipses
  
    noStroke();
    fill(255, 255, 255, 25);
    translate(100,100);
    rotate(radians(a));  
    ellipse(0, 0, 15, 35); //white ellipses rotating around the black ellipses
    
  popMatrix();
 
  a--;
  b+=20;
}



