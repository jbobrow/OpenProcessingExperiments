
//This project was made by Nicholas Chu

void setup () {
  //changes the size to 969 to 969 in size.
  size(969, 969);
  //starts the background to black at the start. 
  background(0);
}
//this is the thing that keeps repeating over and over agian.
void draw () {
  //This draws lines randomely on the screen from the size 969 to 969.
  line(random(969), random(969), random(969), random(969));
  fill(random(255), random(255), random(255));
  ellipse(random(0, 969), random(0, 969), random(0, 969), random(0, 969));
  fill(random(255), random(255), random(255));
  //This tells the program that you can press a button to change something
  if (keyPressed == true)
    noStroke(); 
  /*this puts random sized rectangle from a cordinate of 0-969 and
   a size from 0-969.*/
  rect(random(0, 969), random(0, 969), random(0, 969), random(0, 969));
}
//This sets up the key pressed option.
void keyPressed() {
/*This tells it which button is to be pressed to change the thing
that is supposed to change.*/
  if (key==' ');
  {
//This is the item the KeyPress option changes!
    background(random(255), random(255), random(255));
  }
}
