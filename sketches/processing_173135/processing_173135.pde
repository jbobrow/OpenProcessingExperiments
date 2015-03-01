
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];
float up = 100;

void setup() {
  size(500, 500);
  
  colorMode(HSB, width, height, 100);
  
  
  
int g =0;
 while (g>20) {
  stroke(225);
  rect(30,g,80,g);
     g=g+5;
 
    
  }
}

void draw() {
  background(random(225),random(225),random(225));
   
  

  
   float r1 = map(mouseX,mouseY, width, 0, height);
  float r2 = height-r1;

  
  fill(0,150,200);
  ellipse(width/2 + r1/2, height/2, r1,r1 );
  
  fill(220,0,50);
  ellipse(width/2 - r2/2, height/2, r2, r2);

  
  
  int move = frameCount % num;
  mx[move] = mouseX;
  my[move] = mouseY;
  
  for (int i = 0; i < num; i++) {
  
    int trail = (move+1 + i) % num;
    
    ellipse(mx[trail], my[trail], i, i);
    
  }




   
}

