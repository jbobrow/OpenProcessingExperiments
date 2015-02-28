
// happy coding ~

size(200,200);
background(255,255,0);


//eyes
int x=30;
strokeWeight(2);
ellipse(40+x,60,30,30);
ellipse(160-x,60,30,30);

fill(0);
ellipse(40+x,60,10,10);
ellipse(160-x,60,10,10);


//mouth

fill(250,0,0);
stroke(250,0,0);
line(40,150,160,150);
rect(40,150,120,10);


//nose
/*
stroke(0,250,0);
line(100,100,90,120);
line(100,100,110,120);
line(90,120,110,120);
*/
fill(20,250,60);
stroke(50,200,80);
beginShape();
vertex(100,90);
vertex(90,110);
vertex(110,110);
endShape(CLOSE);


//head

fill(0);
stroke(0);
beginShape();
vertex(0,0);
vertex(50,0);
vertex(0,25);
endShape(CLOSE);

beginShape();
vertex(200,0);
vertex(150,0);
vertex(200,25);
endShape(CLOSE);


//left

fill(255,255,0);
stroke(255,50,10);
strokeWeight(1);
ellipse(30,110,30,30);
ellipse(30,110,20,20);
ellipse(30,110,10,10);
ellipse(30,110,5,5);

//right

fill(255,255,0);
stroke(255,50,10);
ellipse(170,110,30,30);
ellipse(170,110,20,20);
ellipse(170,110,10,10);
ellipse(170,110,5,5);

                
                
