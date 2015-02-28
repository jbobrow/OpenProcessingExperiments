
//primo lavoro autonomo Andrea Maggiore
void setup (){
  size(800,600);
  background(0);
  //noLoop();
  frameRate(150);
}
int x =800;
int y =800;

void draw (){
  stroke (255,255,255);
  strokeWeight(10);
  line(x,500,x,500);
  line(x,400,x,400);
  line(x,300,x,300);
  line(x,200,x,200);
  line(x,100,x,100);
  line(100,y,100,y);
  line(200,y,200,y);
  line(300,y,300,y);
  line(400,y,400,y);
  line(500,y,500,y);
  line(600,y,600,y);
  line(700,y,700,y);
  line(800,y,800,y);
  if (x>0){
  if (y>0){
    x--;
    y--;
  
}else{
  x=0;
  y=0;
}
}
}

