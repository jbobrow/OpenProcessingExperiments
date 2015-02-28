

Pt []myPoint=new Pt[200];//declare array

void setup() {
  size(600, 600);
  smooth();

  float originX=width/2;
  float originY=height/2;
  float angle=0;

  for (int i=0; i<myPoint.length;i++) {
    float radius=random(200);
    float xPos=originX+cos(angle)*radius;
    float yPos=originY+sin(angle)*radius;
    angle+=radians(3.6);

    myPoint[i]=new Pt(xPos, yPos);
  }
}


void draw() {
  background(0);

  // draw the lines
  // we use a nested for loop to get 2 samples(each turn) of all the spots available 
  // see th function "spring" on the other tab
  for (int i = 0; i < myPoint.length-1; i++) {
    for (int j = i +1; j < myPoint.length; j++) {
      connector(myPoint[i].x, myPoint[i].y, myPoint[j].x, myPoint[j].y); //use x,y of 1st poingt &2nd point
    }
  }

  for (int i=0;i<myPoint.length; i++) {
    myPoint[i].update(mouseX, mouseY); 
    myPoint[i].display();
  }
}


