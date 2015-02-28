
void colorfields() {

  //BWBAR
  color black;
  color white;
  black = #000000;
  white = #FFFFFF;

  for (int x = 0+width/20; x < width-width/20; x++) {
    float percent = norm(x, 0, width-width/20);
    stroke(lerpColor(black, white, percent, HSB));
    strokeWeight(0);
    line(x, 0, x, height/20);
    line(width/2, height/20, width/2, height/40);
  }

  //SIZEBAR
  noStroke();
  fill(160);
  rect(0, height-height/20, width, height/20);
  stroke(0);
  int x1 = width/20;
  int y1 = height-height/125;
  int x2 = width;
  int y2 = height-height/27;

  for (int t =0; t < width; t++) {
    float x = lerp(x1, x2, t/150.0);
    float y = lerp(y1, y2, t/150.0);
    strokeWeight(1);
    line(x, y, x, y+height);
  }

  //COLORBAR
  color one = #0033ee;
  color two = #00ee33;
  one = #ff0000;
  two = #00ff00;

  for (int y=0+height/20;y < height; y++) {
    float percent2 = norm (y, 0, height/3);
    stroke(lerpColor(one, two, percent2, HSB));
    line(0, y, width/20, y);
  }
  //ALPHABAR
  color three; 
  color four; 
  three = color(255, 0, 0);
  four = color(255, 255, 255);

  for (int y=0+height/20;y < height; y++) {
    float percent4 = norm (y, height/20, height);
    stroke(lerpColor(four, three, percent4));
    line(width, y, width-width/20, y);
    //red line
    line(width-width/40, height/20, width-width/40, height-height/20);
  }

  //drawing space borders
  stroke(0);
  strokeWeight(2);
  line(0, height/20, width, height/20);
  line(width/20, height-height/20, width-width/20, height-height/20);
  line(width/20, 0, width/20, height);
  line(width-width/20, 0, width-width/20, height);
}


