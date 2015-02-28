
size(400,400);

float space =  10;
background(0);

for(float y = 0; y < height; y = y + space){
for(float x = 0; x < width; x = x + space){
 stroke(255);
  point(x,y);
}
}

//saveFrame("grid.png");

