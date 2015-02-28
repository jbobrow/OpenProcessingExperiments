

size (700,700); // set up window size
background (0,4,8);  // define background color
smooth(); // define the render to be smooth (anti-alias)


// FIRST "LAYER" - 5000 particles, size between 0 and 3, opacity between 0 and 150
for ( int i = 0; i < 1000; i = i + 1){// repeat (loop) 10.000 times

      strokeWeight(random(2)); // give a random size for each particle
      stroke( 255, random(50,50)); // give a random white transparency
      point( random(width),random(height)); // give a random position

}

for (int i=1; i<200; i=i+1)
{
strokeWeight(1);  
stroke(255,230,0);
line(random (1000),random (90,1000), 500, 500);

}


for (int i=1; i<200; i=i+1)
{
strokeWeight(1);  
stroke(255,0,77);
line(random (1000),random (90,1000), 500, 500);

}



for (int i=1; i<150; i=i+1)
{
strokeWeight(1);  
stroke(0,95,255);
line(random (1000),random (90,1000), 500, 500);

}

for (int i=1; i<160; i=i+1)
{
strokeWeight(1);  
stroke(0,255,99);
line(random (1000),random (90,1000), 500, 500);

}


for (int i=1; i<60; i=i+1)
{
strokeWeight(1);  
stroke(255);
line(random (1000),random (90,1000), 500, 500);

}


for (int i=1; i<60; i=i+1)
{
strokeWeight(1);  
stroke(0);
line(random (1000),random (90,1000), 500, 500);

}

