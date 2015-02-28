
int stepCounter;
float[] x = new float[2];
float[] y = new float[2];
float segLength = 5;



float SPEED = 1;

float TURNSPEED = .1;

float angle;
float winangle;
HashSet steps = new HashSet();
HashSet stars = new HashSet();

float STEP = .5;

Star star = new Star();


float goalX, goalY;
float headX =0,headY=250;
//float headX =125,headY=125;


void setup() {
  size(250, 250);
  frameRate(40);
  strokeWeight(5);
  for(int s=0; s<x.length-1; s++) {
     x[s] = headX;
     y[s] = headY;
  }
  
  for(int g = 0; g < 200; g++){
     stars.add(new Point(random(250),random(0, 125)));
  }
  
mouseMoved();
}

void mouseMoved(){
 star.x = mouseX;
star.y = constrain(mouseY,0,110);
goalX = mouseX;
goalY = 234 - star.y;
}


class Point{
   float x,y;
  Point(float x, float y){
     this.x = x;
     this.y = y;
  } 
}


boolean closeEnough(float x1,float y1,float x2,float y2){
    if(mag(x1-x2,y1-y2) < 5){
       return true; 
    }
    return false;
}

void draw() {
  background(0,0,50);
  
    Iterator i = stars.iterator();
strokeWeight(1);
  while(i.hasNext()){
  stroke(random(130,250));
    Point p = (Point)i.next(); 
     line(p.x,p.y,p.x,p.y);
  }

  
  noStroke();
  fill(150,100,30);
  rect(0,125,250,125);
  strokeWeight(4);
   i = steps.iterator();
  stroke(75,50,15,60);
  while(i.hasNext()){
     Point p = (Point)i.next(); 
     line(p.x,p.y,p.x,p.y);
  }


fill(255,255,200);
star.draw();

fill(225,125,0);
rect(116,118,18,7);
fill(0);
  rect(118,120,14,5);

fill(128,128,255);
rect(120,121,2,4);
fill(255,128,128);
rect(128,121,2,4);
fill(225,125,0);
rect(123,123,4,2);




  if(! closeEnough(headX,headY,goalX,goalY)){
     stepCounter ++;    

     float dx = (goalX - headX );
    float dy = ( goalY-headY);
     float wantangle = atan2(dy, dx);
     float anglediff = (angle - wantangle);  
  
      anglediff /= PI;
    //this next bit catches the "runaround"
    
    
    if(anglediff > 1){
      anglediff -= 2;
    }
    if(anglediff < -1){
      anglediff += 2;
    }


    if(anglediff > 0){
      //  println(" <-\\");
      angle -= TURNSPEED; 
    } 
    else {
      //  println(" /->");

      angle += TURNSPEED; 
    }
    
    
   
        
headX +=   cos(angle)* SPEED; 
headY += sin(angle) * SPEED; 
  }
  if(headY < 125){
     headY = 125; 
  }
  drawGuy(0,headX,headY);
  dragSegment(0, headX,headY);
  
  if(stepCounter % 5 == 0){
  steps.add(new Point(headX,headY));
       stepCounter ++;   
  }
  
  for(int s=0; s<x.length-1; s++) {
    dragSegment(s+1, x[s], y[s]);
  }
  
  
  stroke(255,255,200,40);
  strokeWeight(4);
  
  if( closeEnough(headX,headY,goalX,goalY) && closeEnough(125,125,goalX,goalY)){
    pushMatrix();
    translate(125,125);
    rotate(winangle);
    winangle += .02;
    float SHINE = 50;
    line(0,0,SHINE * cos(winangle),SHINE *sin(winangle));
    line(0,0,SHINE * cos(winangle+ PI*2/5),SHINE *sin(winangle+ PI*2/5));
    line(0,0,SHINE * cos(winangle+ PI*4/5),SHINE *sin(winangle+ PI*4/5));
    line(0,0,SHINE * cos(winangle+ PI*6/5),SHINE *sin(winangle+ PI*6/5));
    line(0,0,SHINE * cos(winangle+ PI*8/5),SHINE *sin(winangle+ PI*8/5));
//    line(0,0,SHINE * cos(a),SHINE *sin(a));
//    line(0,0,SHINE * cos(a),SHINE *sin(a));
//    line(0,0,SHINE * cos(a),SHINE *sin(a));
    popMatrix();
  }
    else {
      line(star.x,star.y, goalX,goalY);
    }
  
  
  
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
drawGuy(i,x[i],y[i]);
}




void drawGuy(int i,float x, float y){
  noStroke();
  fill(200);

  rect(x,y-4,2,4);
  
}










class Star{
    float x,y;

   float SIZE = 10;
   float angle = .9;//PI/4;
   
   
   void draw(){
//     angle+=.01;
    // angle = mouseX / 250.0;
     noStroke();
    // println(angle);
     pushMatrix();
     translate(x,y);
     
      beginShape();
      vertex(cos(angle) * SIZE, sin(angle)*SIZE);
      vertex(cos(angle + TWO_PI*.4) * SIZE, sin(angle+ TWO_PI*.4)*SIZE);
      vertex(cos(angle + TWO_PI*.8) * SIZE, sin(angle+ TWO_PI*.8)*SIZE);
      vertex(cos(angle + TWO_PI*.2) * SIZE, sin(angle+ TWO_PI*.2)*SIZE);
      vertex(cos(angle + TWO_PI*.6) * SIZE, sin(angle+ TWO_PI*.6)*SIZE);


endShape(CLOSE);
popMatrix();
   } 
}


