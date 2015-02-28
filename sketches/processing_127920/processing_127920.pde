
void setup() {  
  size(600,600);
  noStroke();
  smooth();
  }
  
void draw() {
   
  if (mousePressed == false){
      int a = mouseX;       
      int b = mouseY;              
      triangle(random(255),random(255),random(255),random(255),a,b);     
      }
      
  else if(mousePressed == true) {
    fill(random(255), random(255), random(255));
    }   
}

