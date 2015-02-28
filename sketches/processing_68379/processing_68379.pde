
void setup(){
  
  size(600,600);
  background(255,140,0);

}

void draw(){

smooth();

noStroke();

fill(94,38,18);
/*Hair, base*/
ellipse(width/2,224,281,310);

fill(94,38,18);
rect(175,175,250,40);

/*Blocker*/
fill(255,140,0);
rect(148,170,20,115);
rect(432,170,20,115);

fill(255,255,255);
/*Hair arch, left*/
ellipse(210, 212, 70, 93);
/*Hair arch, right*/
ellipse(390, 212, 70, 93);
ellipse(width/2, 300, 260, 360);
fill(94,38,18);
/*Hair round*/
ellipse(300,140,210,90);

/*Blocker*/
fill(255,140,0);
rect(148,282,304,200);
/*rect(148,0,304,145);*/

fill(240,240,240);
rect(173, 280, 254, 75);
ellipse(width/2, 338, 256, 300);

fill (230, 230, 230);
/*Left eye, concave*/
ellipse(222, 290, 80, 80);

/*Hey guys! So after playing around with this self-portrait, 
I figured out that this code allows for any random array of color can be assigned. 
You can specify how far into the 255 shades of RGB you need to go for each color, 
and the fourth number in the equation is the intensity/vividness ofthe color. Maximum of 255.
By defualt it's going at 30 fps, I think. Not sure how to change frame rate.*/
fill (random (255), random (255), random (255), 255);
/*Left eye*/
ellipse(235, 305, 30, 30);

fill(0, 0, 0);
/*Left pupil*/
ellipse(235, 305, 10, 10);

fill (94,38,18);
/*Left eyebrow*/
ellipse(width/2, 284, 258, 50);

fill(255,255,255);
/*browline overlay*/
ellipse(width/2, 280, 258, 50);
/*forehead overlay*/
rect(187, 188, 230, 100);
/*nose stem*/
rect (280, 300, 40, 80);
/*nose, round*/
ellipse(width/2, 380, 40, 30);
/*Left, nose/brow connector*/
rect(270, 300, 20, 20);

fill (94,38,18);
/*Right eyebrow*/
ellipse(373, 295, 98, 107);

fill(240,240,240);
/*R*/
ellipse(373, 300, 108, 107);
/*L nose, concave*/
ellipse(268, 344, 36, 80);
/*R nose, concave*/
ellipse(333, 328, 40, 110);

/*Blocker*/
fill(255,140,0);
rect(173, 400, 100, 100);

fill(240,240,240);
/*Left cheek*/
ellipse(230, 382, 100, 100);
/*Left cheek, chin*/
ellipse(290, 442, 100, 90);
/*Left ear*/
ellipse(165, 320, 40, 80);
/*Right ear*/
ellipse(435, 320, 40, 80);

fill (210, 210, 210);
/*Left ear, inner*/
ellipse(165, 320, 20, 60);
/*Right ear, inner*/
ellipse(435, 320, 20, 60);

fill (240, 240, 240);
/*Left ear, flap*/
ellipse(175, 320, 20, 30);
/*Right ear, flap*/
ellipse(425, 320, 20, 30);

fill (230, 230, 230);
/*Right eye, concave*/
ellipse(373, 305, 95, 115);

fill (random (255), random (255), random (255), 255);
/*Right eyeball*/
ellipse(370, 305, 30, 30);

fill(240, 128, 128);
/*Bottom lip*/
ellipse(width/2, 440, 50, 50);

fill(0,0,0);
/*Right pupil*/
ellipse(370, 305, 10, 10);
/*mouth*/
ellipse(width/2, 430, 50, 50);

fill(255, 255, 255);
/*teeth*/
ellipse(280, 420, 10, 10);
ellipse(290, 420, 10, 10);
ellipse(300, 420, 10, 10);
ellipse(310, 420, 10, 10);
ellipse(320, 420, 10, 10);

fill(240, 240, 240);
ellipse(width/2, 412, 80, 20);

fill(255, 255, 255);
/*nose*/
ellipse(315, 375, 20, 20);
ellipse(285, 375, 20, 20);

fill(240,240,240);
ellipse(375,360,100,60);

}

