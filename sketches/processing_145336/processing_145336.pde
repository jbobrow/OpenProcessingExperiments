

//definim variables
int _x;
int _y;
int velX;
int velY;

void setup(){
  size(200,200);

  _x = width/2;
  _y = height/2;
  velX = 3;
  velY = 4;
}

void draw(){
   _x = _x+velX;
  _y = _y+velY;
  background(255,255,255);
  fill(247,202,224);
      if(mousePressed){
  fill(177,33,180);
}
  ellipse(_x,_y,width/1.666,height/1.666);
        if(mousePressed){
  fill(255,21,21);
}
  fill(255,255,255);

  ellipse(_x+23,_y-21,width/5.5,height/5.5);

  fill(0);
  ellipse(_x+15,_y-25,width/20,height/20);
  fill(255,255,255);
  ellipse(_x-23,_y-20,width/5,height/5);
  fill(0);
  ellipse(_x-15,_y-25,width/20,height/20);
  fill(173,110,140);
  ellipse(_x,_y+20,width/4,height/8);
  fill(0);
  ellipse(_x-10,_y+20,width/15,height/18);
  fill(0);
  ellipse(_x+10,_y+20,width/15,height/18);
//posicio X
  if((_x-63<0)||(_x+63>width)){
    velX = -velX;
  }
    //posicio Y
  if((_y-63<0)||(_y+63>height)){
    velY = -velY;
}
}
void mousePressed() {
   
 _x=mouseX;
 _y=mouseY;
}




