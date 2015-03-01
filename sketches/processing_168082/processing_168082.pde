
void setup(){
  size(600,600);
}

void draw(){
   drawFace(300,200,color(255,0,0));
drawFace(400,400);

}

void drawFace(int x, int y,color c){
  // let’s draw 3 rectangles based on anchor point (x,y)
  rect(x,y,100,80); // head
  line(x+20,y+10,x+80,y+10);
  ellipse(x+50,y+20,20,20);
  ellipse(x+50,y+60,60,30)
  fill(c);

 
}

