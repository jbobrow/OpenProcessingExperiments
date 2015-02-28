
Tri bweh;
int counter = 1;
float thirdyup;
float thirdy;
float rot;
float xnoise = 0.0;
float ynoise = 0.0;
float inc = 0.03;
int howMany;
int[] numbers;
int counting;


void setup() {
  size(1200, 1200);

  smooth();
  howMany = int(((width/100)+1) * ((height/86.60254)+1));
  println(howMany);
  numbers = new int[howMany*2];
  noLoop();
  println(howMany);
  for (int i = 0; i < numbers.length; i++) {
    numbers[i] = int(random(100, 255));
  }
}

void draw() {
  noStroke();
  rot = radians(90);
  //  rotate(rot);
  //  translate(0,-2000);



  for (int x = 0; x < width+50; x += 100) {
    for (int y = 0; y < height; y += 86.60254) { 
      if (counter == -1) {
        bweh = new Tri (x-50, y, int(random(100,255)),int(random(100,255)));
      }
      if (counter == 1) {

        bweh = new Tri (x, y, int(random(100,255)), int(random(100,255)));
      }
      bweh.display();
      counter = counter * -1;
      counting+=2;
      if (counting > howMany-2) {
        counting = 0;
      }
    }
  }
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float gray = noise(xnoise, ynoise) *255;
      stroke(gray, 50);

      point(x, y); 
      xnoise = xnoise + inc;
    }
    xnoise = 0;
    ynoise = ynoise + inc;
  }

  //save("iphonered.png");
}

class Tri {
  int colourup, colourdown;
  float x, y;
  float leng = 100;
  

  Tri(float datx, float daty, int colup, int coldown) {
    x = datx;
    y = daty;

    colourdown = coldown; 
    colourup = colup;
  }
  //  println(colourup);
  //  println(colourdown);
 
  void display() {
    beginShape(TRIANGLES);
    fill(colourdown, 0, 0);
    vertex(x, y);
    vertex(x+leng, y);
    float thirdx = x+dist(x, y, x+leng, y)/2;
    thirdy = ((thirdx-x) * sqrt(3))+y;

    vertex(thirdx, thirdy);

    endShape();

    beginShape(TRIANGLES);
    fill(colourup, 0, 0);
    vertex(x, y);
    vertex(x+leng, y);
    float thirdxup = x+dist(x, y, x+leng, y)/2;
    thirdyup = y-((thirdxup-x) * sqrt(3));

    vertex(thirdxup, thirdyup);

    endShape();
  }
}


