
void setupDotList()
{
  dotList = new PVector [ dotAmount ];
  checkCircleSizeList = new float [ circleAmount ];
  prevCircleSizeList = new float [ circleAmount ];
  prevDotList = new PVector [ dotAmount ];
}

void creatDotList()
{
  randomSeed(actRandomSeed);
  int dotCount = 0;
  int circleCount = circleAmount;
  int circle = 0;

  PVector checkDot;

  while (circle < circleCount)
  {
    float circleSize = random (10, height/4);

    int centerX = width/2;
    int centerY = height/2;

    int objectCount = dotAmount/circleAmount;
    
    float radius = random (50, (width+height)/4);
    

    // save Radius in List--------------------------------------------
    if (morphing == false) 
    {
      prevCircleSizeList [circle] = radius;
      //println (prevCircleSizeList [circle]);
    }

    // morph old Radius to new Radius--------------------------------------------
    if (morphing == true) 
    {
      float prevRadius = prevCircleSizeList [circle];
      float newRadius = radius;

      float ma = map(morphCount, 0,maxPositionFactor, 0,1);
      ma = constrain(ma, 0, 1);

      radius = lerp(prevRadius,newRadius, ma);
      
     }
    
    float sortZ = random (-200,200);
    float steps = TWO_PI / objectCount;
    float angle = 0;

    int count = 0;
    while (count < objectCount)
    {
      float x = 0, y = 0, z = 0;
      float currentAngleX = random  (cos(angle-steps/2), cos(angle));
      float currentAngleY = random  (sin(angle-steps/2), sin(angle));

      x = centerX + currentAngleX * radius;
      y = centerY + currentAngleY * radius;

      float randomZ = random (-200,200);

      float m = map(positionFactor, 0,maxPositionFactor, 0,1);
      m = constrain(m, 0, 1);

      z = lerp(randomZ, sortZ, m);

      // save old Position in List--------------------------------------------
      if (morphing == false) 
      {     
        prevDotList [dotCount] = new PVector ( x, y, z );
        if (altMode == true) prevDotList [count+(circle*count)] = new PVector ( x, y, z );
      }

      // morph old x,y,z to new x,y,z
      if (morphing == true) 
      {
        // alte Werte für x,y,z ---------------------------------------------
        checkDot = prevDotList [ dotCount ];
        float startX = checkDot.x, startY = checkDot.y, startZ = checkDot.z;
        float targetX = x, targetY = y, targetZ = z;

        float mb = map(morphCount, 0,maxPositionFactor, 0,1);
        mb = constrain(mb, 0, 1);

        x = lerp(startX, targetX,mb);
        y = lerp(startY, targetY, mb);
        z = lerp(startZ, targetZ, mb);
      }

      dotList [dotCount] = new PVector ( x, y, z );
      if (altMode == true) dotList [count+(circle*count)] = new PVector ( x, y, z );

      dotCount ++;
      angle = angle + steps;
      count++;
    }
    circle++;
  }

}

void drawLinesBetweenDots ()
{
  int dotCount = 0;
  int circleCount = circleAmount;
  int circle = 0;
  while (circle < circleCount)
  {

    int count = 0;
    int countMax = dotAmount/circleAmount;

    PVector currentDot;

    while (count < countMax)
    {

      currentDot = dotList [dotCount];
      if (altMode == true) currentDot = dotList [count+(circle*count)];

      checkDistanceRight (currentDot);

      dotCount++;
      count++;
    }
    circle++;
  }

}

























