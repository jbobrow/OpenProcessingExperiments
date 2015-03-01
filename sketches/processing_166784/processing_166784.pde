
PImage img;
int w, h;
int num=1;
void setup(){
  img = loadImage("http://i133.photobucket.com/albums/q59/jfulkerson0032/11/tv-set-fuzzy-yeeessso.gif");
  w = img.width * 2;
  h = img.height * 2;
  size(1600,1224);
  //size((int)w*2,(int)h*2);
  background(0);
  colorMode(HSB,360,100,100);
  
}

void draw(){
  for(float y=0; y<height; y+=(h/num)){
      for(float x=0; x<width; x+=(w/num)){
        image(img,x,y,(w/num),(h/num));
        tint(random(0,360),65,255);
        
      }
  }
  

}

void mousePressed(){
  if(num<1) return;
  num++;
  //background(0);
}
