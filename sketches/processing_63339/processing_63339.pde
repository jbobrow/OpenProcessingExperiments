
size(400,400);

float space = 3;
float gray = 0;
noStroke();

for(float x = 0; x < width;x = x + space){
  for(float y = 0; y < height; y = y + space){
    fill(gray);
    rect(x,y,space, space);
    gray = gray + 10;
    if(gray > 255)gray = 0;
  } 
}

if(!online)saveFrame("frame.png");

