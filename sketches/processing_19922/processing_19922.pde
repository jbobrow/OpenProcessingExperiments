
size (250, 250);
background (255);
smooth ();

// circles 
noStroke ();
fill (20, 40, 90, 20);
for (int e = 50; e <= width; e+=30) {
  float w = random (e) -30;
  float h = w;
  ellipse (random (e), height / 2 - 20, w, h);
};

for (int e = 60; e <= width; e+=10) {
float w = random (e) -20;
float h = w;
ellipse (random (e), height / 10 + 10, w, h);
};

fill(90, 15, 100, 60);
for(int e = 40; e <=width; e+=40) {
float w = random (e) -90;
float h = w;
ellipse (random (e), height / 2 - 30, w, h);

};
 
fill(255, 120, 90, 30); 
for(int f = 30; f <=width; f+=40) {
float w = random (f) -20;
float h = w;
ellipse (random (f), height / 2 - 30, w, h);

};
 
 
 


