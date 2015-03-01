
void setup(){
  size(400,400);
  smooth();
  frameRate(50);
  noStroke();
}
void face(){
  if (mouseX<200){
    fill(223,216,166);
    rectMode(CENTER);
    rect(150+mouseX/4,200,200,200,50,50,100,100);
  }
  else {
    fill(223-16*(mouseX-200)/50,216-141*(mouseX-200)/50,146-96*(mouseX-200)/50);
    rectMode(CENTER);
    rect(200+(mouseX-200)/4,200,200,200,50,50,100,100);
  }
}
void eyes(){
  fill(0);
  ellipse(100+mouseX/3,160,20,20);
  ellipse(499/3+mouseX/3,160,20,20);
  fill(255);
  ellipse(97+mouseX/2.9,153+mouseY/30,5,5);
  ellipse(164+mouseX/2.9,153+mouseY/30,5,5);
  stroke(0,mouseX-175);
  strokeWeight(2);
  line(220,145,240,150);
  line(310,145,290,150);
  noStroke();
}
void halo(){
  noFill();
  stroke(255,221,76);
  strokeWeight(5);
  ellipse(150+mouseX/4,65+(mouseX/5),125,25);
  noStroke();
}
void horns(){
  fill(255,16,0);
  triangle(180+mouseX/50,150-(mouseX/5),200+mouseX/50,190-(mouseX/5),160+mouseX/50,190-(mouseX/5));
  triangle(270+mouseX/50,150-(mouseX/5),290+mouseX/50,190-(mouseX/5),250+mouseX/50,190-(mouseX/5));
}
void bluesquare(){
  fill(183,233,230);
  rectMode(CENTER);
  rect(200,200,400,180);
}
void mouth(){
  translate(133+mouseX/3,240);
  rotate(radians(mouseX/2.22));
  arc(0,0,75,40,0,PI,OPEN);
}
void draw(){
  background(183,233,230);
  halo();
  horns();
  bluesquare();
  
  face();
  eyes();
  mouth();
}

