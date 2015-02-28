
public class Fuzz{
  
  private float noiseX, noiseY, prevX, prevY;
  private final float inc = 0.005;
  private final int hairLength = 4;
  private color c;
  
  Fuzz(float _x, float _y, color _c){
    noiseX = _x;
    noiseY = _y;
    
    //prevX = noise(noiseX) * width;
    //prevY = noise(noiseY) * height;
    prevX = noiseIt(noiseX, width);
    prevY = noiseIt(noiseY, height);
    
    noiseX += inc;
    noiseY += inc;
    
    c = _c;
  } 
  
  public void step(){
    float x = noiseIt(noiseX, width);
    float y = noiseIt(noiseY, height);
    
    stroke(c, 50);
    strokeWeight(2);
    //point(x,y);
    line(prevX, prevY, x, y);
    
    makeHair(x, y, width, height);
    
    prevX = x;
    prevY = y;
    
    noiseX += inc;
    noiseY += inc;
  }
  
  private void makeHair(float _x, float _y, float _width, float _height){
    float span = (_width + _height) / 4;
    float prevHairX = _x;
    float prevHairY = _y;
    for(int i = 0; i < hairLength; i++){
      float x = noiseHair(prevHairX, span);
      float y = noiseHair(prevHairY, span);
      
      stroke(c, 25);
      strokeWeight(1);
      line(prevHairX, prevHairY, x, y);
      
      prevHairX = x;
      prevHairY = y;
      span /= 2;
    }
  }
  
  private float noiseIt(float _noise, float _span){
    float newNoise = noise(_noise) * (_span + _span / 2) - (_span / 4);
    //float newNoise = noise(_noise) * _span; // too close in to center
    return newNoise;
  }
  
  private float noiseHair(float _noise, float _span){
    float newNoise = noise(_noise) * (_span / 2) + _noise - (_span / 4);
    return newNoise;
  }
}

