


float cor(){
  float i;
  i = random(255);
  return i;
}

  
void setup(){
size(400,400);
background(30);

fill(60,30,10);
rect(90,210,210,150);

for(int y=210; y<=310; y+=45){
  stroke(72,38,12);
  strokeWeight(8);
  line(90,y,300,y);
}


fill(210);
textSize(50);
text("18",160,210);

}

void draw(){
 for(int y=50; y<=90; y+=5){
  stroke(cor(),cor(),cor());
  strokeWeight(1);
  line(90,y,300,y);

}
}
