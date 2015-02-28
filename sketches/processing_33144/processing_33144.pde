
void setup(){
int mega; //This is the main variable used for repetition
int obSize = 10; //This variable allows me to play with linking the size of the shapes. This variable has been increased in this iteration
smooth();
size(600,267);
translate(width/2, height);//Transform is critical for the fan shape. 
// It repositions the grid in the bottom-centre of the canvas
background(1);

for(mega = 0; mega< 60; mega =mega +1){ //This statement controls repetition
rotate(.102); //Frequent rotation for overlap
fill(14,13,232,30);
ellipse(0,13,obSize*53,20); //Transparency is high in this iteration for the centre. All objects have been elongated
rect(0,133,obSize*3,obSize*27);
stroke(10);
fill(255,174,45,100);
ellipse(0,283,53,obSize*27); //Petals and Shadow
ellipse(0,200,8,16);
}
}
void draw(){
}

