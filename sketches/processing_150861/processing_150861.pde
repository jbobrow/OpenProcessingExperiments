
float time = 0;
final float delta_t = 0.1;

float y = 0;
final float x = 500;
float pre_y = 0;
float velocity = 0;
float velocity_a = 0;
float force = 0;
int score = 0;

final float k_air = 0.1;
final float gravity = 9.8;
int flytime = 0;
float ext_force = 0;

float attack_y = 0;
float attack_x = 0;
float attack_width = 80;
float attack_height = 50;
float attack_speed = 5;
float attack_none = 100;

PFont font = createFont("MS Gosic", 20);

boolean gamestart = false;
final int OPENING = 0;
final int GAME = 1;
final int ENDING = 2;

int gamemode = OPENING;

void setup(){
  size(640, 640);
}

void reset(){
  y = height/2;
  flytime = 0;
  ext_force = 0;
  velocity = 0;
  velocity_a = 0;
  force = 0;
  attack_x = -200;
  attack_y = random(attack_none, height - attack_none);  
  score = 0;
}



void draw(){
  switch (gamemode){
    case OPENING:
      opening();
      break;
    case GAME:
      game();
      break;
    case ENDING:
      ending();
      break;
    default:
      break;
      
  }
}

void opening(){
  background(255);
  textFont(font);
  textSize(30);
  fill(0);
  text("Please Click! Click! Click!", width/2 - 200, height/2);
}

void ending(){
  background(255);
  textFont(font);
  textSize(30);
  fill(0);
  text("Game Over", width/2 - 100, height/2);
  text("Score:" + score, width/2 - 100, height/2 + 100);
}


void game(){
  background(255);

  time += delta_t;

  // move nekoman (by verlet method)
  force = gravity - k_air*velocity + ext_force;
  velocity_a = velocity + 0.5*force*delta_t;
  y +=  velocity_a * delta_t;
  force = gravity - k_air*velocity_a + ext_force;
  velocity = velocity_a + 0.5*force*delta_t;

  // move target
  attack_x += attack_speed;
  if(attack_x > width){
    score++;
    attack_x = 0;
    attack_y = random(attack_none, height - attack_none);
  }

  // draw objects
  fill(255);
  ellipse(x, y, 10, 10);
  rect(attack_x - attack_width/2, -1, attack_width, attack_y - attack_height);
  rect(attack_x - attack_width/2, attack_y + attack_height, attack_width, height);

  // draw score
  textFont(font);
  textSize(10);
  fill(0);
  text(score, width - 100, 50);

  // ext force
  if(flytime > 0){
    flytime--;
    ext_force = -(float)(flytime)*60;
  }else{
    ext_force = 0;
  }

  // detect
  if(y < 0){
    gamemode = ENDING;
  }

  if(y > height){
    gamemode = ENDING;
  }


  if(x > attack_x - attack_width && x < attack_x + attack_width){
    if(y > attack_y + attack_height || y < attack_y - attack_height){
      gamemode = ENDING;
    }
  }  
}

void mousePressed(){
  flytime = 5;

  if(gamemode == OPENING){
    gamemode = GAME;
    reset();
  }

  if(gamemode == ENDING){
    gamemode = GAME;
    reset();
  }

}
