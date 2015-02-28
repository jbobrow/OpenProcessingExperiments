
//budding flowers
void setup() {
  size(300, 300);
  background(0);
}

int x = 5; // for maintaing the main center of revolution
int y = 5;// secondary rotation with arc to variate its radius
int z=30;

void draw () { //to keep looping


  noFill();
  pushMatrix();
  translate(width/2, height/2);//shifting the centre
  rotate(radians(x));//main rotation with the centre of screen being the centre
  translate(100, 0);//radius, this is the distance at which the arc formations will take place from the centre
  rotate(radians(y+100)); // local rotation within the arc with respect to the main axis
  strokeWeight(2);
  stroke(255, 245, 49);
  arc(10, 10, 20, 20, radians(random(10)), radians(random(300)));
  popMatrix();

  translate(width/2, height/2);//again shifting the centre
  strokeWeight(1);
  stroke(random(200), random(200), random(16));
  rotate(-radians(x+60));//reverse formation of the lines
  line(150, 30, z, z+30);//different x and y to have a slanting line


  y+=10;
  x++;
}


