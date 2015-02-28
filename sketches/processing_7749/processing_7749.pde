
size(800, 600);
background (0, 5);
smooth ();



for(int x=2; x<width; x+=40){
stroke (255);
strokeWeight (5);
fill (255, 175, 5, 5);
ellipse (610, 300, x, x);
}


for(int y=5; y<width; y+=10){
  stroke(255, 0, 0);
  strokeWeight (5);
  line (0, y, 800,y);
}
for(int y=4; y<width; y+=10){
  stroke(0);
  strokeWeight (2);
  line (0, y, 800,y);
}

for(int y=5; y<width; y+=60){
  stroke(255, 0, 0);
  strokeWeight (5);
  line (0, y, y, 100);
}
for(int y=5; y<width; y+=60){
  stroke (0);
  strokeWeight (2);
  line (0, y, y, 100);
}

for(int y=2; y<width; y+=45){
  stroke(0, 175);
  strokeWeight (7);
  line (y, y, y, 600);
}
for(int y=2; y<width; y+=45){
  stroke(255);
  strokeWeight (2);
  line (y, y, y, 600);
}

for(int y=3; y<width; y+=40){
  stroke(0);
  strokeWeight (7);
  line (0, y, y, 200);
}
for(int y=3; y<width; y+=40){
  stroke(255, 0, 0);
  strokeWeight (3);
  line (0, y, y, 200);
}

for(int y=3; y<width; y+=20){
  stroke(0);
  strokeWeight (5);
  line (0, y, y, 400);
}
for(int y=3; y<width; y+=20){
  stroke (255);
  strokeWeight (2);
  line (0, y, y, 400);
}

for(int y=6; y<width; y+=50){
  stroke(255, 0, 0);
  strokeWeight (5);
  line (y, 0, y, 400);
}
for(int y=6; y<width; y+=50){
  stroke(0);
  strokeWeight (2);
  line (y, 0, y, 400);
}

for(int y=3; y<width; y+=20){
  stroke(255, 0, 0);
  strokeWeight (6); 
  line (0, 0, y, 400);
}
for(int y=3; y<width; y+=20){
  stroke(255);
  strokeWeight (2.5); 
  line (0, 0, y, 400);
}


for(int x=3; x<width; x+=40){
stroke (0);
strokeWeight (5);
smooth ();
fill (255, 175, 5, 5);
ellipse (600, 300, x, x);
}

for(int x=3; x<width; x+=40){
stroke (255, 0, 0);
strokeWeight (2);
smooth ();
fill (255, 175, 5, 5);
ellipse (600, 300, x, x);
}

for(int y=3; y<width; y+=20){
  stroke( 0);
  strokeWeight (.75); 
  line (0, 0, y, 400);
}






