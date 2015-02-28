
//Reference:
// rotateBomb 
// By : Colin Thompson 
// Made : Oct 4th, 2009 
// Where : Processing workshop @ Gray Area Foundation For The Arts, San Francisco, CA 
 
int w = 400; 
int h = w; 
float hw = w/2; 
float hh = h/2; 
int minS = 5; 
int maxS = 50; 
float rotation = 0; 
int first = 1; 
color[] colors = { 
  color(214,43,43), 
  color(165,13,13)};  
int blurOn = 0;   
PImage currImg; 
void setup() { 
  size(400,400,P2D); 
  background(0); 
  frameRate(20); 
 
} 
int time = 0; 
void draw() { 
  if (keyPressed) { 
    if (key == 'b') { 
      blurOn = 1 - blurOn; 
    } 
  } 
  float posX = random(0,w); 
  float posY = random(0,h); 
  noStroke(); 
  fill(255); 
  rotation = sin((PI * noise(time*.75)*2)-.75); 
  rotation = 1; 
  rotation %= 360; 
  int randN = int(random(5,50)); 
  float s = random(minS,maxS); 
  pushMatrix(); 
  translate(posX,posY); 
  for (int i = 0; i < randN; i++) { 
    fill(colors[int(random(0,2))]); 
    rotate(HALF_PI*i); 
    translate(random(10,50),random(5,50)); 
    s = s * .7; 
    ellipse(0,0,s,s);      
  } 
  popMatrix(); 
  currImg = get(0,0,w,h); 
  if (blurOn == 1) { 
    currImg.filter(BLUR,1); 
  } 
  imageMode(CENTER); 
  translate(hw,hh); 
  rotate(radians(rotation)); 
  image(currImg,0,0); 
  if (first == 1) { 
    blend(currImg, 0, 0, w, h, 0, 0, w, h, LIGHTEST); 
  } 
   
  time++; 
} 
 


