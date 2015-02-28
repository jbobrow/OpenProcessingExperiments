

void setup() {
  size(800,500);
  //typo = loadFont("ScalaSans-48.vlw");
}

void draw() {
  background(0);
  ball();
  raquette1();
  raquette2();
  stroke(255);
  line(400,0,400,500);
   
}

void scoreJ() {
  

}

//......................................................................................
//raquette1.............................................................................
//......................................................................................

float raqu1_x=100;
float raqu1_y=300;
float raqu1_w=10;
float raqu1_h=80;
float vitraqu1y=2.5;

void raquette1() {
  fill(255);
  rect(raqu1_x,raqu1_y,raqu1_w,raqu1_h);
  
  if(raqu1_y+raqu1_h/2<ball_y) {
    raqu1_y+=vitraqu1y;

  }
  
  if(raqu1_y+raqu1_h/2>ball_y) {
    raqu1_y-=vitraqu1y;

  }
  
}
//......................................................................................
//raquette2.............................................................................
//......................................................................................


float raqu2_x=700;
float raqu2_y=80;
float raqu2_w=10;
float raqu2_h=80;

void raquette2() {
  raqu2_y = mouseY;
  fill(255);
  rect(raqu2_x,raqu2_y,raqu2_w,raqu2_h);
  
}

//......................................................................................
//BALL..................................................................................
//......................................................................................

float ball_x=30;
float ball_y=30;
float ball_w=20;
float vitx=3;
float vity=3;

void ball() {
  ellipse(ball_x,ball_y,ball_w,ball_w);
  ball_x+=vitx;
  ball_y+=vity;
  
  
  
  if(ball_x>width) {
    vitx*=-1;
   /* ball_x=width/2;
    scoreOrdi++;
    vity=random(-3,3);*/
  }
  
  if(ball_x<0) {
    vitx*=-1;
    /*ball_x=width/2;
    scoreJ++;
    vity=random(-3,3);*/
  }

  if(ball_y>height) {
    vity*=-1;
  }
  
  if(ball_y<0) {
    vity*=-1;
  }
  
  if(ball_x>raqu2_x-raqu2_w && ball_x<raqu2_x && ball_y<mouseY+raqu2_h && ball_y>mouseY) {
    vitx*=-1;
  }
  
  if(ball_x<raqu1_x+2*raqu1_w && ball_x>raqu1_x && ball_y<raqu1_y+raqu1_h && ball_y>raqu1_y) {
    vitx*=-1;
  }
  
}



