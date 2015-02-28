
void setup() {
  size(900,900);
  background(0);
  smooth();
  strokeWeight(2);
  frameRate(100);
  
}
void draw() {
  stroke(random(255));
  for (int i = 500; i < 1000; i = i+20) { // beginnings of the various lines
     for (int j = 500; j < 1000; j = j+200); //bottom portion of the lines 
}

stroke(0);
for (int i = 10; i < 1000; i = i+50){ //position of squares and their movement
strokeWeight(1);
stroke(random(255),0,0);
  line ( 0, (random(-10,15)), random(i), (random(-10,15)) );
  line ( 0, (random(240,265)), random(i), (random(240,265)) );
  line ( 0, (random(40,65)), random(i), (random(40,65)) );
  line ( 0, (random(90,115)), random(i), (random(90,115)) );
  line ( 0, (random(140,165)), random(i), (random(140,165)) );
  line ( 0, (random(190,215)), random(i), (random(190,215)) );
  line ( 0, (random(290,315)), random(i), (random(290,315)) );
  line ( 0, (random(340,365)), random(i), (random(340,365)) );
  line ( 0, (random(390,415)), random(i), (random(390,415)) );
  line ( 0, (random(440,465)), random(i), (random(440,465)) );
  line ( 0, (random(490,515)), random(i), (random(490,515)) );
  line ( 0, (random(540,565)), random(i), (random(540,565)) );
  line ( 0, (random(590,615)), random(i), (random(590,615)) );
  line ( 0, (random(640,665)), random(i), (random(640,665)) );
  line ( 0, (random(690,715)), random(i), (random(690,715)) );
  line ( 0, (random(740,765)), random(i), (random(740,765)) );
  line ( 0, (random(790,815)), random(i), (random(790,815)) );
  line ( 0, (random(840,865)), random(i), (random(840,865)) );
  line ( 0, (random(890,915)), random(i), (random(890,915)) );
  stroke(random(255),random(255),random(255),255);
  line ( 0, (random(0,999)), random(i), (random(0,999)) );


  for (int j = 15; j < 1000; j = j+50) {
      noStroke();
    fill(random(255),0,0); //the color of the squares
rect(random(i), j, 25, 25);  //what makes the squares appear to shift 
fill(random(0),random(150),random(255),40);
ellipse(random(mouseX),random(mouseX), 25,25);
stroke(255);


}
}
}


 void mousePressed() {  //resets the work when you press mouse 
    background(random(255));
 }
