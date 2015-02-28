
PFont f;
int x = 95;
int y = 10;
int xOffset = 200;
int xOffset2 = 315;

int w = 40;
int h = 0;
int spacing = 23;
int hr = hour();
int minutes = minute();

//int m = second();
int mh;

void setup(){
  size(480,600);
  f = loadFont("SansSerif-8.vlw");
}

void draw(){
  //int mh = constrain(h,0,25);
  //while(y<height){
  // for(int y=50; y<height; y+=25){
  background(255);
  fill(100);
  textFont(f,8);
  text("breakfast", 50, height/3);
  text("lunch", 50, height/2);
  text("dinner", 50, height-100);

  for (int i=0; i<(h/spacing)+1;i++) {

    int mh = constrain(h-(i*spacing),0,spacing);
    noStroke();
    fill(255,0,(i*(spacing+1)));
    rectMode(CORNER);
    rect(x,y + (i * (spacing+1)),w,mh);
    //pushMatrix();
    fill(100);
    text(hr,0,y+(i*(spacing+1)));
    text(":",4,y+(i*(spacing+1)));
    text(minutes, 7, y+(i*(spacing+1)));
    // popMatrix();

  }

  text("snack", 165, height-220);
  for (int i=0; i<(h/spacing)+1;i++) {

    int mh = constrain(h-(i*spacing),0,spacing);
    noStroke();
    fill((i*(spacing+1)),0,100);
    rectMode(CORNER);
    rect(xOffset,y + (i * (spacing+1)),w,mh);
 }
 
   text("happy hour",260, height-150);
   for (int i=0; i<(h/spacing)+1;i++) {

    int mh = constrain(h-(i*spacing),0,spacing);
    noStroke();
    fill(0,(i*(spacing+1)),100);
    rectMode(CORNER);
    rect(xOffset2,y + (i * (spacing+1)),w,mh);
 }
  //stroke(100);
  //line(35,0,35,height);
  /*
    noStroke();
   fill(255,0,100);
   rectMode(CORNER);
   rect(x,y+25,w,mh);
   //y = y+spacing;
   */

  h = hour() * spacing + floor(map(minute(), 0, 60, 0, spacing));//h+1;
  println(h);
  // }

}
//NEEDS A CONDITIONAL FOR Y











