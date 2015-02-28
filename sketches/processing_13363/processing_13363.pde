
ArrayList let;
int letWidth= 48;
int letHeight= 48;
float x= 0;
float y= 0;
float easing =.09;

PFont Matrix;
int s=600;
void setup(){
  size(s,s);
  smooth();
  textSize(50);
  textAlign(CENTER);
  Matrix = loadFont("MatrixCodeNFI-48.vlw");
  textFont(Matrix,50);
  background(0,0,0);
  textAlign(CENTER);
  frameRate(20);
  noLoop();
  
  let = new ArrayList();
  let.add(new Let(width/2, 0, letWidth, letHeight));

}

void draw(){
  int margin = 6;
  int gap= 30;
  translate(margin*1.5, margin*2);
int counter = 0;
for(int i=0; i<margin; i++) {
  for(int j=0; j<margin; j++){
    char letter;
    
    int count = 65+(i*margin)+j;
    if(count <= 90) {
      letter = char(65+counter);
      if (letter == 'M' || letter == 'A' || letter =='T' || letter == 'R' || letter == 'I' || letter == 'X') {
    fill (30,250,30);
      }
      else {
        fill(255);
      }}
      else{
        fill(255);
        letter = char(48+counter);
      }
      text(letter, 15+j*gap, 2-+i*gap);
      
  }}}
  
  class Let {
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float h;
  float sleep = 300;
   
  Let(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speed = 5;
    gravity = 0.1;
  }
  
  
     void move() {
    x += random(-2,2);
    speed += gravity;
    y += speed;
    if (y > height) {
      speed = speed*-0.8;
      y = height;
    }
  }
   
  boolean finished() {
    sleep--;
    if (sleep < 1) {
      return true;
    } else {
      return false;
    }
  }
      
  }



