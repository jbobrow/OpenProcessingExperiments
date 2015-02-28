
void setup(){
  smooth();
  background(255);
}

void draw(){
  println(mousePressed);
  fill(255,215,190);
  rect(40, 10, 20, 20);
  line(50, 30, 50, 60);
  line(40, 40, 60, 40);
  line(40, 40, 30, 60);
  line(60, 40, 70, 60);
  rect(25, 60, 10, 10);
  rect(65, 60, 10, 10);
  //leg
  line(40, 60, 60, 60);
  line(40, 60, 40, 80);
  line(60, 60, 60, 80);
  rect(35, 80, 10, 10);
  rect(55, 80, 10, 10);
  //face
  fill(255,50,0);
  arc(50, 25, 5, 5, 0, PI);
  arc(45, 15, 5, 5, 0, (PI/180)*180);
  arc(55, 15, 5, 5, 0, (PI/180)*180);

//nosmooth();
  //mouse pressed
  //[if (some condition is true)]
  if (mousePressed){
    fill(255,215,190);
  rect(40, 10, 20, 20);
  line(50, 30, 50, 60);
  line(40, 40, 60, 40);
  line(40, 40, 25, 10);
  line(60, 40, 75, 10);
  rect(25, 10, 10, 10);
  rect(65, 10, 10, 10);
  //leg
  line(40, 60, 60, 60);
  line(40, 60, 30, 80);
  line(60, 60, 70, 80);
  rect(25, 80, 10, 10);
  rect(65, 80, 10, 10);
  //face
  fill(255,50,0);
  arc(50, 22, 10, 10, 0, PI);
  arc(45, 15, 5, 5, 0, (PI/180)*180);
  arc(55, 15, 5, 5, 0, (PI/180)*180);
  }
}


