
void setup () {  

  size (600, 600);  

  background(0);  

  noStroke();  

  smooth();
}  



void draw () {  

  for (int i = 0; i < 600; i += 30) {  

    if (i <575) {
      filter(BLUR);
    }
    fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));


    ellipse(i, i, i, i);
  }
}       






