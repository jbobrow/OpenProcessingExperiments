
ArrayList<Ripple> ripples = new ArrayList();
ArrayList<rect> rect = new ArrayList();
float y = 100;
float x = 40;
float xCurrentClick;
float xLastClick;
float yCurrentClick;
float yLastClick;
//float xspeed = 2;
//float yspeed = 5;
//font = loadFont("Cambria-BoldItalic-48.vlw");
//textFont(font, 32);


void setup() {
 size(400,900);
 smooth();
 textSize( 40 );
 x = xLastClick;
 y = yLastClick;
}

void draw() {
  background(255);
 
  yCurrentClick = yLastClick ;
  xCurrentClick = xLastClick ;
   y = 100;//random(height);
   x = 30; // random(width);
   //x = x + xspeed;
   //y = y + yspeed;
   fill(#FFF412);
   stroke(255, 0, 0);
   text("CLICK." , xCurrentClick, yLastClick);
    

  for(int i = 0; i < ripples.size(); i++){
    Ripple r = ripples.get(i);
    r.display();
    r.grow();
  } 
  
 
 
 for(int i = 0; i < rect.size(); i++){
    rect r = rect.get(i);
      r.display();
     r.grow();
   } 


void mousePressed() {
  ripples.add(new Ripple(mouseX,mouseY));
  rect.add(new rect(mouseX,mouseY));
  xLastClick = random(width);
  yLastClick = random(height);
}

void} keyPresse(d){
  rect(0,0,400,900); 
  fill(255, 0,0);

 }

class Ripple {
  float x;
  float y;
  float rSize=30;
  float fade = 255;
  int r = 255;
  int g = int(random(0));
  int b = int(random(0));

 Ripple(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void display() {
    stroke(r, g, b,fade);
    noFill();
    ellipse(x, y, rSize, rSize);
  }

  void grow() {
    rSize+=200;
    fade--;
    if (fade <= 0) {
      fade = 0;
    }
  }
}

class rect {
  float x;
  float y;
  float rSize=30;
  float fade = 255;
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));

  rect(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void display() {
    stroke(0);
    noFill();
    rect(x, y, rSize, rSize);
  }

  void grow() {
    rSize++;
    fade--;
    if (fade <= 0) {
      fade = 0;
    }
  }
