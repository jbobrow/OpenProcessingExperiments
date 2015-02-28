
//Orginal 
int a=abs(21);
int b=abs(116);
int c=abs(158);
//Teal Color//
int d=abs(19);
int e=abs(155);
int f=abs(159);

var ellipseDia = 100;

void setup () {
  size(400,800);
  background(252); }

void draw () {
   background(255);
   ellipseMode(CENTER);
   

stroke(5,36,50,40);
   fill(100);
   ellipse(200, 150, ellipseDia, ellipseDia);
  
  ellipseDia = map(mouseX, 0, width, mouseY, 0, height);


//MOON Radius FX///
noStroke();
fill(210,210,210,50);
ellipse(200,150,500,500);

fill(210,210,210,100);
ellipse(200,150,400,400);

fill(210,210,210,150);
ellipse(200,150,300,300);

fill(210,210,210,200);
ellipse(200,150,200,200);



//Light-Gray  Land shapes - Start Here //
noStroke();
fill(217);

beginShape();
vertex(400,300);
vertex(0,360);
vertex(400,420);
endShape();

beginShape();
vertex(400,420);
vertex(0,500);
vertex(400,580);
endShape();

beginShape();
vertex(400,580);
vertex(0,650);
vertex(400,700);
endShape();

beginShape();
vertex(400,700);
vertex(0,750);
vertex(400,800);
endShape();
//Light-Gray  Land shapes - End Here //


//Dark Blue Land shapes - Start Here //


fill(9,62,85);
beginShape();
vertex(0,300);
vertex(400,300);
vertex(0,360);
endShape();

//Texture Top Section -Green- Starts Here
stroke(18,121,45,110);
noFill();
line(1,300,1,320);
line(4,300,3,340);
line(7,300,7,330);
line(10,300,10,315);
line(13,300,13,335);
line(17,300,17,320);
line(20,300,20,325);
line(23,300,23,340);
line(26,300,26,315);
line(30,300,30,310);
line(33,300,33,325);
line(36,300,36,330);
line(39,300,39,320);
line(41,300,41,315);
line(44,300,44,330);
line(49,300,49,315);
line(52,300,52,330);
line(55,300,55,340);
line(59,300,59,315);
line(62,300,62,330);
line(66,300,66,310);
line(69,300,69,315);
line(73,300,73,325);
line(76,300,76,320);
line(80,300,80,310);
line(83,300,83,320);
line(86,300,86,330);
line(92,300,92,315);
line(95,300,95,330);
line(98,300,98,320);
line(101,300,101,315);
line(104,300,104,320);
line(107,300,107,330);
line(110,300,110,340);
line(114,300,114,315);
line(117,300,117,325);
line(120,300,120,335);
line(123,300,120,310);
line(126,300,126,320);
line(129,300,129,340);
line(131,300,131,315);
line(134,300,134,330);
line(137,300,137,310);
line(141,300,141,330);
line(144,300,144,340);
line(147,300,147,330);
line(151,300,151,310);
line(153,300,153,325);
line(156,300,153,340);
line(160,300,160,310);
line(163,300,163,330);
line(166,300,166,320);
line(169,300,169,340);
line(171,300,171,310);
line(174,300,174,320);
line(177,300,177,330);
line(180,300,180,310);
line(183,300,183,325);
line(186,300,186,335);
line(189,300,189,330);
line(192,300,192,310);
line(195,300,195,320);
line(197,300,197,310);
line(200,300,200,325);
line(203,300,203,305);
line(206,300,206,315);
line(209,300,209,320);
line(211,300,211,325);
line(213,300,213,305);
line(216,300,216,304);
line(219,300,219,308);
line(221,300,221,312);
line(223,300,223,320);
line(226,300,226,315);
line(229,300,229,318);
line(231,300,231,310);
line(235,300,235,320);
line(238,300,238,315);
line(241,300,241,320);
line(245,300,245,310);
line(249,300,249,318);
line(252,300,252,312);
line(255,300,255,308);
line(258,300,258,310);
line(261,300,261,309);
line(264,300,264,313);
line(267,300,267,320);
line(270,300,270,310);
line(273,300,273,309);
line(276,300,276,313);
line(280,300,280,308);
line(283,300,283,307);
line(286,300,286,305);
line(290,300,290,308);
line(293,300,293,310);
line(296,300,296,307);
line(299,300,299,305);
line(302,300,302,303);
line(305,300,305,307);
line(308,300,308,309);
line(311,300,311,304);
line(314,300,314,307);
line(317,300,317,309);
line(320,300,320,304);
line(323,300,323,303);
line(326,300,326,305);
line(330,300,330,307);
line(333,300,333,306);
line(336,300,336,308);
line(339,300,339,305);
line(342,300,342,302);
line(345,300,345,303);
line(348,300,348,305);
line(351,300,351,302);
line(355,300,355,303);
line(358,300,358,301);
line(361,300,361,302);
line(364,300,364,303);
line(367,300,367,302);
line(370,300,370,301);
line(374,300,370,301);
line(376,300,376,301);
//Texture Top Section -Green- Ends Here


//  mountain-1
noStroke();
fill(a,b,c);
beginShape();
vertex(360,300);
vertex(305,410);
vertex(400,420);
endShape();

//mountain-2
beginShape();
vertex(310,420);
vertex(260,300);
vertex(200,420);
endShape();

//mountain-3
beginShape();
vertex(235,440);
vertex(170,310);
vertex(100,400);
endShape();

//mountain4
beginShape();
vertex(125,400);
vertex(100,320);
vertex(50,400);
endShape();

//mountain5
beginShape();
vertex(80,400);
vertex(60,350);
vertex(20,400);
endShape();

//mountain6
beginShape();
vertex(50,400);
vertex(40,340);
vertex(0,400);
endShape();


//mountain7
beginShape();
vertex(-30,400);
vertex(15,350);
vertex(60,400);
endShape();


//Blue Area 2//
fill(9,62,85);
beginShape();
vertex(0,360);
vertex(400,420);
vertex(0,500);
endShape();

//mountain 2-1
noStroke();
fill(a,b,c);
beginShape();
vertex(365,430);
vertex(300,570);
vertex(420,582);
endShape();

//mountain2-2
beginShape();
vertex(265,450);
vertex(305,570);
vertex(180,580);
endShape();

//mountain2-3
beginShape();
vertex(170,430);
vertex(220,570);
vertex(70,580);
endShape();

//mountain2-4
beginShape();
vertex(90,450);
vertex(120,570);
vertex(0,580);
endShape();

//mountain2-5
beginShape();
vertex(30,460);
vertex(75,570);
vertex(-40,580);
endShape();

//Shape
fill(9,62,85);
beginShape();
vertex(0,500);
vertex(400,580);
vertex(0,650);
endShape();

//LINED TEXTURE-GREEN-MIDDLE SECTION//
noFill();
stroke(18,121,45,110);
line(0,505,15,505);
line(0,510,30,510);
line(0,515,40,515);
line(0,520,90,520);
line(0,525,70,525);
line(0,530,130,530);
line(0,535,100,535);
line(0,540,170,540);
line(0,545,220,545);
line(0,550,200,550);
line(0,555,230,555);
line(0,560,270,560);
line(0,565,340,565);
line(0,570,250,570);
line(0,573,330,573);
line(0,575,350,575);
line(0,580,380,580);
line(0,585,360,585);
line(0,590,350,590);
line(0,595,320,595);
line(0,600,250,600);
line(0,605,270,605);
line(0,610,200,610);
line(0,615,170,615);
line(0,620,120,620);
line(0,625,90,625);
line(0,630,50,630);
line(0,635,40,635);
line(0,640,20,640);
line(0,645,10,645);
//TEXTURE-GREEN-ENDS-MIDDLE//


// Mountains Layer 3
//mountain 3-1
noStroke();
fill(a,b,c);
beginShape();
vertex(365,580);
vertex(300,700);
vertex(400,700);
endShape();

//mountain3-2
beginShape();
vertex(265,560);
vertex(320,700);
vertex(180,700);
endShape();

//mountain3-3
beginShape();
vertex(160,570);
vertex(220,700);
vertex(70,700);
endShape();

//mountain3-4
beginShape();
vertex(75,600);
vertex(120,700);
vertex(0,700);
endShape();

//mountain3-6
beginShape();
vertex(25,620);
vertex(80,740);
vertex(-20,700);
endShape();

//mountain3-6
beginShape();
vertex(2,640);
vertex(20,740);
vertex(-30,700);
endShape();

//Shape
fill(9,62,85);
beginShape();
vertex(0,650);
vertex(400,700);
vertex(0,750);
endShape();

///Mountain 4
noStroke();
fill(a,b,c);
//mountain 4-1
beginShape();
vertex(365,710);
vertex(300,800);
vertex(400,800);
endShape();

//mountain4-2
beginShape();
vertex(265,690);
vertex(305,800);
vertex(180,800);
endShape();

//mountain4-3
beginShape();
vertex(160,690);
vertex(220,800);
vertex(70,800);
endShape();

//mountain4-4
beginShape();
vertex(80,700);
vertex(120,800);
vertex(10,800);
endShape();

//mountain4-5
beginShape();
vertex(80,700);
vertex(60,800);
vertex(20,800);
endShape();

//mountain4-6
beginShape();
vertex(20,720);
vertex(60,800);
vertex(-40,800);
endShape();


fill(9,62,85);
beginShape();
vertex(0,750);
vertex(400,800);
vertex(0,800);
endShape();

///Green-Texure-Bottom Layer Start
stroke(18,121,45,110);
noFill();
line(1,800,1,780);
line(4,800,3,770);
line(7,800,7,780);
line(10,800,10,775);
line(13,800,13,785);
line(17,800,17,780);
line(20,800,20,775);
line(23,800,23,760);
line(26,800,26,785);
line(30,800,30,790);
line(33,800,33,780);
line(36,800,36,770);
line(39,800,39,780);
line(41,800,41,785);
line(44,800,44,770);
line(49,800,49,785);
line(52,800,52,770);
line(55,800,55,760);
line(59,800,59,775);
line(62,800,62,770);
line(66,800,66,790);
line(69,800,69,785);
line(73,800,73,775);
line(76,800,76,780);
line(80,800,80,790);
line(83,800,83,780);
line(86,800,86,770);
line(92,800,92,785);
line(95,800,95,770);
line(98,800,98,780);
line(101,800,101,785);
line(104,800,104,780);
line(107,800,107,770);
line(110,800,110,760);
line(114,800,114,785);
line(117,800,117,775);
line(120,800,120,765);
line(123,800,120,790);
line(126,800,126,780);
line(129,800,129,770);
line(131,800,131,785);
line(134,800,134,770);
line(137,800,137,780);
line(141,800,141,770);
line(144,800,144,770);
line(147,800,147,780);
line(151,800,151,790);
line(153,800,153,775);
line(156,800,153,780);
line(160,800,160,790);
line(163,800,163,784);
line(166,800,166,780);
line(169,800,169,779);
line(171,800,171,790);
line(174,800,174,780);
line(177,800,177,784);
line(180,800,180,790);
line(183,800,183,785);
line(186,800,186,787);
line(189,800,189,784);
line(192,800,192,790);
line(195,800,195,780);
line(197,800,197,790);
line(200,800,200,785);
line(203,800,203,795);
line(206,800,206,785);
line(209,800,209,780);
line(211,800,211,785);
line(213,800,213,795);
line(216,800,216,794);
line(219,800,219,792);
line(221,800,221,788);
line(223,800,223,785);
line(226,800,226,785);
line(229,800,229,788);
line(231,800,231,780);
line(235,800,235,788);
line(238,800,238,785);
line(241,800,241,789);
line(245,800,245,790);
line(249,800,249,788);
line(252,800,252,789);
line(255,800,255,794);
line(258,800,258,790);
line(261,800,261,791);
line(264,800,264,788);
line(267,800,267,789);
line(270,800,270,790);
line(273,800,273,791);
line(276,800,276,793);
line(280,800,280,798);
line(283,800,283,797);
line(286,800,286,795);
line(290,800,290,798);
line(293,800,293,790);
line(296,800,296,797);
line(299,800,299,795);
line(302,800,302,793);
line(305,800,305,797);
line(308,800,308,799);
line(311,800,311,794);
line(314,800,314,797);
line(317,800,317,799);
line(320,800,320,794);
line(323,800,323,793);
line(326,800,326,795);
line(330,800,330,797);
line(333,800,333,796);
line(336,800,336,798);
line(339,800,339,798);
line(342,800,342,798);
line(345,800,345,796);
line(348,800,348,795);
line(351,800,351,798);
line(355,800,355,797);
line(358,800,358,799);
line(361,800,361,798);
line(364,800,364,797);
line(367,800,367,798);
line(370,800,370,799);
line(374,800,370,799);
line(376,800,376,799);
//Green Texture-Bottom Layer Ends

//Dark Blue Land shapes - End Here //

ellipseMode(CENTER);

//SNOW STARTS HERE//
//Top Area Dark//
/*
noStroke();
fill(255);

ellipse(30,320,10,10);
ellipse(60,310,4,4);
ellipse(110,320,2,2);
ellipse(10,340,5,5);
ellipse(80,330,15,15);
ellipse(140,320,12,12);
ellipse(200,315,3,3);
*/
//Gray Area 1//
noStroke();
fill(255);
ellipse(105,350,6,6);
ellipse(200,360,10,10);
ellipse(270,340,16,16);
ellipse(350,320,10,10);
ellipse(370,370,15,15);
ellipse(290,380,5,5);
ellipse(150,350,12,12);
ellipse(390,310,4,4);

//Blue Area 2//
ellipse(40,400,20,20);
ellipse(90,440,10,10);
ellipse(10,460,5,5);
ellipse(50,470,7,7);
ellipse(200,420,16,16);
ellipse(145,400,4,4);
ellipse(320,420,5,5);
ellipse(260,428,10,10);
ellipse(125,425,13,13);
ellipse(150,460,4,4);

//White Area 2//
ellipse(90,495,17,17);
ellipse(150,490,10,10);
ellipse(210,465,10,10);
ellipse(250,480,8,8);
ellipse(275,530,4,4);
ellipse(320,500,12,12);
ellipse(390,530,9,9);
ellipse(380,450,15,15);
ellipse(360,480,5,5);
ellipse(300,450,12,12);

//Dark Area 3//
/*
ellipse(20,610,8,8);
ellipse(40,560,20,20);
ellipse(80,530,10,10);
ellipse(10,520,4,4);
ellipse(60,630,5,5);
ellipse(105,610,14,14);
ellipse(120,570,11,11);
ellipse(175,560,6,6);
ellipse(300,580,10,10);
ellipse(250,567,3,3);
ellipse(240,589,6,6);
ellipse(160,600,10,10);
*/
//White Area 3//
ellipse(370,610,15,15);
ellipse(390,670,5,5);
ellipse(310,660,10,10);
ellipse(290,620,12,12);
ellipse(210,650,9,9);
ellipse(110,640,10,10);

//Dark Area 4//
ellipse(55,680,12,12);
ellipse(20,700,5,5);
ellipse(80,720,15,15);
ellipse(120,690,9,9);
ellipse(165,710,7,7);
ellipse(210,690,10,10);
ellipse(270,701,12,12);
ellipse(320,700,5,5);

//White Area 4//
ellipse(370,720,10,10);
ellipse(390,360,5,5);
ellipse(280,760,10,10);
ellipse(220,740,12,12);
ellipse(170,750,8,8);
ellipse(340,755,10,10);
/*
//Dark Area 5//
ellipse(30,770,8,8);
ellipse(68,785,11,11);
ellipse(100,780,7,7);
ellipse(160,790,5,5);
ellipse(220,789,9,9);
*/
//SNOW IS COMPLETED//

}


void  mouseClicked() { 
a=d; b=e; c=f;

d=a;
e=b;
f=c;

}

/*
Devon Nitz - Design Problem 1 - Inspired By Sanna Annuka
  Sanna Annukka, currently lives in Brighton England and works 
as a Printmaker and Textile Designer. She's done many commerical
works as well, however she's been working as mostly a freelancer
as of recently. Her works express flat design through patterns, and
minimal color pallettes. Her designs tend to showcase aspects from
many different traditional cultures.
   I was inspired by Sanna Annukka's screenprint works, Inari &
Kainuu, which both use a tall height and shorter width for its size.
Both work with a centerual sun/moon shape near the top of the design,
and use layers of patterns to work to the bottom on the image. 
  With the use of flat colors, and the ellipses as a repetition
I attempted to reflect Annuka's design sense, which I believe I established well.
I had planned to add a more layering effect with the addition of mountains of 
the light gray floor shapes, however I was unable to figure it out by the 
time this assigment was due. I do plan to go back in and add those shapes 
at somepoint, in the near future. 
*/                                                                


