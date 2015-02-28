
float R = 40;
float counter = 0;
 
color[] palette = { #ff006a, #bfba2a, #f6852c, #ffa31a, #cbbf57, #5fc7af, #6d6689, #f98090, #f5e0ad };
 
PImage picture;
PImage pic;
void setup() {
    size(400, 400);
    ellipseMode(RADIUS);
    picture=loadImage ("face.jpg");
    pic=loadImage ("face2.jpg");
    size(500,500);
}
 
void draw() {
    float t = millis() * 1e-3;
    int k = floor((t + 1) / 2);
    boolean isEven =  (t % 2 < 1);
    noStroke();
    translate(0.5 * width, 0.5 * width);
    for (int i = 8; i > 0; i--) {
        float f = i + (isEven ? 1 : (t % 1));
        fill(palette[(k - i + palette.length) % palette.length]);
        ellipse(0, 0, R * f, R * f);
    }
    if (isEven) {
        fill(palette[k % palette.length]);
        arc(0, 0, R, R, 0, (t % 1) * TWO_PI);
    }
    if (second() % 6 == 0) {
       ellipse (0,0,400,400);
       image(picture,-250,-250);
       tint(#ffb312);

    }
  if (second() % 9 == 0) {
       ellipse (0,0,400,400);
       image(pic,-300,-250);
       tint(#4cc3ac);

  }
}



