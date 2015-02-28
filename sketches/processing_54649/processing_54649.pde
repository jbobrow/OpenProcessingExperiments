
PFont font1;

void setup(){
 size(600,100); 
  font1 = loadFont("Stencil-48.vlw");
}

void draw () {
  background(255, 234, 0);
  fill(255,0,0);
  strokeWeight(40);
  line(0,0,600,600);
  line(100,0,800,700);
  line(200,0,1000,800);
  line(300,0,1200,900);
  line(400,0,1400,1000);
  line(500,0,1600,1100);
  line(600,0,1700,1200);
  
 strokeWeight(0);
 fill(255,0,0);
  rect(0,0,600,20);
  rect(0,80,600,500);
  
  fill(255,0,0);
  textFont(font1);
  textSize(30);
  text("DO NOT ENTER", mouseX-90, 60);
 
  
}



