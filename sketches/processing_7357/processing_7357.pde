

//|||||||||||||||||||||||||||||||||||||\\
//||                                 ||\\
//||  Sunil vallu                    ||\\
//||  New Media Design               ||\\  
//||  National Institute Of Design   ||\\
//||                                 ||\\
//|||||||||||||||||||||||||||||||||||||\\


int w = 60;
int h = 60;
float t = 0.0;
float inc = 0.01;
void setup(){
  size(1000,500);
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
  for(int x = 0; x<=width; x+=w)
    for(int y = 0; y<=height; y+=h*2)
      if(mouseX > x-w/2 && mouseX <= x+w/2)
        if(mouseY >= y && mouseY <= y+h)
          triangle(x,y,x-w/2,y+h,x+w/2,y+h);
  /// for shifted row
  for(int x = -w/2; x<=width; x+=w)
    for(int y = h; y<=height; y+=h*2)
      if(mouseX > x-w/2 && mouseX <= x+w/2)
        if(mouseY >= y && mouseY <= y+h)
          triangle(x,y,x-w/2,y+h,x+w/2,y+h);
  /// for inverted beginning row  
  for(int x = 0; x<=width; x+=w)
    for(int y = 0; y<=height; y+=h*2)
      if(mouseX > x && mouseX <= x+w)
        if(mouseY >= y && mouseY <= y+h)
          triangle(x,y,x+w,y,x+w/2,y+h);

  /// for inverted shifted row  
  for(int x = -w/2; x<=width; x+=w)
    for(int y = h; y<=height; y+=h*2)
      if(mouseX > x && mouseX <= x+w)
        if(mouseY >= y && mouseY <= y+h)
          triangle(x,y,x+w,y,x+w/2,y+h);

}












