
int y = 0; 
int r2 = 0;
int r3 = 0;
int speed = 3; 
int blauwTint = 0;
int roodTint = 0;
int groenTint = 0;


void setup() { 
size(400,400); 
smooth(); 
strokeWeight (10);
} 

void draw() { 

if (mouseX < 200)
{
  background (0);
  stroke (255);
}else {
  background(255);
  stroke (0);
}

// rondje 1
y = y + speed; 
if ((y > height) || (y > 0)) { 
speed = speed * +1; 
} 
  
frameRate (20);
blauwTint = int(random(55,255));
roodTint = int(random(0));
groenTint = int(random(0));
fill(roodTint,groenTint,blauwTint);
ellipse(200,y,92,92);

//rondje 2
r2 = r2 + speed; 
if ((r2 > height) || (r2 < 0)) { 
speed = speed * -1; 
} 
 
frameRate (20);
blauwTint = int(random(0));
roodTint = int(random(10,253));
groenTint = int(random(0));
fill(roodTint,groenTint,blauwTint);
ellipse(90,y,92,92);

//rondje3
r3 = r3 + speed; 
if ((r3 > height) || (r3 < 0)) { 
speed = speed * -1; 
} 

frameRate (20);
blauwTint = int(random(0));
roodTint = int(random(0));
groenTint = int(random(109,255));
fill(roodTint,groenTint,blauwTint);
ellipse(310,y,92,92);

// de 3 vierkantjes
fill (255,255,0);
rect (mouseX,mouseY,50,50);
fill (11,18,81);
rect (mouseY,mouseX,50,50);
fill (255,150,0);
rect (mouseX-30,mouseY+40,50,50);
fill (131,8,132);
rect (mouseX-90,mouseY-90,50,50);
fill (80,250,86);
rect (mouseY+50,mouseY-50,50,50);
fill (255,0,0);
rect (mouseY-77,mouseX+80,50,50);
fill (255,8,136);
rect (mouseX-44,mouseX+66,50,50);


}

