


void setup() {
  size(500, 500);
  background(255);

}

void draw(){
  frameRate(20);
if (mousePressed==true){  
     ellipse(random (500), random (500), 0, 0);
    
     ellipse(random (500), random (500), 1, 1);
     
     fill(0);
     ellipse(random (500), random (500), 1, 1);
     ellipse(random (500), random (500), 2, 2);
     ellipse(random (500), random (500), 3, 3);
     ellipse(random (500), random (500), 5, 5);
     ellipse(random (500), random (500), 8, 8);
     
      noFill();
     ellipse(random (500), random (500), 13, 13);
     ellipse(random (500), random (500), 21, 21);
     ellipse(random (500), random (500), 21, 21);
     
     fill(0);
     ellipse(random (500), random (500), 34, 34);
     ellipse(random (500), random (500), 55, 55);
     ellipse(random (500), random (500), 89, 89);
     
     noFill();
     ellipse(random (500), random (500), 144, 144);
     ellipse(random (500), random (500), 233, 233);
     ellipse(random (500), random (500), 377, 377);
     ellipse(random (500), random (500), 610, 610);
     
     
     
     
  fill(255,20);
  stroke(0, 50);

 
}else{
   ellipse(random (500), random (500), 500, 500);
  fill(255,20);
  stroke(0, 50);
     
     ellipse(random (500), random (500), 500, 500);
  fill(0,20);
noStroke();
 
 }
  
 
}

