
void setup() {
  size(800, 800);
}

color c=color(232, 226, 211);
void draw() {
  background(225);
  smooth();
  noStroke();
  colorMode(RGB);
  //println("Mouse X:" +mouseX +"Mouse Y:" +mouseY);
 
 //invisible stuff!
  rect(mouseX+400, mouseY+400,10,10);
 rect(mouseX+405,mouseY+405,10,10);
 point(mouseX+400,mouseY+400);
 point(mouseX+402,mouseY+402);
  
  //body
  fill(85, 82, 82);
  ellipse(mouseX+400, mouseY+500, 260, 300);  //body
  ellipse(mouseX+400, mouseY+345, 150, 150);  //head
  ellipse(mouseX+350, mouseY+280, 20, 100);  //left ear
  ellipse(mouseX+450, mouseY+280, 20, 100);  //right ear
  
  //eyes
  fill(255);
  ellipse(mouseX+355, mouseY+320, 22, 22);   //left white
  ellipse(mouseX+445, mouseY+320, 22, 22);  //right white
  ellipse(mouseX+357, mouseY+316, 7, 7);
  fill(0);

  //eye movement
  float thetaLeft = atan2(mouseY-320, mouseX-355);
  float thetaRight = atan2(mouseY-320, mouseX-445);
  float DRX = abs((400.0-mouseX)/400*6); //distance ratio X- adjusts distance the pupils shoud move with respect to the center of creature
  float DRY = abs((400.0-mouseY)/400*6);

  ellipse((int)(mouseX+355+DRX*cos(thetaLeft)), (int)(mouseY+320+DRY*sin(thetaLeft)), 10, 10);   //left pupil
  ellipse((int)(mouseX+445+DRX*cos(thetaRight)), (int)(mouseY+320+DRY*sin(thetaRight)), 10, 10);   //right pupil

  fill(255);
  ellipse((int)(mouseX+356+DRX*cos(thetaLeft)), (int)(mouseY+317+DRY*sin(thetaLeft)), 4, 4);     //white reflect eyes
  ellipse((int)(mouseX+446+DRX*cos(thetaRight)), (int)(mouseY+317+DRY*sin(thetaRight)), 4, 4);     //white reflect eyes

  //mouth
  fill(0);
  ellipse(mouseX+400, mouseY+350, 25, 10);
  
  //feet
  fill(85, 82, 82);
  ellipse(mouseX+350, mouseY+635, 120, 50);
  ellipse(mouseX+450, mouseY+635, 120, 50);
  
  //arms
  ellipse(mouseX+280, mouseY+500, 50, 150);
  ellipse(mouseX+520, mouseY+500, 50, 150);
  
  
  //belly
  if (mousePressed) {
    if (mouseButton == RIGHT)
    {
      c=color(random(255), random(255), random(255));
    }
  }
  fill(c);
  ellipse(mouseX+400, mouseY+500, 210, 250);
  
  fill(0);
  stroke(10);
  line(mouseX+353, mouseY+343, mouseX+295, mouseY+319); //left of face wiskers
  line(mouseX+353, mouseY+347, mouseX+287, mouseY+344);
  line(mouseX+353, mouseY+352, mouseX+293, mouseY+368);
  line(mouseX+447, mouseY+343, mouseX+505, mouseY+319); //right of face wiskers
  line(mouseX+447, mouseY+347, mouseX+513, mouseY+344);
  line(mouseX+447, mouseY+352, mouseX+507, mouseY+368);
  
 
}

