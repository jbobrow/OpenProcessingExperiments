
//
//juichilin

void setup(){
size(280,275);
background(235,240,240);

}

void draw(){
  //rect red
  fill(231,6,4);
  noStroke();
  rect(0,0,130,130);
  //rect yellow
  fill(255,215,5);
  noStroke();
  rect(0,180,30,95);
  //rect blue
  fill(30,23,101);
  noStroke();
  rect(130,180,85,75);
  
  //h line
  stroke(0);
  strokeWeight(5);
line(0,130,280,130);
 stroke(0);
  strokeWeight(5);
line(0,180,280,180);
 stroke(0);
  strokeWeight(4);
line(130,255,214,255);
//v line
 stroke(0);
  strokeWeight(4);
line(130,0,130,275);
 stroke(0);
  strokeWeight(4);
line(215,180,215,275);
 stroke(0);
  strokeWeight(3);
line(30,180,30,275);

}


