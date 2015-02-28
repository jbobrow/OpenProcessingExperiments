
//variables -------------------------------------------------------
int gamescreen = 1;
int level = 1;
int clicked = 0; //spent the first click
ball myclickball;
float rd_max_var = 100 - level*6;
int ballnumber;
int destination = (level*6);
ball[] createballs;
//ball[] createballs = new ball[ballnumber];
ArrayList<String> infected_xy = new ArrayList<String>();
//variables (changeable) -------------------------------------------
float rd_var = 6;
float speedx_var = 1;
float speedy_var = 1;
float grw_speed_var = 1;
float shrnk_speed_var = 1;
float stand_time_sec_var = 2;

PImage startbg;
PImage gamebg;
PImage fail;
PImage success;
PImage over;

void setup() {
  size (500, 500);
  PFont font;
  font = loadFont("ArialRoundedMTBold-48.vlw");
  startbg = loadImage("start.jpg");
  gamebg = loadImage("game.jpg");
  fail = loadImage("fail.jpg");
  success = loadImage("success.jpg");
  over = loadImage("over.jpg");
}
void createballss(){
  ballnumber = level*10;
  createballs = new ball[ballnumber];
  //ball[] createballs = new ball[ballnumber];
  for (int i = 0; i < ballnumber; i = i+1) {
    //ball(x,y,speedx, speedy, rd, rd_max, grw_speed, shrnk_speed, stand_time_sec,stage,dt_reached);
    createballs[i] = new ball(random(0, width-(rd_var/2)), random(0, width-(rd_var/2)), speedx_var, speedy_var, rd_var, rd_max_var, grw_speed_var, shrnk_speed_var, stand_time_sec_var, 1, 0);
  }
}

void retry(int level_f) {
  level = level_f;
  clicked = 0;
  destination = (level*6);
}
void next_level(int level_f) {
  level = level_f;
  clicked = 0;
  destination = (level*6);
}
void restart() {
  level = 1;
  clicked = 0;
  destination = (level*6);
}


void manage(ball obj) { //manages the stages of objects
  if (obj.stage == 1) {
    obj.stage1();
    for (int i = infected_xy.size()-1; i>=0;i--) { //we used infected_x for control, but it doesnt matter because size of infexted_x and infected_y are the same. additions are done at the same time.
      String infectedxy = infected_xy.get(i);
      String[] infected_exp =split(infectedxy, "|");
      //println(infectedxy+"    |||||   "+float(infected_exp[0])+"---"+float(infected_exp[1]));
      for (int iii = 0; iii < ballnumber; iii = iii+1) {
        if ((myclickball.stage == 2) || (myclickball.stage == 3) || (myclickball.stage == 4)) {
          //println(myclickball.x+","+myclickball.y+"-----"+float(infected_exp[0])+","+float(infected_exp[1]));
          if ((myclickball.x == float(infected_exp[0])) && (myclickball.y == float(infected_exp[1]))) {
            if (dist(obj.x, obj.y, float(infected_exp[0]), float(infected_exp[1])) <= ((rd_var/2) + myclickball.rd/2)) {
              obj.stage = 2;
            }
          }
        }

        if ((createballs[iii].stage == 2) || (createballs[iii].stage == 3) || (createballs[iii].stage == 4)) {
          //println(createballs[iii].x+","+createballs[iii].y+"-----"+float(infected_exp[0])+","+float(infected_exp[1]));
          if ((createballs[iii].x == float(infected_exp[0])) && (createballs[iii].y == float(infected_exp[1]))) {
            if (dist(obj.x, obj.y, float(infected_exp[0]), float(infected_exp[1])) <= ((rd_var/2) + createballs[iii].rd/2)) { 
              obj.stage = 2;
            }
          }
        }
      }
    }
  }

  if (obj.stage == 2) {
    obj.stage2(obj.x, obj.y);
    if (obj.rd == obj.rd_max) {
      obj.stage = 3;
    }
  }
  if (obj.stage == 3) {
    obj.stage3(obj.x, obj.y);
    if (obj.stand_complete == 1) {
      obj.stage = 4;
    }
  }
  if (obj.stage == 4) {
    obj.stage4(obj.x, obj.y);
    if (obj.rd == 0) {
      obj.stage = 5;
    }
  }
  if (obj.stage == 5) {
    obj.stage5(obj.x, obj.y);
  }
  //println(infected_xy.size());
  obj.draw_ball();
}

void draw() {
  background(255,255,255);
  fill (255,255,255);
  int infected_board;
 fill(0);
  if (gamescreen == 1) { //menu
//    textAlign(CENTER);
//    textSize(50);
//    text("C Reaction", width/2, 50);
//    textSize(20);
//    text("Chain Reaction Game", width/2, 70);
//    text("Press P to play", width/2, height/2);
//     textAlign(RIGHT);
//    textSize(20);
//    text("Oğuz Gelal", width-10, height-10);
image(startbg,0,0);
  }
  if (gamescreen == 2) { //game
 image(gamebg,0,0);
  textAlign(RIGHT);
    textSize(15);
    text("Infected ("+infected_xy.size()+")", width-10, height-10);
    textAlign(LEFT);
    textSize(15);
    text("Level : "+level, 20, 20);
    textAlign(RIGHT);
    textSize(15);
    if (destination == 0) {
      text("WIN! now enjoy the reaction", width-20, 20);
    }
    else{
    text(destination+" more to go", width-20, 20);
    }

    for (int i = 0; i < ballnumber; i = i+1) {
      manage(createballs[i]);
    }

    if ((mousePressed == true) && (clicked == 0)) {
      myclickball = new ball(mouseX, mouseY, speedx_var, speedy_var, rd_var, rd_max_var, grw_speed_var, shrnk_speed_var, stand_time_sec_var, 2, 1);
      clicked = 1;
    }
    if (clicked == 1) {
      manage(myclickball);
    }

    if ((infected_xy.size() == 0) && (destination == 0) && (level != 11)) {
      level = level + 1;
      gamescreen = 3; //level complete
    }
    if ((infected_xy.size() == 0) && (destination == 0) && (level == 11)) {
      gamescreen = 5; //game complete
    }    
    if ((infected_xy.size() == 0) && (destination != 0) && (clicked == 1)) {
      gamescreen = 4; //level failed
    }
  }


  if (gamescreen == 3) { //level completed
  image(success,0,0);
//    textAlign(CENTER);
//    textSize(50);
//    text("Level Completed", width/2, height/2);
//    textSize(20);
//    text("Press N for next Level", width/2, height/2 + 40);
  }

  if (gamescreen == 4) { //level failed
  image(fail,0,0);
//    textAlign(CENTER);
//    textSize(50);
//    text("Level Failed", width/2, height/2);
//    textSize(20);
//    text("Press R to Retry", width/2, height/2 + 40);
  }
  if (gamescreen == 5) { //game complete
  image(over,0,0);
//    textAlign(CENTER);
//    textSize(50);
//    text("Game Over", width/2, height/2);
//    textSize(20);
//    text("Press R to Restart", width/2, height/2 + 40);
  }
}

void keyPressed() {
  if ((key == 'P') || (key == 'p')) {
    if (gamescreen == 1) {
      createballss();
      gamescreen = 2;
    }
  }
  if ((key == 'R') || (key == 'r')) {
    if (gamescreen == 5) {
      restart();
      createballss();
      gamescreen = 2;
    }
    if (gamescreen == 4) {
      retry(level);
      createballss();
      gamescreen = 2;
    }
  }
    if ((key == 'N') || (key == 'n')) {
    if (gamescreen == 3) {
      next_level(level);
      createballss();
      gamescreen = 2;
    }
  }
}


class ball { // clas---------------------------------------------------------------------

  float speedx;
  float speedy;
  float rd;
  float x;
  float y;
  color clr;
  float rd_max;
  float grw_speed;
  float shrnk_speed;
  float stand_time_sec;
  int stand_complete = 0;
  int i = 0;
  int carpx;
  int carpy;
  int stage;
  int added_xy = 0;
  int dt_reached;
  int once1 = 0;
  int once2 = 0;


  ball(float x_f, float y_f, float speedx_f, float speedy_f, float rd_f, float rd_max_f, float grw_speed_f, float shrnk_speed_f, float stand_time_sec_f, int stage_f, int dt_reached_f) {
    x = x_f;
    y = y_f;
    speedx = speedx_f;
    speedy = speedy_f;
    rd = rd_f;
    rd_max = rd_max_f;
    grw_speed = grw_speed_f;
    shrnk_speed = shrnk_speed_f;
    stand_time_sec = stand_time_sec_f;
    stage = stage_f;
    dt_reached = dt_reached_f;

    int sayix = round(random(0, 1));
    int sayiy = round(random(0, 1));
    if (sayix == 1) {
      carpx = 1;
    }
    else {
      carpx = -1;
    }
    if (sayiy == 1) {
      carpy = 1;
    }
    else {
      carpy = -1;
    }
  }


  void draw_ball() {
    ellipseMode(CENTER);
    if (clr == color(0)) {
      fill(clr);
    }
    else {
      fill(0,0,1, 90);
    }
    smooth();
    noStroke();
    ellipse(x, y, rd, rd);
    noFill();
  }

  void stage1() { // before collapse | usage : ball.stage1();
    stage = 1;
    //arrange x
    if (x >= (width-(rd/2))) {
      carpx = -1;
    }
    if (x <= (rd/2)) {
      carpx = 1;
    }
    x = x + (speedx*carpx);
    //arrange y
    if (y >= (height-(rd/2))) {
      carpy = -1;
    }
    if (y <= (rd/2)) {
      carpy = 1;
    }
    y = y + (speedy*carpy);
    //color
    clr = color(0);
    //radius
    rd = 5;
  }


  void stage2(float x_f2, float y_f2) { //grow | usage : ball.stage2(ball.x,ball.y);
    stage = 2;
    //x,y freez
    x = x_f2;
    y = y_f2;

    if ((dt_reached == 0) && (destination > 0)) {
      destination = destination - 1;
      dt_reached = 1;
    }
    //arrande radius (grow)
    if (rd < rd_max) {
      rd = rd+grw_speed;
    }
    //color
    clr = color(0,0,1);
    //add infected info

    if (added_xy == 0) {
      infected_xy.add(x+"|"+y);
      added_xy = 1;
    }
    //println(infected_xy);
  }

  void stage3(float x_f3, float y_f3) { //stand | usage : ball.stage3(ball.x,ball.y);
    stage = 3;
    //x,y freez
    x = x_f3;
    y = y_f3;
    //radius
    rd = rd_max;
    //color
    clr = color(0,0,1);
    if (i == (stand_time_sec*60)) {
      stand_complete = 1;
    }
    else {
      i = i + 1;
    }
  }

  void stage4(float x_f4, float y_f4) { //shrink | usage : ball.stage4(ball.x,ball.y);
    stage = 4;
    //x,y freez ()
    x = x_f4;
    y = y_f4;
    clr = color(0,0,1);
    //radius
    if (rd > 0) {
      rd = rd - shrnk_speed;
    }
  }

  void stage5(float x_f5, float y_f5) { //disappear | usage : ball.stage5();
    stage = 5;
    x = x_f5;
    y = y_f5;

    rd = 0;
    clr = color(255);

    if ((infected_xy.indexOf(x+"|"+y)) != -1) {
      infected_xy.remove(infected_xy.indexOf(x+"|"+y));
    }
    //println(infected_xy.indexOf(x+"|"+y));
    //println(infected_xy + "------" + x+"|"+y);
  }
}


