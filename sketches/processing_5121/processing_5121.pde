

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
    update(); 
    move();
    draw();
    
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
    
    fSin =  sin( ftime % (TWO_PI) ) * fRanSize;
    fCos = -cos( ftime % (TWO_PI) ) * fRanSize;
  
    fStart = sin( ftime ) * 0.55;
  
    float fDist = dist(fXpos, fYpos, mouseX, mouseY);
  
    if( fDist < fRanSize/2){
      fXpos = random(width);
      fYpos = random(height);
    }
  }
  
  void move(){
    
    float vx = mouseX - fXpos; // 알으로 갈 곳이 마우스 위치입니다. 속도(벡터) = 미래의 위치 - 현재의 위치 
    float vy = mouseY - fYpos;
    // 형성한 벡터(여기서는 속도)를 가지고 위치를 만듭니다. 자동차를 생각해 보세요
    fXpos += vx * 0.05; // 0.1 이 의미하는 바는 무엇일까요? 1 / 10 ? 
    fYpos += vy * 0.05; // 점진적으로 가고자 하는 곳으로 가게 해줍니다.
    
    
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



