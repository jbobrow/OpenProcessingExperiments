
size(400,400);

float space = 10;


for(float x = 0; x < width;x = x + space){
  for(float y = 0; y < height; y = y + space){
    
    float random = random(1);
    if(random > 0.5){
      line(x,y,x+space,y+space);
    }else{
      line(x,y+space,x+space,y);
    }
  } 
}

if(!online)saveFrame("frame.png");

