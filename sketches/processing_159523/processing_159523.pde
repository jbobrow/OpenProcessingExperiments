
//click for the sun to see you

void setup(){
size (600,400);
background (#75BDE8);
noStroke();
fill(255,0,0);
arc(300, 250, 600, 400, PI, TWO_PI);
fill(255,125,0);
arc(300, 250, 570, 370, PI, TWO_PI);
fill(255,255,0);
arc(300, 250, 540, 340, PI, TWO_PI);
fill(0,255,0);
arc(300, 250, 510, 310, PI, TWO_PI);
fill(0,0,255);
arc(300, 250, 480, 280, PI, TWO_PI);
fill(125,0,125);
arc(300, 250, 450, 250, PI, TWO_PI);
fill(255,0,255);
arc(300, 250, 420, 220, PI, TWO_PI);
fill(#75BDE8);
arc(300, 250, 390, 190, PI, TWO_PI);

fill(255,255,0);
stroke(255,255,0);
ellipse(400,300,80,80);
strokeWeight(5);
line(320,300,480,300);
strokeWeight(3);
line(350,250,450,350);
strokeWeight(5);
line(400,220,400,380);
strokeWeight(3);
line(350,350,450,250);


stroke(255,0,0);
arc(400, 318, 30, 30, 0+QUARTER_PI, HALF_PI+QUARTER_PI);



stroke(0,0,0);
strokeWeight(3);
rect(365,286,30,27);
rect(405,286,30,27);
line(395,300,405,300);

fill(#D9F7F6);
noStroke();
triangle(45,300,50,315,40,315);
triangle(65,305,70,320,60,320);
triangle(105,285,110,300,100,300);

triangle(500,285,505,300,495,300);
triangle(535,305,540,320,530,320);
triangle(485,270,490,285,480,285);
triangle(255,260,260,275,250,275);
triangle(245,250,250,265,240,265);

}



void draw(){
  

  
if(mousePressed){
fill(0,250,0);
noStroke();
ellipse(420,300,18,18);
ellipse(380,300,18,18);

fill(0,0,0);
noStroke();
ellipse(420,300,5,5);
ellipse(380,300,5,5);

}
else{
  
fill(0,250,0);
noStroke();
ellipse(420,300,18,18);

fill(250,250,0);
ellipse(380,300,24,24);
ellipse(420,300,24,24);
stroke(0,250,0);
strokeWeight(2);
line(372,300,387,300);
line(412,300,427,300);

}}


