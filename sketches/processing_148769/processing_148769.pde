
/*
  Andor Salga
  Processing Poetry
  Processing compliant
*/

class Word{
  String string;
  PVector coords;
  int wordSize;
  
  public Word(String s, PVector c){
    string = new String(s);
    wordSize = (int)getWidth(string);
    coords = c;
  }
  
  String getString(){
    return string;
  }
  
  int getSize(){
    return wordSize;
  }
  
  PVector getCoords(){
    return new PVector(coords.x, coords.y);
  }
  
  void setCoords(PVector p){
    coords = new PVector(p.x, p.y);
  }
}

int MAGNET_HEIGHT = 20;

int isHoldingMagnet = -1;

// user will click somewhere on the magnet, need to save 
// this value so the magnet is drawn in same cursor spot
int clickedOffsetX = 0;
int clickedOffsetY = 0;

ArrayList words;

void setup(){
  size(500, 500);

  PFont fontA = createFont("courier", 14);
  textFont(fontA, 16);

  words = new ArrayList();

  // add magnets in specific locations
  int xStart = 350;
  
   String[] stringsToAdd ={
   "a","a", "s", "s", "the", "the", "ed",
   "I", "know", "my", "will", "you", "art",
   "her", "him", "they", "us", "love",
   "Processing", "Miri", "robot", 
   "jolty", "cookie", "magic", "cow", "free", "love", "cried", "rain",
   "forest", "dream", "gloom", "dark", "leap",  
   "run", "walk", "jump", "climb",
   "who", "what", "where", "when", "how", "why", 
   "see", "feel", "smell", "taste", "touch", "hear"};
  
  for(int i = 0; i < stringsToAdd.length; i++){
    addMagnetRandom(stringsToAdd[i]);
  }
   addMagnet("By", xStart, height - 30);
   addMagnet("Andor", xStart + getWidth("By") + 5, height - 30);
   addMagnet("Salga", xStart + getWidth("By") + 5 + getWidth("Andor") + 5, height - 30);
}

// Add a magnet to a random place
void addMagnetRandom(String str){
  PVector coords = new PVector( (int)random(20, width-80), (int)random(20, height-60));

  Word word = new Word(str, coords);
  words.add(word);
}

void addMagnet(String str, int x, int y){
  Word word = new Word(str, new PVector(x, y));
  words.add(word);
}

int getWidth(String str){
  return (int)str.length() * 10;
}

void drawMagnets(){
  stroke(0);

  for(int i = 0; i < words.size(); i++){
    if(i != isHoldingMagnet){
      strokeWeight(2);
      fill(255, 255, 255);
      
      Word w = (Word)words.get(i);
      int x = (int)w.getCoords().x;
      int y = (int)w.getCoords().y;
      int s = w.getSize();
      
      rect(x, y, s, MAGNET_HEIGHT);
      
      fill(0);
      text(w.getString(), x, y+15);
    }
  }
  
  if( isHoldingMagnet != -1){
    int idx = isHoldingMagnet;
     
    // shadow
    noStroke();
    fill(0, 0, 0, 150);
    
    Word w = (Word)words.get(idx);
    int s = w.getSize();
    String string = w.getString();
    
    rect(mouseX - clickedOffsetX, 
         mouseY - clickedOffsetY,
         s, MAGNET_HEIGHT);
    
    strokeWeight(2);
    stroke(0);
    fill(255, 255, 255);
    rect( mouseX - clickedOffsetX-5,
          mouseY - clickedOffsetY-5,
          s, MAGNET_HEIGHT);
    
    fill(0);
    text(string, mouseX - clickedOffsetX - 5,
                 mouseY - clickedOffsetY + 10
    );
  }
}

void draw(){
  background(255);
  
  drawMagnets();
  
  // User tries to pick up a magnet
  if(mousePressed && isHoldingMagnet == -1){
    // did he pick up a magnet or miss?
    int indexOfMagnet = -1;
    
    int mx = mouseX;
    int my = mouseY;

    // Pick up the LAST magnet drawn out of all 
    // the magnets the user clicked on which 
    // will be the 'top' magnet.
    
    for(int i = 0; i < words.size(); i++){

      Word w = (Word)words.get(i);
      
      int x = (int)w.getCoords().x;
      int y = (int)w.getCoords().y;
      int s = w.getSize();
      
      if(mx > x && mx < (x + s) && my >= y && my <= (y + MAGNET_HEIGHT)){           
         // keep overwriting the value
         isHoldingMagnet = i;
         clickedOffsetX = mx - x;
         clickedOffsetY = my - y;
      }
    }
  }

  // if the user picked up a magnet and dropped it
  if(!mousePressed && isHoldingMagnet != -1){
    int idx = isHoldingMagnet;
    
    Word w = (Word)words.get(idx);
    
    int x = mouseX - clickedOffsetX;
    int y = mouseY - clickedOffsetY;
    
    w.setCoords(new PVector(x, y));
        
    words.remove(idx);

    // add to end of list 
    words.add(w);   
    isHoldingMagnet = -1;               
  }
}

