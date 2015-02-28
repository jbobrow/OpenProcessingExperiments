
int num = 1500;

PVector[] pos = new PVector[num]; //point:x
PVector[] vel = new PVector[num];
PVector[] acc = new PVector[num];

float Theta;

void setup() {
  
  size(700, 700);
  
  colorMode(HSB,360,100,100);
  background(0,0,90);
  smooth();

  for (int i = 0; i < num; i++) {
    pos[i] = new PVector(0,random(0,700));
    vel[i] = new PVector(0, 0);
    acc[i] = new PVector(0,random(0,700));
  }
}

int r = 0;
int g = 0;
int b = 0;
float noisy = .003;


void draw() {
  fadeToWhite();
  
    
  
  fill(r,100,100,30);
      r++;
      if(r > 360){
        r = 0;
      }
  
      for(int i = 0; i < num; i++) {

    ellipse(pos[i].x, pos[i].y,1,1); 
    vel[i].x = 10*noise(300+pos[i].x*.007, pos[i].y*.007, noisy*2)*sin(4*PI*noise(pos[i].x*.007, pos[i].y*.007, noisy*.5));
    vel[i].y = 10*noise(300+pos[i].x*.007, pos[i].y*.007, noisy*2)*cos(4*PI*noise(pos[i].x*.007, pos[i].y*.007, noisy*.5));
    pos[i].add(vel[i]);
    if(pos[i].x < 0 || pos[i].y < 0 || pos[i].x > 700 || pos[i].y > 700){
      pos[i].x = random(0, 700);
      pos[i].y = random(0, 700);
      vel[i].x = 0;
      vel[i].y = 0;
    }
    acc[i].x = 0;
    acc[i].y = 0;
      
}
  noisy += .03;
}



void fadeToWhite(){
  noStroke();
  fill(0,0,90,7);
  rect(0,0,700,700);
}
