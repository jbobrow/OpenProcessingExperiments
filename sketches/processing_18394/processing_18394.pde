

//----------------------------------------------------------
//     file:  PG_Scrolling_Noise_1.pde
//     date:  2010-09-21  v1.0
//            2012-10-07  v2.0
//   author:  Ing. Gerd Platl  
//  version:  tested with processing v1.5.1, v2.0a
//  purpose:  demonstrate how use the noise generation
// handling:  Use left mouse button to change resolution:
//                  mouseX = deltaX, mouseY = deltaY
//            Use right mouse button to change 'noiseDetail': 
//                  mouseX = octaves, mouseY = falloff[%]
// see also:  Book: Processing - a programming handbook 
//                  for visual designers and artists, page 131
//----------------------------------------------------------
void setup()
{
  size(480, 480);
  textSize(52);
  text ("Scrolling Noise 1",33, 55);
}

float deltax = 0.01;
float deltay = 0.01;
float xnoise = 0.0;
float ynoise = 0.0;
// draw a noise line and scroll one line down
void draw()
{
  xnoise = deltax*width/2;
  for (int x = 0; x < width; x++) 
  { stroke (noise(xnoise, ynoise   ) * 255
           ,noise(xnoise, ynoise-7 ) * 255
           ,noise(xnoise, ynoise-17) * 255);
    point(x, 0);
    xnoise = xnoise + deltax;
  }
  ynoise = ynoise - deltay;
  // scroll down one line
  copy (0,0, width,height-1, 0,1,width,height-1);
}
void mousePressed() { handleMouse(); }
void mouseDragged() { handleMouse(); }
void handleMouse()
{
  int octaves = 1+mouseX*7/width;
  float falloff =  float(mouseY)/height;
  println("  dx=" + nf(deltax,1,3) + "  dy=" + nf(deltay,1,3)
         +"  octaves="+octaves+"  falloff="+nf(falloff,0,2)+"%");
  if (mouseButton == LEFT)
  {
    deltax = 0.01 + 0.1 * mouseX / width;
    deltay = 0.01 + 0.1 * mouseY / height;
  }
  else noiseDetail(octaves,falloff);
}

