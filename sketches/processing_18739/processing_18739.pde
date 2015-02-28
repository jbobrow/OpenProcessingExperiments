
float C1X = 250;
float C1Y = 50;
float C2X = 0;
float C2Y = 200;
float LX = 0;
float LY = 0;


void setup() {
  size (250,250);
  background (25,50,200);
  smooth();
  noFill();
stroke(100,100,0);
strokeWeight (5);
bezier(50,50,C1X,C1Y,C2X,C2Y,200,200);


 
}

void draw() {
  stroke(255,0,0,random(50));
  line(LX++,0,LX++,250); 
  noFill();
stroke(200,200,0,random(25));
strokeWeight (5);
bezier(50,50,C1X++,C1Y,C2X--,C2Y,200,200);
 stroke(0,200,0,random(50));
  line(0,LY++,250,LY++); 

}

