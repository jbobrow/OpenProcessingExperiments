
size(400,400);

float space = 10;

for(float x = 0; x < width;x = x + space){
  for(float y = 0; y < height; y = y + space){
    fill(random(255));
    rect(x,y,space, space);
  } 
}

if(!online)saveFrame("frame.png");

