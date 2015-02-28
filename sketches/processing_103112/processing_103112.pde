
nt WINDOW_HEIGHT;   
int WINDOW_WIDTH;

static final int MAX_NUM_BALLS = 500;
int NUM_BALLS = 0;

Maxim maxim;
AudioPlayer audio_player_left;
AudioPlayer audio_player_right;
AudioPlayer audio_player_top;
AudioPlayer audio_player_bottom;

class Ball
{
  protected int size;
  protected float x;
  protected float y;
  protected float vel_x;
  protected float vel_y;
  protected int r;
  protected int g;
  protected int b;
  
  Ball(int new_size)
  {
  this.size = new_size;
  this.x = 0;
  this.y = 0;
  this.vel_x = 0;
  this.vel_y = 0;  
  }
  
  Ball()
  {
  this.size = 0;
  this.x = 0;
  this.y = 0;
  this.vel_x = 0;
  this.vel_y = 0;  
  this.r = 0;
  this.g = 0;
  this.b = 0; 
  }
  
  Ball(int new_size, float new_x, float new_y)
  {  
  this.size = new_size;
  this.x = new_x;
  this.y = new_y;
  this.vel_x = 0;
  this.vel_y = 0;
  this.r = 0;
  this.g = 0;
  this.b = 0; 
  }
  
  void set_color(int new_r, int new_g, int new_b)
  {
  this.r = new_r;
  this.g = new_g;
  this.b = new_b; 
  }
  
  void set_size(int new_size)
  {
  this.size = new_size;  
  }
  
  int get_size()
  {
  return this.size;
  } 
  
  float get_x()
  {
  return this.x;  
  }

  float get_y()
  {
  return this.y;  
  }
  
  float get_vel_x()
  {
  return this.vel_x;  
  }

  float get_vel_y()
  {
  return this.vel_y;  
  }

  void set_position(float new_x, float new_y)
  {
  this.x = new_x;
  this.y = new_y;  
  }

  void set_velocity(float vx, float vy)
  {
  this.vel_x = vx;
  this.vel_y = vy;  
  }
  
  void set_vel_x(float vx)
  {
  this.vel_x = vx;
  }

  void set_vel_y(float vy)
  {
  this.vel_y = vy;
  }
  
  void update_position()
  {
    this.x += vel_x;
    this.y += vel_y;  
  }
  
  void draw()
  {
  fill(this.r,this.g,this.b);
  ellipse(this.x, this.y, this.size, this.size);   
  }
  
};


Ball[] ball_arr;


void setup()
{
// Window, background etc
background(0);
size(800, 600);
WINDOW_WIDTH = 800;
WINDOW_HEIGHT = 600;   
// Balls!
ball_arr = new Ball[MAX_NUM_BALLS+1];
// Audio
maxim = new Maxim(this);
audio_player_left = maxim.loadFile("kick_drum.wav");
audio_player_left.setLooping(false);
audio_player_right = maxim.loadFile("snare.wav");
audio_player_right.setLooping(false);
audio_player_top = maxim.loadFile("ride.wav");
audio_player_top.setLooping(false);
audio_player_bottom = maxim.loadFile("hihat.wav");
audio_player_bottom.setLooping(false);
}


void check_and_process_wall_collision(Ball ball, float min_x, float max_x, float min_y, float max_y)
{
float ball_radius = (float)ball.get_size() / 2; 
if ( (ball.get_x() <= (min_x + ball_radius)) && (ball.get_vel_x() < 0) )
{
  // hit left wall - play sound and bounce
  audio_player_left.stop();
  audio_player_left.cue(0);
  audio_player_left.speed(get_audio_speed_from_velocity_component(ball.get_vel_x()));  
  audio_player_left.play();
  ball.set_vel_x(-ball.get_vel_x()); 
}
if ( (ball.get_x() >= (max_x - ball_radius)) && (ball.get_vel_x() > 0) )
{
  // hit right wall - play sound and bounce
  audio_player_right.stop();
  audio_player_right.cue(0);
  audio_player_right.play();
  audio_player_right.speed(get_audio_speed_from_velocity_component(ball.get_vel_x()));  
  ball.set_vel_x(-ball.get_vel_x()); 
}
if ( (ball.get_y() <= (min_y + ball_radius)) && (ball.get_vel_y() < 0) )
{
  // hit top wall - play sound and bounce
  audio_player_top.stop();
  audio_player_top.cue(0);
  audio_player_top.speed(get_audio_speed_from_velocity_component(ball.get_vel_y()));
  audio_player_top.play();  
  ball.set_vel_y(-ball.get_vel_y()); 
}
if ( (ball.get_y() >= (max_y - ball_radius)) && (ball.get_vel_y() > 0) )
{
  // hit top wall - play sound and bounce
  audio_player_bottom.stop();
  audio_player_bottom.cue(0);
  audio_player_bottom.speed(get_audio_speed_from_velocity_component(ball.get_vel_y()));
  audio_player_bottom.play();
  ball.set_vel_y(-ball.get_vel_y());
}
}


float get_audio_speed_from_velocity_component(float vel_comp)
{
return abs(vel_comp/10);  
}


void draw()
{
background(0);
for ( int i=0 ; i<NUM_BALLS ; i++ )
{
  // update each ball
  check_and_process_wall_collision(ball_arr[i], 0, WINDOW_WIDTH, 0, WINDOW_HEIGHT);
  ball_arr[i].update_position();
  ball_arr[i].draw();
  ball_arr[i].set_vel_y(ball_arr[i].get_vel_y() + 0.1);       // gravity
}
}

void mouseReleased()
{
// Create new ball at the mouse position, with velocity based on old position, so user can "swipe" a ball into action
int next_index = 0;
next_index = NUM_BALLS; 
if (next_index < MAX_NUM_BALLS)
{
  // Enough space for another ball
  ball_arr[next_index] = new Ball(25);
  set_ball_params_based_on_mouse_pos(ball_arr[next_index]);
  NUM_BALLS = next_index + 1;
}
else
{
  // We've run out of space, so remove a random ball to replace with the new one (to keep the interactivity going)
  next_index = (int)random(0,MAX_NUM_BALLS);
  if (next_index >= MAX_NUM_BALLS)
  {
    next_index = MAX_NUM_BALLS - 1;  
  }
  set_ball_params_based_on_mouse_pos(ball_arr[next_index]);
}
}


void set_ball_params_based_on_mouse_pos(Ball ball)
{
// Sets the parameters for the ball based on what the mouse is up to
// Also gives the ball a random colour
ball.set_position(mouseX, mouseY);
ball.set_color((int)random(150,255),(int)random(150,255),(int)random(150,255));
float new_vel_x = max(min(mouseX-pmouseX, 10),-10);
float new_vel_y = max(min(mouseY-pmouseY, 10),-10);;
ball.set_velocity(new_vel_x, new_vel_y);        
}
