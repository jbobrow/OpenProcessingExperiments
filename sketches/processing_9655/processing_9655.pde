
void setup(){
  size(800,600);
  frameRate(15);
  smooth();
  //Set ellipses to CORNERS Mode
  ellipseMode(CORNER);
  rectMode(CORNER);
  stroke(0);
  strokeWeight(2.5);
}

void draw(){
  background(255); //White
  
  //Magnemite's Body
  fill(17,107,107); //Dark Cyan
  ellipse(mouseX,mouseY,200,180); //190,100,390,280
  //Magnemite's Eye
  fill(mouseX,0,mouseY); //Light Yellow
  ellipse(mouseX+45,mouseY+35,110,100);
  //Magnemite's Pupil
  fill(0); //Change!
  ellipse(mouseX+90,mouseY+75,20,20);
  //Magnemite's Screws
  fill(150,130,130); //Brighter Grey
  rect(pmouseX+90,pmouseY-30,20,30); //Top screw
  line(pmouseX+90,pmouseY-20,pmouseX+110,pmouseY-20);
  line(pmouseX+90,pmouseY-10,pmouseX+110,pmouseY-10);
  ellipse(pmouseX+80,pmouseY-40,40,10);
  ellipse(pmouseX+30,pmouseY+150,25,25); //Left screw
  line(pmouseX+35,pmouseY+162,pmouseX+50,pmouseY+162);
  line(pmouseX+42,pmouseY+155,pmouseX+42,pmouseY+170);
  ellipse(pmouseX+140,pmouseY+155,25,25); //Right screw
  line(pmouseX+145,pmouseY+167,pmouseX+160,pmouseY+167);
  line(pmouseX+152,pmouseY+160,pmouseX+152,pmouseY+175);
  
  //Right Magnet-Wing
  noFill();
  curve(mouseX+335,mouseY+40,mouseX+335,mouseY+40,mouseX+215,mouseY+40,mouseX+215,mouseY+140);//Upper
  curve(mouseX+335,mouseY+40,mouseX+215,mouseY+40,mouseX+215,mouseY+140,mouseX+335,mouseY+140);
  curve(mouseX+215,mouseY+40,mouseX+215,mouseY+140,mouseX+335,mouseY+140,mouseX+335,mouseY+140);
  fill(37,147,237); //Blue
  rect(mouseX+335,mouseY+40,20,20);
  noFill();
  curve(mouseX+335,mouseY+60,mouseX+335,mouseY+60,mouseX+235,mouseY+60,mouseX+235,mouseY+160);//Lower
  curve(mouseX+335,mouseY+60,mouseX+235,mouseY+60,mouseX+235,mouseY+120,mouseX+335,mouseY+120);
  curve(mouseX+235,mouseY+60,mouseX+235,mouseY+120,mouseX+335,mouseY+120,mouseX+335,mouseY+120);
  fill(237,17,17); //Red
  rect(mouseX+335,mouseY+120,20,20);
  
  //Left Magnet-Wing
  noFill();
  curve(mouseX-135,mouseY+40,mouseX-135,mouseY+40,mouseX-15,mouseY+40,mouseX-15,mouseY+140); //Upper
  curve(mouseX-135,mouseY+40,mouseX-15,mouseY+40,mouseX-15,mouseY+140,mouseX-135,mouseY+140);
  curve(mouseX-15,mouseY+40,mouseX-15,mouseY+140,mouseX-135,mouseY+140,mouseX-135,mouseY+140);
  fill(237,17,17); //Red
  rect(mouseX-155,mouseY+40,20,20);
  noFill();
  curve(mouseX-135,mouseY+60,mouseX-135,mouseY+60,mouseX-30,mouseY+60,mouseX-30,mouseY+160); //Lower
  curve(mouseX-135,mouseY+60,mouseX-30,mouseY+60,mouseX-30,mouseY+120,mouseX-135,mouseY+120);
  curve(mouseX-30,mouseY+60,mouseX-30,mouseY+120,mouseX-135,mouseY+120,mouseX-135,mouseY+120);
  fill(37,147,237); //Blue
  rect(mouseX-155,mouseY+120,20,20);
}
//Produce a Thunder attack
void mousePressed() {
  fill(255,255,0); //Yellow
  ellipse(mouseX,mouseY,200,180); //190,100,390,280
  ellipse(mouseX+45,mouseY+35,110,100);
  rect(pmouseX+90,pmouseY-30,20,30); //Top screw
  line(pmouseX+90,pmouseY-20,pmouseX+110,pmouseY-20);
  line(pmouseX+90,pmouseY-10,pmouseX+110,pmouseY-10);
  ellipse(pmouseX+80,pmouseY-40,40,10);
  ellipse(pmouseX+30,pmouseY+150,25,25); //Left screw
  line(pmouseX+35,pmouseY+162,pmouseX+50,pmouseY+162);
  line(pmouseX+42,pmouseY+155,pmouseX+42,pmouseY+170);
  ellipse(pmouseX+140,pmouseY+155,25,25); //Right screw
  line(pmouseX+145,pmouseY+167,pmouseX+160,pmouseY+167);
  line(pmouseX+152,pmouseY+160,pmouseX+152,pmouseY+175);
  rect(mouseX+335,mouseY+40,20,20);
  rect(mouseX+335,mouseY+120,20,20);
  rect(mouseX-155,mouseY+40,20,20);
  rect(mouseX-155,mouseY+120,20,20);
  println("Magnemite! Thundershock, now!");
}

