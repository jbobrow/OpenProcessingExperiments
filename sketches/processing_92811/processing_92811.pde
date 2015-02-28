



void setup() {
  size(500, 500);
  smooth();
}

int value=0;

void draw(){
background(255);
  noStroke();

  //hair
  
  fill(153,56,0);
  arc(250, 250, 250, 380, PI, PI+PI);

  //neck
  fill(255, 193, 158);
  rectMode(CENTER);
  rect(250, 270, 40, 50);


  //face
  ellipse(250, 180, 170, 190);


  //front hair
  fill(120, 55, 18);
  quad(240, 85, 270, 120, 260, 100, 250, 90);

  //eyes
  fill(255);
  arc(200, 160, 30, 40, PI, PI+PI, CHORD);
  arc(300, 160, 30, 40, PI, PI+PI, CHORD);

  //pupils(move left and right according to mouse movement)
  fill(0);
  ellipse(200+5*mouseX/500, 150, 15, 20);
  ellipse(300+5*mouseX/500, 150, 15, 20);

  //points in pupils
  stroke(255);
  strokeWeight(4);
  fill(255);
  point(300+5*mouseX/500, 150);
  point(200+5*mouseX/500, 150);


  //nose
  stroke(0);
  strokeWeight(1);
  line(250, 180, 240, 190);
  line(240, 190, 250, 195);

  //eyebrows move up and down according to the mouse movement
  noFill();
  stroke(99,2,0);
  strokeWeight(2);
  curve(130, 165-mouseY/20, 190, 130, 210, 130, 250, 165-mouseY/20);
  curve(200,165-mouseY/20,290,130,310,130,370,165-mouseY/20);


  noStroke();

  //lips
  fill(255, 0, 0);
  arc(245, 215, 10, 10, PI, PI+PI, CHORD);
  arc(255, 215, 10, 10, PI, PI+PI, CHORD);
  arc(250, 215, 20, 20, 0, PI, CHORD);

  //body

  fill(103, 153, 255);
  rectMode(CENTER);
  rect(250, 335, 200, 100);

  //arc neck
  fill(255, 193, 158);
  arc(250, 285, 60, 80, 0, PI);

  //shoulder move up and down according to the mouse movement
  fill(103, 153, 255);
  triangle(150, 285, 220, 285, 150, 265+22*mouseY/500);
  triangle(280, 285, 350, 285, 350, 265+22*mouseY/500);
  
}

  
 


