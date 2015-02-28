
size(480,120);
size(400,400);
background(11,109,210);

float ingredientWidth;
float ingredientHeight;

ingredientWidth=width/3*2;
ingredientHeight=height/16;

noStroke();

fill(225,225,5);
rect(0,height/16*3,ingredientWidth,ingredientHeight);

fill(225,255,5);
rect(width/3*2,height/16*4,ingredientWidth,ingredientHeight);

fill(225,255,5);
rect(0,height/16*5,ingredientWidth,ingredientHeight);

fill(225,225,5);
rect(width/3*2,height/16*6,ingredientWidth,ingredientHeight);

fill(225,225,5);
rect(0,height/16*7,ingredientWidth,ingredientHeight);

fill(225,225,5);
rect(width/3*2,height/16*8,ingredientWidth,ingredientHeight);

fill(225,225,5);
rect(0,height/16*9,ingredientWidth,ingredientHeight);

fill(245,5,22,100);
ellipse(width/2,height/16*14, width/10*2,height/10*2);
