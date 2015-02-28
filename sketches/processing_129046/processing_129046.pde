

int keyIndex = 10;

void setup(){
  size(500, 500);
}

void draw(){
  background(0, 0, keyIndex);
  fill(keyIndex*keyIndex, keyIndex, 0);
  ellipseMode(CENTER);
  ellipse(200, 200, keyIndex, keyIndex);

  if (keyPressed == true){
      if (key >= 'h' && keyIndex < 300) {
        keyIndex = keyIndex + 10;
      }
      else{
        keyIndex = keyIndex - 10;
      }
   }
}
