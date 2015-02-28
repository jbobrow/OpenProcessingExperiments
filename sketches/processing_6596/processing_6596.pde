
PGraphics buf;
int PUZSIZE = 150;
int PIECESIZE = 50;
Piece currentPiece = null;
HashSet flakes;
HashSet glows;
HashSet buildings;
float[] snowHeight = new float[PUZSIZE];
ArrayList pieces;

void keyPressed(){
  if(key == ' '){
     reset(); 
  }
}

void reset(){
buildings = new HashSet();
  flakes = new HashSet();
glows = new HashSet();

addBuildings();

  float h = PUZSIZE-10;
  for(int i = 0; i < PUZSIZE;i++){
    snowHeight[i] = h;
    h += random(-1,1);
    if(h >= PUZSIZE) h--;
  }
float o = (width-PUZSIZE) /2;
  pieces = new ArrayList();
  for(int x = 0; x < 3;x++){
    for(int y = 0; y < 3; y++){
      pieces.add(new Piece(x*PIECESIZE,y*PIECESIZE, o +x*PIECESIZE, o+y*PIECESIZE ));
    } 
  }
  //  pieces.add(new Piece(0,0));

}


void setup(){
  size(250,250);
  reset();
  buf = createGraphics(PUZSIZE,PUZSIZE,JAVA2D); 

  Flake f = new Flake(PUZSIZE/2);
  f.y = 75;
  flakes.add(f);
}

void draw(){
  background(128);

  if(random(1) < .15){
    flakes.add(new Flake(random(PUZSIZE)));
  }



  drawSnowOffscreen();

  stroke(0); 
  strokeWeight(1);

  float o = (width-PUZSIZE) /2;

  for(int x = 0; x < 4;x++){
    float ox = o+ (x*PIECESIZE);
    line(ox,o,ox,o+PIECESIZE*3); 
  }
  for(int y = 0; y < 4; y++){
    float oy = o+ (y*PIECESIZE);
    line(o,oy,o+PIECESIZE*3,oy); 
  }

  Piece ph = findPiece(mouseX,mouseY) ;
  if(ph != null){
    ph.hilite = true;
  }


  Iterator i = pieces.iterator();
  while(i.hasNext()){
    Piece p = (Piece)i.next(); 
    p.draw();
    p.hilite = false;
  }

   i = glows.iterator();
  while(i.hasNext()){
    Glow g = (Glow)i.next(); 
    if(g.draw()){
       i.remove(); 
    }
  }


}


void mouseMoved(){

}
float mxo,myo;

void mousePressed(){
  Piece ph = findPiece(mouseX,mouseY) ;
  if(ph != null){
    currentPiece = ph;
    mxo = mouseX - ph.x;
    myo = mouseY - ph.y;
  }
}
void mouseDragged(){
   if(currentPiece != null){
      currentPiece.x = mouseX - mxo;
      currentPiece.y = mouseY - myo;
   } 
}
void mouseReleased(){
   if(currentPiece != null){
      if(currentPiece.checkSettle()){
        Iterator i = pieces.iterator();
       boolean allDone = true;
       while(i.hasNext()){
          Piece p = (Piece)i.next();
          if(!p.isThere()){
            allDone = false;
          }          
       } 
       if(allDone) {
        
float o = (width-PUZSIZE) /2;
         glows.add(new Glow(o,o,3*PIECESIZE)); 

       } else {
         glows.add(new Glow(currentPiece.x,currentPiece.y,PIECESIZE)); 
       } 
    }
   }   
}

class Glow {
float x,y,sz;
   float life = 255;
  Glow(float x, float y, float sz){
     this.x=x;
    this.y=y;
   this.sz=sz; 
  }
  boolean draw(){
   if(life <= 0) {
     return true; //done
   }
   noStroke();
   fill(255,life);
   rect(x,y,sz,sz);
   life -= 10;
    return false;
  }
   
  
}




Piece findPiece(float x, float y){
  //gotta be backwards
  int i;
  for(i = pieces.size() - 1; i >=0; i--){
    Piece p = (Piece)pieces.get(i);
    if(p.pointInside(x,y)){
      return p; 
    }
  }

  return null; 
}


class Piece{
  float x,y;//place on board
  int xo,yo; //, place grabbed from offscreen
  float gx,gy; //goal x and y
  Piece(int xo,int  yo, float gx, float gy){
    this.xo = xo; 
    this.yo = yo;
    x = random(width-PIECESIZE);
    y = random(height-PIECESIZE);
    this.gx = gx; this.gy = gy;
  } 
  boolean hilite;
  boolean pointInside(float mx,float my){
    if(mx >= x && mx < x + PIECESIZE && my >= y && my < y + PIECESIZE){
      return true; 
    }
    return false;
  }
   boolean isThere(){
      return x == gx && y == gy; 
     }


  boolean checkSettle(){
     if(mag(x-gx,y-gy) < 20){
        x = gx;
        y = gy;
        return true;
     } 
     return false;
  }

  void draw(){
    PImage img = buf.get(xo,yo,PIECESIZE,PIECESIZE);
    image(img,x,y);
    if(hilite){
      stroke(255,0,0);
      strokeWeight(1);
      noFill();
      rect(x-1,y-1,PIECESIZE,PIECESIZE); 
    }
  }


}

class Building{
   float w;
  float h;
color c;
float x;
void draw(){
      buf.noStroke();
    buf.fill(c);
    buf.rect(x,250-h,w,h);
  

    float winwidth = w / ((wincount *2)+1);
    int num = 0;
    for(float start = 250 - h + 6;  start < 250; start+= (winheight*2)){
    for(int i = 0; i < wincount; i++){
      if(lit[num]){
           buf.fill(128,128,0); 
      } else {
        
           buf.fill(50); 
      }
      buf.rect( x + (winwidth * (1+(2* i))),start,winwidth,winheight);
      num++;
     }
    }
}
int wincount;
boolean lit[];
float winheight = 6;

void initWindows(){
 wincount  = 3;
  if(w < 16) {
    wincount = 2; 
 }
 if(w > 24){
    wincount = 4; 
 }
 int floorcount = ceil(h / (winheight*2));
 lit = new boolean[floorcount * wincount];
 for(int i = 0; i < floorcount * wincount; i++){
    if(random(1) < .25){
       lit[i] = true;
    } 
 }
 
 
}

}

void addBuildings(){
 float x = 5;
 float w = random(10,30);
 while(x + w < 250){
  Building b = new Building();  
  b.x = x;

   b.w = w;
   b.h = random (150,240);
   b.c = color(random(128,200));
   b.initWindows();
   buildings.add(b);
   x += w + random(4,10);
   w = random(30,50);
 }
 
}


void drawBuildingsOffscreen(){
  Iterator i = buildings.iterator();
  while(i.hasNext()){
Building b = (Building) i.next();
b.draw();
  }
  }



void drawSnowOffscreen(){
  buf.beginDraw();
  buf.background(50,50,128);

  drawBuildingsOffscreen();


  Iterator i = flakes.iterator();
  while(i.hasNext()){
    Flake f = (Flake)i.next();
    if(f.move()) i.remove();
    f.draw();
  }

  for(int s = 0; s < PUZSIZE; s++){
    buf.strokeWeight(2);
    buf.stroke(255);
    buf.line(s,snowHeight[s],s,PUZSIZE);
  }

  buf.endDraw(); 
}

static float FLAKESIZE = 4;
class Flake{
  float y;
  int x;
  float a = 0;
  float rot = random(-.05,.05);

  Flake(float x){
    this.x = (int)x;
    this.y = -FLAKESIZE;
  } 
  //returns true if landed
  boolean move(){
    a += rot; 
    y += .5;
    if(y > snowHeight[x]){
      snowHeight[x]-= 1;
      if(x-1 >= 0){
        snowHeight[x-1]-= .5;
      }
      if(x+1 < PUZSIZE){
        snowHeight[x+1]-= .5;
      }
      return true;
    }
    return false;
  }
  void draw(){
    buf.strokeWeight(1);
    buf.stroke(255);
    buf.pushMatrix();
    buf.translate(x,y);
    buf.rotate(a);
    for(int i = 0; i < 3; i++){
      buf.line(0,-FLAKESIZE,0,FLAKESIZE);
      buf.rotate(PI/3);
    }
    buf.popMatrix();
  }

}




