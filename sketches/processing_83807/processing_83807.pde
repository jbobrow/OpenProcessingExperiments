
int lastSecond;
PImage owl;


void setup () {
  size (280, 300);
  owl = loadImage ("owl2.png");
}

void draw () {
  image(owl, 135, 150);
  fill (0);
 
  //%
  if(second()%2== 0) {
     ellipse (170, 170, 12, 12);
  ellipse (197, 170, 12, 12);
} else {
  ellipse (180, 170, 12, 12);
  ellipse (205, 170, 12, 12);
}



  //clock
  int m=minute(), s=second(), h=hour();
  // float hy=(height+20)/60*m;
  //float my=(height+20)/60*s;
  //float sy=map(millis()%1000, 0, 1000, 0, 120);
  text(h, 160, 235);
  text(m, 180, 235);
  text(s, 200, 235);
}






