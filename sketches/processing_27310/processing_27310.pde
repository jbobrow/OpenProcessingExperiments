
int stepsize = 8;
int blocksize = 50;
float Xcord = 0.0;
float Ycord = 0.0;
color c1 = #000000;


void setup(){
  size (450,550);
  strokeWeight (0);
  stroke(0,0);
  fill(0);
  colorMode(RGB,stepsize*1);
  for (int x = 0;x <= width/blocksize;x++){
    for (int y = 0;y <= ((height-150)/blocksize);y++){
      fill(x,y,stepsize - float(x+y)/2);
      rect(blocksize*x,blocksize*y,blocksize,blocksize);
    }  
  }
  colorMode(RGB,255);
}

void draw(){

  loadPixels();
  Xcord = mouseX;
  Ycord = mouseY;
  c1 = get(mouseX,mouseY);
  String[] C1 = new String[3];

  C1[0]= nf(red(c1),3,0);
  C1[1] = nf(green(c1),3,0);
  C1[2] = nf(blue(c1),3,0);
  fill(0);
  rect(0,height-100,width,height);
  fill (255);
PFont font;
font = loadFont("LucidaSans-20.vlw"); 
textFont(font); 
text("Mouse over the blocks to obtain their RGB values:", 15, height-90, width-20, width-15);
text(join(C1,","), 15, height-30, width-20, width-15);
  println();



}











