
float speed2=1;
float gravity=0.1;
float x, y, mx, my,speed;

void setup(){
  size(900,400);
  background(0);
  smooth();
}

void draw(){
  mx = mx + (mouseX-mx)/200; 
  my += (mouseY-my)/200; 



  speed=speed+gravity;
  x=x+ speed;
  y=y+speed2;


  if((x>height)|| (x<0)){

    speed=speed*-1;
  }

  if((y>width)|| (y<0)){

    speed2=speed2*-1;
  }

  stroke(0,0,0,100);
  fill(x,y,255,100);
  ellipse(mx+random(2),my+random(2),x/6,x/6);

  if(mousePressed){
    background(0);
  }
}




