
int x;

void setup() {
  size(500, 100);
}

void draw() {
  noStroke();
  for ( int i = 0; i < width; i = i +100) {
    fill(random(255),random(255),random(255));
    rect(i, 0, 100, 100);
  }
  textAlign(CENTER,CENTER);
   fill(random(255),random(255),random(255));
    textSize(50);
    text("what???whatwhatawahthweht", width/2, height/2);
    
  if(mousePressed){
  save("myImage"+ x +".jpg");
  x = x+1;
  }
}
