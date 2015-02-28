
size(400,400);

float space = 10;

noStroke();

for(float x = 0; x < width;x = x + space){
  for(float y = 0; y < height; y = y + space){
    if(random(1) > 0.5){
      fill(random(255), random(200,255), 0);
    }else{
      fill(0,random(255), random(200,255));
    }
    rect(x,y,space, space);
  } 
}

if(!online)saveFrame("frame.png");

