
int amount = 10;
int minmult = 120;
float increase = minmult;
int target = 1000;
float ease = 0.05;
boolean run = false;

int length = 100;
float frames = 250.0;
float theta;

float [] rotationX = new float[amount];
float [] rotationY = new float[amount];

float [] g = new float[amount];
float [] b = new float[amount];

float sizeaddon;

int midd_size = 12; // size of middle sphere
int midd_target = 50;



int size = 13;
float ratio = 0.7;
float size_div;
float t; // rotationX time
float t_; // cosmos enlargement/reduction time
float tt_; // middle sphere enlargement/reduction time

void setup() {
  size(500, 500, P3D);
  
  smooth(4);
  colorMode(RGB);
  
  size_div = size*ratio;

  for (int i = 0; i < amount; i++) {
    rotationX[i] = random(TWO_PI);
    rotationY[i] = random(TWO_PI);
    g[i] = random(150,220);
    b[i] = random(150,220);

  }
}
void draw() {
    
  sphereDetail(6);
  background(255);
  translate(width/2, height/2);
  
  t += TWO_PI/frames;
  
  t_ = target/frames;

  tt_ = midd_target/frames;  
  

  if(keyPressed){ // run animation
    if(key =='s' || key == 'S') {
      run = true;
      frameCount = 0;

    }
  }

   
  if(run) {
  if(frameCount > 0 && frameCount < 100 ) { //enlargement easing
    increase += (t_*150 - increase) * ease;
    sizeaddon += (tt_*200 - sizeaddon) * ease;
  } 
  
    if(frameCount >= 100 && frameCount < 150 ) { // 150 frames of nothing
    increase = increase;
    sizeaddon = sizeaddon;
  } 
  if(frameCount >= 150 && frameCount < frames ) { //reduction easing
    increasee += (minmult - increase) * ease;
    sizeaddon += (midd_size - sizeaddon) * ease;
    } 
  }
 
  
  rotateY(t);

  
  for (int i = 0; i < amount; i++) { // apply rotation to each stack of spheres
    pushMatrix();
    rotateX(rotationX[i]);
    rotateY(rotationY[i]);
    
    for(int r = 0; r < 360; r++) { // draw trajectories
    stroke(0,70);
    point(sin(r)*increase, cos(r)*increase);
    }
    
    for (int s = 0; s < length; s++) { // draw spheres
          
      pushMatrix();
      translate(sin(theta-s/(length*0.7)) * increase, cos(theta-s/(length*0.7)) * increase, 0);
      fill(255-(s*2),g[i],b[i]);
      noStroke();
      sphere(size-s/size_div);
      popMatrix();
      
    }
    popMatrix();
  }

  fill(80);
  sphereDetail(15);  
  sphere(12+sizeaddon);


  theta += TWO_PI*2/frames;
}



