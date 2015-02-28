
float n = 3;
float h = 1;

void setup() {
 
  size(600, 800);
  background(0);
  
  frameRate(5);
    
}

void draw() {
   
  backGround();
  
  Collatz(n);
  
  if(keyPressed) {
    keyPressed();
  }
  
  println("n = " + n);
  
  n++;
  
}

void Collatz(float n) {
  
  int f = 0;
  float m = 0;
  float high = 0;
  
  while(n > h) {
    
    m = n;
    
    stroke(n, 255, 255);
  
    if(n%2 == 0) {
      n = n/2;
      //point(f,height - n);
      f+=5;
      
      line(f+9,height - m - 10, f+10,height - n - 10);
      
    }
    else {
      n = 3*n + 1;
      //point(f,height - n);
      f+=5;
      
      line(f+9,height - m - 10, f+10,height - n - 10);
      
    }
    if(n > high) high = n;
    if(n < h) noLoop();
  }
  
  stroke(255);
  line(10,0,10,height-10);
  line(10,height - 10, width, height - 10);
  
  println("length = " + f);
  println("high = " + high);
  
}

void backGround() {
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
}

void keyPressed() {
  
  if(key == CODED) {
    if(keyCode == UP) {
      n++;
      keyCode = LEFT;
    }
    if(keyCode== DOWN) {
      n--;
      keyCode = RIGHT;
    }
  }
}

