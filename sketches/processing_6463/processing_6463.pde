
PFont mario;
PFont letter;
PShape b1, b2;
PShape l2;
PShape l3;
PShape v1;
PShape a1;
PShape p;
PShape h1, h2, h3, h4;
PShape o1, o2, o3, o4;
float b1x, b2x, h1x, l2_1x, l2_2x, l3_1x, l3_2x ;
float b1y = 0;
float b2y;
PShape button;
boolean start_fall = false;
boolean start_game = false;
boolean hard = false;
boolean in_water = false;
PShape start;
PShape cloud;
int omar_count = 0;
int omar_frame = 20;
boolean h1on = true;
boolean h2on = true;
boolean h3on = true;
boolean h4on = true;
int omar_step = 0;
float omar_y = 315;
float gravity = 0.1;
float omar_accelleration;
boolean omar_jumping = false;
boolean game_on = false;
float omar_x = -150;
float easing = 1;
boolean fall = false;
boolean game_over = false;
int page = 1;
int game_over_counter;
int highest_level = 2;
int lives = 5;
int level_time = 0;
PShape o5;
PShape f;
PShape c;

int[] level_1_holes = {
  680, 970, 1180, 1400, 1580};
int level_1_flag = 1900;

int[] level_1_holes_hard = {
  680, 830, 1000, 1170, 1340, 1550};

int[] level_2_holes = {
  680, 900, 1090, 1280, 1470, 1500};
int level_2_flag = 1800;

int[] level_2_holes_hard = {
  680, 870, 1000, 1280, 1410, 1460};

int[] level_3_holes = {
  -200, -100,0,100,200,400, 600, 800, 1120, 1300, 1400, 1500,1600,1700,1800 };
int level_3_flag = 1550;

int[] level_3_holes_hard = {
  -200, -100, 0, 100, 400, 600, 910, 1150, 1400, 1500, 1600, 1700, 1800};

int[] level_4_holes = {
  680, 970, 1260, 1320, 1550, 1700, 1880, 2300};
int level_4_flag = 2600;

int[] level_4_holes_hard = {
  680, 730, 930, 1000, 1270, 1340, 1550, 1650, 1790, 2000, 2200};


void setup() {
  size(640,480);
  mario = loadFont("Mario-100.vlw");

  letter = loadFont("Letter-16.vlw");
  textAlign(CENTER);
  b1 = loadShape("background.svg");
  b2 = loadShape("background.svg");
  h1 = loadShape("h1.svg");
  o1 = loadShape("omar1.svg");
  o2 = loadShape("omar2.svg");
  o3 = loadShape("omar3.svg");
  o4 = loadShape("omar4.svg");
  o5 = loadShape("omar5.svg");
  f = loadShape("flag.svg");
  start = loadShape("start.svg");
  cloud = loadShape("cloud.svg");
  l2 = loadShape("level2.svg");
  v1 = loadShape("v1.svg");
  l3 = loadShape("level3.svg");
  a1 = loadShape("a1.svg");
  button = loadShape("button.svg");
  p = loadShape("pp1.svg");
  c = loadShape("castle.svg");

  b1x = 0;
  b2x = b2.width;
  l2_1x = 0;
  l2_2x =l2.width;
  l3_1x = 0;
  l3_2x =l3.width;
}

void draw(){
  smooth();

  fill(255);
  textFont(mario);
  if(page==0){
    background(0);
    if(lives == 0)
    {
      highest_level = 1;
      text("Game Over",320,143);
    }
    else{
      text("Lives : "+lives,320,143);
    }

    game_over_counter += 1;
    if(game_over_counter > 150){
      if(lives == 0)
      {
        lives = 5;
      }
      game_over_counter = 0;
      page=highest_level;
    }
  }
  if(page==1){
    if(omar_x < 85){
      omar_x += 1;
    }
    
    shape(cloud, 0, 0);
    text("SUPER OMAR JUMPER",320,143);

    pushMatrix();
    textFont(letter);
    fill(0);
    String s ="Help Omar jump over obstacles! Click to jump, move by having your mouse left or right of Omar. Pick EASY or HARD by jumping between the clouds.";
    text(s, 315, 207, 290, 300);
    String e = "EASY";
    text(e, 50, 440, 350,100);
    String h = "HARD";
    text(h, 280, 440, 350,100);
    if(!start_game){
      shape(button, 0,0);
      String st = "START";
      text (st, 280, 350, 350, 100);

    }
    

    popMatrix();

    if (start_game){
      if(mouseX > omar_x + 45){
        omar_x += easing;
      }
      if(mouseX < omar_x ){
        omar_x -= easing * 2;
      } 
    }
    if(omar_x >= 165 && omar_x <= 227 && omar_y >= 315){
      start_fall=true;
      hard = false;
    }
    if(omar_x >= 405 && omar_x <= 450 && omar_y >= 315){
      start_fall=true;
      hard = true;
    }

    if (omar_y > 490){
      page = 2;
      omar_x = 100;
      game_over_counter = 0;
      omar_step = 0;
      omar_y = -300;
      level_time = 0;
    }


  }
  if(page==2){

    shape(b1, b1x, b1y);
    shape(b2, b2x, b2y);
    shape(f, level_1_flag - level_time, 317);
    if(hard){
      for (int i=0; i<level_1_holes_hard.length;i++){
        shape(h1,level_1_holes_hard[i]-level_time,432);
        if(omar_x + 20 > level_1_holes_hard[i]-level_time && omar_x + 20< level_1_holes_hard[i]-level_time + h1.width && omar_y == 315){
          fall = true;
        }
      }
    }
    else{
      for (int i=0; i<level_1_holes.length;i++){
        shape(h1,level_1_holes[i]-level_time,432);
        if(omar_x + 20 > level_1_holes[i]-level_time && omar_x + 20< level_1_holes[i]-level_time + h1.width && omar_y == 315){
          fall = true;
        }
      }
    }
    if(omar_x > level_1_flag - level_time)
    {
      omar_x += 3;
      if(omar_x > 650)
      {
        page = 3;
      }
    }
    else if(!fall){
      level_time +=1;
      b1x -= 1;
      b2x -= 1;
      if (b2x < -b2.width) {
        b2x = b2.width;
      }
      if (b1x < -b1.width) {
        b1x = b1.width;
      }
      if(mouseX > omar_x + 45){
        omar_x += easing;
      }
      if(mouseX < omar_x ){
        omar_x -= easing * 2;
      } 
    } 

  }
  if(page==3)
  {
    background(0);

    highest_level = 3;
    text("Level 2",320,143);
    omar_x = -150;
    level_time = 0;


    game_over_counter += 1;
    if(game_over_counter > 150){
      page=4;
      game_over_counter = 0;
    }
  }
  if(page==4){
    shape(l2, l2_1x, 0);
    shape(l2, l2_2x, 0);
    shape(f, level_2_flag - level_time, 317);
    if (hard){
      for (int i=0; i<level_2_holes_hard.length;i++){
        shape(v1,level_2_holes_hard[i]-level_time,370);
        if(omar_x + 30 > level_2_holes_hard[i]-level_time && omar_x + 20< level_2_holes_hard[i]-level_time + h1.width && omar_y == 315){
          fall = true;
        }
      }
    }
    else{
      for (int i=0; i<level_2_holes.length;i++){
        shape(v1,level_2_holes[i]-level_time,370);
        if(omar_x + 30 > level_2_holes[i]-level_time && omar_x + 20< level_2_holes[i]-level_time + h1.width && omar_y == 315){
          fall = true;
        }
      }
    }
    if(omar_x > level_2_flag - level_time)
    {
      omar_x += 3;
      if(omar_x > 650)
      {
        page = 5;
      }
    }
    else if(!fall){
      level_time +=1;
      l2_1x -= 1;
      l2_2x -= 1;
      if (l2_2x < -l2.width) {
        l2_2x = l2.width;
      }
      if (l2_1x < -l2.width) {
        l2_1x = l2.width;
      }
      if(mouseX > omar_x + 45){
        omar_x += easing;
      }
      if(mouseX < omar_x ){
        omar_x -= easing * 2;
      } 
    }

  }

  if(page==5){
    background(0);

    highest_level = 5;
    text("Level 3",320,143);
    omar_x = -150;
    level_time = 0;


    game_over_counter += 1;
    if(game_over_counter > 150){
      page=6;
      game_over_counter = 0;
    }
  }
  if(page==6){
    shape(l3, l3_1x, 0);
    shape(l3, l3_2x, 0);
    shape(f, level_3_flag - level_time, 317);
    in_water = true;
    if(hard){
      for (int i=0; i<level_3_holes_hard.length;i++){
        shape(a1,level_3_holes_hard[i]-level_time,400);
        if(omar_x -20 > level_3_holes_hard[i]-level_time && omar_x - 50< level_3_holes_hard[i]-level_time + h1.width){
          in_water = false;
        }
      }
    }
    else{
      for (int i=0; i<level_3_holes.length;i++){
        shape(a1,level_3_holes[i]-level_time,400);
        if(omar_x - 20 > level_3_holes[i]-level_time && omar_x - 50< level_3_holes[i]-level_time + h1.width){
          in_water = false;
        }
      }
    }
    if(in_water && omar_y == 315)
    {
      fall = true;
    }
    if(omar_x > level_3_flag - level_time)
    {
      omar_x += 3;
      if(omar_x > 650)
      {
        page =7;
      }
    }
    else if(!fall){
      level_time +=1;
      l3_1x -= 1;
      l3_2x -= 1;


      if (l3_2x < -l3.width) {
        l3_2x = l3.width;
      }
      if (l3_1x < -l3.width) {
        l3_1x = l3.width;
      }

      if(mouseX > omar_x + 45){
        omar_x += easing*2;
      }
      if(mouseX < omar_x ){
        omar_x -= easing * 4;
      } 
    }
  }
  if(page==7)
  {
    background(0);

    highest_level = 7;
    text("Level 4",320,143);
    omar_x = -150;
    level_time = 0;


    game_over_counter += 1;
    if(game_over_counter > 150){
      page=8;
      game_over_counter = 0;
    }
  }
  if(page==8){

    shape(b1, b1x, b1y);
    shape(b2, b2x, b2y);
    shape(c, level_4_flag - level_time, 268);
    if(hard){
      for (int i=0; i<level_4_holes_hard.length;i++){
        shape(p,level_4_holes_hard[i]-level_time,360);
        if(omar_x + 20 > level_4_holes_hard[i]-level_time && omar_x + 20< level_4_holes_hard[i]-level_time + h1.width && omar_y == 315){
          fall = true;
        }
      }
    }
    else{
      for (int i=0; i<level_4_holes.length;i++){
        shape(p,level_4_holes[i]-level_time,360);
        if(omar_x + 20 > level_4_holes[i]-level_time && omar_x + 20< level_4_holes[i]-level_time + h1.width && omar_y == 315){
          fall = true;
        }
      }
    }
    if(omar_x > level_4_flag - level_time)
    {
      omar_x += 3;
      if(omar_x > 650)
      {
        page = 15;
      }
    }
    else if(!fall){
      level_time +=2;
      b1x -= 1;
      b2x -= 1;
      if (b2x < -b2.width) {
        b2x = b2.width;
      }
      if (b1x < -b1.width) {
        b1x = b1.width;
      }
      if(mouseX > omar_x + 45){
        omar_x += easing;
      }
      if(mouseX < omar_x ){
        omar_x -= easing * 2;
      } 
    } 

  }



  if(page==15){
    background(0);
    start_game = false;
    highest_level = 1;
    text("You Win!",320,143);
    text("Created by Katie", 320, 250);
    omar_x = -150;
    level_time = 0;


    game_over_counter += 1;
    if(game_over_counter > 150){
      page=1;
      lives=5;
      game_over_counter = 0;
    }
  }




  /////Omar


  if(omar_jumping)
  {
    omar_y += omar_accelleration;
    omar_accelleration += gravity;
    omar_step = 5;
    if(omar_y > 314)
    {
      omar_y = 315;
      omar_jumping = false;
      omar_step = 0;
    }
  }
  if(omar_step == 0){
    shape(o1, omar_x, omar_y);
    omar_count += 1;
    if(omar_count > omar_frame){
      omar_step = 1;
      omar_count = 0;
    }
  }
  if(omar_step == 1){
    shape(o3, omar_x, omar_y);
    omar_count += 1;
    if(omar_count > omar_frame){
      omar_step = 2;
      omar_count = 0;
    }
  }
  if(omar_step == 2){
    shape(o2, omar_x, omar_y);
    omar_count += 1;
    if(omar_count > omar_frame){
      omar_step = 3;
      omar_count = 0;
    }
  }
  if(omar_step == 3){
    shape(o3, omar_x, omar_y);
    omar_count += 1;
    if(omar_count > omar_frame){
      omar_step = 0;
      omar_count = 0;
    }
  }
  /////fall
  if(omar_step == 4){
    pushMatrix();
    translate(omar_x, omar_y);
    //scale(map(omar_y,315,480,1,.5));
    shape(o4,0,0);
    popMatrix();
  }
  /////jump
  if(omar_step == 5){
    shape(o5,omar_x, omar_y);


  }


  if(start_fall){
    omar_y += 5;
    omar_step = 4;
    if (omar_y > 312 && page==2){
      omar_y = 315;
      start_fall=false;
      omar_step = 0;
    }
  }

  if(fall){
    omar_y += 5;
    omar_step = 4;
  }

  if(omar_y > 480 && page != 1){

    page = 0;
    game_over_counter = 0;
    omar_step = 0;
    fall = false;
    omar_y = 315;
    omar_x = -150;
    lives -= 1;
    level_time = 0;

  }





}

void mousePressed(){
  if(page != 1){
    if(omar_jumping == false && fall == false)
    {
      omar_accelleration = -5;
      omar_jumping = true;

    }
  }
  if(page==1){
    if(start_game){
      if(omar_jumping == false && fall == false){
        omar_accelleration = -5;
        omar_jumping = true;
      }
    }
    else if(mouseX > 420 && mouseX < 492 && mouseY > 338 && mouseY< 380){
      start_game = true;
    }


  }
}


