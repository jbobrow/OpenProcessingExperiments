
PFont Dillfont;
void setup(){
  size(1000,600);
  Dillfont = loadFont("DilleniaUPCBold-48.vlw");
  frameRate(30);
   
}

void draw(){
  
  noStroke();
  fill(205,205,205);
  rect(265,100,70,500);
  
   noStroke();  
  fill(205,205,205);
  rect(50,0,1000,50);
  
 noStroke();  
  fill(205,205,205);
  rect(279,200,300,100);
  
  noStroke();  
  fill(205,205,205);
  rect(611,123,58,100);
  
  noStroke();  
  fill(205,205,205);
  rect(157,200,300,100);
  
  noStroke();
  fill(205,205,205);
  triangle(0,0,300,400,1000,0);

  fill(255);
  rect(0,400,1000,600);
  
  noStroke();
  fill(255,255,255,random(100));
  textFont(Dillfont);
  textSize(random(150));
  text("No Parking",random(-100,1000),random(400,700));
  
  noStroke();
  fill(255,255,255,random(100));
  textFont(Dillfont);
  textSize(random(100));
  text("Please Use Other Door",random(-100,1000),random(700));
  
  noStroke();
  fill(255,255,255,random(100));
  textFont(Dillfont);
  textSize(random(50));
  text("Not A Public Way",random(-100,1000),random(700));

  noStroke();
  fill(220);
  rect(random(1000),random(50,500),3,500);
 
  noStroke();
  fill(205,205,205);
  rect(random(1000),random(50,500),3,500);
}
