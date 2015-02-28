
void setup() {
  size(255,255);  
  textFont(createFont("arial",16)); 
  colorMode(HSB,255);
  noStroke();

  ellipseMode(CENTER);
  smooth();
}
int x=25;int dx=1;
int y=52;int dy=1;
String m = "а потом ты понимаеш, что она задала тебе вопрос...";
float mw;

void draw() {
  mw = textWidth(m);
  background(x,255,255);

  fill(map(y,0,height,200,255),x,255,200);
  ellipse(width/2-45,height/2,100,100);
  ellipse(width/2+45,height/2,100,100);  


  fill(0,255-(120+120*sin(map(x,0,width,-PI,+PI))),255);
  println(120+120*sin(degrees(map(x,0,width,-PI,+PI))));
  ellipse(width/2-45,height/2,15,15);
  ellipse(width/2+45,height/2,15,15);    

  fill(map(x,0,width,125,255),y,100);
  x+=dx;
  y+=dy;

  if(x<0 || x>width) dx=-dx;
  if(y<0 || y>height) dy=-dy;
  
  text(m,x-mw/2,y);  
}

