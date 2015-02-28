
ArrayList points = new ArrayList();
ArrayList posX;
ArrayList posY;
int distance = 200;
float m;
float n;
float number;
float anothernumber;
float anotheranothernumber;
void setup() {
  size(900, 600);
  background(255);
  fill(0);
  smooth();
  for (int i = 0; i <50; i++) {
    PVector point = new PVector(random(0, width), random(0, height));
    points.add(point);
  }
  for (int i = 0; i < 50; i++) {
    for (int j = 0; j < i; j++) {
      if (i != j) {
        PVector pointFromArrayI = (PVector) points.get(i);
        float pointXvalueI = pointFromArrayI.x;
        float pointYvalueI = pointFromArrayI.y;

        PVector pointFromArrayJ = (PVector) points.get(j);
        float pointXvalueJ = pointFromArrayJ.x;
        float pointYvalueJ = pointFromArrayJ.y;

        float distPoints = dist(pointXvalueI, pointYvalueI, pointXvalueJ, pointYvalueJ);
        if (distPoints <= distance) {
          line(pointXvalueI, pointYvalueI, pointXvalueJ, pointYvalueJ);
          number++;
        }
        //above is for caculating number;
      }
    }
  }
    background(255);
}
void mousePressed() {  
  PVector point= new PVector(mouseX, mouseY);
  points.add(point);
  m=mouseX;
  n=mouseY;
   PVector pointFromArrayI = (PVector) points.get(points.size()-1);
    for (int j = 0; j < points.size(); j++) {
       
        float pointXvalueI = pointFromArrayI.x;
        float pointYvalueI = pointFromArrayI.y;

        PVector pointFromArrayJ = (PVector) points.get(j);
        float pointXvalueJ = pointFromArrayJ.x;
        float pointYvalueJ = pointFromArrayJ.y;

        float distPoints = dist(pointXvalueI, pointYvalueI, pointXvalueJ, pointYvalueJ);
        if (distPoints <= distance) {
          line(pointXvalueI, pointYvalueI, pointXvalueJ, pointYvalueJ);
          anothernumber++;
          anotheranothernumber=anothernumber-1;
        }
      }
      anothernumber=0;
      number=number+anotheranothernumber;
      //above is for caculating number;
}


void draw() {
  stroke(180);
  strokeWeight(1);
  background(255);
  for (int i = 0; i < points.size(); i++) {
    for (int j = 0; j < i; j++) {
      if (i != j) {
        PVector pointFromArrayI = (PVector) points.get(i);
        float pointXvalueI = pointFromArrayI.x;
        float pointYvalueI = pointFromArrayI.y;

        PVector pointFromArrayJ = (PVector) points.get(j);
        float pointXvalueJ = pointFromArrayJ.x;
        float pointYvalueJ = pointFromArrayJ.y;

        float distPoints = dist(pointXvalueI, pointYvalueI, pointXvalueJ, pointYvalueJ);
        if (distPoints <= distance) {
          line(pointXvalueI, pointYvalueI, pointXvalueJ, pointYvalueJ);
          
        }
      }
    }
  }
  for (int i = 0; i < points.size(); i++) {
    fill(0);
    PVector pointFromArrayI = (PVector) points.get(i);
     float pointXvalueI = pointFromArrayI.x;
     float pointYvalueI = pointFromArrayI.y;
  ellipse(pointFromArrayI.x,pointFromArrayI.y,8,8);
  noFill();
  }
  fill(0);
  textSize(15);
  
  text(m, 700, height/7);
  text("add point position"+"    "+n, 500, height/7);
  text("amounts of points"+"    "+points.size(), 500, height/12);
  text("total amounts of connections "+"   "+(number), 500, height/5);
  text("more amounts of connections"+"   "+anotheranothernumber, 500, height/4);
  text("distance"+"    "+distance,500,height/3.2);
}   



