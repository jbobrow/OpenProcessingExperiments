
             
size (1020, 400);
background (255);
smooth ();

for ( int i = 0; i < 10000; i = i +1)
  {
      float redSize = random (10);  
      noStroke(); 
      fill (random(150,255),0,0);
      ellipse ( random(width), random(height),redSize,redSize);
  
  }
   
for (int i=1; i<500; i=i+2)
{
strokeWeight(1);
stroke(random(350), random(350), random(350)); // random (R,G,B)
line(random(width), random(height), random(width), random(height) );
}

for ( int i = 3; i < 10000; i = i + 3){
strokeWeight(5);
stroke( 110);
point( random(width),random(height));
}

for (int i=0; i<80; i=i+1) {
fill (5,10,56);
noStroke ();
ellipse (random (width), random (height), 2, 120);
}

for (int i=0; i<100; i=i+1) {
fill (10,5,319);
noStroke ();
ellipse (random (width), random (height), 10, 50);
}

for (int i=1; i<100; i=i+2) {
fill (5,10,95);
noStroke ();
ellipse (random (width), random (height), 15, 30);
}

for (int i=0; i<100; i=i+1) {
fill (255,255,255);
noStroke ();
ellipse (random (width), random (height), 10, 100);
}

for (int i=0; i<100; i=i+1) {
fill (5,120,180);
noStroke ();
ellipse (random (width), random (height), 9, 80);
}

for (int i=0; i<100; i=i+1)
{
strokeWeight(20);
stroke(5,255,5);
}
strokeWeight(2);
stroke(random(978), random(467), random(550)); 
line(random(width), random(height), random(width), random(height) );

noStroke(); 
fill (255,255,255);
ellipse ( 150, 150,200, 200); 

noStroke(); 
fill (0,255,0);
ellipse ( 100, 100,30, 60); 

noStroke(); 
fill (0,0,255);
ellipse ( 200, 182, 80, 100);

saveFrame("maluca.png");
 
  

                
