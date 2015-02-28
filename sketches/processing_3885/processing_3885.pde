
PImage m;
int x,y;
float r,g,b,vrang,vgang,vbang,vel;
float blr=0.5;
float rang = random(0,TWO_PI);
float gang = rang - random(PI/3, PI);
float bang = rang + random(PI/3, PI);

void setup() {
  size(200,200);
  frameRate(20);
  smooth();
  background(0);
  int imgno = int(random(2,6));
  String img = imgno+".jpg";
  println(imgno+", "+img);
  m=loadImage(img);
  for(int i=0;i<m.pixels.length;i++){
    x=i%200;
    y=i/200;
    set(x,y,m.pixels[i]);
  }
}

void draw() {
  fill(0,1);
  rect(0,0,width,height);
  for(int i=0;i<width*height;i++){
    x=i%width;
    y=i/height;
    r=red(get(x,y));
    g=green(get(x,y));
    b=blue(get(x,y));

    if((r>g)&&(r>b)){

      vel=r/255;
      vrang = rang/vel;
      x+=cos(vrang)+vel;
      y+=sin(vrang)+vel;
      //println(rang+", "+cos(rang)+","+sin(rang));
    }
    else if((g>r)&&(g>b)){
      vel=g/255;
      vgang= gang/vel;
      x+=cos(vgang)+vel;
      y+=sin(vgang)+vel;
    }
    else if((b>r)&&(b>g)){
      vel = b/255;
      vbang=bang/vel;
      x+=cos(vbang)+vel;
      y+=sin(vbang)+vel;
    }
    x+=random(-2,2);
    y+=random(-2,2);
    set(x,y,color(r,g,b));
  }
  if(blr<0.6){
    blr+=0.001; 
  }
   filter(BLUR,blr);

}




