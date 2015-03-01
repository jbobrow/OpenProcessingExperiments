
void setup() {
  size(600, 600);
  noLoop();
  //frameRate(1);
}

void draw() {
  //background(255);
  
  BG();
  
  FS();
  
  
}

void BG() {
  float v = 0;
  strokeWeight(2);
  stroke(51);
  
  for(int x = 0; x<width; x++) {
    float n = noise(v) * 60;
    for(float j = 50; j>=1; j-=0.2){
    float y = height/j + 30*sin(5*radians(x));
    //translate(width/2, height);
    
    //if(!(x <240 || x>360)) {
    point(x, y+n);
    //} else {
    //  point(x, (height/j)+n);
   // }
    v ++;
    
    }
  }
}

void FS() {
  int i = 10;
  colorMode(HSB, 360, 100, 100);
  float H = 13;
  float S = 0;
  float r = 0.35;
  translate(width/2, height/2);
  //strokeWeight(2);
  noStroke();
  while(i<60) {
  for (int deg = 0; deg<360*50; deg += i) {
    float angle = radians(deg);
    float x = r*cos(angle);
    float y = r*sin(angle);
    fill(H, S,98);
    ellipse(x, y, 6, 6);
    r +=0.35;
  }
   H+=80;
    S+=2;
    i++;
  }
}
