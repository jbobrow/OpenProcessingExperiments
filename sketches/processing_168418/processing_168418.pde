
//version2 map(value, start1, stop1, start2, stop2)

float y = 0;
float mapx = 0;
float mapy = 0;

void setup(){
size (300,300);
background (0);
strokeWeight(2);

}

void draw (){
   float r=random(255);
  float g=random(255);
  float b=random(255);
  stroke(r,g,b);
  
for (float x=-1; x <1; x=x+.01){
  y = 1-pow(x,4);
  mapx=map(x, -1, 1, 0, width);
  mapy=map(y, -1, 1, height, 0);

  point (mapx,mapy);
  for (float i=0; i<300; i=i+.05){
    point (mapx,mapy/i);
  }
   
}
}


