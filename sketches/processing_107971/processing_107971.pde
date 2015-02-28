
//more initials
//Annie Ranttila, aranttil, CMU, fall 2013

size(400, 400);
background(210, 245, 242);
rectMode(CENTER);

// variables
float x=200;
float y=200;

float wd=300;
float ht=300;

//face
fill(245, 224, 210);
stroke(245, 224, 210);
rect(x,y,wd,ht,wd*.3,wd*.3,wd*.4,wd*.4);

//hair
fill(229, 229, 229);
stroke(229, 229, 229);
rect(x, y-ht*.4, wd, ht*.2, wd*.3, wd*.3, 0,0);
rect(x-wd*.45, y-ht*.15, wd*.1, ht*.4,wd*.3, wd*.3, wd*.1,0);
rect(x+wd*.45, y-ht*.15, wd*.1, ht*.4,wd*.3, wd*.3,0, wd*.1);

//mustache
beginShape();
stroke(72,72,72);
strokeWeight(1);
curveVertex(x-wd*.35, y+ht*.40); //reference 
curveVertex(x-wd*.25, y+ht*.32);
curveVertex(x-wd*.2, y+ht*.18);
curveVertex(x+wd*.2, y+ht*.18);
curveVertex(x+wd*.25, y+ht*.32);
curveVertex(x+wd*.35, y+ht*.40); //reference
endShape();

//mouth
beginShape();
stroke(245,141,141);
strokeWeight(3);
fill(255);
curveVertex(x-wd*.23, y+ht*.30); //reference
curveVertex(x-wd*.18, y+ht*.32);
curveVertex(x-wd*.12, y+ht*.35);
curveVertex(x+wd*.12, y+ht*.35);
curveVertex(x+wd*.18, y+ht*.32);
curveVertex(x+wd*.23, y+ht*.30); //reference
endShape();


//glasses
fill(203,197,191,90);
stroke(203,197,191,90);
strokeWeight(1);
rect(x-wd*.2, y-wd*.05, wd*.3, y*.14);
rect(x+wd*.2, y-wd*.05, wd*.3, y*.14);
stroke(165,165,165);
strokeWeight(4);
line(x-wd*.5, y-wd*.1, x+wd*.5, y-wd*.1);
line(x-wd*.35, y-wd*.1, x-wd*.35, y);
line(x+wd*.35, y-wd*.1, x+wd*.35, y);
line(x-wd*.05, y-wd*.1, x-wd*.05, y);
line(x+wd*.05, y-wd*.1, x+wd*.05, y);
line(x-wd*.05, y-wd*.04, x+wd*.05, y-wd*.04);
beginShape();
curveVertex(x-wd*.35, y-wd*.1);
curveVertex(x-wd*.35, y);;
curveVertex(x-wd*.3, y+wd*.1);
curveVertex(x-wd*.12, y+wd*.1);
curveVertex(x-wd*.05, y);
curveVertex(x-wd*.05, y-wd*.1);
endShape();
beginShape();
curveVertex(x+wd*.35, y-wd*.1);
curveVertex(x+wd*.35, y);;
curveVertex(x+wd*.3, y+wd*.1);
curveVertex(x+wd*.12, y+wd*.1);
curveVertex(x+wd*.05, y);
curveVertex(x+wd*.05, y-wd*.1);
endShape();

//eyes
stroke(108,78,47);
strokeWeight(2);
line(x-wd*.2, y-ht*.06, x-wd*.15, y-ht*.01);
line(x-wd*.2, y-ht*.06, x-wd*.25, y-ht*.01);
line(x-wd*.23, y-ht*.029, x-wd*.17, y-ht*.029);
fill(255);
stroke(108,78,47);
strokeWeight(1);
triangle(x-wd*.23, y-ht*.029, x-wd*.17, y-ht*.029,x-wd*.2, y-ht*.06);
beginShape();
noFill();
strokeWeight(2);
  curveVertex(x+wd*.27,y-ht*.01);
  curveVertex(x+wd*.26, y-ht*.02);
  curveVertex(x+wd*.2, y-ht*.05);
  curveVertex(x+wd*.14, y-ht*.02);
  curveVertex(x+wd*.13,y-ht*.01);
endShape();



