

float x1, y1, x2, y2, x3, y3;//use class Spot to create triangle
float mx, my;


//Spot is included in Triangle
Spot []mySpot=new Spot[100];


void setup() {
  size(600, 600);
  background(0);
  smooth();

  //translate(width/2, height/2);//center
  float originX=width/2;//x to the center
  float originY=height/2;//y to the center
  float angle=0;//angle starts from 0

    //initial object mySpot
  for (int i=0; i<mySpot.length;i++) {//assign array
    float radius=random(250);//random radius ranges from 0-300
    angle+=radians(9);//each time increase radians(9)
    float xPos=originX+cos(angle)*radius;//xPos is used in classSpot
    float yPos=originY+sin(angle)*radius;
    mySpot[i]=new Spot(xPos, yPos);//let xPos,yPos(from arrayMySpot) be used in classSpot//mySpot is an object
  }
}

  void draw() {
    background(0);
    for (int i = 0; i < mySpot.length; i++) {
      mySpot[i].update(mouseX, mouseY);//use method to move points
      mySpot[i].drawSpot();//use method to draw points
    }

   //initial object myTriangle
    for (int i = 0; i < mySpot.length; i++) {//assign array//mySpot.length=50
      noFill();
      stroke(255);
      strokeWeight(0.01);
      triangle(mySpot[0].x, mySpot[0].y, mySpot[1].x, mySpot[1].y, mySpot[2].x, mySpot[2].y);//miss the first 3points
      if (i>=3&&i+2<mySpot.length) {
        // for (int j = i + 1; j < mySpot.length-1; j++) {
        // for (int k = i + 2; k < mySpot.length; k++) {   
        x1=mySpot[i].x;
        y1=mySpot[i].y;
        x2=mySpot[i+1].x;
        y2=mySpot[i+1].y;
        x3=mySpot[i+2].x;
        y3=mySpot[i+2].y;
        //initial triangle by using array_mySpot
        //}
        //}
      }
      triangle(x1, y1, x2, y2, x3, y3);//draw triangle
    }
  }
   


