
class Cloud {//class name
//class data
float xPos, yPos,heft;
color inside;
color lining;
float speed;

Cloud (float tempHeft, float tempX,float tempY, color tempIn, color tempLine, float tempSpeed){
  //constructor
 xPos = tempX;
yPos = tempY;
inside = tempIn;
lining = tempLine;
heft = tempHeft;
speed = tempSpeed;
}

void floatOn() { //we all float on... (method 1)
stroke(lining);
strokeWeight(3);
fill(inside);
for (int x=0; x<5;x++) { //iteration draws the cloud as a series of circles
  for(int y = 0; y<3;y++) {
ellipse(xPos+heft*.75*x,yPos+heft*.55*y,heft,heft);
  }
 
}
 noStroke(); //this rectangle erases the lines in the inside fo the cloud, leaving a "silver lining"
rect(xPos-heft*.25,yPos-heft*.25,heft*3.5,heft*1.5);
}
void flow () { //method 2 adds motion
floatOn();
xPos = xPos+speed;
if (xPos >width+heft){ //this conditional sends the cloud back to start once it passes over the screen completely
 xPos = xPos-width-heft*5;
}
}
}

