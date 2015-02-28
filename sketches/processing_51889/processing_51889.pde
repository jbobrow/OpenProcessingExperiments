
//Homework 3

//Set Up
void setup(){
  size(800,800);
  smooth();
  background(random(255),random(255),random(255));
}

//Brush Action
void draw(){
  for(int x= 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
      strokeWeight(1);
      if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
        fill(255,10);
  rect(400,400,0,0);
  float speedX = abs(mouseX-pmouseX);
  for(int i = 0;i < speedX; i++){
    strokeWeight(10);
    rect(mouseX,mouseY,i*3,i*3);
    fill(random(255),random(255),random(255));
  }
      } 
      }
    }
    for(int i = 400; i<401; i++){
    stroke(random(255),random(255),random(255));
    line(mouseX,mouseY,i,i);
  }
  }
  
//Image Reset
void mouseReleased(){
     background(mouseX,mouseY);
}
     void mousePressed(){
       background(mouseX,mouseY);
}

