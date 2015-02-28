
float reachedWaypointThreshold = 6.0f;

class Word { 
  PVector position = new PVector(0,0);
  PVector velocity = new PVector(0,0);
  PVector initialPosition = new PVector(0,0);
  ArrayList waypoints = new ArrayList();

  String wordText;
  
  Word (float x, float y, String t) {  
    initialPosition.x = x;
    initialPosition.y = y;
    
    position.x = x;
    position.y = y;

    wordText = t;
    velocity.x = 0.0f;
    velocity.y = 0.0f;
  } 
  void update() { 
    //Start moving toward the waypoint
    if(waypoints.size() > 0){
      PVector wp = (PVector)waypoints.get(0);
      //velocity = PVector.sub( wp, position ).normalize();
    
      velocity.x = (wp.x - position.x);
      velocity.y = (wp.y - position.y);

      velocity.normalize();
      velocity.mult(10);
    }
    
    position.x += velocity.x;
    position.y += velocity.y;
    
    //Did we reach a waypoint?
    if(waypoints.size() > 0){
      PVector wp = (PVector)waypoints.get(0);
      if( dist(position.x, position.y, wp.x, wp.y) < reachedWaypointThreshold){
        waypoints.remove( waypoints.get(0) );
        velocity.x = 0.0f;
        velocity.y = 0.0f;
      }
    }
  } 
  void drawWord() {
    fill(0);
    textFont(font);
    textAlign(LEFT,CENTER);
    text(wordText,position.x,position.y);    
  }
  void addWaypoint(float x, float y){
    waypoints.add(new PVector(x,y));
  }
}

PFont font;

Word[] words = new Word[7];

void setup()
{
  size(800,600);
  smooth();
  background(255);
  frameRate(60);
  font = loadFont("CharcoalCY-48.vlw");  //Located in the Data folder
  
  words[0] = new Word(100,300,"S");
  words[1] = new Word(130,300,"C");
  words[2] = new Word(160,300,"A");
  words[3] = new Word(190,300,"T");
  words[4] = new Word(220,300,"T");
  words[5] = new Word(250,300,"E");
  words[6] = new Word(280,300,"R");
}

void draw()
{
  background(255);
  
  for(int i=0; i<7; i++){
    Word w = words[i];
    w.update(); 
    w.drawWord();
  }
}

void mousePressed() {
  PVector p = words[0].position;
  
  if(mouseX < p.x || mouseX > p.x + 250 || mouseY < p.y || mouseY > p.y + 100){
    return;
  }
  
  PVector endPosition = new PVector(random(0,width-300),random(100,height-200));
  
  for(int i=0; i<7; i++){
    for(int j=0; j<2; j++){
      words[i].addWaypoint(random(p.x-100,p.x+100),random(p.y-100,p.y+100));
    }
    words[i].addWaypoint(endPosition.x + words[i].initialPosition.x, endPosition.y);
  }
}

