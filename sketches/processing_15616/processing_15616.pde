
PFont f;
PImage img1;
//PImage img2;
//PImage img3;
//PImage img4;
void setup(){
  smooth();
  strokeWeight(10);
  size(320,600);
 img1 = loadImage ("mm.jpg");
    //  img2 = loadImage ("h.jpg");
    //  img3 = loadImage ("mm.jpg");
    //   img4 = loadImage ("mm.jpg");
  f = loadFont ("PoorRichard-Regular-28.vlw");
  textFont(f);
}

void draw(){
  background(0);
 image(img1,0,0,320,600);
  fill(32,90,15);
   String z = nf(year(),4)+":"+nf(month(),2)+":"+nf(day(),2);
   text(z,20,380);
   String time = nf(hour(),2)+":"+nf(minute(),2)+":"+nf(second(),2);
   text(time,20,410);

  float d = map(day(),0,31,0,350);
  float n = map(month(),0,12,0,350);
  float y = map(year(),0,5000,0,350);
    stroke(222,113,49);
   line(70, y, 80, y); line(80, n, 90, n); line(90, d, 100, d);

  float s = map(second(),0,60,0,380);
  float m = map(minute(),0,60,0,420);
  float h = map(hour(),0,24,0,500);
    stroke(224,64,50);
    line(220, s, 240, s);
    stroke(224,64,50);
    line(180, m, 190, m);
    stroke(224,64,50);
  line(160, h, 170, h);
}


