
int direction =1;
void setup(){
size(800,600);
PFont myFont;myFont = createFont("Jesse test1", width/50);textFont (myFont);textAlign(CENTER);//textMode(SHAPE);
if (direction == 0)
createimage();
if (direction == 1){
background(0);
text("Click to generate new image.", width/2, height*.45);
text("Press \"s\" to save to application directory.", width/2, height*.55);
smooth();
}
}

void draw(){}

void mouseClicked() {
direction =0;
setup();
}

void createimage(){
  background(random(0,50), random(0,50), random(0,50));
  for(int x=0; x<random(20,100); x++){
  strokeWeight(round(random(0,2)));
  stroke(random(127,255));
  fill(random(0,255), random(0,255), random(0,255), round(random(0,100)));
  quad(random(-width,width*2), random(-width,height*2), random(-width,width*2), random(-width,height*2), random(-width,width*2), random(-width,height*2), random(-width,width*2),random(-width,height*2));
  smooth();
  }
}

void keyPressed() {
  if (key == 's' || key == 'S'){
    direction=0;
    saveFrame("frame-####.tif");
  }
}

