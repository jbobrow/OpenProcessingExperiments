
PImage selleck;
float count;

void setup(){
  size(500,500);
  selleck = loadImage("selleck_bike.png");
}

void draw(){
  rect(0,0,500,500);
  
  count++;
  if(count<671){
    image(selleck,count,50);
  } else if(count>671) {
    count=0;
  }
}


