
void setup () {
size(200,200);
}


void draw () { 
background(255);
stroke(0);

// hand links

fill(288,189,4);
ellipse(mouseX-40,mouseY,40,20);

// hand rechts

fill(288,189,4);
ellipse(mouseX+35,mouseY,40,20);

// lijfje

fill(0,0,0);
ellipse(mouseX,mouseY,60,80);

// hoofd

fill(71,203,236);
ellipse(mouseX,mouseY-50,70,90);

// hoedje

fill(0,0,0);
triangle(mouseX-25,mouseY-82,mouseX,mouseY-112,mouseX+25,mouseY-82);

// oog rehts:

fill(0,0,0);
ellipse(mouseX+15,mouseY-60,15,25);

// oog links:

fill(0,0,0);
ellipse(mouseX-10,mouseY-60,15,25);

// mond

fill(0,0,0);
rectMode(CORNER);
rect(mouseX-20,mouseY-40,40,5);

fill(255,0,0);
rect(mouseX-5,mouseY-40,12,5);

// tand links

fill(225);
triangle(mouseX-20,mouseY-35,mouseX-15,mouseY-25,mouseX-10,mouseY-35);

// tand rechts

fill(225);
triangle(mouseX+10,mouseY-35,mouseX+15,mouseY-25,mouseX+20,mouseY-35);

// voet rechts

fill(228,189,4);
ellipse(mouseX+30,mouseY+40,50,30);

// voet links

fill(228,189,4);
ellipse(mouseX-30,mouseY+40,50,30);
}
