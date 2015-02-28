
class Feather {
  int w, h;
  int n = 5000;      //number of lines
  float space, i;

  Feather() {

    //leave blank for now
  } 

  void make() {
    w = width;
    h = height;

    line(w, h, w, h);
    translate(w = 400, 400);
    i += 0.05;

    stroke(225);
    fill(0,11);
    smooth();
    strokeWeight(0.5);

    for ( int x = 0; x < w; x += 1+space){

      rotate(TWO_PI * i);
      line(0, x+2, 0, x-w); 
      line(x+h, 0, w-h, x-w);
    }
space = mouseX/16;  
}
  
}


