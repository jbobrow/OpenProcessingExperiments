
int skip = 2;

void setup(){
size(300, 300);
//smooth();
}

void draw(){
  background(0);
  if (mousePressed){
    skip = 10;
  }else{ skip = 2; }
  
  for (int x = 0; x < width; x += skip){
     for (int y = 0; y < height; y += skip){
       stroke(random(255));
       point(x,y);
    }
  }
}
