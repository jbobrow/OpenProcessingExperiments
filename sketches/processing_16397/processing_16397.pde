
float a;



void setup(){
  size(1440,700);
      background(0);
      smooth();
}
  void draw(){
    
    noStroke();
    fill(255,0,0,50);
    rect(random(100,1240),random(410,110),random(5,00),random(225,130));
    rect(random(100,1240),random(100,100),random(2,00),random(125,125));
    rect(random(100,1240),random(210,210),random(5,00),random(225,225));
    frameRate(30);
    a= random(0,150);
   
  }
