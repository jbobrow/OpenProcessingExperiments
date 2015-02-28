

size(400, 600);


noStroke(); 
fill(255, 254, 56); 
rect(0, 0, 400, 300);

fill(#FFFFFF);
noStroke();
for(int x=10; x<400; x=x+10)
for(int y=10; y<300; y=y+10)
{
 ellipse(x,y,3,3);
} 
 
int[] a={40,50,120,150,180,200};
int[] b={99,130,140,160};

strokeWeight(4); 
stroke(0);
fill(255, 214, 232); 
ellipse(a[5], a[3], a[5], a[4]); 

beginShape();
vertex(a[2], b[0]);
bezierVertex(b[1], a[0], b[2], a[1], b[3], 68);
endShape();

beginShape();
vertex(280, 99);
bezierVertex(270, a[0], 260, a[1], 240, 68);
endShape();

line(120, 150, 150, 160);
line(125, 175, 150, 170);
line(280, 150, 250, 160);
line(275, 175, 250, 170);

line(150, 120, 170, 130);
line(150, 140, 170, 130);
line(250, 120, 230, 130);
line(250, 140, 230, 130);

fill(255, 85, 85); 
beginShape();
vertex(170, 150);
bezierVertex(180, 230, 220, 230, 230, 150);
endShape();

fill(255, 214, 232); 
beginShape();
vertex(170, 150);
bezierVertex(170, 160, 180, 160, 200, 150);
endShape();

beginShape();
vertex(230, 150);
bezierVertex(230, 160, 220, 160, 200, 150);
endShape();




noStroke(); 
fill(65, 14, 160); 
rect(0, 300, 400, 300); 

fill(#FFFFFF);
noStroke();
for(int x=10; x<400; x=x+10)
for(int y=300; y<600; y=y+10)
{
 ellipse(x,y,3,3);
} 

strokeWeight(4); 
stroke(0);
fill(255, 214, 232); 
ellipse(200, 450, 200, 180); 

beginShape();
vertex(120, 399);
bezierVertex(130, 340, 140, 350, 160, 368);
endShape();

beginShape();
vertex(280, 399);
bezierVertex(270, 340, 260, 350, 240, 368);
endShape();

line(120, 450, 150, 460);
line(125, 475, 150, 470);
line(280, 450, 250, 460);
line(275, 475, 250, 470);


fill(191, 219, 255); 
beginShape();
vertex(145, 427);
bezierVertex(145, 450, 160, 460, 160, 423);
endShape();

line(140, 430, 175, 420);
line(260, 430, 225, 420);

line(180, 470, 200, 450);
line(200, 450, 220, 470);
                
                                
