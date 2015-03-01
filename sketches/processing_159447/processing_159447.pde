
void setup() {
  size(800,800); 
  smooth();
}
 
void draw() {
   
  background(255);
   
  ellipseMode(CENTER);
  rectMode(CENTER);
 
  fill(255);
  strokeWeight(12.0);
  rect(400,400,400,400);
 
  strokeWeight(1.0);
  fill(mouseX,125,mouseY);
  ellipse(mouseX,mouseY,200,200);
   if (mouseX <= 195 || mouseX >= 575 || mouseY <=195 || mouseY >= 575)
   {
     fill(0);
     ellipse(mouseX-40,mouseY-30,20,50);    // EYES
     ellipse(mouseX+40,mouseY-30,20,50);    // EYES
   } else {
       fill(0);
       ellipse(mouseX-40,mouseY-30,50,10);
       ellipse(mouseX+40,mouseY-30,50,10);
   }
     if (mouseX <= 195 || mouseX >= 575 || mouseY <=195 || mouseY >= 575)
     {
       rect(mouseX,mouseY+40,50,10);
     } else {
       fill(255);
       rect(mouseX,mouseY+40,100,20);                    //smile
         line(mouseX,mouseY+30,mouseX,mouseY+50);        //teeth
         line(mouseX-20,mouseY+30,mouseX-20,mouseY+50);  //teeth
         line(mouseX-40,mouseY+30,mouseX-40,mouseY+50);  //teeth
         line(mouseX+20,mouseY+30,mouseX+20,mouseY+50);  //teeth
         line(mouseX+40,mouseY+30,mouseX+40,mouseY+50);  //teeth
     }
 
  fill(mouseX,0,mouseY);           //color-changing nose
  ellipse(mouseX,mouseY,40,40);
  fill(mouseX,255,mouseY);
  ellipse(mouseX,mouseY,20,20);
}

