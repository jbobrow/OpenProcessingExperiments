
// July 2013 Haley Cope
// Pong

// Global variables to keep track of game play
final int WIDTH = 600;
final int HEIGHT = 400;       
final int BALL_RADIUS = 20;
final int PAD_WIDTH = 8;
final int PAD_HEIGHT = 80;
final int HALF_PAD_WIDTH = PAD_WIDTH / 2;
final int HALF_PAD_HEIGHT = PAD_HEIGHT / 2;
float[] ball_pos = {WIDTH / 2, HEIGHT / 2};
float[] ball_vel = {0, 0};
float paddle1_pos = HEIGHT / 2;
float paddle1_vel = 0;
float paddle2_pos = HEIGHT / 2;
float paddle2_vel = 0;
int score1 = 0;
int score2 = 0;


void setup(){
  // Init the canvas
  size(600, 400);
  background(0, 0, 0);
  new_game();}


void ball_init(Boolean right){
  // Spawns a ball with random v to the left or right
  ball_pos[0] = WIDTH / 2;
  ball_pos[1] = HEIGHT / 2;
  if (right)
  {
    ball_vel[0] = random(8, 10);
    ball_vel[1] = -1 * random(6, 10);
  }
  else {
    ball_vel[0] = -1 * random(8, 10);
    ball_vel[1] = -1 * random(6, 10);}
  }

void update_ball(){
  //Updates the pos and vel of the ball. If it hits a wall, it bounces. If goes behind paddle score
  //If hits paddle, bounce
  ball_pos[0] += ball_vel[0];
  ball_pos[1] += ball_vel[1];
  if (ball_pos[1] - BALL_RADIUS <= 0 || ball_pos[1] + BALL_RADIUS >= HEIGHT){
      ball_vel[1] = -ball_vel[1];}
  if (ball_pos[0] - BALL_RADIUS < PAD_WIDTH && abs(ball_pos[1] - paddle1_pos) <= HALF_PAD_HEIGHT + BALL_RADIUS){
      ball_vel[0] = -ball_vel[0] * 1.001;}
  if (ball_pos[0] + BALL_RADIUS > WIDTH - PAD_WIDTH && abs(ball_pos[1] - paddle2_pos) <= HALF_PAD_HEIGHT + BALL_RADIUS){
      ball_vel[0] = -ball_vel[0] * 1.001;}
  else if (ball_pos[0] >= WIDTH - PAD_WIDTH){
      score1 += 1;
      ball_init(false);}
  else if(ball_pos[0] <= PAD_WIDTH){
      score2 += 1;
      ball_init(true);}}

void update_paddle(){
  //moves the paddle
  if (paddle1_pos + paddle1_vel + HALF_PAD_HEIGHT <= HEIGHT && paddle1_pos + paddle1_vel - HALF_PAD_HEIGHT >= 0){
      paddle1_pos = paddle1_pos + paddle1_vel;}
  if (paddle2_pos + paddle2_vel + HALF_PAD_HEIGHT <= HEIGHT && paddle2_pos + paddle2_vel - HALF_PAD_HEIGHT >= 0){
      paddle2_pos = paddle2_pos + paddle2_vel;}}

void new_game(){
  //starts a game
  paddle1_pos = HEIGHT / 2;
  paddle1_vel = 0;
  paddle2_pos = HEIGHT / 2;
  paddle2_vel = 0;
  score1 = 0;
  score2 = 0;
  ball_init(true);}
      
void draw(){
  //draws the stuff
  background(0);
  update_paddle();
  stroke(225);
  fill(225);
  line(WIDTH / 2, 0, WIDTH / 2, HEIGHT);
  line(PAD_WIDTH, 0 , PAD_WIDTH, HEIGHT);
  line(WIDTH - PAD_WIDTH, 0, WIDTH - PAD_WIDTH, HEIGHT);
  rect(WIDTH - PAD_WIDTH, paddle2_pos - HALF_PAD_HEIGHT, PAD_WIDTH, PAD_HEIGHT);
  rect(0, paddle1_pos - HALF_PAD_HEIGHT, PAD_WIDTH, PAD_HEIGHT);
  update_ball();
  ellipse(ball_pos[0], ball_pos[1], BALL_RADIUS, BALL_RADIUS);
  text(str(score1), WIDTH / 2 - 30, 40, 20);
  text(str(score2), WIDTH / 2 + 20, 40, 20);}

void keyPressed(){
  //sees the keys if pressed
  if (keyCode == UP){paddle2_vel -= 15;}
  if (keyCode == DOWN){paddle2_vel += 15;}
  if (key == 'w' || key == 'W'){paddle1_vel -= 15;}
  if (key == 's' || key == 'S'){paddle1_vel += 15;}}

void keyReleased(){
  //sees the keys if released
  if(keyCode == UP || keyCode == DOWN){paddle2_vel = 0;}
  if (key == 'w' || key == 'W' || key == 's' || key == 'S'){paddle1_vel = 0;}}
