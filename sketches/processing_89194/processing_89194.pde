
//spirals
color[] hd={#736c48,#f2e3b3,#f2a950,#d98032,#d95d30};

float x;
float y;
float rc=100;
float k;

void setup(){
  size(600,600);
  smooth();
  background(hd[0]);
  ellipseMode(RADIUS);
  rectMode(CENTER);
  
 
  }

void draw(){
  translate(width/2,height/2);
  background(hd[0]);
   fill(#FFFFFF);
  text("press 1,2,3 or 4 for sprials 0 to clear", 10, 295);
 
  
  //blank screen
  if (k == 0){
    noStroke();
    fill(hd[0]);
    rect(0,0,500,500);
  }
  //dots 
  if (k == 1){
    stroke(hd[1]);
    strokeWeight(5);
    for(float angle = 0; angle< 2*PI; angle += .1){
      x= cos(angle) * rc;
      y= sin(angle) * rc;
      point(x,y);
    }
    }
    
    //spiral dots
   if (k == 2) {
    stroke(hd[2]);
    float rsd = 10;
    strokeWeight(5);
    for(float angle = 0; angle< 8*PI; angle += .1){
      rsd+= 0.5;
      x= cos(angle) * rsd;
      y= sin(angle) * rsd;
      point(x,y);
    }
   }
   //spiral line
   if (k == 3) {
    float px = -999; 
    float py = -999; 
    float radiusSpiralLine = 10;
    stroke(hd[3]);
    strokeWeight(5);
    for(float angle = 0; angle < 8*PI; angle += .05){
      radiusSpiralLine += 0.25;
      x = cos(angle) * radiusSpiralLine;
      y = sin(angle) * radiusSpiralLine;
      if(px > -999){        
        line(x, y, px, py);
      }
      px = x; 
      py = y; 
    }
  }
  if(k == 4){
    fill(hd[4]);
    noStroke();
    ellipse(0,0,100,100);
  }
}



void keyPressed(){
  if(key == 49) k=1; //dots
  if(key == 50) k=2; //sprial 1
  if(key == 51) k=3; //sprial 2
  if(key == 48) k=0; //blank
  if(key == 52) k=4; // plain circle
}
