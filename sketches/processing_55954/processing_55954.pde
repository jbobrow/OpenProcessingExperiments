
float e = 0;
float a = 0.0;
float b = 0.0;
float c = 0;
float d = 0.0;
PFont myfont;
PFont otherfont;
PFont fonnt;

void setup()
{
  size(800,500);
  textMode(CENTER);
  myfont = loadFont("CourierNewPSMT-90.vlw");
  otherfont = loadFont("Impact-90.vlw");
  fonnt = loadFont("LaoMN-Bold-90.vlw");
  frameRate(30);
 
}

void draw()
{
  
  background(255,255,255);
  
  noStroke();
  fill(70,53,142);
  rect(0,0,800,800);
    
  noStroke();
  fill(98,87,137);
  rect(0,0,800,107);
  
  noStroke();
  fill(0,3,129);
  rect(200,178,500,800);
    
  strokeWeight(11);
  stroke(0,3,129);
  fill(16,7,77);
  rect(-11,234,320,800);
  
  strokeWeight(60);
  stroke(0,3,129);
  fill(178,0,113);
  rect(600,244,245,800);
  
  noStroke();
  fill(178,0,113);
  rect(0,302,800,800);
    
  noStroke();
  fill(255,255,0);
  rect(0,356,800,800);
  
  noStroke();
  fill(18,144,0);
  rect(0,400,800,100);
  
  noStroke();
  fill(18,144,0);
  triangle(150, 450, 570, 200, 730, 450);
  
  a = a + 0.03;
  b = cos(a)*100+100;
  d = sin(a)*100+50;
  e = b*2;
  c = d*1.5;
  
  translate(width/2,height/2);
  fill(c,0,77);
  textFont(otherfont);
  textSize(d);
  text("TEE JUICE",-150,0);
  
  translate(0,50);
  fill(e,6,77);
  textFont(myfont);
  textSize(b);
  text("selektah deksta",-75,0);
  
  translate(0,50);
  fill(e,6,77);
  textFont(myfont);
  textSize(b);
  text("dirty dek",-5,-100);
  
  translate(25,-300);
  fill(e,6,77);
  textFont(fonnt);
  textSize(b);
  text("WR0NGliCi0US",-500,200);
  
  
}


