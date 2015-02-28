
PImage imag;
void setup(){
size(1600,600);
 
imag=loadImage("hl.jpg");
 image(imag,0,0);
}
 
void draw(){
  for(int x=0;x<imag.width;x++){
  for(int y=0;y<imag.height;y++){
  color este;
  este=imag.get(x+int(random(0,100)), y+int(random(100,0))
  );
  set(x+700,y,este);
  }
  }
}

