
float time = 0.0f;
int mode = 0;
PFont font;

void setup()
  {
  size(640, 480);
  background(0);
  smooth();

  font = loadFont("FreeSans-20.vlw");
  textFont(font);
  text("Sinus", 5, height - 5);
  }

void draw()
  {

  fill(0, 255 / 20);
  noStroke();
  rect(0, 0, width, height);
  
  fill(127);

  stroke(127);
  strokeWeight(1);
  line(0, height / 2, width, height / 2);
  
  line(width / 4, height / 2 - 5, width / 4, height / 2 + 5); // PI / 2
  line(width / 2, height / 2 - 5, width / 2, height / 2 + 5); // PI 
  line(width * 3 / 4, height / 2 - 5, width * 3 / 4, height / 2 + 5); // PI * 3 / 2
  line(width , height / 2 - 5, width, height / 2 + 5); // 2 * PI

  line(width * 1 / 8, height / 2 - 5, width * 1 / 8, height / 2 + 5); // PI / 4
  line(width * 3 / 8, height / 2 - 5, width * 3 / 8, height / 2 + 5); // PI * 3 / 4 
  line(width * 5 / 8, height / 2 - 5, width * 5 / 8, height / 2 + 5); // PI * 5 / 4
  line(width * 7 / 8, height / 2 - 5, width * 7 / 8, height / 2 + 5); // 2 * PI

  if(time == width)
    {
    time = 0.0f;
    }
  else
    {
    time++;
    }

  stroke(127, 255, 0);
  strokeWeight(5);

  switch(mode)
    {
    case 0:
      point(time, height / 2 + height / 4 * -(sin(map(time, 0, width, 0, TWO_PI))));
      break;
    case 1:
      point(time, height / 2 + height / 4 * -(cos(map(time, 0, width, 0, TWO_PI))));
      break;
    case 2:
      point(time, height / 2 + height / 4 * -(tan(map(time, 0, width, 0, TWO_PI))));
      break;
    case 3:
      point(time, height / 2 + height / 4 * -( 1 / tan(map(time, 0, width, 0, TWO_PI))));
      break;
    }
  
  
  }
  
void mouseClicked()
  {
  if(mode == 3)
    {
    mode = 0;
    }
  else
    {
    mode++;
    }
  
  background(0);
  time = 0.0f;

  switch(mode)
    {
    case 0:
      text("Sinus", 5, height - 5);
      break;
    case 1:
      text("Cosinus", 5, height - 5);
      break;
    case 2:
      text("Tangens", 5, height - 5);
      break;
    case 3:
      text("Cotangens", 5, height - 5);
      break;
    }
  }


