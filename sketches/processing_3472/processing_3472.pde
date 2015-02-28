
void setup(){size(256,256);}void draw(){for(int i=0;i<width;i++)for(int j=0;j<height;j++){stroke(mouseY%255,mouseX%255,mouseY%255);point(random(i),random(j));}}

