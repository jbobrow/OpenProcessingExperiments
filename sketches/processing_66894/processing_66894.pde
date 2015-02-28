
int count = 40;
int rectWidth = screen.width / count;
int rectHeight = (screen.height - 100) / count;

int[] colorData = new int[count];
int[] colorRevr = new int[count];
int[] xData = new int[count];
int[] heightData = new int[count];

void setup() {
  //size(screen.width, screen.height);
  size(800, 600);
  background(255);
  smooth();
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);

  for (int i = 0; i < count; i++) {
    colorData[i] = int(map(i, 0, count, 0, 360));
    colorRevr[i] = int(map(i, 0, count, 0, 360));
    xData[i] = i;
    heightData[i] = int(i*rectHeight) + 100;
  }
}

void draw() {
  for (int i = 0; i < count; i++) {
    fill(colorData[i], 80, 80, 80);
    rect(xData[i]*rectWidth, height - heightData[i], rectWidth, heightData[i]);
    
    fill(colorRevr[i], 80, 80, 80);
    rect(xData[i]*rectWidth, 0, rectWidth, height - heightData[i]);

    colorData[i] += 1;
    colorData[i] = colorData[i] % 360;

    colorRevr[i] -= 1;
    if (colorRevr[i] < 0)
      colorRevr[i] = 360;
    //colorRevr[i] = colorRevr[i] % 360;
  }
}


