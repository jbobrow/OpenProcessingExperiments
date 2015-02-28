
//copyright Risa Hiyama
//background setting 
background(255, 204, 0);
strokeWeight(2);
size(700,700);

//references
float x=400;
float y=50;
float wd=100;
float ht=80;


fill(255, 192, 203);
beginShape();
curveVertex(x,y);
curveVertex(x,y);
curveVertex(x+wd*0.25,y+ht*0.25);
curveVertex(x,y+ht*0.5);
curveVertex(x-wd*0.55,y+ht*0.7);
curveVertex(x-wd*0.25,y+ht*0.9);
curveVertex(x+wd*0.25,y+ht*0.7);
//curveVertex(x+wd*0.65,y+ht*0.5);
curveVertex(x,y);
curveVertex(x,y);
endShape();



