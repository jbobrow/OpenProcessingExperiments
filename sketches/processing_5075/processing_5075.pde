

int width = 640;
int height = 480;

int nCount = 10;
PACKMAN[] packMan;

ArrayList packMans;

PFont font;

void setup(){
  size(width, height);
  colorMode(HSB, 255);
  smooth();
  frameRate(30);
  
  font = loadFont("Helvetica-12.vlw");
  
  packMan = new PACKMAN[nCount];
  for(int i = 0; i < nCount; i++){
    packMan[i] = new PACKMAN(random(width), random(height), random(255), random(30, 100));
  }
  
  packMans = new ArrayList();  
}

void draw(){
  background(0);
    
  for(int i = 0; i < nCount; i++){
    packMan[i].render();
  }
  
  for (int i = packMans.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have 
    // to cast the object coming out
    PACKMAN packMan = (PACKMAN) packMans.get(i);
    packMan.render();
    if (packMan.finished()) {
      // Items can be deleted with remove()
      packMans.remove(i);
    }
  }  
  
}

void mousePressed(){
  packMans.add(new PACKMAN(mouseX, mouseY, random(255), random(30, 100) ) );
}

class PACKMAN{
  
  float fXpos, fYpos;
  float ftime;
  float fSin, fCos;
  float fStart; 
  float fRanColor;
  
  float fRanSize;
  
  float fLife = 255;
  
  PACKMAN(float fXpos, float fYpos, float fRanColor, float fRanSize){
    this.fRanColor = fRanColor;
    this.fRanSize = fRanSize;
    this.fXpos = fXpos;
    this.fYpos = fYpos;
  }
  
  void render(){
    draw();
    update();  
  }
    
  void draw(){
    pushMatrix();
      translate(fXpos, fYpos);
      
      float a = atan2(mouseY-fYpos, mouseX-fXpos);
    
      rotate(a);
      stroke(fRanColor, 255, 255);
      strokeWeight(2);
      line(0, 0, fSin, fCos);
  
      noStroke();
      fill(fRanColor, 255, 255);
      arc(0, 0, fRanSize, fRanSize, HALF_PI/4, TWO_PI - fStart);
  
      fill(0);
      float fDist = dist(0, 0, fRanSize/7, fRanSize/6);
      ellipse( fDist, -fDist, fRanSize*0.1, fRanSize*0.1);
    
      fill(fRanColor, 0, 255);
      textFont(font, 12); 
      text("packman", -25, 30);
    popMatrix();
  }
  
  void update(){
    ftime = ftime + 0.2; 
    
    fSin = sin( ftime % (TWO_PI) ) * fRanSize;
    fCos = -cos( ftime % (TWO_PI) ) * fRanSize;
  
    fStart = sin( ftime ) * 0.55;
  
    float fDist = dist(fXpos, fYpos, mouseX, mouseY);
  
    if( fDist < fRanSize/2){
      fXpos = random(width);
      fYpos = random(height);
    }
  }
  
  boolean finished(){
    fLife--;
    if ( fLife < 0){
      return true;
    } else {
      return false;
    }
  }
    
  
}



