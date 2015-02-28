
PImage catinthehat;

/*setting up an array for X & Y position of circle
 maximum # of circles is 101 (position 100 of the array)
 initial click is 0, ie when we don't click*/

int xPos[]=new int [78]; //yup all 78 of them
int yPos[]=new int [78]; //nothing more
int clicks = 0;

void setup() {
  size (500, 615);
  smooth();
}

void draw() {

  catinthehat = loadImage("connect.jpg");
  image(catinthehat, 0 , 0 );

  //no dots to begin with, when there are less than 78 dots & # of dots is less than # of clicks, dots increase by 1 
  for (int dots = 0; dots<78 && dots<clicks; dots++) {
    fill(0);
    noStroke();
    //draw a new dot & store its value in the xPos yPos arrays
    ellipse(xPos[dots], yPos[dots], 5, 5);

    //a line is drawn from the previous x&yPos stored in the array to the current x&yPos position
    if (dots>0){
      strokeWeight(2);
      stroke(0);
      line(xPos[dots-1], yPos[dots-1], xPos[dots], yPos[dots]);
    }
  }
}

//when the mouse is pressed values for mouseX&Y get stored in the xPos&yPos arrays
//drawing in increments of clicks
void mousePressed() {
  xPos[clicks]=mouseX;
  yPos[clicks]=mouseY;
  clicks++;
}




