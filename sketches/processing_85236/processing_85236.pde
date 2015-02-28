
size(1200, 700);
background(0);

// pas remplir
fill(#FFFFFF,30);
noStroke();


for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 880, 955, 70, 30, 40, 60);

}


for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(700, 700, 80, 205, 170, 60, 540, 60);

}

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0,700, 80, 205, 170, 60, 540, 60);

}


for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(700,0, 80, 205, 170, 60, 540, 60);

}

///////////////////////
// pas remplir
fill(0,10);

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(800, 800,70, 95, 50, 60, 540, 60);

}

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 10, 05, 870, 860, 80, 80);

}

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 20, 60, 170, 60, 80, 60);

}

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 30, 115, 170, 60, 20, 60);

}

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 1500, 115, 170, 60, 20, 60);

}

for (int i=0;i<360;i+=10){
  rotate(radians(10));
  quad(0, 0, 1800, 115, 170, 60, 20, 60);

}

fill(0,30);

for (int i=0;i<360;i+=10){
  rotate(radians(2));
  quad(0, 0, 1800, 1105, 170, 60, 20, 60);
  quad(0, 0, 1800, 1105, 170, 60, 20, 60);
    quad(0, 0, 1800, 1105, 170, 60, 20, 60);
}
