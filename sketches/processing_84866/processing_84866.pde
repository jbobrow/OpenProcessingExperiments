
////////////////////////////////////////////////////////
// DRAWS ALL DOGGYGHOSTS
// Takes SVG file and gives random colors 
////////////////////////////////////////////////////////
class DoggyGhost
{
  
////////////////////////////////////////////////////////
// GLOBAL VARIABLES
////////////////////////////////////////////////////////
// floats and ints
float doggyW;             // width
float doggyH;             // height
float doggyX;             // x position
float doggyY;             // y position
float doggySpeed;         // speed
color randomCol1;         // a random color
color randomCol2;

// shapes
PShape doggyGhost;
PShape body;
PShape ears;
PShape innerEars;
PShape eyes;
////////////////////////////////////////////////////////


////////////////////////////////////////////////////////
// VARIABLES VALUES (CONSTRUCTOR)
////////////////////////////////////////////////////////
DoggyGhost()
{
// floats and ints
doggyX=width/2;
doggyY=height/2;
doggyW=65;
doggyH=doggyW;
doggySpeed=3;

// shapes
doggyGhost = loadShape("doggy-ghost.svg");
body = doggyGhost.getChild("body_1_");
ears = doggyGhost.getChild("ears_1_");
innerEars = doggyGhost.getChild("inner-ears");
eyes = doggyGhost.getChild("eyes");
}
////////////////////////////////////////////////////////


////////////////////////////////////////////////////////
// DRAWING DOGGYGHOST
////////////////////////////////////////////////////////
void spawn(float doggyX,float doggyY, color randomCol1, color randomCol2)
{
pushStyle();
rectMode(CENTER);
shapeMode(CENTER);
noStroke();

// draw doggyghost
shape(doggyGhost, doggyX, doggyY, doggyW, doggyH);

// draw doggyghost body a random color
// disable the colors found in the SVG file
body.disableStyle();
fill(randomCol1);
shape(body,doggyX,doggyY,doggyW,doggyH);

// draw doggyghost ears a random color
// disable the colors found in the SVG file
ears.disableStyle();
fill(randomCol1);
shape(ears,doggyX,doggyY,doggyW,doggyH);

// draw doggyghost inner ears a random color
// disable the colors found in the SVG file
innerEars.disableStyle();
fill(randomCol2);
shape(innerEars,doggyX,doggyY,doggyW,doggyH);

// draw doggyghost eyes
// disable the colors found in the SVG file
innerEars.disableStyle();
fill(255);
shape(eyes,doggyX,doggyY,doggyW,doggyH);


// test stuff for massing
//fill(255,0,0);
//rect(doggyX,doggyY,doggyW,doggyH);
//
//stroke(0);
//strokeWeight(10);
//point(doggyX,doggyY);

popStyle();
}
////////////////////////////////////////////////////////

}

