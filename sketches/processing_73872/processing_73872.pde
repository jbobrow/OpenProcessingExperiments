
int fillDuration = 5000;
int overflowDuration = 1000;
color testTubeColor = #DCF8FA;
color bgColor = #2F536A;
color chemicalColor = #C4FF05;
color explosionColor = #FA67EC;

void setup(){
 size(400,700);
 background(bgColor); 
}



void draw(){
  
  stroke(testTubeColor);
  strokeWeight(150);
  strokeCap(SQUARE);
  line(200,100, 200,550);
  strokeCap(ROUND);
  line(200,500, 200,550);
  
  strokeWeight(120);
  strokeCap(ROUND);
  stroke(chemicalColor);
  line(200,530, 200,550);
  strokeCap(SQUARE);
  float topFillEdge = 530-millis()/15;
  for (int i=1; i<2; i++) {
    line(200,530, 200,topFillEdge);
    if (topFillEdge>110) {
      noStroke();
    }
  }
  

  
  strokeWeight(121);
  strokeCap(SQUARE);
  stroke(bgColor);
  line(200,0, 200,110);
  
  //explosion!!
  if (millis()>5000){
  strokeWeight(120);
  strokeCap(ROUND);
  stroke(explosionColor);
  line(200,530, 200,550);
  strokeCap(SQUARE);
  line(200,530, 200,0);
  fill(explosionColor);
  noStroke();
  quad(0,0, 140,110, 260,110, 400,0);
  strokeWeight(2);
  stroke(#FCB2F5);
  strokeCap(ROUND);
  for (int i=1;i<120;i++){
    line(140+i,110, random(0,400),0);
  }
  }
  
  strokeWeight(30);
  strokeCap(ROUND);
  stroke(testTubeColor);
  line(170,400, 170,140);
}
