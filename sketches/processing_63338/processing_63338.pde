
size(400,400);
smooth();
float space = 10;


for(float x = 0; x < width;x = x + space){
  for(float y = 0; y < height; y = y + space){
    if(random(1) > 0.5){
      strokeWeight(3);
    }else{
      strokeWeight(1);
    }
    if(random(1) > 0.5){
      line(x,y,x,y+space);
    }else{
      line(x,y,x+space,y);
    }
  } 
}

if(!online)saveFrame("frame.png");

