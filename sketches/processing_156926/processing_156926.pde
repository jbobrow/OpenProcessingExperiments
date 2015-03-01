
int numPos = 50;
int [] x = new int [numPos];
int [] y = new int [numPos];

void setup(){
  size (900,600);
  for (int i = 0; i < x.length; i++){
  x[i] =int(random(width/30));
  y[i] =int(random(height/30));
}
}
void draw() {
  background(random(200),random(255),random(0),random(200));
   fill(random(200),random(200),random(200),random(200));
 
  for(int i = 0; i < numPos - 1; i++){
    x[i] = x[i+1];
    y[i] = y[i+1];
  }
 x[numPos-1] = mouseX;
 y[numPos-1] = mouseY;
  for(int i = 0; i < numPos; i++){
    ellipse (x[i], y[i], random(50),random(50));
    for(int j = 0; j < numPos; j++){
    ellipse (x[j], y[j], random(50),random(50));
  }
}
}
 
    
    
