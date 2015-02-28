
String[] lines;
final int BAR_HEIGHT = 20;
List<Integer> ages = new ArrayList<Integer>();
float[][] ageAverages;

void setup() {
  lines = loadStrings("data.csv");
  size(800, 600);
  smooth();
  
  //noStroke();
}

void draw() {
  colorMode(RGB, 255);
  background(110);
  fill(0, 0, 0);
  line(50, 30, 50, height-50);
  text("Age", 12, 25);
  fill(180);
  for (int i = 1; i < lines.length; i++) {
    String[] fields = split(lines[i], ",");
    System.out.println(fields[26] + ") Internet Usage: " + fields[25] + ", Disorientation: " + fields[27]);
    if (!ages.contains(Integer.parseInt(fields[26]))) ages.add(Integer.parseInt(fields[26]));
    //age = 26, intUsage = 25, disorientations = 27
  }

  /*
  Trying to get averages for each age.
   We do this by simply running through all of the lines and the 
   first order of the array, and changing the second order to display the current average.
   Basically what we do is have count of the number of elements added (index 1) and set index 0 to
   sum of all (index 2) divided by count (index 1).
   */
  ageAverages = new float[ages.size()][3];
  for (int j = 0; j < ages.size(); j++) {
    for (int i = 1; i < lines.length; i++) {
      String[] fields = split(lines[i], ",");
      if (ages.get(j) == Float.parseFloat(fields[26])) {
        ageAverages[j][2] += Float.parseFloat(fields[25]);
        ageAverages[j][1]++;
        ageAverages[j][0] = ageAverages[j][2] / ageAverages[j][1];
      }
    }
  }

  for (int j = 0; j < ages.size(); j++) {
    //age = 26, intUsage = 25, disorientations = 27

    if (mouseContained(53, j*30+30, 53+(int)map(ageAverages[j][0], 0, 1, 0, 350), (j*30+30)+BAR_HEIGHT)) {
      fill(65, 65, 65);
    }
    else {
      fill(155, 155, 155);
    }
    
    noStroke();
    drawBar(53, j*30+30, (int)map(ageAverages[j][0], 0, 1, 0, 350));
    text(ages.get(j), 15, j*30+42);
    stroke(0);
    if (mouseContained(53, j*30+30, 53+(int)map(ageAverages[j][0], 0, 1, 0, 350), (j*30+30)+BAR_HEIGHT)) {
      fill(200, 200, 200);
      rect(mouseX, mouseY, 150, 25);
      fill(0);
      text("Avg: " + ageAverages[j][0], mouseX+10, mouseY+20);
    }
  }
  //noLoop();
}

void drawBar(int x, int y, int wd) {
  rect(x, y, wd, BAR_HEIGHT);
}

boolean mouseContained(int nwX, int nwY, int seX, int seY) {
  return mouseX >= nwX && mouseX <= seX && mouseY >= nwY && mouseY <= seY;
}

