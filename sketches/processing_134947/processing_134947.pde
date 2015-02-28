
int ellipseHeight = 50;
int ellipseWidth = 50;
int ellipseSize = 100;
int arcHeight = 50;
int arcWidth = 250;
int arcSize = 100;
int bezierY = 50;
int bezierX = 50;

int strokeW = 1;
int alphas = 150;

void setup() {
  size(1000, 500);
  smooth();
background(210);
noLoop();



}


void draw() {
 noFill();
stroke(190, 190, 190, alphas);
strokeWeight(strokeW);


//1 Large Shape
//ellipse left
ellipseMode(CENTER);
ellipse(ellipseHeight*4, ellipseWidth*5, ellipseSize*3, ellipseSize*3);

//elipse right
ellipseMode(CENTER);
ellipse(ellipseHeight*16, ellipseWidth*5, ellipseSize*3, ellipseSize*3);

//bezier ellipse topleft botright
bezier(bezierX*4, bezierY*2, bezierX*8, bezierY*2, bezierX*12, bezierY*8, bezierX*16, bezierY*8);

//bezier ellipse topright botleft
bezier(bezierX*16, bezierY*2, bezierX*12, bezierY*2, bezierX*8, bezierY*8, bezierX*4, bezierY*8);

//arc left
ellipseMode(CENTER);
arc(arcHeight*7, arcWidth, arcSize*3, arcSize*3, radians(90), radians(270));

//arc right
ellipseMode(CENTER);
arc(arcHeight*13, arcWidth, arcSize*3, arcSize*3, radians(270), radians(450));

//bezier arc topleft botright
bezier(bezierX*7, bezierY*2, bezierX*10, bezierY*2, bezierX*10, bezierY*8, bezierX*13, bezierY*8);

//bezier arc topright botleft
bezier(bezierX*13, bezierY*2, bezierX*10, bezierY*2, bezierX*10, bezierY*8, bezierX*7, bezierY*8);




//2 Medium shape
//ellipse left
ellipseMode(CENTER);
ellipse(ellipseHeight*4, ellipseWidth*5, ellipseSize*2, ellipseSize*2);

//elipse right
ellipseMode(CENTER);
ellipse(ellipseHeight*16, ellipseWidth*5, ellipseSize*2, ellipseSize*2);


//arc left
ellipseMode(CENTER);
arc(arcHeight*8, arcWidth, arcSize*2, arcSize*2, radians(90), radians(270));

//arc right
ellipseMode(CENTER);
arc(arcHeight*12, arcWidth, arcSize*2, arcSize*2, radians(270), radians(450));


//bezier ellipse topleft botright
bezier(bezierX*4, bezierY*3, bezierX*8, bezierY*3, bezierX*12, bezierY*7, bezierX*16, bezierY*7);

//bezier ellipse topright botleft
bezier(bezierX*16, bezierY*3, bezierX*12, bezierY*3, bezierX*8, bezierY*7, bezierX*4, bezierY*7);


//bezier arc topleft botright
bezier(bezierX*8, bezierY*3, bezierX*10, bezierY*3, bezierX*10, bezierY*7, bezierX*12, bezierY*7);

//bezier arc topright botleft
bezier(bezierX*12, bezierY*3, bezierX*10, bezierY*3, bezierX*10, bezierY*7, bezierX*8, bezierY*7);




//3 Small shape
//ellipse left
ellipseMode(CENTER);
ellipse(ellipseHeight*4, ellipseWidth*5, ellipseSize, ellipseSize);

//elipse right
ellipseMode(CENTER);
ellipse(ellipseHeight*16, ellipseWidth*5, ellipseSize, ellipseSize);


//arc left
ellipseMode(CENTER);
arc(arcHeight*8, arcWidth, arcSize, arcSize, radians(90), radians(270));

//arc right
ellipseMode(CENTER);
arc(arcHeight*12, arcWidth, arcSize, arcSize, radians(270), radians(450));


//bezier ellipse topleft botright
bezier(bezierX*4, bezierY*4, bezierX*8, bezierY*4, bezierX*12, bezierY*6, bezierX*16, bezierY*6);

//bezier ellipse topright botleft
bezier(bezierX*16, bezierY*4, bezierX*12, bezierY*4, bezierX*8, bezierY*6, bezierX*4, bezierY*6);


//bezier arc topleft botright
bezier(bezierX*8, bezierY*4, bezierX*10, bezierY*4, bezierX*10, bezierY*6, bezierX*12, bezierY*6);

//bezier arc topright botleft
bezier(bezierX*12, bezierY*4, bezierX*10, bezierY*4, bezierX*10, bezierY*6, bezierX*8, bezierY*6);


float w = width;
while (w > 0) {
  stroke(205);
  ellipse(width/2, height/2, w*2, w*2);
  w = w - 5;
}


}



void mouseClicked() {
 strokeW = ceil(random(8))+2;
 alphas = 100 - ceil(map(strokeW, 3, 10, 0, 100)); 
//ellipseSize = ellipseSize + random(-3, +3);
//arcSize = arcSize + random(-3, +3);
//bezierX = bezierX + random(-1, +1);



noFill();
stroke(100, 100, 100, alphas);
strokeWeight(strokeW);


//1 Large Shape (beziers)
//bezier ellipse topleft botright
bezier(bezierX*4, bezierY*2, bezierX*8, bezierY*2, bezierX*12, bezierY*8, bezierX*16, bezierY*8);

//bezier ellipse topright botleft
bezier(bezierX*16, bezierY*2, bezierX*12, bezierY*2, bezierX*8, bezierY*8, bezierX*4, bezierY*8);

//bezier arc topleft botright
bezier(bezierX*7, bezierY*2, bezierX*10, bezierY*2, bezierX*10, bezierY*8, bezierX*13, bezierY*8);

//bezier arc topright botleft
bezier(bezierX*13, bezierY*2, bezierX*10, bezierY*2, bezierX*10, bezierY*8, bezierX*7, bezierY*8);


//2 Medium shape (beziers)
//bezier ellipse topleft botright
bezier(bezierX*4, bezierY*3, bezierX*8, bezierY*3, bezierX*12, bezierY*7, bezierX*16, bezierY*7);

//bezier ellipse topright botleft
bezier(bezierX*16, bezierY*3, bezierX*12, bezierY*3, bezierX*8, bezierY*7, bezierX*4, bezierY*7);


//bezier arc topleft botright
bezier(bezierX*8, bezierY*3, bezierX*10, bezierY*3, bezierX*10, bezierY*7, bezierX*12, bezierY*7);

//bezier arc topright botleft
bezier(bezierX*12, bezierY*3, bezierX*10, bezierY*3, bezierX*10, bezierY*7, bezierX*8, bezierY*7);


//3 Small shape (beziers)
//bezier ellipse topleft botright
bezier(bezierX*4, bezierY*4, bezierX*8, bezierY*4, bezierX*12, bezierY*6, bezierX*16, bezierY*6);

//bezier ellipse topright botleft
bezier(bezierX*16, bezierY*4, bezierX*12, bezierY*4, bezierX*8, bezierY*6, bezierX*4, bezierY*6);

//bezier arc topleft botright
bezier(bezierX*8, bezierY*4, bezierX*10, bezierY*4, bezierX*10, bezierY*6, bezierX*12, bezierY*6);

//bezier arc topright botleft
bezier(bezierX*12, bezierY*4, bezierX*10, bezierY*4, bezierX*10, bezierY*6, bezierX*8, bezierY*6);






//1 Large Shape (ellipse & arc)
//arc left
ellipseMode(CENTER);
arc(arcHeight*7, arcWidth, arcSize*3, arcSize*3, radians(90), radians(270));

//arc right
ellipseMode(CENTER);
arc(arcHeight*13, arcWidth, arcSize*3, arcSize*3, radians(270), radians(450));

//ellipse left
ellipseMode(CENTER);
ellipse(ellipseHeight*4, ellipseWidth*5, ellipseSize*3, ellipseSize*3);

//elipse right
ellipseMode(CENTER);
ellipse(ellipseHeight*16, ellipseWidth*5, ellipseSize*3, ellipseSize*3);

//arc left
ellipseMode(CENTER);
arc(arcHeight*7, arcWidth, arcSize*3, arcSize*3, radians(90), radians(270));

//arc right
ellipseMode(CENTER);
arc(arcHeight*13, arcWidth, arcSize*3, arcSize*3, radians(270), radians(450));




// Medium shape (ellipse & arc)
//ellipse left
ellipseMode(CENTER);
ellipse(ellipseHeight*4, ellipseWidth*5, ellipseSize*2, ellipseSize*2);

//elipse right
ellipseMode(CENTER);
ellipse(ellipseHeight*16, ellipseWidth*5, ellipseSize*2, ellipseSize*2);


//arc left
ellipseMode(CENTER);
arc(arcHeight*8, arcWidth, arcSize*2, arcSize*2, radians(90), radians(270));

//arc right
ellipseMode(CENTER);
arc(arcHeight*12, arcWidth, arcSize*2, arcSize*2, radians(270), radians(450));





//3 Small shape (ellipse & arc)
//ellipse left
ellipseMode(CENTER);
ellipse(ellipseHeight*4, ellipseWidth*5, ellipseSize, ellipseSize);

//elipse right
ellipseMode(CENTER);
ellipse(ellipseHeight*16, ellipseWidth*5, ellipseSize, ellipseSize);


//arc left
ellipseMode(CENTER);
arc(arcHeight*8, arcWidth, arcSize, arcSize, radians(90), radians(270));

//arc right
ellipseMode(CENTER);
arc(arcHeight*12, arcWidth, arcSize, arcSize, radians(270), radians(450));


if(mouseX > height/2) { 
  ellipseSize = ellipseSize + random(+3, +3);  
  arcSize = arcSize + random(+3, +3);
  bezierX = bezierX + random(+1, +1);
} else {  
  ellipseSize = ellipseSize + random(-3, -3);
  arcSize = arcSize + random(-3, -3);
  bezierX = bezierX + random(-1, -1);
}



}


//arcSize = arcSize + random(-3, +3);
//bezierX = bezierX + random(-1, +1);





/*
The artist I selected is Heather Hansen. She makes symmetrical chacoal drawings
using her entire body. She creates lots of circles and curvy lines. I found these
to connect with the ellipse, arc, and bezier tools. I feel like I captured her 
style of work with the piece of work that I created.
*/


