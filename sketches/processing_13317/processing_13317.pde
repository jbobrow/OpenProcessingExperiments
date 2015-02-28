
class HeightmapGenerator
{
  private float _heightmap[][];
  private int _size;
  private float _noise_scale;
  
  public HeightmapGenerator(int s)
  {

    
    noiseDetail(4);
    //noiseSeed(40200);
    _noise_scale = 0.005f;
    
    // Generate a perlins noise height field using s as as the size
    _heightmap = new float[s][s];
    _size = s;
    
    for(int y = 0 ; y < s; y++)
    {
      for( int x = 0; x < s; x++)
      {
        float v  = noise( x*_noise_scale,y*_noise_scale );
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
  public int Size()
  {
    return _size;
  }
  

  
}

