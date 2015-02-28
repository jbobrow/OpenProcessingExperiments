
///////////////////////////////////////////////////////
//click on the screen to create little balls
//right-click on ball to delete it
//the balls will immediatelly start reacting with each other
//they avoid each other, but are attracted to the "team"
//up/down controlls the attractor bar (top)
//left/right controls the avoidance bar.
//TAB = pause
///////////////////////////////////////////////////////

//global variables declaration
ArrayList balls;
Intrface game;
float midx, midy;
float br; //ball radius
color bkgcolor;
color dotcolor;
color linecolor;
color centerstroke;
color centercolor;
int ballslimit;
float rnd;//random value (how random)
boolean paused;
float pos_power, neg_power;

//init variables etc.
void setup(){
  colorMode(RGB,255,255,255,100);
  game = new Intrface(800,600,60);
  paused = false;
  bkgcolor = color (0,0,0,100);
  dotcolor = color (255,0,255,90);
  linecolor = color(255,255,255,5);
  centercolor = color (200,64,64,60);
  rnd = 0.0;
  br = 10;
  pos_power = 0.4; // 0.01 to 0.9
  neg_power = 300; // 30 to 300
  ballslimit = 60;
  balls = new ArrayList();
  balls.add(new Ball(width/2, height/2));
}

void draw(){
  game.displaybkg();
  //calculate the middle of the group
  midx = 0;
  midy = 0;
  pos_power = game.pos_power;
  neg_power = game.neg_power;
  for (int i = balls.size()-1; i >= 0; i--) { 
    Ball ball = (Ball) balls.get(i);
    midx += ball.xpos;
    midy += ball.ypos;
  }
  midx /= balls.size();
  midy /= balls.size();
  /*if (midx>mouseX) midx -= (midx-mouseX)/10;
  if (midx<mouseX) midx += (mouseX-midx)/10;
  if (midy>mouseY) midy -= (midy-mouseY)/10;
  if (midy<mouseY) midy += (mouseY-midy)/10;*/
  for (int i = balls.size()-1; i >= 0; i--) {
    Ball ball = (Ball) balls.get(i);
    if ((!paused)&(balls.size() >1)) ball.move(midx,midy,true);
    //if ((!paused)&(balls.size() >1)) ball.move(mouseX,mouseY,true);
    for (int j = balls.size()-1; j >= 0; j--) {
      Ball bill = (Ball) balls.get(j);
      if ((!paused)&(balls.size() >1)&(ball.xpos != bill.xpos)) ball.move(bill.xpos,bill.ypos,false);
      stroke(linecolor);
      line(ball.xpos,ball.ypos,bill.xpos,bill.ypos);
    }
  ball.display();
  }
  noStroke();
  fill(centercolor);
  arc(midx, midy,br,br,0,2*PI);
  game.displaybars();
}



