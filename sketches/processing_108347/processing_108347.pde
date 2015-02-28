
void setup()
{
  int i,j;
  float v,v0,v1,v2;
  float vMin,vMax;
  size(250,250);
  background(255);
  
  loadPixels();
  
  vMin = 1000;
  vMax = 0;
  
  for(i=0;i<height;i++){
    for(j=0;j<width;j++){
      v0 = value(dist(50,50,i,j));
      v1 = value(dist(50,200,i,j));
      v2 = value(dist(50,125,i,j));
      v = v0+v1+v2;
      if(v<vMin){
        vMin = v;
      }
      if(vMax<v){
        vMax = v;
      }
      if(-3<v){
        pixels[j+i*width] = color(31*(v+0.23),31*(v+0.23),255);
        //pixels[j+i*width] = color(32*(v-290.18463));
      }
    }
  }
  updatePixels();
  print(vMin+"\t"+vMax+"\n");
}

void draw()
{
  int i,j;
  float v,v0,v1,v2;
  
  loadPixels();
  for(i=0;i<height;i++){
    for(j=0;j<width;j++){
      v0 = value(dist(125,75,j,i));
      v1 = value(dist(75,200,j,i));
      v2 = value(dist(200,200,j,i));
      v = v0+v1+v2;
      pixels[j+i*width] = color(31*(v+0.23),16*(v+0.23)+127,255);
    }
  }
  updatePixels();
}

float value(float v)
{
  float a;
  a = TWO_PI*24*v/width-0.3*frameCount;
  return (cos(a)+1)*(width-v)/width;
//  return 100*pow(2.71828182846,-1*a*a);
}
