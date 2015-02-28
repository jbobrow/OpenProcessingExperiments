
color c = color(255);
boolean selected;

float movingX=0;

void setup(){
 size(800,600); 
 noStroke();
 smooth();
 ellipseMode(CENTER);
 rectMode(CENTER);
}




void draw(){
  background(c);
  fill(0,255,0);
 selected = false;


//performing all my tests
 circleBtn(movingX,300,150);
 circleBtn(400,100,50);
 

 
 
 
// changing background color 
 if (selected == true){
   c = color(255,0,0);
 }
 else{ 
  c = color(255);
 } 
 
 movingX = movingX +5;

}


void circleBtn(float xpos, float ypos, float d){
  // if mouse is inside circle, change selected to true  
  if(dist(xpos,ypos, mouseX,mouseY) < d/2){
  
   selected = true;
  }

  ellipse(xpos,ypos,d,d);
}
  
  /*
  void rectBtn(float xpos, float ypos, float w, float h){
    if(mouseX > xpos && mouseY > ypos && mouseX < xpos+w && mouseY<ypos+h){
      selected = true;
    }
  rect(xpos,ypos,w,h);

  
}

*/











//   if (mouseX > 100 && mouseX < 200 && mouseY > 100 && mouseY < 200){
//   background(0);
//   }
//  
//  if(dist(400,400, mouseX,mouseY) < 25){
//  background(0);
//  }
//  
//   rect(100,100,100,100);
//  ellipse(400,400,50,50); 




  /*
  if(mouseX < 400 || mouseX > 700){
    background(255);
  }
  else if(mouseX >= 400 && mouseX < 600){
    background(255,0,0);
  }
  else {
    background(0); 
    }
  */
  
  








