
//lines
void setup(){
  size(300,300);
  smooth();
  background(#FFFFFF);
}

void draw(){
  strokeCap(SQUARE);
  strokeWeight(10);
  //red line
  stroke(#FF0900);
 line(50,10,50,290);
 //orange line
 stroke(#FF9900);
 line(10,250,290,250);
 //yellow line
 stroke(#F6FF00);
 line(250,290,250,10);
//green line
stroke(#00FF1B);
 line(290,50,10,50);
  //red finished
  stroke(#FF0900);
 line(50,10,50,100);
}
