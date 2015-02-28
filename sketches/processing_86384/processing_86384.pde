
//Copyright Yaakov Lyubetsky / ylyubets@andrew.cmu.edu / Januray 21th, 2013
//Homework #2 - Processing for the Arts
size(400, 400);
background(250, 97, 73);
smooth();

float x, y, wd, ht;
x = 50;
y = 50;
wd = 300;
ht = 300;

//temporary bounding box
fill(234, 196, 125);
noStroke();
rect(x, y, wd, ht);

stroke(242, 129, 15);
strokeWeight(10);


//Top of the "Y"
beginShape();
  curveVertex(x + .25*wd, .5*y); //guide point
  
  curveVertex(x + .25*wd, y);
  curveVertex(x + .32*wd, y + .18*wd);
  curveVertex(x + .5*wd, y + .25*ht);
  curveVertex(x + .72*wd, y + .18*wd);
  curveVertex(x + .75*wd, y);
   
  curveVertex(x + .75*wd, .5*y); //guide point
endShape();
 
 //Bottom of "Y"
line(x + .5*wd, y + .25*ht, x + .5*wd, y + .4*ht);

//Eyes
stroke(255);
ellipse(x + .32*wd, y + .4*ht, x / 5, y / 5);
ellipse(x + .72*wd, y + .4*ht, x / 5, y / 5);
stroke(0);
ellipse(x + .32*wd, y + .4*ht, x / 10, y / 10);
ellipse(x + .72*wd, y + .4*ht, x / 10, y / 10);

//Moustache
stroke(100, 50, 70);
beginShape();
  vertex(x + .32*wd, y + .5*ht);
  vertex(x + .72*wd, y + .5*ht);
  vertex(x + .85*wd, y + .7*ht);
  vertex(x + .2*wd, y + .7*ht);
endShape(CLOSE);

line(x + .4*wd, y + .5*ht,x + .3*wd, y + .7*ht);
line(x + .47*wd, y + .5*ht,x + .4*wd, y + .7*ht);
line(x + .55*wd, y + .5*ht,x + .61*wd, y + .7*ht);
line(x + .64*wd, y + .5*ht,x + .72*wd, y + .7*ht);

//Mouth
stroke(250, 154, 196);
beginShape();
  curveVertex(x + .25*wd, y + .72*ht); //guide point
  
  curveVertex(x + .25*wd, y + .78*ht);
  curveVertex(x + .35*wd, y + .85*ht);
  curveVertex(x + .5*wd, y + .78*ht);
  curveVertex(x + .65*wd, y + .85*ht);
  curveVertex(x + .8*wd, y + .78*ht);
  
  curveVertex(x + .8*wd, y + .72*ht);//guide point
endShape();

//Glasses
noFill();
stroke(0);
strokeWeight(4);
ellipse(x + .32*wd, y + .4*ht, x - 10, y - 10);
ellipse(x + .72*wd, y + .4*ht, x - 10, y - 10);

beginShape();
  curveVertex(x + .35*wd, y + .43*ht);//guidepoint
  
  curveVertex(x + .39*wd, y + .4*ht);
  curveVertex(x + .45*wd, y + .35*ht);
  curveVertex(x + .5*wd, y + .33*ht);
  curveVertex(x + .6*wd, y + .35*ht);
  curveVertex(x + .65*wd, y + .4*ht);
 
  curveVertex(x + .67*wd, y + .43*ht);//guide point
endShape();

//Ear_Left
//stroke(242, 129, 15);
//beginShape();
  //curveVertex(x + .2*wd, y + .28*ht);//guide point

 // curveVertex(x + .15*wd, y + .3*ht);
  //curveVertex(x + .08*wd, y + .35*ht);
  //curveVertex(x + .05*wd, y + .4*ht);
  //curveVertex(x + .05*wd, y + .5*ht);
  //curveVertex(x + .10*wd, y + .6*ht);

  //curveVertex(x + .15*wd, y + .62*ht);//guide point
//endShape();

//Ear_Right
//beginShape();
  //curveVertex(x + .8*wd, y + .28*ht);//guide point

  //curveVertex(x + .85*wd, y + .3*ht);
  //curveVertex(x + .92*wd, y + .35*ht);
  //curveVertex(x + .95*wd, y + .4*ht);
  //curveVertex(x + .95*wd, y + .5*ht);
  //curveVertex(x + .9*wd, y + .6*ht);

  //curveVertex(x + .85*wd, y + .62*ht);//guide point
//endShape();
