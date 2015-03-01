
//|||||||||||||||||||||||||||||||||||||\\
//||                                 ||\\
//||  Sunil vallu                    ||\\
//||  New Media Design               ||\\ 
//||  National Institute Of Design   ||\\
//||                                 ||\\
//|||||||||||||||||||||||||||||||||||||\\
 
 
float w = 80;
float h = 0.5 * sqrt(3) * w;
float t = 0.0;
float inc = 0.01;
void setup(){
  size(320,480);
  background(255);
  smooth();
 
}
 
void draw(){
  /// for color
  float c = noise(t)*width/2;
  t += inc;
  noStroke();
  colorMode(HSB);
  fill(c,255,random(255));
  /// for beginning row 
  for(float x = 0; x<=width; x+=w)
    for(float y = 0; y<=height; y+=h*2)
      if(mouseX > x-w/2 && mouseX <= x+w/2)
        if(mouseY >= y && mouseY <= y+h)
          triangle(x,y,x-w/2,y+h,x+w/2,y+h);
  /// for shifted row
  for(float x = -w/2; x<=width; x+=w)
    for(float y = h; y<=height; y+=h*2)
      if(mouseX > x-w/2 && mouseX <= x+w/2)
        if(mouseY >= y && mouseY <= y+h)
          triangle(x,y,x-w/2,y+h,x+w/2,y+h);
  /// for inverted beginning row 
  for(float x = 0; x<=width; x+=w)
    for(float y = 0; y<=height; y+=h*2)
      if(mouseX > x && mouseX <= x+w)
        if(mouseY >= y && mouseY <= y+h)
          triangle(x,y,x+w,y,x+w/2,y+h);
 
  /// for inverted shifted row 
  for(float x = -w/2; x<=width; x+=w)
    for(float y = h; y<=height; y+=h*2)
      if(mouseX > x && mouseX <= x+w)
        if(mouseY >= y && mouseY <= y+h)
          triangle(x,y,x+w,y,x+w/2,y+h);
 
}
