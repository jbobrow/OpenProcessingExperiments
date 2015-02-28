
String lines[];
float iris_radius, eye_radius;
color c_a, c_c, c_g, c_t;
float center_x, center_y;
float l_scale = 5.0f;
String dna_file = "chr1_gl000191_random.fa";
int fraction_to_use = 1;

void setup() {
  noLoop();
  noFill();
  lines = loadStrings(dna_file);
  iris_radius = 15 * l_scale;
  eye_radius = 60 * l_scale;
  float total_radius = eye_radius + 10;
  size((int)(total_radius*2), (int)(total_radius*2));
  center_x = width / 2.0f;
  center_y = height / 2.0f;
  background(190);
  smooth();
  c_a = color(#003EBA);
  c_c = color(#5D7CBA);
  c_g = color(#FF5400);
  c_t = color(#FFE17F);
}

void draw() {
  fill(0);
  ellipse(center_x, center_y, iris_radius * 2, iris_radius * 2);
  noFill();
  ellipse(center_x, center_y, eye_radius * 2, eye_radius * 2);
  float angle_step = 2.0f * PI / lines.length * fraction_to_use;
  float line_step = (eye_radius - iris_radius) / lines[0].length();
  for (int i = 0; i < lines.length / fraction_to_use; i++)
  {
    for (int j = 0; j < lines[i].length(); j++)
    {
      char letter = lines[i].charAt(j);
      color c_letter;
      switch(letter) {
        case 'a':
          c_letter = c_a;
          break;
        case 'c':
          c_letter = c_c;
          break;
        case 'g':
          c_letter = c_g;
          break;
        case 't':
          c_letter = c_t;
          break;
        default:
          c_letter = c_a;
          break;
      }
      // MATH!
      float l_x1, l_x2, l_y1, l_y2;
      l_x1 = center_x +
        ((iris_radius + j*line_step) * cos(angle_step * i));
      l_x2 = center_x +
        ((iris_radius + (j+1)*line_step) * cos(angle_step * i));
      l_y1 = center_y +
        ((iris_radius + j*line_step) * sin(angle_step * i));
      l_y2 = center_y +
        ((iris_radius + (j+1)*line_step) * sin(angle_step * i));
      // /MATH :(
     
      stroke(c_letter, 150);
      strokeWeight(2);
      line(l_x1, l_y1, l_x2, l_y2);
    }
  }
  save("iris_" + dna_file + ".png");
}


