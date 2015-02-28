
boolean isDrawing = false;


void setup(){
  
  size(500,500);
  background(255);
  smooth();


  
  
};

void draw(){
  
  if (isDrawing) {
    
    float a = random(40);
    stroke(#CC3300);
    strokeWeight (a);
    line(pmouseX,pmouseY,mouseX,mouseY);//draws a line from the previous mouse points to the new one.

    stroke (0);
    strokeWeight (a/8);
    fill(#44dd99);
    ellipse(mouseX, mouseY, 1.5 * a, 1.5 *  a);
    
    
      float c = random(20);
      stroke(#3399ff, c );
      strokeWeight(c);
      noFill();
   

    triangle( mouseX, mouseY,  random(500),  random(500), pmouseX - 50, pmouseY - 50);
    
    
   
   
  }
  
};

void mousePressed() {
  
  isDrawing = !isDrawing;
  
};

