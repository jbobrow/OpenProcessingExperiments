
void setup () {
size (500,500);
background (40,224,232);
noStroke();
}

void draw () {
  for (int i = 0; i < width ; i = i + 40) {
    for (int j = 0 ; j < height ; j = j + 40) {
      fill (74,232,40);
        rect(i+10,j+10,20,20);
     }
  }
  
}
