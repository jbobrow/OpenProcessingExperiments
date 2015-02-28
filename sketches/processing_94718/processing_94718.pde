
//zooming_rotating_sliding
color[] palette = {#f7cb61,#cb282f,#4a4a50,#776d53,#c4a14d };

int d = 40;

float xo;
float yo;
float zoom = 1;
float angle = 0;

//Setup////////////////////////////////////////////////////////
void setup(){
  size(600,200);
  xo= width/2;
  yo= height/2;
  smooth();
  noStroke();
}//end setup

//draw//////////////////////////////////////////////////////////
void draw(){
  background(palette[0]);
  translate(xo,yo);
  scale(zoom);
  rotate(angle);
  
  fill(palette[1]);
  ellipse(-200,0,d,d);
  fill(palette[1]);
  ellipse(0,-100,d,d);
  
  fill(palette[2]);
  ellipse(-100,0,d,d);
  fill(palette[2]);
  ellipse(0,-50,d,d);
  
  fill(palette[3]);
  ellipse(0,0,d,d);
  
  fill(palette[2]);
  ellipse(100,0,d,d);
  fill(palette[2]);
  ellipse(0,50,d,d);
  
  fill(palette[1]);
  ellipse(200,0,d,d);
  fill(palette[1]);
  ellipse(0,100,d,d);
}//end draw

//keyPress///////////////////////////////////////////////////////
void keyPressed(){
  if(key == CODED) {
    if (keyCode == UP){
      zoom +=.03;
    }else if(keyCode == DOWN) {
      zoom -= .03;
    }else if(keyCode == RIGHT) {
      angle += .03;
    }else if (keyCode == LEFT) {
      angle -= .03;
    }
  }
  if (key ==' ' ){
    angle = 0;
    zoom = 1;
    xo = width/2;
    yo = height/2;
  }
}//end keyPress

//mouseDrag////////////////////////////////////////////////////
void mouseDragged() {
  xo = xo + (mouseX-pmouseX);
  yo = yo + (mouseY-pmouseY);
}//end mouse drag
