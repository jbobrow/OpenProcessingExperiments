


float x, y;      
float px, py;     
float rdm;       
float count=60;  
float inc=5;       

int ns=10;       
int hInc=7;     
int div = 40;    
float strk=1.3;  

void setup() {
  size(600, 750);
  background(255, 250, 245);
  smooth();
  stroke(255, 250, 245);
  strokeWeight(strk);
  frameRate(900);
  fill(51);
  //rectMode(CORNERS);
  rect(0, 0, width, height);  
  noCursor();
}

void draw() {
  count=60;
  inc=0;
  ns=7;       
  hInc=7;     
  div = 50;    
  strk=1.0;
  background(51);
  while (count<height-80) {

    if (inc>25) {  
      inc=25;
    }     
    else {  
      inc = count/div;
    }   
    rdm=random(0, 300);           
    y=noise(rdm)*ns+count;     
    int dy = mouseY - int(y);
    if(abs(dy) < 10) {
      y += 10-dy;
    }
    line(px, py, x, y);          
    py=y;                        
    px=x;                        
    x+=hInc;                    
    if (x>width+10) {              
      noStroke();
      x=0;
      count = count + inc;
      py=y;
      px=x;
      stroke(255, 250, 245);
    }
  }
}



