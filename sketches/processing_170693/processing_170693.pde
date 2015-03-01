
void setup(){
  size(600,600);
   colorMode(RGB);
  fill(random(255),100,255,50);
}

void draw(){
 drawFace(mouseX,mouseY); // lets mouse when pressed change color 

}

void drawFace(int x, int y){
  // let’s draw 3 rectangles based on anchor point (x,y)
  rect(x,y,50,30); // head
  ellipse(x+25,y+10,10,10); // eye
ellipse(x+25,y+22,30,7); // mouth
line(x+25,y,x+25,y-5);

}
void mousePressed(){

  stroke(0);
  fill(random(255), random(255), random(255), 100); // random colors of the shape 
  rect(mouseX,mouseY, 50,30); 
  drawFace(mouseX, mouseY);
 
}
void keyPressed(){
 if(key == 'c'){ // clears background
 background(255);
}
else{
   background(0); // background turns to black
 }
}
