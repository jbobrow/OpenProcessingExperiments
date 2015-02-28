
void setupDotList ()
{
  int totalAmount = radiusAmount*dotsPerRadius;
  dotList = new PVector [totalAmount];
  //println (totalAmount);
}


void createRadius ()
{
  randomSeed (actRandomSeed);
  noiseSeed (actNoiseSeed);

  int dotCounter = 0;
  int count = 0;
  int amount = radiusAmount;
  float radiusNoise = random (3);

  while (count < amount)
  {

    float radius = startRadius + noise (radiusNoise)*noiseRadius;
    float zRandom = (-150)+ random (15*count, 17*count);
    float zArranged = (-150)+ 16*count;

    float m = map(randomZPos, 0,10, 0,1);
    m = constrain(m, 0, 1);
    float z1 = lerp(zRandom, zArranged, m);


    //float z1 =  (-150)+ random (15*count, 17*count);

    int centerX = 0, centerY = 0;

    int dotsPerRadiusCount = 0;
    int dotsPerRadiusAmount = dotsPerRadius;

    float steps = TWO_PI / dotsPerRadiusAmount;
    float angle = 0;
    float time = 0+timeSeed;

    while (dotsPerRadiusCount < dotsPerRadiusAmount)
    {
      float noiseValue = noise (time)*noiseZ;
      if (count >= amount-2) noiseValue = 0;

      float x = centerX + cos (angle) * (radius);
      float y = centerY + sin (angle) * (radius);
      float z = z1+noiseValue;

      dotList [dotCounter] = new PVector (x,y, z);

      time += 0.075;
      angle += steps;
      dotsPerRadiusCount++;
      dotCounter++;
    }
    radiusNoise += 0.13;
    count++;
  }
}


