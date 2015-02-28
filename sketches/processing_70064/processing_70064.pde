
int x = 100, y = 100;

float dt;
float prevMx, prevMy;
float velMouse=0;

//..................

void setup(){
  size(500,500);
  background(120,175,100);
  
  prevMx=mouseX;
  prevMy=mouseY;
  
}

//.....................

void draw(){
  
  //background(0,125,0);
  
  /*fill(125,0,250);
  stroke(0);
  triangle(x,y,x+20,y+40,x-20,y+40);
  */
  
  
  dt = distancia(width/2,height/2,mouseX,mouseY);
  // dt [0,350]; ndt=map(dt,0,350,0,255) -> ndt=[0,255];
  
  dt=map(dt,0,350,0,255);
  
  
  println(dt);
  stroke(0,dt,125);
  line(width/2,height/2,mouseX,mouseY);
  
  //fill(125,255,0);
  //ellipse(mouseX,mouseY,dt,dt);
  
  velMouse=distancia(mouseX,mouseY,prevMx,prevMy);
  
  fill(dt,100,200,125);
  ellipse(mouseX,mouseY,velMouse,velMouse);
  
  fill(100,200,dt,125);
  ellipse(0,mouseY,velMouse,velMouse);
  
  fill(200,dt,100,125);
  ellipse(mouseX,0,velMouse,velMouse);

  
  prevMx=mouseX;
  prevMy=mouseY;
  

  
}

//.....................

float distancia(float x1, float y1, float x2, float y2){
 
  float dx,dy,h;
  
  dx=x2-x1;
  dy=y2-y1;
  h=sqrt(dx*dx+dy*dy);
  
  return h;
  
}

//.....................sqrt = raiz cuadrada

void tri2(int tx, int ty, int rojo, int verde, int azul){
  
  float dt;
  
  dt=distancia(tx,ty,mouseX,mouseY);
 
  fill(rojo,verde,azul);
  stroke(0);
  triangle(tx,ty,tx+dt,ty+40,tx-dt,ty+40);
 
 
  
}



