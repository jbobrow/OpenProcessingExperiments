
//Declaring variables
float followerX;
float followerY;
float easing = 0.05;

//Background rectangle coordinates
int x1 = 0;
int x2 = 200;
int y1 = 0;
int y2 = 200;
int w = 200;
int h = 200;

void setup() {
  size(400, 400);
  smooth(); 
  noStroke();
}

void draw() {
  //Background rect - purple
  fill(120, 60, 210); 
  rect(0, 0, width/2, height/2); 
  //Background rect - light blue
  fill(55, 150, 240);
  rect(width/2, 0, width/2, height/2); 
  //Background rect - dark blue
  fill(55, 65, 225);
  rect(0, height/2, width/2, height/2);
  //Background rect - green
  fill(70, 200, 40);
  rect(width/2, height/2, width/2, height/2);
  
  //Change cursor color
  //Black 
  if (mousePressed) 
           {
             fill(0);
           }
  //Light blue circle on purple rect
  else if ((mouseX > x1) && (mouseX < x1+w) &&
          (mouseY > y1) && (mouseY < y1+h))
           {
             fill(55, 150, 240);
           }
  //Green circle on light blue rect
  else if ((mouseX > x2) && (mouseX < x2+w) &&
           (mouseY > y1) && (mouseY < y1+h))
           {
             fill(70, 200, 40);
           }
  //Purple circle on dark blue rect
  else if ((mouseX > x1) && (mouseX < x1+w) &&
           (mouseY > y2) && (mouseY < y2+h))
           {
             fill(120, 60, 210);
           }
  //Dark blue circle on green rect
  else if ((mouseX > x2) && (mouseX < x2+w) &&
           (mouseY > y2) && (mouseY < y2+h))
           {
             fill(55, 65, 225);
           }
  //White
  else
           {
           fill(255);
           }
             
  //Cursor circle
  float targetX = mouseX;
  float targetY = mouseY;
  followerX += ((targetX - followerX) * easing);
  followerY += ((targetY - followerY) * easing);
  ellipse(followerX, followerY, 20, 20);
  
  
}


