
//Homework 2, due 9/14/2012
//author: Jenny He
//               copyright © Jiping He
//               Tuesday, September 4, 2012
//               Pittsburgh 15213 
//               All Rights Reserved

size(400,400);
background(46,84,116);

//draw reference circle
float x, y, w, h;
x=width* .5; //x-coordinate of center of reference circle
y=height* .5; //y-coordinate of center of reference circle
w=400; //width of reference circle
h=400; //height ofreference circle
//strokeWeight(3);
//ellipse(x,y,w,h);
//point(x,y);

//setup beginShape stroke
noStroke();

/*
//background 
fill(0,0,0);
beginShape();
vertex(x-w/3,y-h*3/8);
vertex(x+w*2/9, y-h*3/8);
vertex(x+w*2/9, y+h/4);
vertex(x-w/3, y+h/4);
endShape(CLOSE);
*/

//top bar of J
fill(240,174,174);
beginShape();
vertex(x-w/3, y-h*3/8); //top left corner
vertex(x, y-h*3/8); //top right corner
vertex(x, y-h/4); //bottom right corner
vertex(x-w/3, y-h/4); //bottom right corner
vertex(x-w/3,y-h/4); //top left corner to close
endShape(CLOSE);

//first rect of J vertical
fill(240,174,174,200);
beginShape();
vertex(x-w*2/9, y-h/4+2/8*h); //top left corner
vertex(x-w/9, y-h/4+2/8*h); //top right corner
vertex(x-w/9, y-h/8+2/8*h); //bottom right corner
vertex(x-w*2/9, y-h/8+2/8*h);
endShape(CLOSE);


//second rect of J vertical
fill(240,174,174,180);
beginShape();
vertex(x-w*2/9, y-h/4+h/8); //top left corner
vertex(x-w/9, y-h/4+h/8); //top right corner
vertex(x-w/9, y); //bottom right corner
vertex(x-w*2/9, y);
endShape(CLOSE);


//third rect of J vertical
fill(240,174,174,160);
beginShape();
vertex(x-w*2/9, y); //top left corner
vertex(x-w/9, y); //top right corner
vertex(x-w/9, y+h/8); //bottom right corner
vertex(x-w*2/9, y+h/8);
endShape(CLOSE);

//fourth rect of J vertical
fill(240,174,174,140);
beginShape();
vertex(x-w*2/9, y+h/8); //top left corner
vertex(x-w/9, y+h/8); //top right corner
vertex(x-w/9, y+h/4); //bottom right corner
vertex(x-w*2/9, y+h/4);
endShape(CLOSE);

//curve of J
beginShape();
vertex(x-w/3, y+h/8); //top left corner
vertex(x-w*2/9, y+h/8); //top right corner
vertex(x-w*2/9, y+h/4); //bottom right corner
vertex(x-w/3, y+h/4); //bottom right corner
endShape(CLOSE);

//first horizontal rect of H
fill(174,240,240,180);
beginShape();
vertex(x-w/9, y-h/4+h/8); //top left corner
vertex(x, y-h/4+h/8); //top right corner
vertex(x, y); //bottom right corner
vertex(x-w/9, y);
endShape(CLOSE);

//second horizontal rect of H
fill(174,240,240,170);
beginShape();
vertex(x, y-h/4+h/8); //top left corner
vertex(x+w/9, y-h/4+h/8); //top right corner
vertex(x+w/9, y); //bottom right corner
vertex(x, y);
endShape(CLOSE);


//first rect of H right vertical
fill(174,240,240,255);
beginShape();
vertex(x+w/9, y-h*3/8);
vertex(x+w*2/9, y-h*3/8);
vertex(x+w*2/9, y-h/4);
vertex(x+w/9, y-h/4);
endShape(CLOSE);

//second rect of H right vertical
fill(174,240,240,200);
beginShape();
vertex(x+w/9, y-h/4+2/8*h); //top left corner
vertex(x+w*2/9, y-h/4+2/8*h); //top right corner
vertex(x+w*2/9, y-h/8+2/8*h); //bottom right corner
vertex(x+w/9, y-h/8+2/8*h);
endShape(CLOSE);


//third rect of H right vertical
fill(174,240,240,180);
beginShape();
vertex(x+w/9, y-h/4+h/8); //top left corner
vertex(x+w*2/9, y-h/4+h/8); //top right corner
vertex(x+w*2/9, y); //bottom right corner
vertex(x+w/9, y);
endShape(CLOSE);

//fourth rect of H right vertical
fill(174,240,240,160);
beginShape();
vertex(x+w/9, y); //top left corner
vertex(x+w*2/9, y); //top right corner
vertex(x+w*2/9, y+h/8); //bottom right corner
vertex(x+w/9, y+h/8);
endShape(CLOSE);


//fifth rect of H right vertical
fill(174,240,240,140);
beginShape();
vertex(x+w/9, y+h/8); //top left corner
vertex(x+w*2/9, y+h/8); //top right corner
vertex(x+w*2/9, y+h/4); //bottom right corner
vertex(x+w/9, y+h/4);
endShape(CLOSE);

//saveFrame("hw2_JennyHe.jpg");

