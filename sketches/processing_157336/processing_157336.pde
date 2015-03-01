
// Differential motion
/// Space to randomize

int HEIGHT = 600;
int WIDTH  = 600;
float R = 0.42; // % of the screen to use
int r = 55;     // radius of the circles
int CIRCLE_R = 70; // base radius of the circles

int t = 0;   // time counter
int num=20; //number of circles
float speed=0.08; // Speed of movement
float SPIRAL = 0.4; // Degree of spiral


void setup() {
  size(HEIGHT,WIDTH);
  _init();
}

void _init() {
    float rand = random(3,min(12,t/100)+3);
//    num =  int(random(3,min(12,int(t/100))+3))*
//           int(random(3,min(12,int(t/100))+3));
    num = int(rand*rand);
    speed = random(0.2,2)*0.1/(1.0*num);
    SPIRAL = 1.0/num*(random(-5,5));
    r = int(random(0.5,2)*CIRCLE_R);
    //println(num+","+speed+","+SPIRAL);
}


void draw() {
  // Draw background
  fill(0,0,0); noStroke();
  rect(0,0,width,height);
  
  fill(180,20,20);
  for(int i=1; i < num+1; i++) {
     float angle = i*t*speed;
     float n_x = cos(angle);
     float n_y = sin(angle);
     
     fill(sin(SPIRAL*angle)*64+196,
          cos(0.2*angle)*64+196,
          cos(0.3*angle)*64+196);

     float radius = (cos(SPIRAL*angle)+1)*0.5*R;
     int x = floor(HEIGHT*(0.5 + radius*n_x));
     int y = floor(WIDTH*(0.5 + radius*n_y));
     ellipse(x,y,r,r);
  }
  
  t++;
}

void keyPressed() {
  if(key == ' ') {
    _init();
  } 
  
}

void mousePressed() {
 _init();
}

