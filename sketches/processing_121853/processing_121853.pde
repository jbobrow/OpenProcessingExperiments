
void setup() {
  size(500,500);
}

void draw() {
  background(255,255,255);
  rectMode(CENTER);
  stroke(0);
  /* Antenne */
  fill(255,10,0);
  ellipse(mouseX,mouseY,10,10); //220 194
  fill(255,10,0);
  rect(mouseX,mouseY+16,1,20); //220 210
  /* Lijf */
  fill(255,245,5);
  rect(mouseX+30,mouseY+56,100,60); //250 250
  fill(180,180,180);
  rect(mouseX+30,mouseY+116,40,60); //250 310
  /* Armen */
  line(mouseX+10,mouseY+106,mouseX+30,mouseY+126); //230 300 250 320
  line(mouseX+50,mouseY+106,mouseX+70,mouseY+126); //270 300 290 320
  /* Benen */
  line(mouseX+10,mouseY+146,mouseX+10,mouseY+176); //230 340 230 370
  line(mouseX+50,mouseY+146,mouseX+50,mouseY+176); //270 340 270 370
  /* Ogen */
  fill(0,100,255);
  ellipse(mouseX+10,mouseY+46,12,12); //230 240
  fill(0,100,255);
  ellipse(mouseX+40,mouseY+46,10,10); //260 240
}
