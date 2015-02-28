
ArrayList points = new ArrayList();
ArrayList posX;
ArrayList posY;
int distance = 200;
float m;
float n;
int i=0;
int j=0;

void setup() {
  size(900, 600);
  background(255);
  fill(0);
  smooth();
  for (int i = 0; i <50; i++) {
    PVector point = new PVector(random(0, width), random(0, height));
    points.add(point);
  };
    
}
//void mousePressed() { 
//  PVector point= new PVector(mouseX, mouseY);
//  points.add(point);
//  m=mouseX;
//  n=mouseY;
//   PVector pointFromArrayI = (PVector) points.get(points.size()-1);
//    for (int j = 0; j < points.size(); j++) {
//        
//        float pointXvalueI = pointFromArrayI.x;
//        float pointYvalueI = pointFromArrayI.y;
// 
//        PVector pointFromArrayJ = (PVector) points.get(j);
//        float pointXvalueJ = pointFromArrayJ.x;
//        float pointYvalueJ = pointFromArrayJ.y;
// 
//        float distPoints = dist(pointXvalueI, pointYvalueI, pointXvalueJ, pointYvalueJ);
//        if (distPoints <= distance) {
//          line(pointXvalueI, pointYvalueI, pointXvalueJ, pointYvalueJ);
//        }
//      }
//      //above is for caculating number;
//}
// 
 
void draw() {
   noFill();
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
  };
//  PVector pointStart= new PVector(0, 0);
//  points.add(pointStart);
//  PVector pointEnd= new PVector(width, height);
//  points.add(pointEnd);
   for (i=0;i < points.size(); i++) {
    for (j=i; j < points.size(); j++) {
      if (i != j) { 
        PVector pointFromArrayI = (PVector) points.get(i);
        float pointXvalueI = pointFromArrayI.x;
        float pointYvalueI = pointFromArrayI.y;
 
        PVector pointFromArrayJ = (PVector) points.get(j);
        float pointXvalueJ = pointFromArrayJ.x;
        float pointYvalueJ = pointFromArrayJ.y;
 
        float distPoints = dist(pointXvalueI, pointYvalueI, pointXvalueJ, pointYvalueJ);
        if (distPoints <= distance) {
              stroke(0,255,255);
           strokeWeight(2);
          line(pointXvalueI, pointYvalueI, pointXvalueJ, pointYvalueJ);
            stroke(180);
           strokeWeight(1);
          fill(100,30);
          ellipse(pointXvalueI,pointYvalueI,distance,distance); 
          fill(0);
          ellipse(pointXvalueJ,pointYvalueJ,8,8);       
     
          i=j;  
        
        println(i);  
        println(j);      
        }
      }
    }
  };
  fill(0);
   PVector pointStart = (PVector) points.get(0);
     PVector pointEnd = (PVector) points.get(49);
   ellipse(pointStart.x,pointStart.y,8,8);
   noFill();
//  for (int m = 0; m < points.size(); m++) {
//    fill(0);
//    PVector pointFromArrayI = (PVector) points.get(i);
//     float pointXvalueI = pointFromArrayI.x;
//     float pointYvalueI = pointFromArrayI.y;
//  ellipse(pointFromArrayI.x,pointFromArrayI.y,8,8);
//};
}
