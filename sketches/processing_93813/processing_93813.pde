
String[] vivi;

int rect_size = 20;

color color_zero = color(46, 52, 54);
color color_two = color(78, 154, 6);
color color_three = color(196, 160, 0);
color color_four = color(6, 152, 154);

void setup() {
  size(430, 570);
  background(0);
  smooth();
  noLoop();

  vivi = loadStrings("vivi.txt");

  noStroke();
}

void draw() {
  for (int i = 0; i < vivi.length; i++) { 
    for (int j = 0; j < vivi[i].length();j++) { 
      switch(vivi[i].charAt(j)) {
      case '0':
        fill(color_zero);
        break;
      case '2':
        fill(color_two);
        break;
      case '3':
        fill(color_three);
        break;
      case '4':
        fill(color_four);
        break;
      default:
        noFill();
        break;
      }

      rect(j*rect_size+30, i*rect_size, rect_size, rect_size);
    }
  }
}

