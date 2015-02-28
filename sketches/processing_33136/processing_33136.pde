
void setup() {
  int mega; //This is the main variable used for repetition
  int obSize = 4; //This variable allows me to play with linking the size of the shapes
  smooth();
  size(600,267);
  translate(width/2, height); //Transform is critical for the fan shape. 
  // It repositions the grid in the bottom-centre of the canvas
  background(1);

  for(mega = 0; mega< 60; mega =mega +1) { //This statement controls repetition
    rotate(.1); //Frequent rotation for overlap
    noStroke();
    fill(14,13,232,30); //Transparency is high in this iteration
    ellipse(0,20,obSize*53,67); 
    fill(100,150,70,30);
    rect(0,133,obSize*27,obSize*27);
    fill(255,174,45,100);
    ellipse(0,200,16,16); //Small circles to increase visual interest
    ellipse(0,283,obSize*27,obSize*27); //Yellow circles used for feathers
  }
}
void draw() {
}


