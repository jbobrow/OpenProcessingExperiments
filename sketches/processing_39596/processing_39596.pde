
int num = 25;  //assign amount of circles
float[] y = new float[num];
float[] speed = new float[num];
color[] Colors = new color[4];
int[] colorFill = new int[num];


void setup() {
  size(300, 300);

  Colors[0] = color(255, 0, 0, 75);  //assign color red
  Colors[1] = color(0, 255, 0, 75);  //assign color green
  Colors[2] = color(0, 0, 255, 75);  //assign color blue
  Colors[3] = color(220, 255, 0, 75);  //assign color yellow

  for (int i=num-1; i>=0; i--) {
    y[i] = random(0, height);
    speed[i] = random(-2, 2);
    colorFill[i] = floor(random(0, 4));
  }
  noStroke();
  smooth();
}



void draw() {
  background(0);

  for (int i=0; i<num-1; i++) {
    fill(Colors[colorFill[i]]);  //fill with Colors
    ellipse(width/num * i + width/num, y[i], 200, 200);  //create circles
    y[i] = y[i] + speed[i];  //assign speed


    if (y[i] > height) y[i] = 0;  //reset if circles fall off screen
  }
  
}
void keyPressed(){
  if((key == 's') || (key == 's')){    //saves screanshot image
   save("image.jpg");
   println("Image saved.");
  }
}

