
String name = "HYUK";
float xoff =0, yoff = 0 ;
float xinc =0.01, yinc = 0.01;
float []x = new float[4];
float []y = new float[4];
float []tx = new float[4];
float []ty = new float[4];
float fontSz = 90;

void setup() {
  size( 600, 600);
  background(0);
  for (int i=0; i<4; i++) {
    x[i]=0; 
    y[i]=0;
    tx[i] = i*fontSz-fontSz*1.5;
    ty[i] = 0;
  }
  textSize(fontSz);
}

void draw() {
  translate(width/2, height/2);
  background(17, 17, 64, 3);
  fill(255);
  for (int i=0; i<name.length (); i++) {
    if (mousePressed) {
      x[i]+=(tx[i]-x[i])/10;
      y[i]+=(ty[i]-y[i])/10;
    } else {
      x[i]+=fontSz/3*cos(noise(xoff, yoff)*360);
      y[i]+=fontSz/3*sin(noise(xoff, yoff)*360);
    }
    text(name.substring(i, i+1), x[i], y[i]);
    xoff+=xinc;
  }
  yoff+=yinc;
}
