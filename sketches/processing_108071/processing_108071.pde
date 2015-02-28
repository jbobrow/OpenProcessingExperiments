
//hw 2 - in class exercise - more initials
//edenweingart

size(400, 400 );
rectMode(CENTER);

//variables
float x=200;
float y=200;

float wd=275;
float ht=275;

//background
noStroke();
fill(214, 62, 19);
background(255, 96, 52);
rect(x-wd*.5, y, wd, ht*2);

//head
noStroke();
fill(255, 242, 237);
ellipse( x, y, wd*1.05, ht*1.05);

//ears
ellipse( x-wd*.525, y-ht*.09, wd*.15, ht*.125);
ellipse( x+wd*.525, y-ht*.09, wd*.15, ht*.125);;

//left glasses
fill(255);
stroke(0);
strokeWeight(5);
beginShape();
  curveVertex(x+wd*.01, y-ht*.5);
  
  curveVertex(x, y-ht*.15);
  curveVertex(x-wd*.1, y+ht*.01);
  curveVertex(x-wd*.3, y+ht*.01);
  curveVertex(x-wd*.4,y-ht*.15);
  
  curveVertex(x-wd*.35, y-ht*.5);
endShape();

//right glasses
beginShape();
  curveVertex(x-wd*.01, y-ht*.5);
  
  curveVertex(x, y-ht*.15);
  curveVertex(x+wd*.1, y+ht*.01);
  curveVertex(x+wd*.3, y+ht*.01);
  curveVertex(x+wd*.4, y-ht*.15);
  
  curveVertex(x+wd*.35, y-ht*.5);
endShape();

//glasses
line(x-wd*.55, y-ht*.15, x+wd*.55, y-ht*.15);

//eyes
strokeWeight(8);
point(x-wd*.20, y-ht*.07);
point(x+wd*.20, y-ht*.07);

//mustache
noStroke();
fill(129, 117, 107);
arc(x, y+ht*.325, x-ht*.15, y-ht*.40, radians(180), radians(360));
stroke(255, 242, 237);
strokeWeight(3);
line(x, y+ht*.175, x, y+ht*.325);
line(x-wd*.085, y+ht*.17, x-wd*.085, y+ht*.325);
line(x+wd*.085, y+ht*.17, x+wd*.085, y+ht*.325);
line(x-wd*.17, y+ht*.17, x-wd*.17, y+ht*.325);
line(x+wd*.17, y+ht*.17, x+wd*.17, y+ht*.325);

//nose
noStroke();
fill(224, 197, 186);
quad(x-wd*.035, y-ht*.30, x+wd*.035, y-ht*.30, x+wd*.065, y+ht*.20, x-wd*.065, y+ht*.20);
triangle(x+wd*.065,y+ht*.20, x-wd*.065, y+ht*.20, x, y+ht*.25);


