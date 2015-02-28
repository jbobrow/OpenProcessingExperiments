
//sketch by _ks
//more weird stuff...changing of val just makes weird useless shapes
int val = 100;
int[] x = new int[val];
int[] y = new int[val];


void setup () {
  size (700,400);
  colorMode (HSB);
  background(255);
  noFill();
  
  
  for (int i = 0; i < val; i++){
   x[i] =  i * (width/val);
   y[i] = i * (height/val);
  }
  

}

void draw (){

  int mX = mouseX;
  int mY = mouseY;
  
  for (int i = 0; i < val; i++){
    
    float dia = dist(mX, mY, x[i], y[i]);
    
    float r = random (0,100);
    int rZ = round (r);
    fill(300-r,80+r,80+r, i*2);
    
  ellipse (x[i], height/2, dia, dia);
  ellipse (width/2, y[i], dia, dia);
   
  }
  
}

