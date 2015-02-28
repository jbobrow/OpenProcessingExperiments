
ArrayList points = new ArrayList();
ArrayList posX;
ArrayList posY;
int distance = 200;
float m;
float n;
float number;
float anothernumber;
float anotheranothernumber;
float mousePressNumber;

int numberPoints=30;

void setup() {
  size(800, 500);
  background(255);
  fill(0);
  smooth();
  for (int i = 0; i <numberPoints; i++) {
    PVector point = new PVector(random(0, width-300), random(0, height));
    points.add(point);
  }
  for (int i = 0; i < numberPoints; i++) {
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


void mouseClicked() {  
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
          anotheranothernumber=anothernumber;
        }
      }
      anothernumber=0;
      number=number+anotheranothernumber;
      //above is for caculating number;
}


void draw() {
  

  
  if(keyPressed){
    if(key=='w'){
   distance= distance-2;
    }
    if(key=='s'){
     distance= distance+2;    
    }
  }

  strokeWeight(1);
  background(255);
  noStroke();
  fill(255,0,0);
  ellipse(mouseX, mouseY,10,10);
    stroke(180);
  noFill();
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
  textSize(12);
  text("data visualization for connections of points", width-300,30);
  text("press W key and S key to change the distance value", width-300,50);
  text(n, width-50, 110);
  text("add point position"+"    "+m, width-300, 110);
  text("amounts of points"+"    "+points.size(), width-300, 90);
  text("total amounts of connections "+"   "+(number), width-300, 130);
  text("more amounts of connections"+"   "+anotheranothernumber, width-300, 150);
  text("distance"+"    "+distance,width-300,170);
}   

