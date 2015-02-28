
float randomcolor=255;
float randomred=255;
float randomgreen=255;
float randomsize=5;
boolean grow=false;

void setup() {
  background(100);
  size(1800,1000);
}

void draw () {
  strokeCap(ROUND);
  line(355,400,800,35);
  line(600,100,375,450);
  line(375,450,825,450);
  line(825,450,600,100);
  strokeWeight(30);
  strokeCap(ROUND);
  stroke(225,255,255,20);
  line(0,400,mouseX,mouseY);
  
  stroke(255,0,0,20);
  strokeWeight(10);
  strokeCap(SQUARE);
  line(675,200,mouseX,mouseY);
  
  stroke(255,140,0,20);
  strokeWeight(10);
  strokeCap(SQUARE);
  line(680,210,mouseX,mouseY);
  
  stroke(255,255,0,20);
  strokeWeight(10);
  strokeCap(SQUARE);
  line(685,220,mouseX,mouseY);
  
  stroke(0,255,0,20);
  strokeWeight(10);
  strokeCap(SQUARE);
  line(690,230,mouseX,mouseY);
  
  stroke(0,0,255,20);
  strokeWeight(10);
  strokeCap(SQUARE);
  line(695,240,mouseX,mouseY);
  
  stroke(139,0,139,20);
  strokeWeight(10);
  strokeCap(SQUARE);
  line(1000,250,mouseX,mouseY);
  
  randomsize=random(70);
  randomcolor=int (random(255));
  randomred=int (random(255));
  randomgreen=int (random(255));
  fill (randomred,randomgreen,randomcolor,100);
  if(mousePressed) {
    
    triangle(600,100,375,450,825,450);
    ellipse(mouseX,mouseY,40,40);
  }
  
  if(grow==true){
    if (randomsize <100){
      randomsize++;
    }
    else{
      randomsize=0;
    }
  }
}

void mouseClicked(){
  grow=!grow;
}
