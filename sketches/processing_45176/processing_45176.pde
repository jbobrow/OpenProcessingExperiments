
/*  i couldnt tell you the purpose of this program.
    it was in the beginning of learning and slow. it has been
    tweaked a little now, to make it look more interesting.
    
    i think it was getting a color palette from an image. 
    
    anyways..
    the image is a photograph i took myself. any derivative 
    use is applicable under the same license as this program.
    
    david kay
    cst003@gmail.com

*/
PImage img;

void setup()
{
  size(600,500);
  smooth();
  frameRate(15);
  img = loadImage("R1-06813-025A.jpg");
 }
  
  
void draw()
{
  int ix = int(random(img.width));
  int iy = int(random(img.height));
  color c = img.get(ix,iy);
  fill(c,102);
  int xgrid = int(random(-2,8)) * 75;
  int ygrid = int(random(-2,8)) * 75;
  rect(xgrid, ygrid, 60, 60);
  
}
void mousePressed(){
  noLoop();
}

void mouseReleased(){
  loop();
}


