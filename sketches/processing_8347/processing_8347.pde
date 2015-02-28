
class Splooge
{
  boolean pixArr[][];
  
  float odds = .5;
  float ranMin = -10.5;
  float ranMax = 10.8;
  
  color myCol;
  
  PImage layer;
  
  Splooge(int w, int h, color col, PImage img)
  {
    myCol = col;
    pixArr = new boolean[w][h];
    layer = img;
                    
    layer.loadPixels();
    
    for(int i = 0; i < w/(w/200); i++)
      for(int j = 0; j < h/(h/200); j++)
        sploogeAdvance(i*(w/200), j*(h/200), 1, 0, 0); 

    layer.updatePixels();
    
    
    
  }
  
  PImage getBlock(int x, int y, int sze)
  {
    return layer.get(x, y, sze, sze);
  }
  
  PImage getImage()
  {
    return layer;
  }
  
  void blur()
  {
    this.layer.filter(BLUR, 1);
  }
  
  void sploogeAdvance(int xP,int yP,float colourMult, int orientation, int depth)
  {

    
    if(depth < 670)
    {
      colourMult = max(0,colourMult);
      colourMult = min(255, colourMult);
      
      pixArr[(int)xP][(int)yP] = true;   
      
      layer.pixels[(int)(((yP)*layer.width)+(xP%layer.width))] = color(red(myCol)*(colourMult/255.0), green(myCol)*(colourMult/255.0), blue(myCol)*(colourMult/255.0));
      orientation = (int)floor(random(8));
      
      try{
      if(colourMult < 254)
      {
        for(int i = orientation+1; i != orientation; i = (i+1)%8)
        {
          switch(i)
          {
            case 0:
              if(yP < layer.height-1 && !pixArr[xP][yP+1] && random(2) > odds)
                sploogeAdvance(xP, yP+1, colourMult+random(ranMin,ranMax), 0, depth+1);
              break;
              
            case 1:
              if(yP < layer.height-1 && xP > 0 && !pixArr[xP-1][yP+1] && random(2) > odds)
                sploogeAdvance(xP-1, yP+1, colourMult+random(ranMin,ranMax),1, depth+1);
              break;
              
            case 2:
              if(xP > 0 && !pixArr[xP-1][yP] && random(2) > odds)
                sploogeAdvance(xP-1, yP, colourMult+random(ranMin,ranMax),2, depth+1);
              break;
              
            case 3:
              if(xP > 0 && yP > 0 && !pixArr[xP-1][yP-1] && random(2) > odds)
                sploogeAdvance(xP-1, yP-1,  colourMult+random(ranMin,ranMax),3, depth+1);
              break;
          
            case 4:
              if(yP > 0 && !pixArr[xP][yP-1] && random(2) > odds)
                sploogeAdvance(xP, yP-1,  colourMult+random(ranMin,ranMax),4, depth+1);
              break;
              
            case 5:
              if(xP < layer.width-1 && yP > 0 && !pixArr[xP+1][yP-1] && random(2) > odds)
                sploogeAdvance(xP+1, yP-1,  colourMult+random(ranMin,ranMax),5, depth+1);
              break;
              
            case 6:
              if(xP < layer.width-1 && !pixArr[xP+1][yP] && random(2) > odds)
                sploogeAdvance(xP+1, yP,  colourMult+random(ranMin,ranMax),6, depth+1);
              break;
              
            case 7:
              if(xP < layer.width-1 && yP < layer.height-1 && !pixArr[xP+1][yP+1] && random(2) > odds)
                sploogeAdvance(xP+1, yP+1, colourMult+random(ranMin,ranMax),7, depth+1);
              break;
  
          }
        }
          
      }
      }
      catch(StackOverflowError e){}
    }
  }
  
}

