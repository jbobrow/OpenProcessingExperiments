
boolean changed = false;

ArrayList x = new ArrayList();
ArrayList y = new ArrayList();

void setup()
{
  size(400,400);
  background(255);
  smooth();
  
  fill(0);
  text("[CLICK] add,  [ANY KEY] delete",20,20);
}

void draw(){
  background(255);
  fill(0);
  text("[CLICK] add,  [ANY KEY] delete",20,20);
  drawSpline(x,y);
  
  // randomize
  for(int i=0; i<x.size(); i++){
    float x0 = ((Float)x.get(i)).floatValue();
    float y0 = ((Float)y.get(i)).floatValue();
    
    x.set(i, new Float(x0 + random(2.0)-1.0));
    y.set(i, new Float(y0 + random(2.0)-1.0));
    
  }
  
}

void mousePressed(){
  x.add(new Float(mouseX));
  y.add(new Float(mouseY));
  
  changed = true;
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

