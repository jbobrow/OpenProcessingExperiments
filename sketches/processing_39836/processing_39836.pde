
int num=20;
float[] y=new float[num];

void setup() {
  size(300, 300);
  noStroke();
  colorMode(RGB,width);
  for (int i=0; i<y.length; i++) {
    y[i]=random(width);
  }
}

void draw() {
  background(49,24,54);
  for (int i=0; i<y.length; i++) {
    fill(y[i]*2,y[i]*40,y[i]*20);//the color changes as it moves across screen
    ellipse(y[i], (width/y.length)*i, 30, 30);//this moves ellips across screen
    y[i]=y[i]+5;
    ellipse((width/y.length)*i,y[i],40,20);//this moves ellipse down screen
    y[i]=y[i]+1;
    if(y[i]>width) y[i]=0;
  }
}

//I am very lost with arrys, I seem to just not be getting it.

