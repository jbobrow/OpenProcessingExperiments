
void setup () {
  size(800,800);
  background(#556B2F);

}
void draw () {
   background(	#EEEEE0);
    int x=mouseX;
  int y=mouseY;
  noStroke();
  smooth();
  fill(#7D9EC0,y*.2);
  rect(x,300,200,200);
  fill(	#C67171,y*.2);
  rect(x,x,200,200);
  fill(	#71C671,y*.2);
  rect(x,-x+600,200,200);
}

