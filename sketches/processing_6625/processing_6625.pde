
int BLANKID = 8;
PGraphics buf;
float PIECESIZE = 250/3;
HashSet pieces = new HashSet();
Piece blank;

    Tree t1 = new Tree(180,25,60);
    Tree t2 = new Tree(100,80,130);

Piece moving;
float move_current;
float msx,msy,mex,mey;

int shuffleToDo = 100;

void setup(){
   size(250,250);
   buf = createGraphics(250,250,JAVA2D);     
    //buf.fill(255);
    //buf.noStroke();
    //buf.rect(0,0,250,250);

    drawScene();
    
    for(int i = 0; i < 8; i++){
       pieces.add(new Piece(i));       
    }
    blank = new Piece(BLANKID);
    pieces.add(blank);

}
void keyPressed(){
   if (key == ' '){
      shuffleToDo += 100;
   } 
}

void draw(){
  if(shuffleToDo > 0){
     randomMove(); 
     shuffleToDo --;
  }
  drawScene();
  background(0);
  if(moving!=null){
    if(move_current < 1.0){ 
    moving.cx = lerp(msx,mex,move_current); 
     moving.cy = lerp(msy,mey,move_current); 
//     print(moving.cx+" ");
     move_current += .16;
    }else {
      moving.moving = false;
     moving = null; 
    }
    
  }
  Iterator i = pieces.iterator();
  while(i.hasNext()){
     Piece p = (Piece) i.next();
     p.draw();
  }

}

void randomMove(){
  int bx = spotToXcoord(blank.curspot);
  int by = spotToYcoord(blank.curspot);
  int x = -2; 
  int y = -2;
while(! ((x == bx && (y == by - 1 || y == by + 1)) ||
      (y == by && (x == bx - 1 || x == bx + 1)) )){
      x = int(random(3));
      y = int(random(3));
      }
        int where = x + (y*3);
        Piece p = findPieceBySpot(where);
        if(p != null){

                    p.curspot = blank.curspot;
                blank.curspot = where; 
        }
          
}

void mousePressed(){
  if(moving != null){ return; }
   int x = (int)(mouseX / PIECESIZE); 
   int y = (int)(mouseY / PIECESIZE);

  if(x < 0 || x > 2 || y < 0 || y > 2) return;

  int bx = spotToXcoord(blank.curspot);
  int by = spotToYcoord(blank.curspot);

  if((x == bx && (y == by - 1 || y == by + 1)) ||
      (y == by && (x == bx - 1 || x == bx + 1)) ){
        int where = x + (y*3);
        Piece p = findPieceBySpot(where);
        if(p != null){
          //starting and stopping of peice...
          msx = x * PIECESIZE;
          msy = y * PIECESIZE;
          mex = bx * PIECESIZE;
          mey = by * PIECESIZE;
         move_current = 0.0;
          moving = p;
         
          p.curspot = blank.curspot;
          blank.curspot = where; 
          p.moving=true;
        }
      } 
}


Piece findPieceBySpot(int spot){
    Iterator i = pieces.iterator();
    while(i.hasNext()){
       Piece p = (Piece)i.next(); 
       if(p.curspot == spot){
          return p; 
       }
    }
    return null;
}


class Tree {
  float x,y;
  float MINSIZE = width/10;
  float MAXSIZE = width / 5;
  float WIDTH,HEIGHT;
  float xs;

  ArrayList ornaments = new ArrayList();

  //float stroke ;
  Tree(float x, float y, float basesize){
    this.x = x;
    this.y = y;
    WIDTH = basesize * (.5 + norm(y,0,250)); // basesize * random(.8,1.2);
    HEIGHT = basesize *( .5 + norm(y,0,250));
    ;
    //stroke = basesize / 5;
    xs = 4*(.1 + norm(getBottom(),0,250));
    //int c = Math.round(random(3,8));
    for(int i = 1; i <= 6; i++){
      addOrnament(i/7.0);
    }
    addOrnament(4.0/5.0);
  }
  void addOrnament(float yper){
//    triangle(x,y-HEIGHT*.5,x-.75*WIDTH,y+HEIGHT,x+.75*WIDTH,y+HEIGHT);
      
      //float yper = random(1);
 
      float oy = (-HEIGHT*.5)    + (yper * (1.5 * HEIGHT));
      float xper = random(-1,1);
//xper = 1;
      float ox = xper * yper  * .75 * WIDTH;      
      ornaments.add(new Ornament(ox,oy));
  }

  void draw(){
    buf.strokeWeight(10);
    buf.stroke(0);
    doTrunk();
    buf.noStroke();
    doTrunk();
    buf.stroke(0);
    doGreen();
    buf.noStroke();
    doGreen();
    Iterator i = ornaments.iterator();
    while(i.hasNext()){
      Ornament o = (Ornament)i.next();
      buf.strokeWeight(6);
      buf.stroke(0);
      buf.fill(o.c);
      buf.ellipse(x+o.x,y+o.y,WIDTH/5,WIDTH/5); 
      buf.noStroke();
      buf.ellipse(x+o.x,y+o.y,WIDTH/5,WIDTH/5); 

    }

  }    
  float getBottom(){
    return  y+HEIGHT*1.5;
  }

  void doTrunk(){
    buf.fill(128,64,0);
    buf.rect(x -WIDTH*.075,y+HEIGHT*.5,WIDTH*.15,HEIGHT);
  }
  void doGreen(){

    buf.fill(0,200,0);
    //upper
    mytri(-HEIGHT*.5, 0, WIDTH*.35);
    //middle
    mytri(-HEIGHT*.35,HEIGHT*.5,WIDTH*.55);
    //lower
    mytri(-HEIGHT*.2,HEIGHT,-WIDTH*.75);
  }    
  void mytri(float topOffset, float botOffset, float widthOffset){
    buf.triangle(x,y+topOffset,x - widthOffset,y+botOffset,x+widthOffset, y+botOffset);
  }


}


class Ornament{
  float x,y;
  color c;
  Ornament(float x, float y){
    this.x = x;
    this.y = y;
    this.c = color(random(128,255),random(128,255),random(128,255));
  }


}
class Piece {
  int id;
  int curspot;

float cx,cy;

  boolean moving;
  
  Piece(int id){
       curspot = this.id = id;

   }
   
   
   void draw(){
    
    float x = spotToXcoord(curspot)*PIECESIZE;
    float y = spotToYcoord(curspot)*PIECESIZE;
    
    if(moving){
       x =  cx;
       y = cy;
    }
    
     if(isWin() || id != BLANKID){
       
       
        PImage img = buf.get(
          (int)(spotToXcoord(id)*PIECESIZE),(int)(spotToYcoord(id)*PIECESIZE),(int)PIECESIZE,(int)PIECESIZE);
        image(img,x,y);
     
     noFill();
     stroke(0); 
     strokeWeight(2);
     rect(x,y,PIECESIZE,PIECESIZE);
     }
   }
   
  
}


   int spotToXcoord(int s){
     return s % 3;
   }
   int spotToYcoord(int s){
     return s / 3;
   }



class Star{
    float x,y;
   Star(float x, float y){
      this.x = x;
      this.y = y;
   } 
   float SIZE = 20;
   float angle = .9;//PI/4;
   
   
   void draw(){
     angle+=.01;
    // angle = mouseX / 250.0;
     buf.noStroke();
    // println(angle);
     buf.pushMatrix();
     buf.translate(x,y);
     
      buf.beginShape();
      buf.vertex(cos(angle) * SIZE, sin(angle)*SIZE);
      buf.vertex(cos(angle + TWO_PI*.4) * SIZE, sin(angle+ TWO_PI*.4)*SIZE);
      buf.vertex(cos(angle + TWO_PI*.8) * SIZE, sin(angle+ TWO_PI*.8)*SIZE);
      buf.vertex(cos(angle + TWO_PI*.2) * SIZE, sin(angle+ TWO_PI*.2)*SIZE);
      buf.vertex(cos(angle + TWO_PI*.6) * SIZE, sin(angle+ TWO_PI*.6)*SIZE);


buf.endShape(CLOSE);
buf.popMatrix();
   } 
}


Star s = new Star(100,25);
Star sb = new Star(100,25);

void drawScene(){
       buf.beginDraw();
      buf.background(255);
boolean win = isWin();
    t1.draw();

    t2.draw();
    if(win){
sb.SIZE = 30;
buf.fill(0);
      sb.draw();
      buf.fill(250,250,30);

      s.draw();        

    }
    
    buf.endDraw();
 
  
}


boolean isWin(){
  if(moving != null || shuffleToDo > 0) return false;
  Iterator i = pieces.iterator();
while(i.hasNext()){
   Piece p = (Piece)i.next();
   if(p.id != p.curspot){
     return false;
   }
} 
 return true;
}

