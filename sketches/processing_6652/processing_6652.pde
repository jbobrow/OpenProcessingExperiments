
 
  float FW = 10; //18  ;
  float FH = 10 ;//18;
  float CH = 6;

long mouseCount = 0;

boolean mortar = false;


float FIELDX = 120; 
float FIELDY = 80;

int STARTDROP = 13;
int SZ = 10;

int[][] stack = new int[SZ][SZ];
ArrayList[][] falling = new ArrayList[SZ][SZ];

void setup(){
  frameRate(30);
   size(250,250); 
  reset(true);
   for(int x = 0; x < SZ; x++){
      for(int y = 0; y < SZ ; y++){
         falling[x][y] = new ArrayList();
      }
   }
//   stack[9][9]=22;
   dropBlock(9,9);
}

boolean dropBlock(int x, int y){
    if(stack[x][y] >= SZ){
        return false;
    }
    ArrayList fallers = falling[x][y];
    if(fallers.size() > 0){
        Cube highest =(Cube)fallers.get(fallers.size()-1);
        if(highest.h > STARTDROP -1) {
          return false;
        }
    }
    fallers.add(new Cube(STARTDROP));
    return true;
}


void reset(boolean wall){
     for(int x = 0; x < SZ; x++){
      for(int y = 0; y < SZ ; y++){
        
        stack[x][y] =0;
        if(wall && (y == 0 || x == 0 || y == 9 || x == 9)){ 
        stack[x][y] =1;// 0;//1;//ceil(random(10)); 
        }
      }
   }

}

class Cube{
  float h, s;
   Cube(float h){
      this.h = h; 
      s = 0.0f;
   }
}

void keyPressed(){
   if(key == ' '){
      reset(false);
   } 
}

void draw(){
mouseCount++;

  background(200,200,250);
  noStroke();
  fill(255);
  rect(0,50,250,220);
   for(int x = 0; x < SZ; x++){
      for(int y = 0; y < SZ ; y++){
          for(int z = 0; z < stack[x][y]; z++){
             drawcube(x,y,z); 
          }
          Iterator i = falling[x][y].iterator();
          while(i.hasNext()){
             Cube c = (Cube)i.next();
             drawcube(x,y,c.h); 
             c.s += .05;
             c.h -= c.s;
             if(c.h < stack[x][y]){
                i.remove();
               stack[x][y]++; 
             }
          }
        }
      }

//      drawtop(0,0);

    figureMouse();
}

void mouseClicked(){
     if(mouseButton == RIGHT){
      mortar = !mortar; 

     } 
}

void figureMouse(){
  float myMouseX = mouseX - 8 ;
  float myMouseY = mouseY - 10;
  
  int xp = round( ((myMouseX - FIELDX) / (2*FW) )  +   ((myMouseY - FIELDY) / (2*CH) ))      ;
  int yp = round((myMouseY - FIELDY) / (2* CH) - ((myMouseX - FIELDX) / (2*FW) ));


  xp = constrain(xp,0,SZ-1);
    yp = constrain(yp,0,SZ-1);

if(mouseCount < 60){
  drawtop(xp,yp);
}
  if(mousePressed && mouseButton == LEFT){
    mouseCount = 0;
    dropBlock(xp,yp);
    
  }
    
}


void mouseMoved(){
    mouseCount = 0;
}


void drawtop(int xp,int yp){
   fill(255,128,128,100);
   int zp = stack[xp][yp]-1;
   noStroke();
        float x = FIELDX + (xp * FW) - (yp * FW);
     float y = FIELDY + (xp * CH) + (yp * CH) - (zp * FH);
         quad(x,y,x+FW,y+CH,x+FW+FW,y,x+FW,y-CH);
}




   void drawcube(int xp,int yp, float zp){
     float x = FIELDX + (xp * FW) - (yp * FW);
     float y = FIELDY + (xp * CH) + (yp * CH) - (zp * FH);
     //fill(c);
     if(mortar){
       strokeWeight(1);
       stroke(0);//,128);  
     } else {
     noStroke();
     }
     fill(240,240,255);//,128);
       quad(x,y,x,y+FH,x+FW,y+FH+CH,x+FW,y+CH);
      fill(170,170,220);//,128);
       quad(x+FW,y+FH+CH,x+FW,y+CH,x+FW+FW,y,x+FW+FW,y+FH);

      fill(255 -( 3 * zp));//,128);
       quad(x,y,x+FW,y+CH,x+FW+FW,y,x+FW,y-CH);

   }
    


