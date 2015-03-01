
float cirWidth = 30;
float cirHeight = 30;

float ballX = 100;
float ballY = 100;
float xSpeed = 3;
float ySpeed = 5;

float radius = 30;
//int x = 250;
//int y = 100;
float radius2 = 30;

boolean changed = false;

ArrayList x = new ArrayList();
ArrayList y = new ArrayList();

Zoog[] zoogies = new Zoog[200];


void setup(){
 size(500, 500);
smooth(); 
 rectMode(CORNER);
 ellipseMode(CENTER);
 ellipseMode(RADIUS);
 for (int i = 0; i < zoogies.length; i ++ ) {
    zoogies[i] = new Zoog(random(width),random(height),30,30);
  }
}

void draw(){

  //background(255);
  
  
  
  //if(mouseX==zoogies[].x){
    //if (mouseY==zoogies[i].y){
      //zoogies[i].c=color(200,100,100,100);
    //}
  //}
  
  
  for (int i = 0; i < zoogies.length; i ++ ) {
    zoogies[i].display();
    zoogies[i].jiggle();
   
    
    }
    

  
  //will the ball hit the box?
  if(intersectsBox(ballX+xSpeed, ballY)){
    xSpeed *= -1;
  }
  //will the ball leave the screen?
  else if(ballX+xSpeed < 0 || ballX+xSpeed > width){
    xSpeed *= -1;
  }

  //will the ball hit the box?
  if(intersectsBox(ballX, ballY+ySpeed)){
    ySpeed *= -1;
  }
  //will the ball leave the screen?
  else if(ballY+ySpeed < 0 || ballY+ySpeed > height){
    ySpeed *= -1;
  }

  ballX += xSpeed;
  ballY += ySpeed;
  fill(255,100,100,200);
  ellipse(ballX, ballY, radius, radius);
  fill(100,255,100,200);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, cirWidth, cirHeight);
   if ( dist(mouseX, mouseY,cirWidth, cirHeight ) < radius2){
    fill(255,20,0);
  }
  
  drawSpline(x,y);
  
  // randomize
  for(int i=0; i<x.size(); i++){
    float x0 = ((Float)x.get(i)).floatValue();
    float y0 = ((Float)y.get(i)).floatValue();
    
    x.set(i, new Float(x0 + random(2.0)-1.0));
    y.set(i, new Float(y0 + random(2.0)-1.0));
    
  }

 

}


boolean intersectsBox(float x, float y){
  if(x > mouseX && x < mouseX + cirWidth){
  if(y > mouseY && y < mouseY + cirHeight){
    return true;
   } 
  }

  return false;
  
}
void mouseMoved() {
 
  
  
  
}

void mousePressed(){
  x.add(new Float(mouseX));
  y.add(new Float(mouseY));
  
  changed = true;
  
  background(random(255),random(255),random(100),50);
  
  
}

void keyPressed(){
  if(x.size()<1) return;
  
  x.remove(x.size()-1);
  y.remove(y.size()-1);
  
  changed = true;
}

void drawSpline(ArrayList x, ArrayList y){
  int s = x.size();
  float[] mx = new float[s];
  float[] my = new float[s];
  
  for(int i=0; i<s; i++){
    mx[i] = ((Float)x.get(i)).floatValue();
    my[i] = ((Float)y.get(i)).floatValue();
  }
  
  drawSpline(mx,my);
}

void drawSpline(float[] x, float[] y)
{
  if(x.length<1) return;
  
  Spline xs, ys;
  xs = new Spline(x);
  ys = new Spline(y);
  
  stroke(0);
  noFill();
  beginShape();
  
  for(float t=0.0; t<=x.length-1; t += 0.01){
    vertex(xs.calc(t), ys.calc(t));
    //point(xs.calc(t), ys.calc(t));
  }
  
  endShape();
  
  noStroke();
  fill(255,0,0);
  ellipseMode(CENTER);
  
  for(int i=0; i<x.length; i++){
    ellipse(x[i],y[i],4,4);
  }
}

class Spline
{
  int n;
  float[] a, b, c, d;
  float[] x;
  
  Spline(float[] sp)
  {
    float[] w;
    float tmp;
    n = sp.length;
    
    a = new float[n];
    b = new float[n];
    c = new float[n];
    d = new float[n];
    w = new float[n];
    
    for(int i=0; i<n; i++){
      a[i] = sp[i];
    }
    
    c[0] = 0.0;
    c[n-1] = 0.0;
    
    for(int i=1; i<n-1; i++){
      c[i] = 3.0 * (a[i-1] - 2.0*a[i] + a[i+1]);
    }
    
    w[0] = 0.0;
    for(int i=1; i<n-1; i++){
      tmp = 4.0 - w[i-1];
      c[i] = (c[i] - c[i-1])/tmp;
      w[i] = 1.0 / tmp;
    }
    
    for(int i=n-2; i>0; i--){
      c[i] = c[i] - c[i+1] * w[i];
    }
    
    b[n-1] = 0.0;
    d[n-1] = 0.0;
    
    for(int i=0; i<n-1; i++){
      d[i] = (c[i+1] - c[i])/3.0;
      b[i] = a[i+1] - a[i] - c[i] - d[i];
    }
    
    /*
    for(int i=0; i<n; i++){
      print("[" + i + "] ");
      println("a:" + a[i] + " b:" + b[i] + " c:" + c[i] + " d:" + d[i]); 
    }
    println();
    */
    
  }
  
  float calc(float t)
  {
    int j;
    float dt;
    
    j = floor(t);
    
    if(j<0) j=0;
    else if(j>n) j=n;
   
    dt = t - (float)j; 
    return a[j] + (b[j] + (c[j] + d[j]*dt)*dt)*dt;
  }
}
class Zoog {
  
  float x,y,w,h;
  color c = color(100,100,255,50);

  
  Zoog(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;

  }
  
  
  void jiggle() { 
    
    x = x + random(-1,1);
    y = y + random(-1,1);
    
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  
  void highlight() { 
    c = color(200,100,100,100);
  }
  // Display Zoog
  void display() {
    // Set ellipses and rects to CENTER mode
    ellipseMode(CENTER); 
 

    
    noStroke();
    fill(c);
    ellipse(x,y-h,w,h);
    
    if(mouseX==x){
      if(mouseY==y){
      c=color(200,100,100,100);
      }
    }
    }
    void draw(){
    }
    void mouseClicked(){
      c = color(random(360),random(360),random(360),50);
    }
  
  
  boolean intersectsMs(float x, float y){
  if(x > mouseX && x < mouseX + cirWidth){
  if(y > mouseY && y < mouseY + cirHeight){
    return true;
   } 
  }

  return false;
  
}


}



