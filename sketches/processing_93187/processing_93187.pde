
void  setup () {
  size(1000,150);
}

void nowaFunkcja(float x, float y, float r, float a, float b ) {
   ellipse(b, a, r, r);
   translate(x, y);
}
void draw() {
  background(255 *  noise(frameCount * .01 ), 200 *  noise(30+frameCount * .01), 200 * noise(10+frameCount * .01)  );
  fill (255 *  noise(40+frameCount * .01 ), 200 *  noise(10+frameCount * .01), 200 * noise(30+frameCount * .01)  );
  for(int j = 0; j < 10; j++) {
    for(int i = 0; i < 20; i++) {
      nowaFunkcja(20 + noise(frameCount * .02 ),  noise(frameCount * .01), 100 * noise(frameCount *.01 + i), 100 * noise(100+frameCount *.01 + i), 100 * noise(10+frameCount *.01 + i));
      }
    for (int i = 20; i > 0; i--) {
      nowaFunkcja(5 +  noise(frameCount * .01 ),  noise(frameCount * .01), 100 * noise(frameCount * .01 + i), 100 * noise(frameCount *.01 + i), 100 * noise(frameCount *.01 + i));
    }
  }
}
