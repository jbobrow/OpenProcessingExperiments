
void setup() {
  
  
  size(500, 500, P2D);
  smooth();
  background(0);
 
}

int x = 0;
int y = 0;
int s = 10;
int i = 0;
int j = 0;

void draw() {
   
  noStroke();
  noFill();
  strokeWeight(10);
  stroke(0, 5);
  
  if(mousePressed) { 
    
    x = round(random(10, 490));
    y = round(random(10, 490));
    s = round(random(10, 20));
    
    noStroke();
    fill(255, 25);
    strokeWeight(s);
    
    //rect(round(x), round(y), round(50 + (x/20)), round(50 + (x/20)));
    
    if(j == 5) {
      
      fill (0, 10);
      noStroke();
      rect(0, 0, 500, 500);
      j = 0;
      
    } else { j = j + 1; }
    
    // bezier(x, y, random(x), random(y), random(y), random(x), random(x),random(y));
    
    ellipse(250,250,random(x),random(y));    
 
  } else { 
  
    x = round(random(10, 490));
    y = round(random(10, 490));
    s = round(random(3));
    
    noFill();
    stroke(255, 25);
    strokeWeight(s);
    
    //rect(round(x), round(y), round(50 + (x/20)), round(50 + (x/20)));
    
    strokeCap(ROUND);
    strokeJoin(ROUND);
    
    if(j == 5) {
      
      fill (0, 10);
      noStroke();
      rect(0, 0, 500, 500);
      j = 0;
      
    } else { j = j + 1; }
    
    // bezier(x, y, random(x), random(y), random(y), random(x), random(x),random(y));
  
    int a = round(random(x));
    int b = round(random(y));
  
    rect((250-round(a/2)),(250-round(b/2)),a,b);
  
  }
  
}

