
class EnemCirc {
  
  // Parameters ////////////////////////////////////////////////////////
  // Color of enemCircY
  color colorCirc_00;
  
  // Speed of enemCircY
  int enemCircSpeed;
  
  // Constructor ///////////////////////////////////////////////////////
  // Without arguments
  EnemCirc() {
    // Initiate arrays;
    enemCircX = new float[numEnemCirc];
    enemCircY = new float[numEnemCirc];
    sizeCirc = new float[numEnemCirc];
    
    // Set initial position, size of all enemCircs
    for (int i = 0; i < numEnemCirc; i++) {
      enemCircX[i] = (int) random(0, width);
      enemCircY[i] = -(int) random(0, height);
      sizeCirc[i] = noise(perlinNoiseTime)*width/10;
    }
    
    // Other parameters
    enemCircSpeed = 4;
    this.colorCirc_00 = color_black;
  }
  
  // With arguments
  EnemCirc(int numEnemCirc) {
    // Initiate arrays;
    enemCircX = new float[numEnemCirc];
    enemCircY = new float[numEnemCirc];
    sizeCirc = new float[numEnemCirc];
    
    // Set initial position, size of all enemCircs
    for (int i = 0; i < numEnemCirc; i++) {
      enemCircX[i] = (int) random(0, width);
      enemCircY[i] = -(int) random(0, height);
      sizeCirc[i] = noise(perlinNoiseTime)*width/10;
    }
    
    // Other parameters
    enemCircSpeed = 4;
    this.colorCirc_00 = color_black;
  }
  
  // Methods ///////////////////////////////////////////////////////
  // Drawing the oneselves
  void drawEnemCircs() {
    for (int i = 0; i < numEnemCirc; i++) {
      // Perlin Noise process
      // Get a noise value at "time" and scale it according to the window's width.
      sizeCirc[i] = noise(perlinNoiseTime)*width/10;
      
      // Set new enemCirc's position
      enemCircY[i] += enemCircSpeed;
      
      // Draw enemCirc
      //stroke(colorCirc_00);
      noFill();
      stroke(colorCirc_00);
      ellipse(enemCircX[i]-4, enemCircY[i], sizeCirc[i], sizeCirc[i]);
      
      // Re-setup the position, When enemies screenout
      if (enemCircY[i] > height + 20) {
        enemCircX[i] = (int) random(0, width);
        enemCircY[i] = -(int) random(20, height);
      }
      
      // With each cycle, increment the " time "
      perlinNoiseTime += perlinNoiseIncrement;
    }
  }
}


