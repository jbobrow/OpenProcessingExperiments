
Mitra[][] myMitra;

int cols =10;
int rows =10;


void setup(){
  frameRate(60);

  
 
  size(1080,400);
  myMitra = new Mitra [cols][rows];
  for( int i =0; i< cols; i++) {
    for ( int j =0;j<rows; j++) {
      myMitra [i][j] = new Mitra( i*(width/10),j*(width/10),width/10,width/10,i+j,1);
    }
  }
}

void draw(){
   
  
  smooth();
  background(0);
 
  
  for ( int i=0;i<cols;i++) {
    for (int j=0;j<rows;j++) {
  
  myMitra[i][j].oscillate();
  myMitra[i] [j].display();
   
 
  
    }
  }
}

class Mitra {
  float x,y;
  float w,h;
  float angle;
  float col;
  
  Mitra ( float tempX,float tempY,float tempW, float tempH, float tempAngle,float tempCol) {
    
   x= tempX;
   y= tempY;
   w= tempW;
   h=tempH;
   angle = tempAngle;
   col=tempCol;
   
  }

void oscillate (){
  angle+= 0.01;
}
void display () {
  col+=(1); {
  if (col> 200) {
  col-=(1);
  }
 
  
  
  fill(160+160*cos(angle));
  strokeWeight(col+col*cos(angle)*cos(angle)*cos(angle));
  stroke (col+col*cos(angle));
  ellipse (x,y,w,h);
 
}

  strokeWeight (1);
  stroke(255,0,200);
  fill(255,0,200);
  triangle (mouseX*cos(angle)*cos(angle)*cos(angle),mouseY,width*(7/10*cos(angle)*tan(angle)),(height/5)*cos(angle),width*(3/5)*cos(angle)*cos(angle),tan(3));
  triangle (mouseX*sin(angle)*sin(angle)*cos(angle),0,mouseX*(7/10*cos(angle)*cos(angle)),(mouseY/5)*cos(angle),mouseY*(3/5)*cos(angle)*cos(angle),height/3);
  triangle (mouseX* sin(angle)*sin(angle)*cos(angle),mouseY,width*(7/10*cos(angle)*cos(angle)),(height/5)*tan(angle),mouseY*cos(angle)*cos(angle),height/3);
 


  
 
  

 rect (x*sin(angle),y*cos(angle),w*sin(angle)*0.000006,h*cos(angle)/0.000006);

}
}



