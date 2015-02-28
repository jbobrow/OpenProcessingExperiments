
// joseph jung jjjung

size(400,400);
background(255,255,255);

//variables
float x = 200;
float y = 200;

float wd = 200;
float ht = 200;

fill(250,200,200);
noStroke();
ellipse(x,y,wd,ht);
ellipse(x-wd*.5,y,wd*.3,ht*.3);
ellipse(x+wd*.5,y,wd*.3,ht*.3);

fill(255);
ellipse(x-wd*.25,y-ht*.15,wd*.1,ht*.1);
ellipse(x+wd*.25,y-ht*.15,wd*.1,ht*.1);

fill(0);
ellipse(x-wd*.25,y-ht*.15,wd*.05,ht*.05);
ellipse(x+wd*.25,y-ht*.15,wd*.05,ht*.05);

noFill();
stroke(0);
strokeWeight(3);
rect(x-wd*.4,y-ht*.3,wd*.2,ht*.2,wd*.1);
rect(x+wd*.2,y-ht*.3,wd*.2,ht*.2,wd*.1);

//beginShape();
//curveVertex(x - wd*.75,  y+ht*.75);
//curveVertex(x - wd*.5 ,  y);
//curveVertex(x - wd*.25,  y-ht*.25);
//curveVertex(x         ,  y);
//curveVertex(x + wd*.25,  y+ht*.25);
//curveVertex(x + wd*.5 ,  y);
//curveVertex(x + wd*.75,  y-ht*.75);
//();

noStroke();
fill(150,110,110);
beginShape();
curveVertex(x-wd,y+ht);
curveVertex(x-wd*.8,y+ht*.7);
curveVertex(x-wd*.65,y+ht*.55);
curveVertex(x-wd*.55,y+ht*.3);
curveVertex(x-wd*.25,y+ht*.05);
curveVertex(x,y+ht*.15);
curveVertex(x+wd*.25,y+ht*.05);
curveVertex(x+wd*.55,y+ht*.3);
curveVertex(x+wd*.65,y+ht*.55);
curveVertex(x+wd*.8,y+ht*.7);
curveVertex(x+wd,y+ht);
endShape();



fill(255);
beginShape();
curveVertex(x-wd,y+ht);
curveVertex(x-wd*.8,y+ht*.7);
curveVertex(x-wd*.7,y+ht*.5);
curveVertex(x-wd*.55,y+ht*.45);
curveVertex(x,y+ht*.35);
curveVertex(x+wd*.55,y+ht*.45);
curveVertex(x+wd*.7,y+ht*.5);
curveVertex(x+wd*.8,y+ht*.7);
curveVertex(x+wd,y+ht);
endShape();

fill(180,80,80);
stroke(0);
strokeWeight(2.5);
bezier(x-wd*.15,y+ht*.25,x-wd*.1,y+ht*.8,x+wd*.1,y+ht*.8,x+wd*.2,y+ht*.14);

fill(255);
noStroke();
bezier(x-wd*.15,y+ht*.25,x-wd*.1,y+ht*.25,x+wd*.1,y+ht*.25,x+wd*.2,y+ht*.14);


noFill();
stroke(200,150,150);
strokeWeight(2.5);
bezier(x-wd*.1,y-ht*.1,x-wd*.06,y+ht*.15,x+wd*.1,y+ht*.11,x+wd*.1,y-ht*.28);



