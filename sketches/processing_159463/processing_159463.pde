
int[] randomCounts;
color[] randomColors;

void setup() {
  size(1280, 720);
  randomCounts = new int[20];  
  randomColors = new color[20];
  for (int x = 0; x < randomColors.length; x++) {
    randomColors[x] = color(60, 0, 0);
  }
  background(0);
}

void draw() {
  int index = int(random(randomCounts.length));
  randomCounts[index] = randomCounts[index] + 30;
  stroke(0);
  int w = width/randomCounts.length;
  for (int x = 0; x < randomCounts.length; x++) {
    if (randomCounts[x] > height) {
      randomCounts[x] = 0;
      
      int red = int(red(randomColors[x])) + 60;
      if(red > 255){
        red = red - 255;    
      }      
      randomColors[x] = color(red, 0, 0);
      //println(x + " " + red(randomColors[x]));
      fill(red(randomColors[x]));
    } else {
      fill(randomColors[x]);
    }
    rect(x * w, height - randomCounts[x], w-1, randomCounts[x]);
  }
}

