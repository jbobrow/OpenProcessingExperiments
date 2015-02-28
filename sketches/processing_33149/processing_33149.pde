
void setup() {
  int mega; //This is the main variable used for repetition
  int obSize = 5; //This variable allows me to play with linking the size of the shapes.
  smooth();
  size(600,267);
  translate(width/2, height);//Translate is critical for the fan shape.
  // It repositions the grid in the bottom-centre of the canvas
  background(1);

  for(mega = 0; mega< 200; mega =mega +1) {//This statement controls repetition
    rotate(4); // Less rotation to create separation for the spokes
    fill(133,67,3,30);//Transparency is high in this iteration to create movement
    ellipse(0,13,obSize*13,obSize*13);
    rect(0,0,obSize*3,obSize*37); //ellongated rectangle for spokes
    stroke(10);
    fill(122,38,13,50);
    noStroke();
    ellipse(0,283,53,obSize*27);
    ellipse(0,200,8,8);
  }
}
void draw() {
}


