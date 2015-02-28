
int s = 20;
void setup () {
  size (500,500);
  background(30,50,14);
  strokeWeight(4);
}

void draw () {
   frameRate(s);
  translate(width/2,height/2);
  rotate(radians(frameCount%(180)));
  fill(255,255,255);
  quad(0,250,250,0,0,-250,-250,0);
  rotate(radians(frameCount%(180)));
  fill(220,220,220);
  quad(125,125,-125,125,-125,-125,125,-125);
   rotate(radians(frameCount%(180)));
   fill(180,180,180);
  quad(125,0,0,125,-125,0,0,-125);
   rotate(radians(frameCount%(180)));
  fill(140,140,140);
  quad(125/2,125/2,-125/2,125/2,-125/2,-125/2,125/2,-125/2);
   rotate(radians(frameCount%(180)));
  fill(80,80,80);
  quad(125/2,0,0,125/2,-125/2,0,0,-125/2);
   rotate(radians(frameCount%(180)));
  fill(40,40,40);
  quad(125/4,125/4,-125/4,125/4,-125/4,-125/4,125/4,-125/4);
   rotate(radians(frameCount%(180)));
  fill(0,0,0);
  quad(125/4,0,0,125/4,-125/4,0,0,-125/4);
}
void keyPressed(){
  if(key == CODED){
    if (keyCode == UP){
      s=s+5;
      s=min(s,100);
    }
    if (keyCode == DOWN){
      s=s-5;
      s=max(s,1);
    }}}

