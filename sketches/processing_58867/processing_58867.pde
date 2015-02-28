
int x = 310; 
int y = 300;
int bodyHeight = 80;
int neckHeight = 20;
int radius = 30;
int ny = y - bodyHeight - neckHeight - radius;

size(720,480);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

//Neck
fill(40);
rect(x+35,ny+50,30,neckHeight);


//Arm
strokeWeight(4);
line(x+80,y-30,x+140,y-40);
line(x-50,y-40,x+20,y-10);
line(x+50,y+40,x+120,y+110);
line(x-20,y+120,x+50,y+40);

//Body
fill(255);
ellipse(x+50,y+10,radius*3,radius*4);
fill(0);
ellipse(x+50,y+30,radius*2,radius*2+10);

//Head
fill(0);
ellipse(x,ny-10,radius,radius);
ellipse(x+100,ny-10,radius,radius);
fill(255);
ellipse(x+50,ny+15,radius*3,radius*2+5);
fill(0);
ellipse(x+50,ny+35,radius,radius);
fill(255);
ellipse(x+50,ny+25,8,8);
strokeWeight(4);
line(x+10,ny+15,x+40,ny+5);
line(x+60,ny+5,x+90,ny+15);
ellipse(x+35,ny+10,3,3);
ellipse(x+65,ny+10,3,3);


