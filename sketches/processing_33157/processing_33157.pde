
void setup() {
  int mega; //This is the main variable used for repetition
  int obSize = 5; //This variable allows me to play with linking the size of the shapes.
  smooth();
  size(600,267);
  translate(width/2, height);//Translate is critical for the fan shape.
  // It repositions the grid in the bottom-centre of the canvas
  background(1);

  for(mega = 0; mega< 120; mega =mega +1) { //Repetion is increased as the objects are very narrow 
    rotate(.2);
    fill(245,211,0,120);
    ellipse(0,random(47,80),obSize*0.6,100); //Semi-Random positioning has been used to create noise
    fill(110,39,70,120);
    rect(0,random(100,133),obSize*1.2,obSize*27); //objects are narrow
    noStroke();
    fill(245,0,169,100);
    ellipse(0,random(200,283),3,obSize*27);
    ellipse(0,random(133,200),3,16);
  }
}

void draw() {
}


