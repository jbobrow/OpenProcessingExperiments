
void setup () {
  size (500, 500);
  background (247, 218, 47);
}

void draw() {
  smooth();
  stroke (4);
  
  
  fill (47, 219, 247);
  

  
    for (int i=1; i<550; i=i+100) {
    for (int a=1; a<550; a=a+150) {
    
    belly (i, a);
    }
  }
    for (int i=70; i<550; i=i+100) {
    for (int a=20; a<550; a=a+150) {
    
      eye (i, a);
      eye (i+20, a);
    }
  }
 

  for (int i=70; i<550; i=i+100) {
    for (int a=20; a<550; a=a+150) {
    
      mouth (i, a*2);
    }
  }
  
  
}

  void eye(int x, int y){
    noFill();
    ellipse (x, y, random(0,200), 60); 
    fill (86, 147, 224);
    ellipse (x, y+7, 30, 30); 
    fill(255);
    ellipse(x, y+10, 10, 10); 
  }

void belly(int x, int y){
  noFill ();
  ellipse (x,y-30, random(100,120), 120);
  fill (255);
  ellipse (x,y-10, 5, random (5, 20));
      }
      
      
void mouth (int x, int y) {
  fill (234, 75, 21);
  ellipse (x-100, y, 30, random(10, 25));
}

