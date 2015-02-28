

color[] sethsColors = new color[5];
int num = 20; 
float[] x = new float[num];        //x-coordinates of the rectangles
float[] y = new float[num];        //y-coordinates of the rectangles

void setup() {
  size(300, 300);
  smooth();

  sethsColors[0] = color(178, 57, 99);        //Color palette for the rectangles
  sethsColors[1] = color(255, 107, 113);
  sethsColors[2] = color(255, 252, 125);
  sethsColors[3] = color(65, 153, 204);
  sethsColors[4] = color(66, 137, 178);


  for (int i = 0; i < num; i++) {       //creates the rectangle loop
    x[i] = random(width);        //Controls Spacing
    y[i] = i * (height/num);
  }
}


void draw() {
  background(0, 255);

  for (int i = 0; i<num;i++) {

    fill(pickAColor());
    rect(x[i], y[i], 10, width);
    rect(x[i], y[i/2], 20, width/2); 

    x[i] = x[i]+1; 
    if (x[i] > width + 2)
      x[i] = -5;
  }
}

color pickAColor() {        //Picks from the palette
  int a = int(random(5));       //Number of colors to use
  return sethsColors[a];
}















