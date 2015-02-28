
//Greg Johnson
//Letters whos height and condenced value are dictated by typographer.
//Insert a number into letterWidth & letterHeight to change letters apearence

int yleft,yright, xtop, xbottom, letterWidth, letterHeight;

void setup(){
  size(600,600);
  smooth();
}
void draw(){
 
  letterWidth=20;
  letterHeight=18;

  noFill();
  strokeWeight(50);
  
  yleft=letterWidth*10;
  yright=600-yleft;
  
  xtop=letterHeight*10;
   xbottom=600-xtop;
   
  
  beginShape();
  vertex(yleft,xbottom);
  vertex(yleft,xtop);
  vertex(300,350);
  vertex(yright,xtop);
  vertex(yright,xbottom);
  endShape();
    
  }

