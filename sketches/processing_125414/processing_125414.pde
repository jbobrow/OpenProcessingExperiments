
/*18anos, yaaay, parabens, uhu ~o~ */




float cor(){
  float i;
  i = random(255);
  return i;
}
float bola(){
  float b;
  b=random(100);
  return b;
}

float area(){
  float a;
  a=random(400);
  return a;
}

void draw(){

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
  
  for(int y=195; y<=220; y+=2){
    stroke(cor());
    strokeWeight(1);
    fill(cor(),cor(),cor(),bola());
    ellipse(area(),area(),bola(),cor());
 }
 for(int y=165; y<=185; y+=2){
    stroke(cor(),cor(),cor());
    strokeWeight(1);
    line(175,173,y,60);
  }
 for(int y=195; y<=220; y+=2){
    stroke(cor(),cor(),cor());
    strokeWeight(1);
    line(210,173,y,60);
 }
}
  
   void setup(){
   size(400,400);
   background(30);
 }

