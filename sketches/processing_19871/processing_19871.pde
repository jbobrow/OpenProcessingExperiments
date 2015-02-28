
PFont font;

void setup(){
  size(250, 250);
  font= loadFont ("Helvetica-Bold-48.vlw");
  textFont(font);
  smooth();
  textAlign(CENTER);
  textSize(15);
  frameRate(120);

}
int novia=0;
void draw(){
  background(0);//bkg needs to be set here because need to repetition black at each frame
  fill(novia,width,width); /// creating movement by setting x and y variables to the width
  fill(random(255), random(23), random(243));// colour set(random=rainbowish_
  text("L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2",0,90,novia,novia);
  novia++;//the text "L5v2m2" starting at coordinates (0,0), and increasing variable by one "++"
  text("L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2",0,0,novia,novia);
  novia++; //2
    text("L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2L5V2M2",0,125,novia,novia);
  novia++;//3
}


