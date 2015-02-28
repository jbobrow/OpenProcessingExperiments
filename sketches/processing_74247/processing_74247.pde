

public class BMFractal
{
  PVector baseVector;
  PVector currentEdgeVector;
  float currentAngle;
  ArrayList currentPoints;
  float stretchRatio;
  float spreadRatio;
  int currentLine;
  int timeInterval = 1000 / 60;
  
  float padding = 10.0f;
  float textBuffer = 10.0f;

  PVector zeroDegreeLine;
  ArrayList base;
  ArrayList motif;

  boolean needsUpdate;
  int maxIterations;

  int sweepType;

  final int SWEEP_NONE = 0;
  final int SWEEP_EVEN = 1; 
  final int SWEEP_ODD = 2; 
  final int SWEEP_ALTERNATING_EVEN = 3; 
  final int SWEEP_ALTERNATING_ODD = 4;

  color[] spectrum;

  BMFractal(BMFractalDescription description)
  {
    this(description.sweepStyle, description.defaultIterations, description.defaultBase, description.defaultMotif);
  }

  BMFractal(int theSweepType, int theMaxIterations, ArrayList theBase, ArrayList theMotif)
  {
    base = theBase;
    motif = theMotif;
    maxIterations = theMaxIterations;
    stretchRatio = 100;
    spreadRatio = 0;

    sweepType = theSweepType;

    zeroDegreeLine = new PVector(1.0f, 0.0f);

    spectrum = new color[7];
    
    spectrum[0] = #FF0000;
    spectrum[1] = #FFFF00;
    spectrum[2] = #00FF00;
    spectrum[3] = #00FFFF;
    spectrum[4] = #0000FF;
    spectrum[5] = #FF00FF;
    spectrum[6] = #FF0000;

    needsUpdate = true;
  }
  
  //Stretch: 0.8
  //Spread: -1.45
  //sweep: 1
  //Fractal: Space-filled triangle

  float spreadValue(float value) {
    float returnVal = value;
    
    if (value < 0.5) {
      returnVal = value - (value * ((float)spreadRatio / 100.0));
    }
    else if (value > 0.5) {
      returnVal = value + ((1.0 - value) * ((float)spreadRatio / 100.0));
    }
    
    return returnVal;
  }

  void calculate()
  {
    //Start with the basis lines.
    currentPoints = (ArrayList)base.clone();
    ArrayList distortedMotif = new ArrayList();
    
    for(int i = 0; i < motif.size(); i++) {
      PVector currentPoint = (PVector)motif.get(i);
      distortedMotif.add(new PVector(spreadValue(currentPoint.x), currentPoint.y * ((float)stretchRatio / 100.0)));
    }

    int iteration = 0;

    while (iteration < maxIterations)
    {
      ArrayList newPoints = new ArrayList();

      PVector finalPoint = new PVector(0, 0);

      for (int i = 0; i < currentPoints.size() - 1; i++)
      {
        PVector angleStartPoint = (PVector)currentPoints.get(i);
        PVector angleEndPoint = (PVector)currentPoints.get(i + 1);
        PVector angleVector = PVector.sub(angleEndPoint, angleStartPoint);
        float angleVectorMag = angleVector.mag();

        currentAngle = PVector.angleBetween(zeroDegreeLine, angleVector);

        if (angleStartPoint.y > angleEndPoint.y)
        {
          currentAngle = TWO_PI - currentAngle;
        }

        int maxVal = (currentPoints.size() - 1) * (distortedMotif.size() - 1);

        for (int j = 0; j < distortedMotif.size() - 1; j++)
        {
          PVector lineStart = ((PVector)distortedMotif.get(j)).get();
          PVector lineEnd = ((PVector)distortedMotif.get(j + 1)).get();

          boolean shouldInvert;

          if (sweepType == SWEEP_NONE) {
            shouldInvert = false;
          } 
          else if (sweepType == SWEEP_EVEN) {
            shouldInvert = (i % 2 == 0);
          } 
          else if (sweepType == SWEEP_ODD) {
            shouldInvert = (i % 2 != 0);
          } 
          else if (sweepType == SWEEP_ALTERNATING_EVEN) {
            shouldInvert = (i % 2 == iteration % 2);
          } 
          else if (sweepType == SWEEP_ALTERNATING_ODD) {
            shouldInvert = (i % 2 != iteration % 2);
          } 
          else {
            shouldInvert = false;
          }

          if (shouldInvert)
          {
            lineEnd.y = -lineEnd.y;
          }

          PVector transformStart = rotatePoint(scalePoint(lineStart, angleVectorMag), currentAngle);
          PVector transformEnd = rotatePoint(scalePoint(lineEnd, angleVectorMag), currentAngle);

          if (j == 0 && i == 0)
          {
            newPoints.add(PVector.add(transformStart, finalPoint));
          }

          newPoints.add(PVector.add(transformEnd, finalPoint));

          if (j == distortedMotif.size() - 2)
          {
            finalPoint = PVector.add(transformEnd, finalPoint);
          }
        }
      }
      currentPoints = newPoints;

      iteration++;
    }

    this.needsUpdate = false;
  }

  void draw()
  {
    int startTime = millis();

    if (needsUpdate)
    {
      background(0x000000);

      this.calculate();
      
      currentLine = 0;
    }

    float scaleValue = min(height - (padding * 2) - textBuffer, width - (padding * 2));

    PVector initPoint = (PVector)currentPoints.get(0);
    PVector minPoint = new PVector(initPoint.x, initPoint.y);
    PVector maxPoint = new PVector(initPoint.x, initPoint.y);

    for (int i = 0; i < currentPoints.size(); i++)
    {
      PVector currentPoint = (PVector)currentPoints.get(i);
      minPoint.x = min(currentPoint.x, minPoint.x);
      minPoint.y = min(currentPoint.y, minPoint.y);
      maxPoint.x = max(currentPoint.x, maxPoint.x);
      maxPoint.y = max(currentPoint.y, maxPoint.y);
    }

    float xDiff = maxPoint.x - minPoint.x;
    float yDiff = maxPoint.y - minPoint.y;
    float finalScale = 1.0f / max(xDiff, yDiff);

    for (int i = currentLine; i < currentPoints.size() - 1; i++)
    {
      stroke(lineColor(i, currentPoints.size() - 1));
      fill(lineColor(i, currentPoints.size() - 1));

      PVector lineStart = (PVector)currentPoints.get(i);
      PVector lineEnd = (PVector)currentPoints.get(i + 1);

      PVector transformStart = scalePoint(lineStart, scaleValue * finalScale);
      PVector transformEnd = scalePoint(lineEnd, scaleValue * finalScale);

      line(transformStart.x - (minPoint.x * scaleValue * finalScale) + padding, 
          transformStart.y - (minPoint.y * scaleValue * finalScale) + padding, 
          transformEnd.x - (minPoint.x * scaleValue * finalScale) + padding, 
          transformEnd.y - (minPoint.y * scaleValue * finalScale) + padding);
      //set(floor(transformStart.x - (minPoint.x * scaleValue * finalScale)), 
      //    floor(transformStart.y - (minPoint.y * scaleValue * finalScale)), 
      //    lineColor(i, currentPoints.size() - 1));
      //point(transformStart.x - (minPoint.x * scaleValue * finalScale), transformStart.y - (minPoint.y * scaleValue * finalScale));
      //point(transformEnd.x - (minPoint.x * scaleValue * finalScale),  transformEnd.y - (minPoint.y * scaleValue * finalScale));
      //ellipse(transformEnd.x - (minPoint.x * scaleValue * finalScale),  transformEnd.y - (minPoint.y * scaleValue * finalScale),3,3);
      if(millis() - startTime >= timeInterval) {
        currentLine = i;
        break;        
      }
    }
  }

  PVector rotatePoint(PVector originalPoint, float angle)
  {
    PVector newPoint = new PVector(originalPoint.x * cos(angle) - originalPoint.y * sin(angle), 
    originalPoint.x * sin(angle) + originalPoint.y * cos(angle));

    return newPoint;
  }


  PVector scalePoint(PVector originalPoint, float scaleFactor)
  {
    PVector newPoint = new PVector(originalPoint.x * scaleFactor, 
    originalPoint.y * scaleFactor);

    return newPoint;
  }

  color lineColor(int currentSequence, int maxSequence)
  {
    int spectrumSlots = spectrum.length - 1;

    int lowerIndex = floor(((float)currentSequence / (float)maxSequence) * spectrumSlots);
    int upperIndex = ceil(((float)currentSequence / (float)maxSequence) * spectrumSlots);
    float remainder = upperIndex - (((float)currentSequence / (float)maxSequence) * spectrumSlots);
    remainder = 1.0f - remainder;

    int rLower = spectrum[lowerIndex] >> 16 & 0xff;  
    int gLower = spectrum[lowerIndex] >> 8 & 0xff;  
    int bLower = spectrum[lowerIndex] & 0xff;

    int rUpper = spectrum[upperIndex] >> 16 & 0xff; 
    int gUpper = spectrum[upperIndex] >> 8 & 0xff;
    int bUpper = spectrum[upperIndex] & 0xff;

    int rInterp = ceil((float)(rUpper - rLower) * remainder) + rLower;
    int gInterp = ceil((float)(gUpper - gLower) * remainder) + gLower;
    int bInterp = ceil((float)(bUpper - bLower) * remainder) + bLower;

    return color(rInterp, gInterp, bInterp);
  }
}


