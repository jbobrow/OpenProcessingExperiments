
//creat v with 2 lines
//creative programming class 20141010
//FW season trend pattern burgendy REd check

void setup(){
  size(600,600);
  frameRate(10);
}

void draw(){
  background(#711F1F);
  //stroke(random(31,199),random(0,180),random(40,255));
    stroke(random(mouseY,mouseY),random(mouseY,mouseX),random(mouseX,mouseY));
  strokeWeight(random(0.3,2));
  
for (int y = 120; y<=height; y+=130){
  for(int x = 20; x<=width; x+=15){
    line(x,y,x-15,y-30);
    line(y,x,y-30,x+15);
  }
}
}
