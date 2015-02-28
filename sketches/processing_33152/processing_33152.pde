
void setup(){
int mega; //This is the main variable used for repetition
int obSize = 2; //This variable allows me to play with linking the size of the shapes. This value is small in this interation
int x =33;
smooth();
size(600,267);
translate(width/2, height); //Translate is critical for the fan shape.
// It repositions the grid in the bottom-centre of the canvas
background(1);

for(mega = 0; mega< 60; mega =mega +1){
rotate(.1); //Rotation is high for visual intrest
fill(14,x,232); //very high contrast for visual intrest
x = 107;
ellipse(0,x,obSize*13,obSize*13); // Small size of inner ring fits into the theme of this iteration
noStroke();
x = 133; // new x value increases size gradually
rect(0,x,obSize*33,obSize*53); //All shapes are relatively small.
fill(255,sin(x),45);
x =283;
ellipse(0,x,obSize*27,obSize*27);
x=333;
ellipse(0,x,33,33);
}
}
void draw(){
}

