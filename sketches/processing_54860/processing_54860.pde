
void setup() {
  size(400,600);
  background(180);
  smooth();
}

void draw(){
  
  //background extras
  strokeWeight(2.5);
  line(220,140,230,80);
  line(220,140,300,60);
  line(220,145,300,100);
  noStroke();
  fill(255);
  arc(300,60,7,7,0,6.28);
  stroke(0);
  strokeWeight(2.5);
  line(160,360,80,320);
  line(160,360,120,380);
  fill(255);
  noStroke();
  arc(80,320,7,7,0,6.28);
  
  //body
  strokeWeight(10);
  stroke(65);
  line(190,185,190,230); //left neckline
  line(210,185,210,250); //right neckline
  fill(255);
  noStroke();
  arc(200,150,70,70,0,6.28); //head
  fill(255);
  rect(150,230,57.5,100); //body top left white rectangle
  fill(65);
  rect(207.5,250,30,30); //body top right dark grey square
  fill(0);
  rect(190.5,280,47,50); //black square right
  rect(150,330,87.5,20); //thin rectangle black
  fill(255);
  rect(150,350,87.5,35); //white thick rectangle
  fill(65);
  arc(193.75,385,87.5,87.5,0,3.14); //semi circle bottom
  
  //extras
  arc(210,130,20,20,0,6.28); //big eye
  arc(225,145,5,5,0,6.28); //little cirlce in head
  arc(217.5,152.5,5,5,0,6.28); //little circle in head
  arc(210,160,5,5,0,6.28); //little circle in head
  for (int i=0; i<4; i++) {
    arc(160,240+10*i,5,5,0,6.28); //first line little circles body
  }
  for (int i=0; i<6; i++) {
    arc(170,260+10*i,5,5,0,6.28); //second line little circles body
    fill(0);
    rect(155,355,40,10); //long black rectangle
    rect(155,370,10,10); //small square black
    rect(170,370,10,10); //small square black
    rect(185,370,10,10); //small square black
    rect(200,370,10,10); //small square black
    rect(215,370,10,10); //small square black
    
  }
 
}

