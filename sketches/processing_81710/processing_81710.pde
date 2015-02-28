
boolean background_refresh = true;//true;
boolean balls_refresh = true;
boolean balls_dots = false;
int frameskip = 1;

float range = 2; //range in which balls are dropped

//int maxballs = 50000;

int Nx = 20; //Number of pins in y
int Ny = 20; //Number of pins in x

int Nb = 100; //Number of balls

float ballr = 12;
float pinr = 4;
float bouncy = 0.4;

Ball[] balls = new Ball[Nb]; //Array containing balls
Pin[] pins = new Pin[Nx*Ny]; //Array containing all pins

int[] counter = new int[Nx];

float g = -0.1; //Gravitational acceleration
int i, ii, xi, yi, bi; //Counters
int ballcount = 0;

void setup(){
  
  size(800, 800);
  
  //place pins
  for(yi = 0; yi < Ny; yi++){
    for(xi = 0; xi < Nx; xi++){
      pins[xi + Nx*yi]= new Pin( 
        (width/(Nx)) * (xi + float((yi%2))/2),
        (height/(Ny+1)) * float(yi) );
    }
  }
    
  background(0);
  noStroke();
  ellipseMode(RADIUS);
  colorMode(HSB);
  
  for(bi = 0; bi < Nb; bi++){
    balls[bi] = new Ball();
    balls[bi].reset();
  }
  
}

void draw(){
  
  if(background_refresh == true){
    background(0);}
  
  for(ii = 0; ii < frameskip; ii++){
  
  //Reset Ball
  for(bi = 0; bi < Nb; bi++){
    
    if(balls[bi].y < 0 && balls_refresh == true){
      for(xi = 0; xi < Nx; xi++){
        if(balls[bi].x > (width/(Nx)) * xi && balls[bi].x < (width/(Nx)) * (xi+1)){
           counter[xi]++;}}
      balls[bi].reset();
      ballcount++;
    }
    //if (ballcount >= maxballs) exit();
  
    //Check collision
    for(i = 0; i < Nx*Ny; i++){
      balls[bi].checkCollision(pins[i]);
    }
  
    balls[bi].integrate();
  
    //drawing phase
    if(ii == frameskip-1)balls[bi].drawme();
  }}
  noStroke();
  fill(96);
  for(i = 0; i < Nx*Ny; i++){
  pins[i].drawme();}
}

class Pin
{
  float x, y, r;
  
  Pin(float xx, float yy){
    x = xx; y = yy;
    r = pinr;}
    
  void drawme(){
    noStroke();
    fill(96);
    ellipse(x, height-y,r,r);
  }
}

class Ball
{
  float x, y, vx, vy, r;
  float bouncyness;
  color c;
  
  Ball(){
    x = 0; y = 0; vx = 0; vy = 0; r = 8; c = color(0,255,0); bouncyness = 0.5;}
  
  void reset(){
    float rr = random(1);
    
    r = ballr;
    bouncyness = bouncy;
    y = height; x = width/2 - range/2 + rr*range;//r*range;
    vx = 0; vy = 0;
    
    c = color(192*rr,255,255);
  }
  
  void integrate(){
    //Integrate x''
    vy += g;
    //Integrate x'
    x += vx;
    y += vy;
  }
    
  void drawme(){
    noStroke();
    fill(c);
    if(balls_dots == true)
      ellipse(x, height-y, 1, 1);
    else ellipse(x, height-y, r, r);
  }
  
  void checkCollision(Pin pin){ 
    if(sqrt(sq(x + vx - pin.x) + sq(y + (vy+g) - pin.y)) < (r + pin.r)){collide(pin);}
  }

  void collide(Pin pin){  
      
      float distance = sqrt(sq(pin.x - x)+sq(pin.y - y));

      float speed_module = sqrt( sq(vx) + sq( (vy+g) ) );
    
      float collision_angle = acos( (vx*(pin.x-x) + (vy+g)*(pin.y-y))/( speed_module * distance ) );
    
      float perpendicular_speed = speed_module * cos(collision_angle);
      
      vx -= (1 + bouncyness) * ( perpendicular_speed*(pin.x-x)/distance );
      vy -= (1 + bouncyness) * ( perpendicular_speed*(pin.y-y)/distance );

  }
}
