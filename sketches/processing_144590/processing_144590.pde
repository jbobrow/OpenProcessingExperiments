
int num = int(random(400, 800)); //star field population (not density)
float [] posx = new float[num];
float [] posy = new float[num];
float [] rad = new float[num];
int [] filler = new int[num];
int T=0;
float t = 0;



void setup() {
  size(500, 500);

  background(0);
  noStroke();
  //println(num);
  for (int i = 0; i < num; i++) {
    posx[i] = int(random(0, width));
    posy[i] = int(random(0, height));
    rad[i] = random(0, 2.5);
  }
}



void draw() {
  background(0);
  T++;


  //-------Background---------
  t = t + 0.005;
  //shimmer
  for (int i = 0; i < num; i++) {
    int noisy = int(100*noise(t*i));
    //for some reason Processing.JS renders the shimmer differently use -40,80 for Java and more extreme values for JS
    filler[i] = 100+ int(map(noisy,0,100,-100,100));
  }

  //load randomized skymap
  for (int i = 0; i < posx.length; i++) {

    fill(255, filler[i]);
    ellipse(posx[i], posy[i], rad[i], rad[i]);
  }
}

