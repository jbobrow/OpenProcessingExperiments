
//Homework 2
//copyright Maitri Shah September 2011 Pittsburgh,PA

size(500,500);

float x,y,wd,ht;
x=250;
y=250;
wd=25;
ht=25;

//Base Circle
ellipse(x,y,16*wd,16*ht);

//letter D
stroke(240,122,12);
strokeWeight(6);
noFill();

beginShape();

curveVertex(x-4*wd,y-8*ht);
curveVertex(x-2*wd,y-7*ht);
curveVertex(x,y-6*ht);
curveVertex(x+wd,y-5*ht);
curveVertex(x+2*wd,y-3*ht);
curveVertex(x+3*wd,y);
curveVertex(x+3*wd,y+5*ht);
curveVertex(x+wd,y+7*ht);
curveVertex(x-wd,y+7*ht);
curveVertex(x-3*wd,y+6*ht);
curveVertex(x-3*wd,y+4*ht);
curveVertex(x-2*wd,y+2*ht);
curveVertex(x,y-ht);
curveVertex(x+wd,y+ht);
curveVertex(x+3*wd,y+2*ht);
curveVertex(x+4*wd,y+3*ht);

endShape();

//Letter M

stroke(178,12,240);
strokeWeight(10);

beginShape();

curveVertex(x-9*wd,y+4*ht);
curveVertex(x-7*wd,y+2*ht);
curveVertex(x-7*wd,y-2*ht);
curveVertex(x-6*wd,y-3*ht);
curveVertex(x-5*wd,y-3*ht);
curveVertex(x-4*wd,y+2*ht);
curveVertex(x-3*wd,y-3*ht);
curveVertex(x-2*wd,y-3*ht);
curveVertex(x- wd,y-2*ht);
curveVertex(x- wd,y+2*ht);
curveVertex(x+wd,y+4*ht);

endShape();

//Letter S

stroke(32,111,27);
strokeWeight(12);

beginShape();

curveVertex(x+6*wd,y-4*ht);
curveVertex(x+5*wd,y-5*ht);
curveVertex(x+3*wd,y-6*ht);
curveVertex(x+2*wd,y-6*ht);
curveVertex(x     ,y-5*ht);
curveVertex(x     ,y-3*ht);
curveVertex(x+wd  ,y-  ht);
curveVertex(x+2*wd,y     );
curveVertex(x+4*wd,y     );
curveVertex(x+6*wd,y+  ht);
curveVertex(x+7*wd,y+2*ht);
curveVertex(x+7*wd,y+4*ht);
curveVertex(x+5*wd,y+6*ht);
curveVertex(x+3*wd,y+6*ht);
curveVertex(x+  wd,y+5*ht);
curveVertex(x+  wd,y+3*ht);

endShape();


