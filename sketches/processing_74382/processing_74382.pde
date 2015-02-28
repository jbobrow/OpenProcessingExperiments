
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/73843*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//Resource: Brendon Gouevia + Michael (from openprocessing.org)

float x,y;
float px,py;
float easing = .15;

  

void setup(){
  background(13,47,225);
  size(500,500);
}

void draw(){
 py=y;
   px=x;
  noCursor();
 stroke(237,22,12);
 strokeWeight(10);
  
  smooth();
  frameRate(75);


point(mouseX,mouseY);

  if(mouseButton==LEFT){
  smooth();
    noStroke();
    
    fill(random (mouseX+mouseY), random (mouseX), random(mouseY));
   ellipse(mouseX-20,mouseY-20,mouseX/3,mouseY/3);
       
  }  if(mouseButton==RIGHT){
   smooth();
   stroke(25,25,25);
   strokeWeight(4);
    stroke(225,75);
float targetX = mouseX;
   x += (targetX-x) * easing;
   float targetY = mouseY;
   y += (targetY-y) * easing;
   
   float weight = dist(x,y, px,py);
   fill(225,30,30);
   strokeWeight(weight*3);
   line(x,y, px,py);
    
    
    
  }
    



if (keyPressed) {
    if (key == 'b' || key == 'B') {
      smooth();
      stroke(10,10,10);
      point(mouseX,mouseY);
    
    }
    
     if (key == 'v' || key == 'V') {
      smooth();
     stroke(0,225,10);
      rect(mouseX,mouseY,30,30);
    }


}
 
  

  
   //back up x and y, so next frame we have current & previous!
}
