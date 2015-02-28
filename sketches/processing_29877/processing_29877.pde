
void setup(){
  size(450, 450);
  smooth();
  noStroke();
}
 
 void draw(){
  background(0);

   for(int y= 0; y <= width; y = y + 25){

     if (mouseY < height / 2) {
       fill(255,50);
       ellipse(y, mouseY, 20, 20);
       fill(255,50);
       ellipse(y, mouseY, 40, 40);
       fill(255,50);
       ellipse(y, mouseY, 60, 60);
     } else {
       rectMode(CENTER);
       fill(255,50);
       rect(y, mouseY, 10, 10);
       fill(255,50);
       rect(y, mouseY, 20, 20);
       fill(255,50);
       rect(y, mouseY, 60, 60);
     }
  }
}

         
                    
