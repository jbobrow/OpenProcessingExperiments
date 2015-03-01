
ArrayList<blip> blist = new ArrayList<blip>();
public float d = 0;
void setup(){
  size(1300,700);
  noStroke();
}
void draw(){
  for(int xe = 0; xe < 13; xe++){
    for(int ye = 0; ye < 7; ye++){
      noStroke();
      fill(color(random(0,255), random(0,255), random(0,255)));
      rect(xe*100, ye*100, 100, 100);
    }
  }
  for(int i = 0; i < blist.size(); i++){
    fill(blist.get(i).c);
    //stroke(0);
    //fill(color(random(0,255), random(0,255), random(0,255)));
   blist.get(i).drawblip(); 
  }
  if(mousePressed && dist(mouseY, mouseX, pmouseY, pmouseX) > 3){
   blist.add(new blip(mouseX, mouseY, color(random(0,255), random(0,255), random(0,255)))); 
  }
  d+=radians(2);
}


class blip{
  int x;
  int y;
  color c;
 blip(int xt, int yt, color cx){
  x=xt;
  y=yt;
  c=cx;
 }
void drawblip(){
 ellipse(x, y, 30,30);
 ellipse(x+sin(d)*25, y+cos(d)*25, 20,20);
 ellipse(x+sin(d+radians(90))*25, y+cos(d+radians(90))*25, 20,20);
 ellipse(x+sin(d+radians(180))*25, y+cos(d+radians(180))*25, 20,20);
 ellipse(x+sin(d+radians(270))*25, y+cos(d+radians(270))*25, 20,20);
} 
}
