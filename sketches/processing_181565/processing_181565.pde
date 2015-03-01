
//Luca Seid
//Attempt at drawing a house

void setup ()
{
  size(800,600);
background(#A4F2FA);
}

void draw ()
{

 stroke(255);
 fill(255);
  ellipse(100,150,100,70);
  ellipse(97,170,120,50);
stroke(0);
fill(0);
  
rect(300,400,200,100);

fill(#BC930B);
triangle(120,98,180,70,180,98);
rectMode(CENTER);
rect(400,85,440,29);
triangle(680,98,620,70,620,98);


fill(210);
triangle(103,480,400,490,300,370); //Patio
triangle(500,480,697,480,490,370);

fill(#FFFB6C);
rectMode(CENTER); //lower level wall
rect(400,285,520,350); //patio


fill(255);
stroke(0);
rect(146,285,12,350); //trim sides
rect(654,285,12,350);
rect(235,104,190,12);
rect(565,104,190,12);
stroke(255);
rect(146,115,10,29);
rect(654,115,10,29);




stroke(0);
rectMode(CENTER); //Roof
line(80,265,180,210);
line(180,210,620,210);
line(620,210,720,265);

stroke(0);

rectMode(CENTER);
fill(#BC930B);
stroke(#BC930B);
rect(400,240,439,57);

stroke(0);

fill(#FFFB6C);
rectMode(CENTER); //Center Upper Wall
rect(400,170,150,120);
fill(255);
rect(331,170,12,120);

fill(255);
stroke(0);
rectMode(CENTER);
rect(469,168,12,125);
rect(400,224,150,12);
noStroke();
rect(331,215,10,20);
rect(470,215,10,20);

fill(255);
stroke(255);
stroke(0);
triangle(310,110,490,110,400,37);

fill(#FFFB6C);
triangle(325,110,475,110,400,50); //Top Triangle
stroke(#FFFB6C);
triangle(325,110,475,110,400,80);

fill(255);    //more trimming
stroke(0);
rect(331,107,12,12);
stroke(255);
rect(331,107,10,15);
stroke(255);
triangle(314,109,335,109,331,95);
stroke(0);
rect(469,106,12,12);
stroke(255);
rect(469,106,10,15);
stroke(255);
triangle(480,109,470,109,475,100);

stroke(0);

fill(255);
ellipse(400,155,100,100); //Circle Window
fill(#E0FFFF);
ellipse(400,155,85,85);

fill(255);
rectMode(CENTER); //left lower Window
rect(210,370,80,80);
fill(#E0FFFF);
rect(192,352,31,31);
rect(228,352,31,31);
rect(228,388,31,31);
rect(192,388,31,31);

fill(255);

rectMode(CENTER); //right lower window
rect(590,370,80,80);
fill(#E0FFFF);
rect(572,352,31,31);
rect(608,352,31,31);
rect(608,388,31,31);
rect(572,388,31,31);


fill(255);
rectMode(CENTER); //left upper window
rect(240,160,80,80);
fill(#E0FFFF);
rect(222,142,31,31);
rect(222,178,31,31);
rect(259,178,31,31);
rect(259,142,31,31);

fill(255);

rectMode(CENTER); //right upper window
rect(555,160,80,80);
fill(#E0FFFF);
rect(537,142,31,31);
rect(537,178,31,31);
rect(574,178,31,31);
rect(574,142,31,31);

fill(255);
rectMode(CENTER); //roof foundation
rect(400,273,640,15);

fill(210);
rectMode(CENTER); //patio foundation
rect(400,490,600,20);
rectMode(CENTER); //lower step
triangle(361,487,361,492,356,492);
triangle(440,492,440,487,445,492);
rect(400,490,80,6);
noStroke();
rect(436,490,10,4);
rect(365,490,10,4);
stroke(0);
rect(400,500,90,15);

noStroke();
fill(#BC930B);
rectMode(CENTER);
rect(182,85,5,27);
rect(619,85,5,27);


stroke(0);
fill(255);
rectMode(CENTER); //trim
rect(400,455,520,10);
stroke(255);
rect(146,445,10,20);
rect(654,445,10,20);


stroke(0);

rectMode(CENTER); //Door
rect(400,390,88,140);
fill(#BC930B);
rect(400,395,70,130);

fill(#EAD10E);
rect(425,400,7,17);
ellipse(425,400,8,8); //Door Handle
rectMode(CENTER); 

fill(255);
stroke(255);
rect(450,455,20,8);
rect(350,455,20,8);


stroke(0);
rectMode(CENTER); //far left beam
rect(118,380,20,200);
rect(110,380,20,200);

rectMode(CENTER); //middle left beam
rect(285,380,20,200);
rect(280,380,20,200);

rectMode(CENTER); //far right beam
rect(682,380,20,200);
rect(690,380,20,200);

rectMode(CENTER); //middle right beam
rect(515,380,20,200);
rect(520,380,20,200);

fill(210);
stroke(210);
rect(425,470,150,18);

fill(#BC930B);
noStroke();
triangle(180,211.5,180,265,83,265); //lower roof colors
triangle(620,211.5,720,265,620,265);

fill(255);
stroke(0);           //window panes
rect(130,104,22,12);
rect(670,104,22,12);
stroke(255);
rect(131,104,21,10);
rect(670,104,21,10);

stroke(0);
rect(400,155,6,85); //circle window panes 
rect(400,155,85,6);
stroke(255);
rect(400,155,94,4);
rect(400,155,4,94);

stroke(210); //pillar trim
fill(210);
triangle(120,479,130,479,140,465);
stroke(0);
line(121,479,128,473);
stroke(210);
fill(210);
triangle(291,479,300,479,300,470);
stroke(0);
line(291,479,295,473);
stroke(210);
triangle(509,479,500,479,500,470);
stroke(0);
line(509,479,505,473);
stroke(210);
fill(210);
triangle(680,479,670,479,670,472);
stroke(0);
line(680,479,672,472);

}



