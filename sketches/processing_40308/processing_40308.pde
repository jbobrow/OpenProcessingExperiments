
void setup(){
  size(600,600);
  colorMode(RGB, width);
  for (int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      stroke(x,y,width);
      point(x,y);
    }
  }
 grid(); 
  }

void draw(){ 
  PFont font;
  font = loadFont("LilyUPC-48.vlw");
  textFont(font);
  text("Group 6 is awesome",100,40,50);
}

  
void grid(){
  noStroke();
for(int x=0; x<width; x+=40){
    for(int y=0; y<height; y+=40){
    fill(random(55)+255,255,0);
    rect(x,y,20,20);
    randomTriangle(x,y);
}
}
}

void randomTriangle(int x,int y){
  if (random(1001)<650) {
    fill(random(55)+255,0,0);
    triangle(x,y,x+20,y,x+20,y+20);
  }
}


