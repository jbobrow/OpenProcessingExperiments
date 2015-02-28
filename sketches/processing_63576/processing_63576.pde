
void setup (){
size(600,600);

smooth();
}

void draw (){
background(255);
pushMatrix();

float irisX =   mouseX/15;
float irisX2 =   mouseX/15+100;
float irisY=   mouseY/15;
float x=245;
float x2=345;
float y=61;

//Arme
noStroke();
fill(93,5,118);
ellipse(115,275,118,25);
ellipse(499,275,118,25);

//Hörner
noStroke();
fill(50,2,64);
triangle(254,56,269,124,239,124);
triangle(354,57,368,124,339,124);
stroke(255);
strokeWeight(3);
line(243,107,265,103);
line(246,93,261,90);
line(249,78,259,80);
line(344,100,365,106);
line(347,87,362,93);
line(350,76,360,81);

//Körper
noStroke();
fill(93,5,118);
ellipse(306,316,343,418);

//Ohren
triangle(165,125,218,142,176,179);
triangle(450,128,439,182,398,145);

//Augen
noStroke();
fill(255);
ellipse(x,223,y,61);
ellipse(x2,223,y,61);

//Iris
noStroke();
fill(0,0,0);
ellipse(irisX+225,irisY+200,20,20);
ellipse(irisX2+225,irisY+200,20,20);

//Mund
noStroke();
fill(255);
rect(134,315,256,6);
noStroke();
fill(255);
triangle(178,279,200,316,154,318);
triangle(239,315,277,316,257,348);
triangle(324,292,339,316,308,316);
triangle(364,300,374,316,354,316);

//Füße
fill(93,5,118);
ellipse(223,526,110,30);
ellipse(388,526,110,30);

//flecken
fill(50,2,64);
ellipse(230,461,45,45);
ellipse(193,399,18,18);
ellipse(426,273,34,34);
ellipse(400,285,11,11);

if (irisX < x-10*y) {
    irisX = x-10+y;
  }
     
  if (irisX2 < x-10*y) {
     irisX2 = x-10*y ;  }
    
  if (irisY < x-10+y) {
    irisY = x-10*y ; }
    popMatrix();
   

if (mousePressed == true) {

//Arme
stroke(255);
fill(255);
ellipse(115,275,118,25);
ellipse(499,275,118,25);

//Körper
noStroke();
fill(93,5,118);
ellipse(306,316,343,418);

//Augenbraue
strokeCap(SQUARE);
stroke(0);
strokeWeight(7);
line(213,162,270,186);
line(323,188,380,150);

//Augen
noStroke();
fill(255);
ellipse(245,223,61,61);
ellipse(345,223,61,61);

//Augen Inneres
noStroke();
fill(0,0,0);
ellipse(245,223,20,20);
ellipse(345,223,20,20);

//Mund
noStroke();
fill(93,5,118);
rect(134,315,256,6);
triangle(178,279,200,316,154,318);
triangle(239,315,277,316,257,348);
triangle(324,292,339,316,308,316);
triangle(364,300,374,316,354,316);

fill(50,2,64);
ellipse(287,351,299,197);
fill(255);
triangle(174,286,207,267,205,305);
triangle(342,260,378,273,348,297);
triangle(267,422,279,448,250,446);
triangle(307,431,317,448,299,448);

//Füße
fill(93,5,118);
ellipse(223,526,110,30);
ellipse(388,526,110,30);

//flecken
fill(50,2,64);
ellipse(230,461,45,45);
ellipse(193,399,18,18);
ellipse(426,273,34,34);
ellipse(400,285,11,11);


}
}

