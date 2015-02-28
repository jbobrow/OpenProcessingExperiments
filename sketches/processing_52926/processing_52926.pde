
//////////////////////////////////////////////////
// Kof's XORIFIED, 2012                         //
//////////////////////////////////////////////////
PImage img;
boolean matrix[],backup[];
boolean flip = true;

int offsets[] = {1,1,1,1,1,1,1,1,1,1,1,2,3,5,5,5,5,5,5,5,5,6,8,13,23,16,3,7,3,2};
//////////////////////////////////////////////////
void setup(){
  size(300,300,P2D);
  noiseSeed(19);
  matrix = new boolean[width*height];
  backup = new boolean[width*height];
  img = loadImage("kof.png");
  for(int i = 1;i<matrix.length;i++){
    backup[i] = matrix[i] = brightness(img.pixels[i])>230?true:false;
  }
  background(12);
}
//////////////////////////////////////////////////
void draw(){
  int offset = offsets[frameCount%offsets.length];

  fastblur(g,(int)((noise(frameCount/5.0))*20.0));
  loadPixels();
  for(int i = 0 ; i < pixels.length;i++){
    matrix[i] = brightness(img.pixels[i])>=127?true:false;
    matrix[i] |= backup[i];
    matrix[i] ^= matrix[(i+offset+pixels.length)%matrix.length];
    pixels[i] += 0.5*(matrix[(i-offset+pixels.length)%matrix.length]?0xffffffff:0xff000000);
  }
  updatePixels();
  strokeWeight(5);
  stroke(0,30);
  noFill();
  rect(0,0,width,height);
}
/////////////////////////////////////////////////

