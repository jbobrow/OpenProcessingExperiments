
size (400,400);
stroke(0);
background(255);
int posX=200;
int posY=150;


fill(0);
ellipse (width/2, height/2, posX, 200);
//right cheekbone
noStroke();
fill(255);
ellipseMode(CORNER);
ellipse (width/2+50, height/2, 100, 300);
//left cheekbone
ellipseMode(CORNERS);
ellipse (width/2-200, height/2, 150, 400);
strokeWeight(3);
stroke(0);
fill(255);
beginShape(QUAD_STRIP); 
vertex(width/2, height/2+50); 
vertex(width/2, height/2+125); 
vertex(width/2+20, height/2+50);


vertex(width/2+20, height/2+125);
vertex(width/2+35, height/2+50); 
vertex(width/2+35, height/2+125); 
vertex(width/2+55, height/2+50);
vertex(width/2+55, height/2+125); 
endShape();

beginShape(QUAD_STRIP); 
vertex(width/2, height/2+50);
vertex(width/2, height/2+125);
vertex(width/2-25, height/2+50); 
vertex(width/2-25, height/2+125); 
vertex(width/2-55, height/2+50);
vertex(width/2-55, height/2+125); 
endShape();

//left eye shape
triangle(width/2-25, height/2, 100, 100, 100, height/2);


fill(255);
//right eye shape
triangle(width/2+25, height/2, 300, 100, 300, height/2);


//nose
fill(255);
triangle (width/2-25, height/2+25, width/2, 195, width/2+25, height/2+25);
stroke(0);
strokeWeight(3);
line(width/2, height/2+25, 200, 150);
//hat

fill(0, 255, 0, 90);
triangle (width/2-50, 100, width/2, 50, width/2+50, 100);
fill(255, 0, 0);
triangle (width/2-25, 100, width/2, 50, width/2+25, 100);


