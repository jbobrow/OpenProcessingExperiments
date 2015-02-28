
void setup(){
int mega; //This is the main variable used for repetition
int ObSize = 5; //This variable allows me to play with linking the size of the shapes.
smooth();
size(600,267);
translate(width/2, height);//Translate is critical for the fan shape.
// It repositions the grid in the bottom-centre of the canvas
background(1);

for(mega = 0; mega< 60; mega =mega +1){//This statement controls repetition
rotate(4); // Less rotation to create separation for the beams of light
noStroke();
fill(232,106,11,30); //Transparency is high in this iteration to make it look like it shines
ellipse(0,20,ObSize*200,20);
rect(0,133,ObSize*4,ObSize*4);
fill(255,69,33,30);
ellipse(0,283,53,ObSize*100);
ellipse(0,200,8,16);
}
}
void draw(){
}

