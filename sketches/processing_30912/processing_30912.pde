
PVector pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8, speed;
float largo;
float d;


void setup() {
  size(400,400);
  frameRate(300);
}

void draw() {
  colorMode(HSB);
  strokeWeight(random(0.1,0.8));
  
  largo = random(0,100);
  for(int i=0; i<20;i++) {
    pos1 = new PVector(random(width),random(-100,100));
    pos2 = new PVector(pos1.x, pos1.y+largo);
    d=20;
     float a = map(noise(frameCount/100.0), 0, 1, d,d+50);
    stroke(a,180,359,random(40,100));
    line(pos1.x,pos1.y,pos2.x,pos2.y);
   
    pos3 = new PVector(random(width),random(50,200));
    pos4 = new PVector(pos3.x, pos3.y+largo);
    d=100;
    float e = map(noise(frameCount/100.0), 0, 1, d,d+50);
    stroke(e,120,359,random(40,100));
    line(pos3.x,pos3.y,pos4.x,pos4.y);
    
    pos5 = new PVector(random(width),random(150,300));
    pos6 = new PVector(pos5.x, pos5.y+largo);
    d=130;
    float o = map(noise(frameCount/100.0), 0, 1, d,d+50);
    stroke(o,120,359,random(40,100));
    line(pos5.x,pos5.y,pos6.x,pos6.y);
    
    pos7 = new PVector(random(width),random(250,400));
    pos8 = new PVector(pos7.x, pos7.y+largo);
    d=160;
    float u = map(noise(frameCount/100.0), 0, 1, d,d+50);
    stroke(u,120,359,random(40,100));
    line(pos7.x,pos7.y,pos8.x,pos8.y);
    
    
    
  } 
}

