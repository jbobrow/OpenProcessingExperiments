

float angle = 0.0; // Current angle 
float speed = 0.005; // Speed of motion 
float radius; // Range of motion 
float sx ; 
float sy ; 
float sa;
float sb;
float noiseFactor1 =0;
float noiseFactor2 =10;
float noiseFactor3 =100;
int count = 0;
boolean toggle = false;

void setup() { 
  size(900, 450); 
  radius = width/8;
  noStroke(); 
  smooth(); 
  init( random(5.0),random(2.0),int(random(20)+1),int(random(40)+1)); 
} 

void draw() { 
  noiseFactor1 +=.001;
  noiseFactor2 +=.0008;
  noiseFactor3 +=.0015;
  angle += speed;
  float d = sin((sa/sb)*angle);

  //w/2 (midpoint) + w/8*(2*(noise-.5)) (noise factor) + 2*r*d*cos(theta) (d and this 
  //term make up the parametric version of r = sin((a/b)*theta)
  // 
  float x = width/2 + (width/8*(2*(noise(noiseFactor1)-.5))) + 2*radius*d*cos(angle); 
  float y = height/2 + (height/8*(2*(noise(noiseFactor2)-.5))) + 2*radius*d*sin(angle);


  // fill(255); 
  // ellipse(x, y, 1, 1);

  // Set the position of the large circles based on the 
  // new position of the small circle 
  float x2 = x + radius*d*cos(angle*sx); 
  float y2 = y + radius*d*sin(angle*sy);
  //fill(0,255,0);
  // ellipse(x2, y2, 1, 1); // Draw larger circle 

  stroke((255*noise(noiseFactor1)),(255*noise(noiseFactor3)),(255*noise(noiseFactor2)),random(10,40)); 
  line(x,y,x2,y2); 

} 

void init(float _sx, float _sy, int _sa, int _sb){ 
  background(0); 
  sy=_sx; 
  sx = _sy; 
  sa = _sa;
  sb = _sb;
  angle = 0.0;
  // println("init : sx:   "+sx +"  sy:" + sy); 
} 

void mousePressed(){
  count++;
  if (!toggle){
    noLoop();
    //  save("sketch"+count+".tif");
    toggle = true;
  }
  else{
    loop();
    toggle = false;
  }

}

void keyPressed() {
  if (key == ' ') {
    init( random(5.0),random(2.0),int(random(20)+1),int(random(40)+1));
  }

}

