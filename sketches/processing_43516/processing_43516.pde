
// reduce each color component in an image to a specified number

class ColorReduction{
  
  public ColorReduction(){}
  
  public PImage getReducedImage(PImage img, int num_clrs)
  {
    if(num_clrs<2) num_clrs = 2; // no division by 1 or zero
    PImage buf = createImage( img.width, img.height,ARGB);
    float range = 255.0/num_clrs;
    //println(range);
    img.loadPixels();
    buf.loadPixels();
    for(int i=0;i<buf.pixels.length;i++){
      color c = img.pixels[i];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float step_r = ceil(r/range);
      float step_g = ceil(g/range);
      float step_b = ceil(b/range);
      color nc = color(step_r*range,step_g*range,step_b*range);
      buf.pixels[i] = nc;
    }
    buf.updatePixels();
    img.updatePixels();
    return buf;
  }
}

