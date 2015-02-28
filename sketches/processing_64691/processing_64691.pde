
// Constants instead of enum because processing doesn't support it
private static final int MODE_BlackWhite = 0;
private static final int MODE_Grey3 = 1;
private static final int MODE_Grey255 = 2;
private static final int MODE_Color8 = 3;
private static final int MODE_Color255 = 4;

// Properties that can be modified
private static final int ms_nImageSize = 16;
private static final int ms_nPixelSize = 16;
private static final int m_nColorMode = MODE_Color8;

// Private attributes
private boolean m_bInPause;
private Coordinates m_coordinates;
private Color[][] m_nPixels;

public void setup(){
  size(256, 256);
  background(0);
  noStroke();
  
  m_bInPause = false;
  m_coordinates = new Coordinates();
  m_nPixels = new Color[ms_nImageSize][ms_nImageSize];

  for (int i = 0; i < ms_nImageSize; ++i){
    for (int j = 0; j < ms_nImageSize; ++j){
      m_nPixels[i][j] = new Color();
    }
  }
}

public void draw(){
  if (!m_bInPause){
    m_coordinates.X = 0;
    m_coordinates.Y = 0;
    incrementPixel(m_coordinates);
  }
}
    
public void keyPressed(){
  if (key == 'p' || key == 'P') {
    m_bInPause = !m_bInPause;
  }
}

public void incrementPixel(Coordinates coord){
  int x = coord.X;
  int y = coord.Y;
  
  if (m_nPixels[x][y].Increment()) {
    coord.Increment();
    incrementPixel(coord);
  }
  
  fill(m_nPixels[x][y].R, m_nPixels[x][y].G, m_nPixels[x][y].B);
  rect(x * ms_nPixelSize, y * ms_nPixelSize, ms_nPixelSize, ms_nPixelSize);
}

public class Coordinates{
  public int X = 0;
  public int Y = 0;
  
  public void Increment(){
    X++;
    if (X >= ms_nImageSize){
      X = 0;
      Y = (Y + 1) % ms_nImageSize;
    }
  }
}

public class Color{
  public int R = 0;
  public int G = 0;
  public int B = 0;
  
  public boolean Increment(){
    switch(m_nColorMode){
      case MODE_BlackWhite:
      if (R == 255){
        R = G = B = 0;
        return true;
      }
      else{
        R = G = B = 255;
        return false;
      }
        
      case MODE_Grey3:
      if (R >= 255){
        R = G = B = 0;
        return true;
      }
      else{
        R = G = B = R + 128;
        return false;
      }
      
      case MODE_Grey255:
      if (R >= 255){
        R = G = B = 0;
        return true;
      }
      else{
        R = G = B = R + 1;
        return false;
      }
      
      case MODE_Color8:
      if (R >= 255){
        R = 0;
        if (G >= 255){
          G = 0;
          if (B >= 255){
            B = 0;
            return true;
          }
          else{
            B += 32;
          }
        }
        else{
          G += 32;
        }
      }
      else{
        R += 32;
      }
      return false;
        
      case MODE_Color255:
      if (R >= 255){
        R = 0;
        if (G >= 255){
          G = 0;
          if (B >= 255){
            B = 0;
            return true;
          }
          else{
            B++;
          }
        }
        else{
          G++;
        }
      }
      else{
        R++;
      }
      return false;
      
      default: return false;
    }
  }
}
