
WorldMap wmap;
PFont medFont;
Table myTable;
void setup(){
  size(1200,800);
 wmap=new WorldMap(0,0,1200,800);
  medFont=loadFont("AppleBraille-Pinpoint6Dot-24.vlw");
    myTable=new Table("geo1.tsv");
    wmap.addAllPlaces();
    smooth();
    frameRate(30);
}

void draw(){
background(255);
  //wmap.drawBackground();
  if(mousePressed){
   wmap.updatePos(); 
  }
  if(keyPressed){
   wmap.backToMap(); 
  }
  wmap.drawMapPoints(0,0);
}

