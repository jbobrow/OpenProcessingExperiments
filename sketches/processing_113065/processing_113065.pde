
int bgColor = 100;
int colorDelta = 1;
int shadeCount = 0;

void draw() {
  background(bgColor);
  bgColor += colorDelta;
  if (shadeCount < 50) {
    shadeCount++;
  } else {
    shadeCount = 0;
    colorDelta *= -1;
  }
}
