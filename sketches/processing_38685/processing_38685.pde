
int data [] = {42534,44663,46627,47209,45989};

void setup(){
  background(0);
  size(800, 200);
}

void draw(){
  background(0);
  for(int i = 0; i< data.length; i++){
    float ellSize = map(data[i],40000,50000,0,100);
    ellipse(i*150+100,100,ellSize,ellSize);
    text(data[i],i*150+100,100);
  }
  
}

