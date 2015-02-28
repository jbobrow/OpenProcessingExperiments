
size (400, 400);
background (255);

ellipseMode(CENTER);
fill(179);

float x = 20;
float y = 20;
float w = 20;

for (int i=0; i<29; i++) {
    //w = w * 0.9;
    w = sin((1 - y) / 2) * 30 +40;
  
   for (int j=0; j<22; j++ ) {
     y = j / 2 + w;
     ellipse(x, y+ 50, 200, 70);
          ellipse(x, y, 200, 70);
          ellipse(x, y+150, 90, 150);
                    ellipse(x, y+250, 90, 150);

           ellipse(x, y+330, 200, 90);


   }
   x = x + w + 8;
}


