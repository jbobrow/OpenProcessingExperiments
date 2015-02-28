
size(400,400);
background(40);
smooth();

int xCampo = 210;
int yCampo = 380;

rectMode(CENTER); 
ellipseMode(CENTER); 

strokeWeight (5);
stroke(255);
fill(200);
rect(height/2,width/2,xCampo,yCampo);
rect(height/2,(width/2)-160,90,60);
rect(height/2,(width/2)+160,90,60);

line(95,height/2,305,height/2);

noFill();
ellipse(height/2,width/2,70,70);






