
void setup(){
size(500,500);
    noStroke();
}
void draw(){
  int s = second();
 noCursor();
  background(255);
  for (float x = 1; x < height-1; x = x+25) {
    for (float y = 1; y <width-1; y = y+25) {
      if  (x<500){
        fill(mouseY,189,60);
        rect(y,x,15,15);
      }
      if (mouseX<400){
        fill(y,mouseY,1);
        rect(x,y,15,15);
      }
     
   if (mouseY<500){
        fill(mouseY,30,20);
        rect(x,mouseX,15,15);
      }
      if (mouseX<500){
        fill(mouseX,s,y);
        rect(mouseY,x,15,15);
      }  
      if (mouseX<300){
        fill(mouseY,mouseX,59);
        rect(y,x,15,15);
      }
      if (mouseX<200){
        fill(mouseY,200,50);
        rect(x,y,15,15);
}
      if (mouseX<100){
        fill(100,50,20);
        rect(x,y,15,15);
      } 
        if (mouseY<500){
          fill(mouseY,000,000);
          rect(y,x,15,15);
        }
        if (y<400){
          fill(s,mouseY,1);
          rect(y,x,15,15);
        }
        if (mouseY<300){
          fill(mouseX,s,mouseX);
          rect(y,x,15,15);
        }
        if (y<200){
          fill(s,200,mouseY);
          rect(y,x,15,15);
        }
        if (mouseY<100){
          fill(mouseX,200,mouseY);
          rect(y,x,15,15);
        }
      }
    }
  }



