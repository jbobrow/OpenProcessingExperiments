
//draws that wicked cool fractal
void setup(){
  size(300, 300);
  background(255, 255, 255);
}

void draw() {
  
  for (int x = 0; x < width; x++ ) {
    for (int y = 0; y < height; y++ ) {
      loadPixels();
      // Calculate the 1D pixel location
      int loc = x + y*width;
       
      if(complexAbsSquared(zfunc(20, getComplex(x, y))) < 5){
        float r, g, b;
        r = random(0, 255);
        g = random(0, 255);
        b = random(0, 255);
        color c = color(r,g,b);
        pixels[loc] = c;
        updatePixels(); 
      }  
    }
  }  
}

float complexAbsSquared(complex c){
  return c.x*c.x + c.y*c.y;
}




complex getComplex(float x, float y){
  complex poi = new complex((x/100) - 2.3, (y/100) - 1.5);
  return poi;  
}

complex zfunc(int d, complex c){
  if(d == 0)
    return new complex(0, 0);
  else{
    return complexAdd(complexSquare(zfunc(d-1, c)),c);
  }  
}

complex complexAdd(complex c1, complex c2){
   return new complex(c1.x + c2.x, c1.y + c2.y); 
}

complex complexSquare(complex c){
  return new complex(c.x*c.x - c.y*c.y, 2*c.x*c.y);  
}

public class complex{
  public float x, y;
  public complex(float x, float y){
    this.x = x;
    this.y = y;
  } 
}

