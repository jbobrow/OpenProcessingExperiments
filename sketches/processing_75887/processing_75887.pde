

 int i= 0;
void setup () {
  size(500, 500);
  
  background(255);
} 
void draw() {
  
  
  if (mousePressed==true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
 
    strokeWeight(random(i));
    i= 6;
  }
 
 
  {
   
    if (keyPressed) {
      if (key == 'l') {
        ellipse(mouseX, mouseY, pmouseX, pmouseY);
        fill( random(255), random(255), random(255), random(255));
         noStroke();
      }
 
      if (keyPressed) {
        if (key=='e') {
          rect(mouseX, mouseY, 30, 30);
          fill(random(255), random(255), random(255), random(255));
           noStroke();
        }
      }
 
      if (keyPressed) {
        {
          if (key=='n') {
            triangle(mouseX, mouseY, pmouseX,pmouseY, mouseX+10, mouseY+10);
            fill(random(255), random(255), random(255), random(255));
             noStroke();
          }
        }
      }else{
 {if(mouseX>460 && mouseX< 500 && mouseY>460 && mouseY< 500 && mousePressed){
  background(256);
      

      } 
      }
      }
      }
     

  }
}

