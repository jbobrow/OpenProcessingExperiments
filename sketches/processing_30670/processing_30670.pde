

size (720, 405);
background (0);
smooth (); 

fill (255);
for (int i=0; i<200; i=i+1) {
arc (random (width), random (height), 200, 100, radians(random (0)), radians(random (20)) );
}

  
noFill ();
stroke (255);
strokeWeight (random (1));
for (int i=0; i<500; i=i+1) {
arc (random (width), random (height), 80, 300, radians(random (8)), radians(random (305)) );
}
 
 
saveFrame ("2.tiff");

                
                
