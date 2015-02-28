
int[] radius = new int[400]; 
color[] colors = new color[400];


void setup () {
  size(400, 400);
  for (int i = 0; i < radius.length; i++ ) {
    radius[i] = int(random(2, 100)); 
    //println(radius[i]);
  }

  for(int j = 0; j < colors.length; j++) {
    colors[j] = color(random(100,250),random(100,250), random(100,250), random(10,150));
  } 
  noStroke();
}

void draw() {
  background(150);

  int counter = 0;
  for (int x = 10; x < 400; x += 20) {
    //for every x value, iterate thru the y values
    for (int y = 10; y < 400; y += 20) {
      //draw an ellipse at the current x and y location
      fill(colors[counter]);
      ellipse(x, y, radius[counter], radius[counter]);
      //int rad = int(random(2,50));
      //ellipse(x, y, rad, rad);
      if(dist(x,y,mouseX, mouseY) < 40) {
        if (radius[counter] > 0) {
          radius[counter] -= 20;
        }
      }
      else if(dist(x,y,mouseX, mouseY) > 100) {
        if(radius[counter] < 200) {
          radius[counter] += 1;
        }
      }

      counter ++;
    }
  }
}

                
                                
