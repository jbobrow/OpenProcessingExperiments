
size(400, 400);
background(70,55,55);
rectMode(CENTER);

float x=200;
float y=200;

float w= 100;
float h= 100;

//body
fill(40,35,180);
arc(x,y+h*2 ,w*4 , h*2, PI, TWO_PI , OPEN);

//hairtop
fill(200,200,200);
beginShape();
curveVertex(x/2+w/2,y/2+h/2);
curveVertex(x-w*.9, y-h*.2);
curveVertex(x-w, y-h*1.4);
curveVertex(x+w,  y-h*1.4);
curveVertex(x+w*1.2, y-h*.2);
curveVertex(x+2*w, y/4+h/2);
endShape();

//face
fill(250,200,146);
beginShape();
curveVertex(x/2-w/2,y/2-h/2);
curveVertex(x-w, y-w);
curveVertex(x-w, y+h);
curveVertex(x+w,  y+h);
curveVertex(x+w, y-h);
curveVertex(x+w*1.5, y/2-h/2);
endShape();


fill(200,200,200);
beginShape();
curveVertex(x/2-w/2,y/2-h/2);
curveVertex(x-w, y-w);
curveVertex(x, y-h*.9);
curveVertex(x+w*.8,  y-h*.8);
curveVertex(x+w, y-h);
curveVertex(x+w*1.5, y/2-h/2);
endShape();

line(x-w, y-h*.8, x+w, y-h*.8);//glasstop

fill(240,240,200);
arc(x-w/2,y-h*.75 ,w*.8 , h, 0, PI);//glassbottom
arc(x+w/2,y-h*.75 ,w*.8 , h, 0, PI);

//nose
noFill();
beginShape();
curveVertex(x,y-h*1.4);
curveVertex(x, y-h*.8);
curveVertex(x+h*.05, y+h*.2);
curveVertex(x-h*.4,  y);
curveVertex(x, y);
endShape();

//mustach top
noFill();
beginShape();
curveVertex(x-w/2,y+h*.8);
curveVertex(x-w/2, y+h*.7);
curveVertex(x, y+h*.3);
curveVertex(x+w/2,  y+h*.7);
curveVertex(x+w/2, y+h*.8);
endShape();

//mustach bottom right
fill(180,180,180);
beginShape();
curveVertex(x,y);
curveVertex(x, y+h*.3);
curveVertex(x+w/4, y+h*.6);
curveVertex(x+w/2,  y+h*.7);
curveVertex(x+w/2, y+h*.8);
endShape();

//mustach bottom left
fill(180,180,180);
beginShape();
curveVertex(x-w/2,y+h*.4);
curveVertex(x-w/2, y+h*.7);
curveVertex(x-w/4, y+h*.6);
curveVertex(x,  y+h*.3);
curveVertex(x, y+h*.2);
endShape();

fill(30,40,250);
ellipse(x-w/2,y-h/2,w/5,h/5);
ellipse(x+w/2,y-h/2,w/5,h/5);

//mouth
noFill();
beginShape();
curveVertex(x-w,y);
curveVertex(x-w/2, y+h*.75);
curveVertex(x, y+h*.95);
curveVertex(x+w/2, y+h*.75);
curveVertex(x+w/2, y);
endShape();
