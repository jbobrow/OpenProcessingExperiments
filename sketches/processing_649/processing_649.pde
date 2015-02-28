
/* 
 
simple shakin letters 

*/ 
// ParticleSystem
ParticleSystem ps;
 
// an array of letters 
int nLetters = 7; 
Letter[] letters = new Letter[nLetters]; 

 
// shakin variables 
PVector prev;
PVector diff;

// movement
float floatSpeed;
float friction = -0.5;
float spring = 0.1;

// text
String wordOrder[] = {"Be", "quick", "or", "the", "words", "will", "disappear"};
int[] wordLength = new int[nLetters];
PFont font;

int time = 500;
 
void setup() 
{ 
  size(580,410); 
  smooth();
  // create a bunch of letters on the screen 
  for (int i=0; i<nLetters; i++) 
  { 
    wordLength[i] = wordOrder[i].length();
    println(wordLength[i]);
    letters[i] = new Letter(new PVector(random(width), random(height)), wordOrder[i], wordLength[i], i, letters); 
  }
  // set up particle system
  ps = new ParticleSystem(1, new PVector(width/2,height/2));
  // set up fonts 
  font = loadFont("ComicSansMS-Bold-48.vlw"); 
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  int fontSize = 60;
  textFont(font, fontSize); 
  // set up current frame position 
  Point a = frame.getLocation(); 
  prev = new PVector(a.x, a.y);
} 
 
 
void draw() 
{ 
  background(120,120,255,200); 
  // check if the frame is shakin 
  Point a = frame.getLocation(); 
  diff = new PVector((a.x-prev.x)/25, (a.y-prev.y)/25);
  prev = new PVector(a.x, a.y);
  // ParticleSystem
  ps.run();
  // Quotation marks
  fill(255);
  text('"', 95, 90);
  text('"', 520, 290);
  // time count down
  time--; 
  println("time "+time);
  // draw the letters on the screen
  for (int i=0; i<nLetters; i++) 
  { 
    letters[i].shakeMe(diff); 
    letters[i].update();
    if (time >= 0) ps.addParticle(letters[i].position.x,letters[i].position.y,letters[i].boxLength,letters[i].boxHeight, letters[i].letter);
  }
  // sentence position
  // Be
  if ((letters[0].press) && (letters[0].position.x >= 140) && (letters[0].position.x <= 160) && (letters[0].position.y >= 90) && (letters[0].position.y <= 110)) {
    letters[0].finished = true;
  }
  if (letters[0].finished) {
    letters[0].position = new PVector(150.0, 100.0, 0.0);
    letters[0].display();
  }
  fill(250, 20);
  ellipse(150, 100, 20, 20);
  //rect(150, 100, 80, 70);
  // quick
  if ((letters[1].press) && (letters[1].position.x >= 290) && (letters[1].position.x <= 310) && (letters[1].position.y >= 90) && (letters[1].position.y <= 110)) {
    letters[1].finished = true;
  }
  if (letters[1].finished) {
    letters[1].position = new PVector(300.0, 100.0, 0.0);
    letters[1].display();
  }
  fill(250, 20);
  ellipse(300, 100, 20, 20);
  //rect(300, 100, 170, 70);
  // or
  if ((letters[2].press) && (letters[2].position.x >= 120) && (letters[2].position.x <= 140) && (letters[2].position.y >= 190) && (letters[2].position.y <= 210)) {
    letters[2].finished = true;
  }
  if (letters[2].finished) {
    letters[2].position = new PVector(130.0, 200.0, 0.0);
    letters[2].display();
  }
  fill(250, 20);
  ellipse(130, 200, 20, 20);
  //rect(80, 200, 60, 70);
  // the
  if ((letters[3].press) && (letters[3].position.x >= 220) && (letters[3].position.x <= 240) && (letters[3].position.y >= 190) && (letters[3].position.y <= 210)) {
    letters[3].finished = true;
  }
  if (letters[3].finished) {
    letters[3].position = new PVector(230.0, 200.0, 0.0);
    letters[3].display();
  }
  fill(255, 20);
  ellipse(230, 200, 20, 20);
  //rect(180, 200, 100, 70);
  // words
  if ((letters[4].press) && (letters[4].position.x >= 390) && (letters[4].position.x <= 410) && (letters[4].position.y >= 190) && (letters[4].position.y <= 210)) {
    letters[4].finished = true;
  }
  if (letters[4].finished) {
    letters[4].position = new PVector(400.0, 200.0, 0.0);
    letters[4].display();
  }
  fill(255, 20);
  ellipse(400, 200, 20, 20);
  //rect(350, 200, 200, 70);
  // will
  if ((letters[5].press) && (letters[5].position.x >= 110) && (letters[5].position.x <= 130) && (letters[5].position.y >= 290) && (letters[5].position.y <= 310)) {
    letters[5].finished = true;
  }
  if (letters[5].finished) {
    letters[5].position = new PVector(120.0, 300.0, 0.0);
    letters[5].display();
  }
  fill(255, 20);
  ellipse(120, 300, 20, 20);
  //rect(120, 300, 120, 70);
  // disappear
  if ((letters[6].press) && (letters[6].position.x >= 340) && (letters[6].position.x <= 360) && (letters[6].position.y >= 290) && (letters[6].position.y <= 310)) {
    letters[6].finished = true;
  }
  if (letters[6].finished) {
    letters[6].position = new PVector(350.0, 300.0, 0.0);
    letters[6].display();
  }
  fill(255, 20);
  ellipse(350, 300, 20, 20);
  //rect(350, 300, 300, 70);
}

// release from handling
void mouseReleased() 
{
  for(int i=0; i<nLetters; i++) {
    letters[i].release();
  }
}

//--------------------------------------
class Letter 
{ 
  
  PVector position;
  PVector velocity;
  int boxHeight = 49;
  int boxLength;
  
  String letter; 
  int diameter;
  int id;
  Letter[] others;
  
  boolean over;
  boolean locked = false;
  boolean press;
  boolean otherslocked = false;
  
  boolean finished = false;
 
  Letter(PVector p, String _l, int _w, int idin, Letter[] oin) 
  {
    position = p.get();
    letter = _l;
    diameter = _w;
    id = idin;
    others = oin;
    
    velocity = new PVector(random(-0.01,0.01), random(-0.01,0.01));
    boxLength = diameter*20;
    diameter *=2;
  }
  
  void update() 
  {
    move();
    repulsion();
    pickUp();
    finish();
  }
  
  void display() {
    fill(255);
    text(letter, position.x, position.y);
  }
  
  void finish() {
    if (finished) {
      //over = false;
      locked = false;
      press = false;
      velocity = new PVector(0,0);
    }
  }
     
  // screen movement
  void shakeMe(PVector shake) 
  { 
    // move when applet is shaken
    position.add(shake);
    // momentum after released
    velocity.sub(shake);
  }
  
  // movement
  void move() 
  {  
    position.add(velocity);
    if (position.x - boxLength/2 < 0) 
    {
      position.x = boxLength/2;
      velocity.x *= friction;
    }
    else if (position.x + boxLength/2 > width) 
    {
      position.x = width - boxLength/2;
      velocity.x *= friction;
    }
    if (position.y - diameter/2 < 0) 
    {
      position.y = diameter/2;
      velocity.y *= friction;
    }
    else if (position.y + diameter > height) 
    {
      position.y = height - diameter;
      velocity.y *= friction;
    }
  }
  void repulsion() 
  {
    for (int i = id + 1; i < nLetters; i++) 
    {
      float dx = others[i].position.x - position.x;
      float dy = others[i].position.y - position.y;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].diameter/2 + diameter/2;
      if (distance < minDist) 
      {
        float angle = atan2(dx, dx);
        float targetX = position.x + cos(angle) * minDist;
        float targetY = position.y + sin(angle) * minDist;
        float ax = (targetX - others[i].position.x) * spring;
        float ay = (targetY - others[i].position.y) * spring;
        velocity.x -= ax;
        velocity.y -= ay;
        others[i].velocity.x += ax;
        others[i].velocity.y += ay;
      }
    }
  }
  // handle words
  void pickUp() {
    for (int i=0; i<others.length; i++) {
      if (others[i].locked == true) {
        otherslocked = true;
        break;
      } else {
        otherslocked = false;
      }
    }   
    if(otherslocked == false) {
      over();
      press();
    }
    if (press) {
      position.x = mouseX;
      position.y = mouseY;
    }
  }
  
  void press() {
    if (over && mousePressed || locked) {
      press = true;
      locked = true;
    } else {
      press = false;
    }
  }
  
  void over() {
    if ((mouseX >= (position.x-boxLength/2)) && (mouseX <= (position.x+boxLength/2)) && (mouseY >= (position.y-boxHeight/2)) && (mouseY <= (position.y+boxHeight/2)) && mousePressed) {
      over = true;
    } else {
      over = false;
    }
  }
  
  void release() {
    locked = false;
  }
} 


