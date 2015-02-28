
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
  
  int[] gradientAlphaMask;

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
  }

  boolean isFinishedBleeding() {
    return (currentVelocity == 0);
  }

  void startBleeding() {
    currentVelocity = startVelocity;
    gradientCurrentLength = 0;
    
    gradient = new LinearGradient(gradientThickness, (int)gradientEndLength, LinearGradient.VERTICAL);
    gradient.color1 = startColor;
    gradient.color2 = endColor;
    gradient.drawGradient();
    
    gradientAlphaMask = new int[gradient.gradientImage.pixels.length];
    for (int i = 0; i < gradientAlphaMask.length; i++)
      gradientAlphaMask[i] = 0;
  }

  void updateBleeding() {
    if (isFinishedBleeding())
      return;
      
    float gradientOldLength = gradientCurrentLength;

    gradientCurrentLength += currentVelocity;
    currentVelocity -= deceleration;
    currentVelocity = max(currentVelocity, 0);
    
    // reveal more of the full-length gradient
    for (int i = gradientThickness * ((int)gradientOldLength); i < gradientThickness * ((int)gradientCurrentLength); i++)
      gradientAlphaMask[i] = 255;
      
    gradient.gradientImage.mask(gradientAlphaMask);
  }
}




