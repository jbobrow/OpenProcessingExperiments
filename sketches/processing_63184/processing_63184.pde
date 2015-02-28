
//knots weave v3
void setup() {
  size(920,1080);
  background(255);
  smooth();
  
  strokeWeight(3);
  
  }
    
    void draw() {
    stroke(map(5*int(frameCount/width),0,height,0,125));
    
    for (int k = 0;k<1100;k++){
      frameCount++;
      fill(255,0,0);
point(frameCount%width,5*int(frameCount/width) + sin((frameCount%width + int(frameCount/width))/10.0)*4 + cos((frameCount%width)/23.0)*9 + sin((frameCount%width)/18.0)*13 + sin((frameCount%width)/(48.0+frameCount/width))*3 + sin((frameCount%width)/12.4+4)*3.3);
    
    }
      }
      //===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
