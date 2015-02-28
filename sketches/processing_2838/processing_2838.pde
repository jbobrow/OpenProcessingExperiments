
// Conic Colours by Charles Morrice
// Playing with colours ...
// iso-coloured regions have constant ratio of distance from midpoint line to mouse location.
// can you spot the parabola's, hyperbola's and ellipses?
// I can't find a circle ... the point / line required for that must be outside the plane.
// but the 'pair of lines' is there!



float dpoint;
float dline;
int colourxy;

void setup()
{
  size(400,400);
  colorMode(HSB,360,100,100,100);
}
void draw()
{
  loadPixels();
  for (int x=1;x<width;x=x+1){
    for (int y=1;y<height;y=y+1){
      dline=sqrt(sq(height/2-y));                        //calculate distance to fixed line (horizontal division)
      dpoint=sqrt(sq(x-pmouseX)+sq(y-pmouseY));          //calculate distance to fixed point (mouse location)
      float ratio=dline/dpoint;                          //ratio of distance to line/distance to point
      colourxy = color(int(ratio*360)%360,100,100,100);  //calculates colour on scale 1-360 (fneeds to work for rations both < and > 1)
      pixels[(y-1)*width+x]=colourxy;                    //sets pixel colour
    }
  }
  updatePixels();
  loop();
}

