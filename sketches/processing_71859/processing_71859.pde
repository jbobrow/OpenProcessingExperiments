

//Suprematist Painting by Kazimir Malevich 1916-17

void setup() {
  
  size(600,600);
  background(212,196,185);
  
}


void draw() {
  if(mousePressed){

println(" x: "+mouseX +" y: "+mouseY);
  }
  
//orange arc  
  
  noFill();
  strokeWeight(10);  
  stroke(212,91,60);
  arc(200,220,400,400,radians(130), radians(230));
  
//rect behind circle

  noStroke();
  fill(0,0,0);
  quad(40,390,454,22,504,80,90,454);
  
  fill(184,146,120);
  quad(60,484,485,100,522,145,97,529);
  
//circle in the middle

  fill(212,91,60);
  noStroke();
  ellipse(300,259,420,420);

//square in the middle of the circle
  
  fill(0,0,0);
  strokeWeight(2);
  stroke(255,255,255);
  rect(190,100,220,220);
  
  noFill();
  
//arc

  noFill();
  strokeWeight(20);
  stroke(0,0,0);
  arc(330,350,400,400,radians(50), radians(100));

  noFill();
  strokeWeight(8);  
  stroke(212,91,60);
  arc(300,385,300,300,radians(88), radians(115));
  
  noFill();
  strokeWeight(4);  
  stroke(0,0,0);
  arc(210,220,400,400,radians(150), radians(220));

  fill(212,91,60);
  noStroke();
  triangle(458,424,553,479,502,521);

  fill(212,91,60);
  noStroke();
  triangle(492,363,559,374,522,423);

  fill(0,0,0);
  noStroke();
  triangle(548,398,565,407,559,415);
  
  fill(212,91,60);
  noStroke();
  quad(540,525,585,484,650,586,620,630);

  fill(0,0,0);
  noStroke();
  quad(563,454,572,444,598,479,588,490);

}
