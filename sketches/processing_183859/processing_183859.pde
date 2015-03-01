
size(650,400);
background(0);
smooth();

//Background Shapes
noStroke();
fill(255,0,0,85);
rect(0,125,width,50);
fill(0,255,0,70);
rect(0,150,width,75);
fill(0,0,255,85);
rect(0,200,width,75);
fill(255,0,0,70);
rect(0,250,width,25);

//"P" Shadow
noFill();
stroke(255);
strokeWeight(25);
arc(60,105,125,125,PI+HALF_PI,TWO_PI+HALF_PI);
//Above is ARC, below is RECT
fill(255);
noStroke();
rect(35,30,25,height-50);

//The Letter "P"
noFill();
stroke(250,103,140);
strokeWeight(25);
arc(50,100,125,125,PI+HALF_PI,TWO_PI+HALF_PI);
//Above is ARC, below is RECT
fill(250,103,140);
noStroke();
rect(25,25,25,height-50);

//"A" Shadow
fill(255);
rect(170,30,70,25);
rect(170,205,70,25);
//FOR QUADS: Left Up, Right Up, Right Down, Left Down)
quad(165,30,190,30,180,height-20,155,height-20);
quad(220,30,245,30,255,height-20,230,height-20);

//The Letter "A"
fill(242,46,94);
rect(165,25,70,25);
rect(165,200,70,25);
//FOR QUADS: Left Up, Right Up, Right Down, Left Down)
quad(160,25,185,25,175,height-25,150,height-25);
quad(215,25,240,25,250,height-25,225,height-25);

//"I" Shadow
fill(255);
rect(312,30,26,height-50);
quad(275,30,312,30,312,50,275,55);
quad(338,30,375,30,375,55,338,50);
quad(275,height-20,312,height-20,312,height-40,275,height-45);
quad(338,height-20,375,height-20,375,height-45,338,height-40);

//The Letter "I"
fill(152,9,43);
rect(312,25,26,height-50);
quad(275,25,312,25,312,45,275,50);
quad(338,25,375,25,375,50,338,45);
quad(275,height-25,312,height-25,312,height-45,275,height-50);
quad(338,height-25,375,height-25,375,height-50,338,height-45);

//"G" Shadow
fill(255);
rect(395,30,25,height-50);
quad(420,30,495,30,495,55,420,50);
quad(420,height-20,485,height-20,485,height-45,420,height-40);
rect(445,205,40,25);
quad(465,205,490,205,495,height-20,470,height-20);

//The Letter "G"
fill(242,46,94);
rect(400,25,25,height-50);
quad(425,25,500,25,500,50,425,45);
quad(425,height-25,490,height-25,490,height-50,425,height-45);
rect(450,200,40,25);
quad(470,200,495,200,500,height-25,475,height-25);

//"E" Shadow
fill(255);
rect(515,30,25,height-50);
quad(540,30,615,30,615,55,540,50);
quad(540,height-20,615,height-20,615,height-45,540,height-40);
rect(540,205,50,25);

//The Letter "E"
fill(250,103,140);
rect(525,25,25,height-50);
quad(550,25,625,25,625,50,550,45);
quad(550,height-25,625,height-25,625,height-50,550,height-45);
rect(550,200,50,25);

//Letters consist primarily of filled rectangles & quadrilaterals
//The exception of this is "P", which also contains an arc with a stroke of 25px wide
//Shadows created by copy-pasting the original lettering code, then shifting each object 5px down and 10px,5px,0px,-5px,-10px to the side, respectively.


