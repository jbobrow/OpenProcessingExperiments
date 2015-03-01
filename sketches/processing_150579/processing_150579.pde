
float x,y;
float v=100;
float dt=0.05;
float dx;
void setup(){
   size(600,200);
   //rectMode(CENTER);
}
void draw(){
  background(200);
  //tramo1
  if(x<width/2){
    dx = v*dt;
    x+=dx;
    y=0;
  }
  //tramo2
  else{
    dx= (v/2)*dt;
    x+=dx;
    y-=PI/4;
  }
  //se traslada la escena
  translate(x,y);
  //dibujo del cuerpo del coche
  rect(0, height/2, 60, 30);
  //2 ruedas
  ellipse(10, (height/2)+40, 20, 20);
  ellipse(50, (height/2)+40, 20, 20);
}


