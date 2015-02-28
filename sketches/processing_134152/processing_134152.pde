
//size(1280, 720);
size(640, 360);
smooth();
background(255);

int horzUnit = 4;
strokeWeight(horzUnit);
for (int y = 0; y < height; y += horzUnit) {
  float c = ((float)y / height);
  stroke(255 - (255 * c), 128);
  line(0, y, width, y);
}

int stepCount = 6;
int margin = stepCount * 2;
strokeWeight(1);
for (int x = margin; x < (width - (margin * 2)); x += stepCount) {
  float stepRatio = (float)x / (width - (margin * 2));
  int maxLineHeight = height - (stepCount * 2);
  int lineHeight = (int)(maxLineHeight * (stepRatio * stepRatio));

  float a = 192 - (192 * stepRatio);
  stroke(64, a);
  line(x + (stepCount / 2), margin, x + (stepCount / 2), margin + lineHeight);
  stroke(192, a);
  line(x + stepCount, height - margin, x + stepCount, height - margin - lineHeight);
}



