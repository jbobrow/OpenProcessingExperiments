
class BleedingGradient extends DisplayObject {

  // fields

  LinearGradient gradient;

  float gradientEndLength;
  float gradientCurrentLength;
  int gradientThickness;

  color startColor;
  color endColor;

  float currentVelocity;
  float startVelocity;
  float deceleration;

  // methods

  BleedingGradient(int gradientThickness, color startColor, color endColor, float startVelocity, float deceleration) {
    this.gradientThickness = gradientThickness;
    this.startColor = startColor;
    this.endColor = endColor;
    this.startVelocity = startVelocity;
    this.deceleration = deceleration;

    // calculate final gradient length
    float gradientCurrentLength = 0;
    float currentVelocity = startVelocity;
    while (currentVelocity > 0) {
      gradientCurrentLength += currentVelocity;
      currentVelocity -= deceleration;
    }
    this.gradientEndLength = gradientCurrentLength;

    gradient = new LinearGradient(gradientThickness, (int)gradientEndLength, LinearGradient.VERTICAL);
    gradient.color1 = startColor;
    gradient.color2 = endColor;
  }

  boolean isFinishedBleeding() {
    return (currentVelocity == 0);
  }

  void startBleeding() {
    currentVelocity = startVelocity;
    gradientCurrentLength = 0;
  }

  void update() {
    if (!isFinishedBleeding()) {
      gradientCurrentLength += currentVelocity;
      currentVelocity -= deceleration;
      currentVelocity = max(currentVelocity, 0);
    }

    gradient.gradientHeight = (int)gradientCurrentLength;
    gradient.color2 = lerpColor(startColor, endColor, gradientCurrentLength / gradientEndLength);
    gradient.drawGradient();
  }
}






