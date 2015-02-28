
float angle = 0.0;

size(250,250);
background(255,155,155,40);
smooth();

PFont font;
font = loadFont ("AlBayan-Bold-48.vlw");
textFont(font);
smooth();
for(int x=40; x<=250; x+=5){
  textSize(70);
  fill(190,68,120,90);
  text("M",x,50);
  text("J",x+150,50);
  fill(255,234,234,80);
  text("M2H3J3",x+5,50);
  fill(247,95,115,90);
  text("2",x+50,50);
  text("3",x+165,50);
  fill(255,36,65,100);
  text("H",x+80,50);
  fill(255,111,166,100);
  text("3",x+120,50);
 
  angle = angle +0.6; // rate of rotation 
  translate(100, 100);	// offset from orig position 
  rotate(angle);	// rotate shape at angle value
}

