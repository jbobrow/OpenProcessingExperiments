
int startX=5; //Initial x-coordinate
int stopX=380; //Final x-coordinate
int startY=10; //Initial y-coordinate
int stopY=420;  //Final y-coordinate
float x=startX;  //Current x-coordinate
float y=startY;  //Current y-coordinate
float step=0.006; //Size of each step(0.0 to 8.0)
float pct=0.5; //Percentage traveled (0.0 to 8.0)

PFont font;

void setup(){
  size(500,450);
  smooth();
  frameRate(15);
  font=loadFont("Arial-Black-36.vlw");
  textFont(font);
  
}
void draw(){
  background(#C620BE);
  textSize(36);
  text("watch the black ball", 50,60,70);
  if(pct<1.0){
    x=startX+((stopX-startX)*pct);
    y=startY+((stopY-startY)*pct);
    pct+=step;
  }
  ellipse(x,y,35,35);
  fill(0);
 
//rectangle1
  stroke(0);
  fill(#F0E62E);
  rect(0,150,70,94);
  fill(#2EF086);
  rect(8,180,12,18);
  rect(15,180,12,18);
  rect(25,180,12,18);
  fill(#000F01);
  
  //rectange2
  stroke(0);
  fill(#282A74);
  rect(0,250,180,145);
  fill(#42E3DF);
  rect(50,225,160,120);
  rect(60,225,160,120);
  rect(70,225,160,120);
  fill(#89F70C);
  
  //rectangle3
  stroke(0);
  fill(#F7200C);
  rect(110,340,220,140);
  fill(#89F70C);
  rect(130,280,180,150);
  fill(#000F01);
  
  
}
