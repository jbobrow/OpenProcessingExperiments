
boolean[][][] life;        // so the variables. you have a "who's alive" array (life),
int a;                     // a sum (a), a timer (count), placeholders for mouse position  
int count;                 // (xx,yy), the delay on each frame, the zoom on the pixels, 
int xx;                    // two temporary variables to keep the initial pattern centered
int yy;                    // (s,d), and a pause button, arbitrarily named 'blue'.
int Delay=1;
int zoom=6;
int s;
int d;
boolean blue;
void setup(){
  rectMode(CORNER);       // P2D speeds up the framerate... somehow. it has to do with the 
  size(600,400,P2D);      // way the pixels are drawn. 
  life=new boolean[2][width/zoom][height/zoom];     // "life" is effectively two arrays for
  stroke(0);                                        // every pixel in the window. one for
  strokeWeight(zoom/4);                             // this frame, one for next.
  fill(0,200,0); 
  background(0);
  s=width/zoom/2-15;           // keeping the glider gun in the middle of the window, in case
  d=height/zoom/2-5;           // you want to resize it. below is the inital pattern. 

  life[0][s][d+2]=true;
  life[0][s][d+3]=true;
  life[0][s+1][d+2]=true;
  life[0][s+1][d+3]=true;
  life[0][s+8][d+3]=true;
  life[0][s+8][d+4]=true;
  life[0][s+9][d+2]=true;
  life[0][s+9][d+4]=true;
  life[0][s+10][d+2]=true;
  life[0][s+10][d+3]=true;
  life[0][s+16][d+4]=true;
  life[0][s+16][d+5]=true;
  life[0][s+16][d+6]=true;
  life[0][s+17][d+4]=true;
  life[0][s+18][d+5]=true;
  life[0][s+22][d+1]=true;
  life[0][s+22][d+2]=true;
  life[0][s+23][d+0]=true;
  life[0][s+23][d+2]=true;
  life[0][s+24][d+0]=true;
  life[0][s+24][d+1]=true;
  life[0][s+24][d+12]=true;
  life[0][s+24][d+13]=true;
  life[0][s+25][d+12]=true;
  life[0][s+25][d+14]=true;
  life[0][s+26][d+12]=true;
  life[0][s+34][d]=true;
  life[0][s+34][d+1]=true;
  life[0][s+35][d]=true;
  life[0][s+35][d+1]=true;
  life[0][s+35][d+7]=true;
  life[0][s+35][d+8]=true;
  life[0][s+35][d+9]=true;
  life[0][s+36][d+7]=true;
  life[0][s+37][d+8]=true;
}
void draw(){
  background(0);
  if(blue && count>Delay){             // if it's not paused and the count is above 3
    for(int i=0;i<width/zoom;i++){
      for(int j=0;j<height/zoom;j++){  // for all entries: find out how many neighbors it  
        a=sum(i,j);                    // has, determine if this pixel should be alive next 
        if(life[0][i][j]){             // turn, and put the results in the secondary array.
          if(2<=a && a<=3){
            life[1][i][j]=true;        // the current rules are conway's original rules,
          }                            // but this can easily be changed. 
          else{
            life[1][i][j]=false;
          }                            // put a rectangle at i,j (the arrays, you'll notice
          rect(i*zoom,j*zoom,zoom-1,zoom-1);      // directly correspond to coordinate 
        }                              // location), and compensate for zoom.
        else{
          if(3<=a && a<=3){
            life[1][i][j]=true;
          }
          else{
            life[1][i][j]=false;
          }
        }
      }
    }
    for(int i=0;i<width/zoom;i++){
      for(int j=0;j<height/zoom;j++){      // then, for all entries, set the "current"  
        life[0][i][j]=life[1][i][j];       // array entry to the value of it's 
      }                                    // corresponding "next" array entry. this is done
    }                                      // seperately to make the changes simultaneously
    count=0;        // reset the counter
  }
  else{  // if the count<delay or blue
    for(int i=0;i<width/zoom;i++){         // keep showing the pixels that are alive, so that
      for(int j=0;j<height/zoom;j++){      // you can tell what you're doing when paused. 
        if(life[0][i][j]){
          rect(i*zoom,j*zoom,zoom-1,zoom-1);
        }
      }
    }
    count++;                     // increment the timer
  }
}

int sum(int i,int j){            // this just goes through each surrounding cell and 
  int local=0;                   // determines if it is alive, and adds it to the local sum. 
  if(i>0 && j>0){                // the if statements keep the pixels from trying to access
    local+=int(life[0][i-1][j-1]);        // neighbors that don't exist. 
  }
  if(i>0){
    local+=int(life[0][i-1][j]);
  }
  if(i>0 && j<height/zoom-1){
    local+=int(life[0][i-1][j+1]);
  }
  if(j>0){
    local+=int(life[0][i][j-1]);
  }
  if(j<height/zoom-1){
    local+=int(life[0][i][j+1]);
  }
  if(i<width/zoom-1 && j>0){
    local+=int(life[0][i+1][j-1]);
  }
  if(i<width/zoom-1){
    local+=int(life[0][i+1][j]);
  }
  if(i<width/zoom-1 && j<height/zoom-1){
    local+=int(life[0][i+1][j+1]);
  }
  return local;          // at the end, return the sum of the neighbors. 
}
int Line(int x1, int y1,int x2,int y2){      // i had to remake the line function so that it 
  float a=abs(x1-x2)+abs(y1-y2);             // turned cells "on" as opposed to just coloring 
  float x=x1;                                // them. 
  float y=y1;
  int X=int(x);
  int Y=int(y);
  for(int i=0;i<a;i++){
    x+=(x2-x1)/a;
    y+=(y2-y1)/a;
    X=int(x);
    Y=int(y);
    life[0][int(X/zoom)][int(Y/zoom)]=true;
  }                                             // technically, since it's a function, it has
  return 0;                                     // to return something, but we don't use this
}
void mousePressed(){                  // when right-click, toggle the pause, 
  if(mouseButton==RIGHT){             // when left-click, toggle live/dead cells. 
    blue=(!blue);
  }
  else if(mouseX<width && mouseX>=0 && mouseY<height && mouseY>=0){
    life[0][int(mouseX/zoom)][int(mouseY/zoom)]=!(life[0][int(mouseX/zoom)][int(mouseY/zoom)]);
    xx=mouseX;
    yy=mouseY;
  }
}
void mouseDragged(){
  if(mouseButton==LEFT && mouseX<width && mouseX>=0 && mouseY<height && mouseY>=0){
    Line(xx,yy,mouseX,mouseY);
    xx=mouseX;                      // same thing, except that when dragging, cells aren't 
    yy=mouseY;                      // toggled back and forth, they are just turned on. 
  }                                 // this was because the toggling back and forth went 
}                                   // fast enough to randomly turn cells on and off 


