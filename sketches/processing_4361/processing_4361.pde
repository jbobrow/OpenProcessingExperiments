
PImage p,rp;
int ratioW = 20; 
int ratioH;// is calculed based on the image ratio and  ratioW
boolean useRect = true;
 
void setup()
{

 p = loadImage("Mona_Lisa.jpg");
 size(p.width,p.height);
 
 float imgRatio = float(height) / float(width);
 ratioH = round (ratioW * imgRatio);
 
 image(p, 0, 0);
      
 pixelate(ratioW, ratioH);
 
}
 
public void pixelate(int rW, int rH)
{
//int cubeSize = 20; // in pixels
 rp = p;
 rp.resize(rW, rH);
 
for (int i=0; i<width; i+=rW)
 for (int j=0; j<height; j+=rH)
 {
   color c = avgColor(i, 
                      j, 
                      rW, 
                      rH);
 
   fill(c);
   rect(i,j,rW, rH);
   image(rp, i, j);
   blendColor(i,j,rW,rH,c);

   
 }
 
 
}
 
 
void draw()
{
 
}


/**
 * blendColor: each pixel of quad (x,y,w,h) is melted
 * based on the color m. 
 * The melting process is just the average between the components RGB.
 */
public void blendColor(int x, int y, int w, int h, color m)
{
 
 int cR=0, cG=0, cB=0;
 
 for (int i=x; i<x+w; i++)
  for (int j=y; j<y+h; j++)
  {
   color c=  get(i,j);
   cR += ((c >> 16) & 0xFF) + ((m >> 16) & 0xFF);  
   cG += ((c >> 8) & 0xFF) + ((m >> 8) & 0xFF);   
   cB += (c & 0xFF) + (m & 0xFF);          
   cR /=  2;
   cG /=  2;
   cB /=  2;

    // the -50 is becouse my photo has too many light
    // it will be cool to try another avg function like 
    //something involving squares :)
   set(i,j, color(cR-50,cG-50,cB-50));
  
  }
 

 
}


/**
 * For a quad (x,y,w,h) the average color is calculated
 * for each component
 */
public color avgColor(int x, int y, int w, int h)
{
 
 int cR=0, cG=0, cB=0;
 
 for (int i=x; i<x+w; i++)
  for (int j=y; j<y+h; j++)
  {
   color c=  get(i,j);
   cR += (c >> 16) & 0xFF;  
   cG += (c >> 8) & 0xFF;   
   cB += c & 0xFF;          
  }
 
 cR /=  w*h;
 cG /=  w*h;
 cB /=  w*h;
 
 return color(cR,cG,cB);
 
}
 

void keyPressed(){
  
  if (key == 'z') {
    image(p, 0, 0);
    ratioW++;
    setup();
  } else 
    if (key == 'x') {
    image(p, 0, 0);
    ratioW--;
    setup();

  } else 
    if (key == 's') { 	
      save("snapshot.jpg");
    }
} 
 
 
 

