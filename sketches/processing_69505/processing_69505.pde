
//Morgan D
//Computer Programming 1, Mods (13) 14-15
//Penguin
//URL -> http://padova.webs.com/MantaRaySite.html

size(300,300);
background(0,15,50);
smooth();
int incrementA;

//IncrementA will be used for my while loops, which will be used 
//to 'fade ot' the edges of certain shapes.

//Fish
noStroke();
incrementA=0;
while(incrementA<5) {
    fill(0,0,0,16-incrementA);
    ellipse(150+7.5*incrementA,50,30+incrementA,10+2*incrementA);
    ellipse(165+7.5*incrementA,50,34-incrementA,18-2*incrementA);
    triangle(165+2*incrementA,45+2*incrementA,193-2*incrementA,45+2*incrementA,200-2*incrementA,33+2*incrementA);
    triangle(180+incrementA,50,210+incrementA,40+incrementA,210+incrementA,60-incrementA);
    incrementA=incrementA+1;
}

//Eel
noFill();
incrementA=1;
while(incrementA<5) {
    strokeWeight(4*incrementA);
    stroke(0,0,0,50-26*incrementA/3);
    bezier(90+incrementA/2,230+incrementA,120+incrementA,210,90-incrementA,260,130-incrementA,270-incrementA/2);
    incrementA=incrementA+1;
}

//Mid Beam
incrementA=0;
noStroke();
fill(128,255,128,1);
while (incrementA<9) {
    triangle(250,-500,88-3*incrementA,400,112+5*incrementA,400);
    incrementA=incrementA+1;
}

//Manta interior.
fill(35,15,15);
triangle(35,100,49,160,150,120);
triangle(49,160,130,115,180,122);
triangle(100,180,45,160,178,121);
triangle(97,180,155,180,176,121);
triangle(154,180,251,195,174,122);

//Pare interior to outline.
stroke(0,15,50);
strokeWeight(10);
noFill();
bezier(32,95,60,118,115,105,110,110);
bezier(185,128,240,198,223,179,270,195);
bezier(180,188,175,190,175,185,270,205);
bezier(23,100,59,142,53,145,35,160);

//To make outline.
stroke(0);
strokeWeight(2);
bezier(30,100,60,130,150,100,180,130);
bezier(180,130,225,190,225,190,270,200);
bezier(100,180,175,180,175,180,270,200);
bezier(30,100,60,140,60,140,45,160);
bezier(161,119,220,130,220,135,220,135);
bezier(166,122,220,130,220,135,220,135);
arc(192,130,24,8,PI,3*PI/2);
fill(0);
triangle(166,122,188,126,178,127);

//Mouth Region
fill(255,255,255,60);
bezier(45,160,83,135,135,170,100,180);
fill(0,15,50);
bezier(45,160,72,150,113,170,100,180);
stroke(0,15,50);
strokeWeight(3);
line(49,161,98,179);

//Spots.
noStroke();
fill(160,150,100,70);
ellipse(49,116,5,6);
ellipse(60,119,5,6);
ellipse(71,120,5,6);
ellipse(82,121,5,6);
ellipse(93,121,5,6);
ellipse(104,121,5,6);
ellipse(115,121,5,6);
ellipse(126,121,5,6);
ellipse(137,122,5,6);
ellipse(148,123,5,6);
ellipse(159,126,5,6);
ellipse(170,131,5,6);
ellipse(179,139,5,6);
ellipse(187,149,5,6);
ellipse(194,158,5,6);
ellipse(201,167,5,6);
ellipse(208,176,5,6);
ellipse(216,183,5,6);
bezier(80,132,130,130,155,135,165,160);
bezier(80,132,35,138,120,142,123,146);
bezier(123,146,130,150,175,190,165,160);

//Left Beam
incrementA=0;
noStroke();
fill(128,255,128,1);
while (incrementA<15) {
    triangle(200,-500,20-8*incrementA,400,40+2*incrementA,400);
    incrementA=incrementA+1;
}

//Right Beam
incrementA=0;
while (incrementA<15) {
    triangle(300,-550,180-3*incrementA,400,200+6*incrementA,400);
    incrementA=incrementA+1;
}
