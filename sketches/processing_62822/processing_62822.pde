
/*
Kasper Nielsen, knie@itu.dk
 Excercise 8.3.c
 */
float fadeAmount;
int currentIdx = 0;

int num = 4; //the number of pictures for the slideshow
PImage pic [] = new PImage [num];

void setup () {
  size(800, 450); //window size corresponds to image size
  //a for loop 
  for (int i = 1; i <= pic.length; i ++) {
    String sd = nf(i, 2);
    println(sd);
    pic [i-1] = loadImage("Slide"+sd+".jpeg");
  }
}

void draw () {
  fadeOver(currentIdx, (currentIdx+1)%num, fadeAmount);
  fadeAmount ++;
  if (fadeAmount == 255) {
    currentIdx = (currentIdx+1)%num;
    fadeAmount = 0;
  }
  println(currentIdx);
  text("we are programming",width/2-50,100);

}

void fadeOver(int firstIdx, int secondIdx, float alpha) {
  noTint();
  image(pic[firstIdx], 0, 0);
  tint(255, alpha);
  image(pic[secondIdx], 0, 0);
}


