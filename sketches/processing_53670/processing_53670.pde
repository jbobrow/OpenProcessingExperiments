
int  flips = 0;
int  state = 0;
int bestScore = 50000;
int numclicked = 0;
int click1 = 0;
int click2 = 0;
int clickTimer;

static int clearPenalty = 8;
static int leftPenalty = 4;

int clickScore = 0;

PFont font;

static int tilesWide = 7;
static int tilesHigh = 4;
int[] tiles;
int[] tstates; //0 is hidden, 1 is showing, 2 is deleted
color[] colors;
static int tileN = 70;
static int tileS = 6;
color bgcolor;

void scrambleTiles(){
  for(int j=tilesWide*tilesHigh-1;j>=0;j--){
    int t = tiles[j];
    int r = (int)random(j);
    tiles[j] = tiles[r];
    tiles[r] = t;
  }
}

void setup(){
  size(640,480);
  smooth();
  
  tiles = new int[tilesWide*tilesHigh];
  for(int i=0; i<tilesWide*tilesHigh; i++){
    tiles[i] = i%7;
  }
  
  tstates = new int[tilesWide*tilesHigh];
  for(int i=0; i<tilesWide*tilesHigh;i++){
    tstates[i] = 0;
  }
  
  colors = new color[7];
  colors[0] = color(255,0,0);
  colors[1] = color(255,165,0);
  colors[2] = color(255,255,0);
  colors[3] = color(50,205,50);
  colors[4] = color(0,65,225);
  colors[5] = color(45,0,165);
  colors[6] = color(192,60,255);
  
  bgcolor = color(255,192,203);
  
  font = loadFont("SansSerif-48.vlw");
}

void restart(){
  flips = 0;
  state = 1;
  scrambleTiles();
  for(int i=0; i<tilesWide*tilesHigh;i++){
    tstates[i] = 0;
  }
  numclicked = 0;
  clickScore = 0;
}

void mouseClicked(){
  int x = mouseX / (tileN+tileS);
  int y = mouseY / (tileN+tileS);
  if(x >=0 && x < tilesWide && y >= 0 && y < tilesHigh){
    if(tstates[y*tilesWide+x] == 0){   
      if(numclicked == 0){
        click1 = y*tilesWide+x;
        numclicked = 1;
        tstates[y*tilesWide+x] = 1;
        clickScore++;
      } else if(numclicked == 1){
        click2 = y*tilesWide+x;
        numclicked = 2;
        tstates[y*tilesWide+x] = 1;
        clickScore++;
        clickTimer = 0;
      }
    }
  }
}

boolean isGameOver(){
  int[] counts = new int[7];
  for(int i=0;i<7;i++) counts[i] = 0;
  for(int i=0;i<tilesWide*tilesHigh;i++){
    if(tstates[i] == 0 || (numclicked >= 1 && i == click1) || (numclicked == 2 && i == click2)) {
      counts[tiles[i]]++;
    }
  }
  for(int i=0;i<7;i++){
    if(counts[i] >= 2) return false;
  }
  return true;
}

void draw(){
  switch(state){
    case 0:
    default:
      state = 1;
      restart();
      break;
    case 1:
      noStroke();
      fill(bgcolor);
      rect(0,0,640,480);
      
      for(int y=0;y<tilesHigh;y++){
        for(int x=0;x<tilesWide;x++){
          color c;
          if(tstates[y*tilesWide+x] == 0){
            c = color(128,128,128);
            fill(c);
            stroke(0);
          } else if(tstates[y*tilesWide+x] == 1) {
            c = colors[tiles[y*tilesWide+x]];
            fill(c);
            stroke(0);
          } else {
            noFill();
            noStroke();
          }
          
          rect(x*(tileN+tileS),y*(tileN+tileS),tileN,tileN);
        }
      }
      
      if(numclicked == 2){
        clickTimer++;
        
        fill(colors[tiles[click1]]);
        textFont(font,48);
        
        if(tiles[click1] == tiles[click2]){
          text("Hot!",320,480-10);
        } else if((tiles[click1]+3)%7 == tiles[click2] || (tiles[click1]+4)%7 == tiles[click2]){
          text("Eww.",320,480-10);
        } else {
          text("Hmm.",320,480-10);
        }
        
        if(clickTimer % 60 == 0){
          numclicked = 0;
          
          if(tiles[click1] == tiles[click2]){
          } else if((tiles[click1]+3)%7 == tiles[click2] || (tiles[click1]+4)%7 == tiles[click2]){
            tstates[click1] = 2;
            tstates[click2] = 2;
            clickScore += clearPenalty;
          } else {
            tstates[click1] = 0;
            tstates[click2] = 0;
          }
          
        }
      }
      
      fill(255,255,255);
      textFont(font,48);
      text("Clicks: "+clickScore,0,480-10);
      
      if(isGameOver()){
        state = 2;
        clickTimer = 0;
        for(int i=0;i<tilesWide*tilesHigh;i++){
          if(tstates[i] == 0) {
            tstates[i] = 1;
            clickScore += leftPenalty;
          }
        }
      }
      break;
      
      case 2:
        noStroke();
        fill(bgcolor);
        rect(0,0,640,480);
        
        
        for(int y=0;y<tilesHigh;y++){
          for(int x=0;x<tilesWide;x++){
            color c;
            if(tstates[y*tilesWide+x] == 0){
              c = color(128,128,128);
              fill(c);
              stroke(0);
            } else if(tstates[y*tilesWide+x] == 1) {
              c = colors[tiles[y*tilesWide+x]];
              fill(c);
              stroke(0);
            } else {
              noFill();
              noStroke();
            }
            
            rect(x*(tileN+tileS),y*(tileN+tileS),tileN,tileN);
          }
        }
      
      if(bestScore > clickScore){
        bestScore = clickScore;
      }
      
      fill(255,255,255);
      textFont(font,48);
      text("Game over, Clicks: "+clickScore,0,480-58);
      text("Best score, Clicks: "+bestScore,0,480-10);
      clickTimer++;
      if(clickTimer % 360 == 0){
        state = 0;
      }
  }
}

