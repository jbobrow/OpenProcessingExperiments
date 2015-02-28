
int colorValue;

void setup(){
  size(600,800);
  smooth();
  background(400);
  fill(255,400,300);
  noStroke();
  
}

void draw(){
  background(colorValue,100,190);
  float ellSize =0;
  for(int x=0;x<width; x+=5){
  for(int y=0;y<height;y+=20){
    ellSize =tan(x*y)*cos(mouseX/100)*10;
    ellipse(x-200,y,ellSize,ellSize);
    fill(random(5000),random(255),random(50));
    fill(random(300), random(400),random(10));
  }
}
}

