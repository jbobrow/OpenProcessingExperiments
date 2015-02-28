
float particles[];

float globalPhase, globalRadius = 1;
float spinningSpeed = TWO_PI / 1300;
float collapsingSpeed = 0.999;
float initialExpandingSpeed = 0.30, expandingDec = 0.97, expandingSpeed;
float minRadius = 0.10, minSpeed = 0.1;
boolean expanding = false;

float diffusion = 23;
float loops = 1.5;

void setup() {
  size(600,600,P2D);
  frameRate(30);
  noSmooth(); 
  noStroke();
  
  Random random = new Random();
  particles = new float[10000];
  for(int i=0; i<particles.length; i++)
    particles[i] = (float) random.nextGaussian();
}

void draw() {
  if(!expanding)
    fill(0,0,0,25);
  else if(expandingSpeed > minSpeed * 2)
    fill(255,0,0,10);
  else
    fill(255,255,255,10);
  rect(0,0,width,height);
  
  fill(230,230,255,50);
  int x = width / 2, y = height / 2;
  float phase = globalPhase, phaseInc = TWO_PI * loops / particles.length;
  float radius = 0, radiusInc = max(width,height) / (float)(particles.length * 2);
  
  for(int i=0; i<particles.length; i++, phase += phaseInc, radius += radiusInc) {
    float pr = globalRadius * (diffusion * particles[i] + radius) * (i%2 == 0 ? 1 : -1);
    rect(x + pr * cos(phase), y - pr * sin(phase),2,2);
  }
  
  globalPhase -= spinningSpeed;
  if(globalPhase < 0)
    globalPhase += TWO_PI;
    
  if(expanding) {
    globalRadius += expandingSpeed;
    expandingSpeed *= expandingDec;
    if(expandingSpeed < minSpeed)
      expanding = false;
  }
  else {
    globalRadius *= collapsingSpeed;
    if(globalRadius < minRadius) {
      expanding = true;
      expandingSpeed = initialExpandingSpeed;
    }
  }
}

void keyPressed() {
  if(keyCode == DOWN)
    diffusion--;
  else if(keyCode == UP)
    diffusion++;
  else if(keyCode == RIGHT) {
    loops-=0.1;
    if(loops <= 0)
      loops = 0.1;
  }
  else if(keyCode == LEFT)
    loops+=0.1;
}

