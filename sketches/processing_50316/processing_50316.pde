
//Golden Ratio (LINE-based art)
//Draw squares spiraling into the center
//Draw lines of alternating direction within each square


void setup() {
  size(1200, 742);
  background(200);
  loop();
}

void draw() {
  float i, j;
  int leeway;
  int direction = 0;  //monitors where next shape goes;
  float cornerX = 0;
  float cornerY = 0;
  float phi = 1.6180339;    //mathematical constant ("Golden Ratio")
  float s = width / (1.62);
  int weight = 8;
  int lnshade = 100;
  int shade = 100;
  //strokeWeight(weight);
  //stroke(lnshade);
  
  for (i = 0; i < 12; i++) {
    if (weight > 2) {
      weight--;
    }
    fill(10, shade - 50, shade);
    shade += 25;
    stroke(lnshade);
    if (lnshade <=230) {
      lnshade += 25;
    }

    rect(cornerX, cornerY, s, s);
    if (direction % 2 == 0) {
      for (j = cornerX; j <= cornerX + s; j += 10) {
        leeway = int(random(2)) - 1;      //leeway is a random variable that makes each line slightly thicker/thinner
        strokeWeight(weight + leeway);    //because of the loop, the lines are constantly shifting
        line(j, cornerY, j, cornerY + s); //creating a dizzying effect
      }
    } else {
      for (j = cornerY; j <= cornerY + s; j += 10) {
        leeway = int(random(4)) - 2;
        strokeWeight(weight + leeway);
        line(cornerX, j, cornerX + s, j);
      }
    }
    if (direction % 4 == 0) {
      //arc(cornerX + s, cornerY + s, 2*s, 2*s, PI, 3 * PI / 2);  //arcs used to check math
      cornerX = cornerX + s;
    } 
    
    else if (direction % 4 == 1) {
     // arc(cornerX, cornerY + s, 2*s, 2*s, 3 * PI / 2, 2 * PI);
      cornerY = cornerY + s;
      cornerX = cornerX + (s - s / phi);
    } 
    
    else if (direction % 4 == 2) {
      //arc(cornerX, cornerY, 2*s, 2*s, 0, PI/2);
      cornerX = cornerX - (s / phi);
      cornerY = cornerY + (s - s / phi);
    } 
    
    else if (direction % 4 == 3) {
      //arc(cornerX + s, cornerY, 2*s, 2*s, PI/2, PI);
      cornerY = cornerY - (s / phi);
    }
    direction++;
    s = s / phi;
  }
  
}

