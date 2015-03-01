
//assignment for week 4 tuesday
//Andrea Pagan - Hat Guy




int x,y;
float xIntheBox;
float yIntheBox;
void setup(){

  size(640,520);
  
  
}

void draw(){
  background(0);
  x = mouseX;
  y = mouseY;
  
  fill(0,0,100);
 
  ellipse(320,150,300,200);
  
  ellipse(320,200,500,100);
  fill(0,0,0);
  ellipse(320,200,300,70);
  fill(190,110,70);
  ellipse(320,265,350,200);
  fill(255,255,255);
  ellipse(250,240,80,80);
  ellipse(395,240,80,80);
 
  fill(190,110,70);
  arc(323,275, 50, 50, -PI, 0);
  fill(0,0,0);
  arc(323,330, 50, 50, -PI, 0);


xIntheBox = map(x,0,639,240,265);
yIntheBox = map(y,0,400,220,251);
ellipse(xIntheBox,yIntheBox,40,40);
xIntheBox = map(x,0,639,240,265);
yIntheBox = map(y,0,400,220,251);
ellipse(xIntheBox+140,yIntheBox,40,40);

println(x);
}
