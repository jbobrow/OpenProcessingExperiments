
//HomeWork 2 09/03/2013
//all right reserved to Chia-Fang Lue

size(400, 400);
background(240);
rectMode( CENTER );

//vaiables
float x = 200;
float y = 200;

float wd = 100;
float ht = 90;

fill(255, 214, 137);
noStroke();
ellipse(x, y, 2*wd, 2*ht);

//left glasses
fill(255, 255, 255);
stroke(100);//glasses golden frame
strokeWeight(2);
beginShape();
curveVertex(x-wd*.8, y-ht*.7);
curveVertex(x-wd*.8, y-ht*.5);
curveVertex(x-wd*.7, y-ht*.1);
curveVertex(x-wd*.3, y-ht*.1);
curveVertex(x-wd*.1, y-ht*.5);
curveVertex(x-wd*.1, y-ht*.3);
endShape();

//glasses frame
beginShape();
noFill();
curveVertex(x-wd, y);
curveVertex(x-wd, y);
curveVertex(x-wd-1, y-ht*.5);
curveVertex(x+wd+1, y-ht*.5);
curveVertex(x+wd, y);
curveVertex(x+wd, y);
endShape();


//right glasses
fill(255, 255, 255);
beginShape();
curveVertex(x+wd*.8, y-ht*.7);
curveVertex(x+wd*.8, y-ht*.5);
curveVertex(x+wd*.7, y-ht*.1);
curveVertex(x+wd*.3, y-ht*.1);
curveVertex(x+wd*.1, y-ht*.5);
curveVertex(x+wd*.1, y-ht*.3);
endShape();

//ears
fill(255, 214, 137);
noStroke();
ellipse(x-wd, y, 30, 30);
ellipse(x+wd, y, 30, 30);

//nose
stroke(240, 180, 68);
strokeWeight(3);
noFill();
beginShape();
curveVertex(x, y-ht*.1);
curveVertex(x, y-ht*.1);
curveVertex(x-wd*.2, y+ht*.2);
curveVertex(x, y+ht*.3);
curveVertex(x, y+ht*.3);
endShape();

//eyes
ellipseMode(RADIUS);
stroke(67, 40, 14);
fill(255);
strokeWeight(1);
ellipse(x-wd*.5, y-ht*.3, 9, 9); 
ellipse(x+wd*.5, y-ht*.3, 9, 9); 
noStroke();
fill(98, 59,22);
ellipseMode( CENTER);
ellipse(x-wd*.5, y-ht*.3, 8, 8);
ellipse(x+wd*.5, y-ht*.3, 8, 8);

//mounth
fill(240, 135, 82);
noStroke();
ellipse(x, y+ht*.65, 30, 20);

//beard
beginShape();
noStroke();
fill(155, 97, 42);
curveVertex(x-wd*.4, y+ht*.8);
curveVertex(x-wd*.5, y+ht*.8);
curveVertex(x, y+ht*.4);
curveVertex(x+wd*.5, y+ht*.8);
curveVertex(x, y+ht*.65);
curveVertex(x-wd*.5, y+ht*.8);
curveVertex(x-wd*.4, y+ht*.8);
endShape();




