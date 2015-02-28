
/*
This sketch loads a picture, sizing screen to
800x600 or more, and allows user to apply some filters,
namely GRAY, INVERT, POSTERIZE and BLUR,
to return to the original picture, and to save images.
*/

//global variables declared
PImage photo;
PImage filtered;

void setup() 
{
  size(800,600);
  background(0);
  photo = loadImage("panorama.jpg");
  filtered = photo;
}

void draw() {
  image(photo, 0, 0);
}

void keyReleased()
{
  switch(key)
  {
    case DELETE:
      photo = loadImage("panorama.jpg");
      image(photo, 0, 0);
      break;
    case BACKSPACE:
      photo = loadImage("panorama.jpg");
      image(photo, 0, 0);
      break;
    case 'g':
      filtered.filter(GRAY);
      image(filtered,0,0);
      break;
    case 'G':
      filtered = photo;
      filtered.filter(GRAY);
      image(filtered,0,0);
      break;
    case 'i':
      filtered = photo;
      filtered.filter(INVERT);
      image(filtered,0,0);
      break;
    case 'I':
      filtered = photo;
      filtered.filter(INVERT);
      image(filtered,0,0);
      break;
    case 'p':
      filtered = photo;
      filtered.filter(POSTERIZE,4);
      image(filtered,0,0);
      break;
    case 'P':
      filtered = photo;
      filtered.filter(POSTERIZE,4);
      image(filtered,0,0);
      break;
    case 'b':
      filtered = photo;
      filtered.filter(BLUR,6);
      image(filtered,0,0);
      break;
    case 'B':
      filtered = photo;
      filtered.filter(BLUR,6);
      image(filtered,0,0);
      break;
    case 's':
      save("filteredImage"+floor(random(1,99))+".jpg");
      break;
    case 'S':
      save("filteredImage"+floor(random(1,99))+".jpg");
      break;  
  }
}

