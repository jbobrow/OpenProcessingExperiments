
//Carla Campos-Rodriguez
//April 14,2013
//Clock

PImage img;

void setup() {
  img = loadImage("greenstar.png");
  size(600, 600);
}
void draw() {
  println(minute() + ": " + second());
  background(251, 251, 239);
  float w = map(second(), 0, 59, 0, width);

  

  stroke(246, 122, 62);//orange
  line(0, 200, w, 30);
  line(600, 200, w, 30);
  strokeWeight(4);
  stroke(179, 220, 222);//light blue
  line(0, 200+30, w, 30);
  line(600, 200+30, w, 30);
  strokeWeight(2);
  stroke(141, 197, 150);//green
  line(0, 200+60, w, 30+80);
  line(600, 200+60, w, 30+80);
  strokeWeight(2);
  stroke(244, 178, 81);//yellowish
  line(0, 200+80, w, 30+80);
  line(600, 200+80, w, 30+80);

  stroke(179, 132, 138);//purple
  line(0, 200+120, w, 30+120);
  line(600, 200+120, w, 30+120);

  stroke(128, 167, 172);//dark blue
  line(0, 200+130, w, 30+130);
  line(600, 200+130, w, 30+130);
  // second
  stroke(246, 122, 62);//orange
  line(0, 200+180, w, 30+180);
  line(600, 200+180, w, 30+180);
  strokeWeight(4);
  stroke(179, 220, 222);//light blue
  line(0, 200+190, w, 30+190);
  line(600, 200+190, w, 30+190);

  strokeWeight(2);
  stroke(141, 197, 150);//green
  line(0, 200+200, w, 30+200);
  line(600, 200+200, w, 30+200);


  stroke(244, 178, 81);//yellowish
  line(0, 200+240, w, 30+240);
  line(600, 200+240, w, 30+240);

  stroke(179, 132, 138);//purple
  line(0, 200+250, w, 30+250);
  line(600, 200+250, w, 30+250);

  stroke(141, 197, 150);//green
  line(0, 200+290, w, 30+290);
  line(600, 200+290, w, 30+290);

  stroke(179, 220, 222);//light blue
  line(0, 200+310, w, 30+310);
  line(600, 200+310, w, 30+310);

  stroke(128, 167, 172);//dark blue
  line(0, 200+340, w, 30+340);
  line(600, 200+340, w, 30+340);

  stroke(246, 122, 62);//orange
  line(0, 200+360, w, 30+360);
  line(600, 200+360, w, 30+360);

  image(img, 0, w+90, 60, 60);
 
  image(img, 300, w+90, 60, 60);
  image(img, 550, w+90, 60, 60);


}



