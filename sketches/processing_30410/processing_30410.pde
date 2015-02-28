
size (1280,720); // set up window size
background (255);  // define background color
smooth(); // define the render to be smooth (anti-alias)

for ( int i = 0; i < 100; i = i +1)
{
stroke (1);
strokeWeight(random(1)); 
arc (  random(width), random(height), 50,50, radians(0), radians ( random(360)) );
}

 
noStroke(); 
fill(45,124,0,125);
rect(0,height/2, width, height);

noStroke(); 
fill(93,120,214,125);
rect(0,0, width, height/2); 

for ( int i = 0; i < 80; i = i +1)
{
  
strokeWeight(random(20)); 
stroke(57,1,1,80);
point ( random(width), random(height) );
}

for ( int i = 0; i < 800; i = i +1)
{
     strokeWeight (1);
    stroke (247,198,0);
line (random (width/2-400, width/2+360), random (height/2+700), 640, 360);
}

stroke (247,165,0);
fill (247,198,0);
arc (  640,360, 100,100, radians(180), radians (360) );
arc (640,360,50,50, radians (180), radians (360));       

 
float x91, y91; 
float x92, y92; 

float radius10;
radius10 = 100;

float radius91;
radius91 = 700;

 
x91 = width/2;
y91 = height/2;

for (int angle9=0; angle9<360; angle9=angle9+2) 
{
  
  float rad9 = -radians (angle9);
x92 = radius91 * cos (rad9);
y92 = radius10 * sin (rad9);

stroke (random (90), 500,700,80);
  strokeWeight (1);
  
line (x91,y91,width/2+x92,height/2+y92);
}

saveFrame ("2.png");

