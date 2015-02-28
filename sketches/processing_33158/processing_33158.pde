
void setup(){
int mega; //This is the main variable used for repetition
int obSize = 10; //This variable allows me to play with linking the size of the shapes. Very high in this iteration
smooth();
size(600,267);
translate(width/2, height); //Translate is critical for the fan shape.
// It repositions the grid in the bottom-centre of the canvas
background(1);

for(mega = 0; mega< 30; mega =mega +1){ //This iteration has the lowest amount of repetitions to seperate leaves
rotate(.2);
fill(110,49,8,80);
ellipse(0,20,obSize*53,7);
rect(0,133,obSize*3,obSize*27);
stroke(10);
fill(52,133,7,100);
ellipse(0,283,53,obSize*27); //dark colours
ellipse(0,200,8,16);
}
}

void draw(){
}

