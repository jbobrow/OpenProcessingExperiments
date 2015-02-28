
class HeightmapGenerator
{
  private float _heightmap[][];
  private int _size;
  private float _noise_scale;
  
  public HeightmapGenerator(String filename)
  {;

    PImage img=loadImage(filename); 
    img.loadPixels(); 
    
    // Generate a perlins noise height field using s as as the size
    _heightmap = new float[img.width][img.height];
    
    for(int y = 0 ; y < img.height; y++)
    {
      for( int x = 0; x < img.width; x++)
      {
        color col = img.pixels[img.width*y+x];
        float v  = (red(col)*green(col)*blue(col))/(255*255*255);
        _heightmap[x][y] = v;
      }
      
    } 
    
  }
  
  // Get the size of the heightmaps wiudth ( this is the same as the height - as its square homeboi )
  public float[][] GetHeightMap()
  {
    return _heightmap;
  }
  
  // Returns the width of the heightmap, which happens to be the same as its height.. cool huh?
  public int[] getSize()
  {
    int[] ret = new int[2];
    ret[0] = _heightmap[0].length;
    ret[1] = _heightmap[1].length;
    return ret;
  }
  

  
}

