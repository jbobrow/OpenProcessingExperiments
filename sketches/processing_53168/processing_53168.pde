
class Creature {
  PVector startPt, direction, destination;

  int segRangeLow  = 3;
  int segRangeHigh = 7;
  int segSizeLow   = 10;
  int segSizeHigh  = 15;
  int numSegments;
  int[] segmentSizes;
  int creatureStrokeWeight = 1;

  ArrayList patternsUsed = new ArrayList();

  ArrayList creatureSectors = new ArrayList();

  Sector startSector;

  color patternColor;

  Creature(PVector startLocation) {
    startPt = startLocation;

    // Establish how many segments the creature will have
    numSegments = (int)random(segRangeLow, segRangeHigh);
    segmentSizes = new int[numSegments];
    String desc = "";

    for (int i = 0; i < numSegments; i++) {
      segmentSizes[i] = (int)random(segSizeLow, segSizeHigh); 
      desc += segmentSizes[i] ;
      desc += " ";
    }
    print("\nThis creature will have " + numSegments + " segments of sizes: " + desc + "\n");

    patternColor = color((int)random(0,200));

    findStartSector();
    buildSegments();
    buildBorders();
  }

  void buildBorders() {
    for (int i = 0; i < creatureSectors.size(); i++) {
      // Get center
      Sector s = (Sector)creatureSectors.get(i);
      float sWidth    = s.secWidth;
      float sHeight   = s.secHeight;
      PVector sCenter = s.centerPoint();

      ArrayList borderSectors = new ArrayList();

      borderSectors.add(grid.sectorWithPoint(new PVector(sCenter.x, sCenter.y - sHeight)));
      borderSectors.add(grid.sectorWithPoint(new PVector(sCenter.x + sWidth, sCenter.y)));
      borderSectors.add(grid.sectorWithPoint(new PVector(sCenter.x, sCenter.y + sHeight)));
      borderSectors.add(grid.sectorWithPoint(new PVector(sCenter.x - sWidth, sCenter.y)));

      // Check each border sector to see if it is in this creature
      for (int j = 0; j < 4; j++) {
        if (creatureSectors.contains((Sector)borderSectors.get(j)) == false) {
          // We are in here because the sector is the last in a particular direction
          // s is the active sector
          
          switch(j) {
           case 0:
              s.drawBorderTop = true;
              break;
           case 1: 
              s.drawBorderRight = true;
              break;
           case 2:
              s.drawBorderBottom = true;
              break;
           case 3:
              s.drawBorderLeft = true;
              break;
          } 
        }
      }
    }
  }

  void buildSegments() {
    // Seed with the start sector
    boolean atStart = true;
    Sector thisSector = null;

    for (int i = 0; i < numSegments; i++) {
      
      // Pattern variables to be used with this segment
      int patternDensity = (int)random(7, 20); // Randomize this slightly at a later point

      while (patternDensity % 4 > 0) {
        patternDensity +=1;
      }
      print("Pattern Density: " + patternDensity + "\n"); 
      int patternType    = (int)random(1, 10);

      // Checks to make sure that each pattern is only used once with each Creature
      while (patternsUsed.contains (patternType)) {
        patternType = (int)random(1, 10);
        print("picking a new pattern...\n");
      }
      patternsUsed.add(patternType);

      // Iterate for each sector in segment
      for (int j = 0; j < segmentSizes[i]; j++) {

        // Null sector is expected at start
        if (atStart) {
          thisSector = pickSector(thisSector, atStart);
        }

        // Helps avoid problems when there is a null sector
        if (thisSector != null) {
          if (!atStart) {
            thisSector = pickSector(thisSector, atStart);
          }
          
          thisSector.setUpPattern(patternType, patternDensity, patternColor);
          thisSector.sectorStrokeWeight = creatureStrokeWeight;
          
          thisSector.drawBorderTop = false;
          thisSector.drawBorderRight = false;
          thisSector.drawBorderBottom = false;
          thisSector.drawBorderLeft = false;
          
          creatureSectors.add(thisSector);
        }

        atStart = false;
      }
    }
  }

  Sector pickSector(Sector previous, boolean atStart) {
    Sector thisSector = null;
    if (atStart) {
      thisSector = startSector;
    } 
    else {
      boolean sectorFound = false;
      int counter = 0;

      PVector prevCenter = previous.centerPoint();
      float prevWidth  = previous.secWidth;
      float prevHeight = previous.secHeight;

      while (sectorFound == false) {
        int direction = (int)random(0, 4) + 1;
        //print("direction: " + direction + "\n"); 

        PVector pointToTry = null;

        switch (direction) {
        case 1: // Up
          pointToTry = new PVector(prevCenter.x, prevCenter.y - prevHeight);
          break;
        case 2: // Right
          pointToTry = new PVector(prevCenter.x + prevWidth, prevCenter.y);
          break;
        case 3: // Down
          pointToTry = new PVector(prevCenter.x, prevCenter.y + prevHeight);
          break;
        case 4: // Left
          pointToTry = new PVector(prevCenter.x - prevWidth, prevCenter.y);
          break;
        }

        boolean proceed = grid.sectorWithPointIsAvailable(pointToTry);

        if (proceed) {
          thisSector = grid.sectorWithPoint(pointToTry);
          sectorFound = true; 
          break;
        }

        counter += 1;
        if (counter > 4) {
          print ("CAN'T FIND SUITABLE DIRECTION \n");
          break;
        }
      }
    }

    int secIndex = grid.unclaimedSectors.indexOf(thisSector);
    //print("SecIndex: " + secIndex + "\n");
    //grid.unclaimedSectors.remove(secIndex);
    //grid.claimedSectors.add(thisSector);

    return thisSector;
  }

  void findStartSector() {
    // Number of sectors
    int numSectors = grid.sectors.size();

    for (int i = 0; i < numSectors; i++) {
      Sector s = (Sector)grid.sectors.get(i);
      if (isInSector(s)) {
        // Do something about being in the sector
        print("found the sector\n");

        // Save it as the startSector
        startSector = s;
        break;
      }
    }
  }

  boolean isInSector(Sector s) {
    if (startPt.x >= s.topLeft.x && startPt.x < s.topRight.x && startPt.y >= s.topLeft.y && startPt.y < s.bottomLeft.y && startPt.x > s.borderThreshold && startPt.x < width - s.borderThreshold && startPt.y > s.borderThreshold && startPt.y < height - s.borderThreshold) {
      return true;
    } 
    else {
      return false;
    }
  }
}


