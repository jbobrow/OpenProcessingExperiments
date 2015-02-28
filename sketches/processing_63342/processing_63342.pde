
size(400,400);
smooth();
background(127);

float space = 6;
float gray = 0;
noStroke();

for(float x = 0; x < width;x = x + space){
  for(float y = 0; y < height; y = y + space){
    fill(gray);
    float diameter = gray / 55 + 2;
    ellipse(x,y,diameter, diameter);
    gray = gray + random(10);
    if(gray > 255)gray = 0;
  } 
}

if(!online)saveFrame("frame.png");

