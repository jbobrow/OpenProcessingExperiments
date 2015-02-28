
void setup() {

  size (640, 480); 
  background (222, 62, 93);
} 

void draw() {
  fill(222, 62, 156);
  ellipse (320, 240, 50, 50); //(width/3, height/4, width/3, height/4);
  fill(133, 222, 62);
  rect (320, 240, 50, 50); // shape center:30w-20h, shape size: 125,140
  stroke(0);
  line(0, 0, mouseX, mouseY);
  noStroke();
}

void mousePressed() {
  background(30, 64);
  stroke(255);
  line(640, 480, mouseX, mouseY);
  noStroke();


  println(); //to move the first line into a new line
  println ("A fire, a sword, doing you awful harm?");
  println ("No! These words are too loud and shabby!");
  println ("A pain, well-known like to eyes – a palm,");
  println ("Like to lips – a name of a dear baby. ");
  println ();
  println ("Marina Tsvetaeva, Love, 1924");
  println ();
  println ("Translated by Yevgeny Bonver, October 15, 2005");
}





