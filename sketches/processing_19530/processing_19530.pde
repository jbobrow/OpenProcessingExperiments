
PFont font;
float y = 125;

void setup(){
  size(250, 250);
  font = loadFont("NewsGothicMT-15.vlw"); //news gothic 15
  smooth();
}

void draw(){ 
  background(20);
  noFill();
  textFont(font);
  frameRate(15);
  
//V
  fill(#033639, 150); 
  text("V", random(250), y);
  fill(#22A99A, 150);
  text("V", random(250), y);
  fill(#44BFAB, 150);
  text("V", random(250), y);
  fill(255, 150); 
  text("V", random(250), y);
//5  
    fill(#033639, 150); 
  text("5", random(250), y);
  fill(#22A99A, 150);
  text("5", random(250), y);
  fill(#44BFAB, 150);
  text("5", random(250), y);
  fill(255, 150); 
  text("5", random(250), y);
//B
    fill(#033639, 150); 
  text("B", random(250), y);
  fill(#22A99A, 150);
  text("B", random(250), y);
  fill(#44BFAB, 150);
  text("B", random(250), y);
  fill(255, 150); 
  text("B", random(250), y);
//1
    fill(#033639, 150); 
  text("1", random(250), y);
  fill(#22A99A, 150);
  text("1", random(250), y);
  fill(#44BFAB, 150);
  text("1", random(250), y);
  fill(255, 150); 
  text("1", random(250), y);
//Z
    fill(#033639, 150); 
  text("Z", random(250), y);
  fill(#22A99A, 150);
  text("Z", random(250), y);
  fill(#44BFAB, 150);
  text("Z", random(250), y);
  fill(255, 150); 
  text("Z", random(250), y);
//9
    fill(#033639, 150); 
  text("9", random(250), y);
  fill(#22A99A, 150);
  text("9", random(250), y);
  fill(#44BFAB, 150);
  text("9", random(250), y);
  fill(255, 150); 
  text("9", random(250), y);

//vertical lines
noFill(); 
strokeWeight(random(0.01, 1)); //strokeweight is random between 0.01 and 1
rectMode(CENTER); 
  stroke(#033639, 150);
  rect(random(250), 0, random(250), 600); //boxes extend outside of box, so only lines appear
  stroke(#22A99A, 150);
  rect(random(250), 0, random(250), 600);
  stroke(#44BFAB, 150);
  rect(random(250), 0, random(250), 600);
  stroke(255, 150);
  rect(random(250), 0, random(250), 600);

 }

