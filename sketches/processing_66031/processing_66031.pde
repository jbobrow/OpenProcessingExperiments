
void setup(){
  size(400,400);
  background(255);
  smooth();
  
}

void draw(){
  //color blocs
  noStroke();
  fill(255,50,10);//red
  rect(50,50,200,200);
  rect(372,310,30,90);
  rect(250,310,132,65);
  
  fill(255,212,70,160);//yellow
  rect(250,2,130,150);
  rect(0,310,50,90);
  //black
  fill(0);
  rect(50,250,100,100);
  rect(150,350,100,25);
  //blue
  fill(0,0,255);
  rect(255,314,117,58);
  
  
  stroke(0);
  strokeWeight(6);
  strokeCap(SQUARE);
  //line horizontal
  line(0,3,400,3);
  line(6,50,375,50);
  line(8,150,50,150);
  line(250,150,375,150);
  line(50,250,375,250);
  line(5,310,400,310);
  line(50,350,250,350);
  line(150,375,375,375);
  //line vertical
  line(50,50,50,385);
  line(80,15,80,50);
  line(375,15,375,395);
  line(397,0,397,400);
  line(150,250,150,394);
  line(250,6,250,378);
  line(312,150,312,250);
}

