
//Wie lassen sich die Figuren verschieben?

void setup(){
  stroke(255);
  strokeWeight(4);
  background(0,0,0);
  size(500,445);
}
void draw(){
strokeWeight(5);
  var dx = random(-100,100);
  var dy = random(-100,100);
  stroke(random(140), random(150), random(160));
  line(100,125,100+dx,125+dy);
  var dx = random(-100,100);
  var dy = random(-100,100);
  stroke(random(160), random(150), random(140));
  line(215,125,215+dx,125+dy);
  var dx = random(-100,100);
  var dy = random(-100,100);
  stroke(random(160), random(150), random(140));
  line(350,160,350+dx,160+dy);
  fill (0, 0, 0, 10);
  noStroke();
  rect (0, 0, width, height);
stroke(255,255,255);
strokeWeight(2);
point(250, 200);



fill(149,75,5);


ellipse(250, 500, 400, 400);
ellipse(250, 300, 200, 200);
ellipse(370, 250, 80, 80);


ellipse(150, 240, 80, 80);
}
