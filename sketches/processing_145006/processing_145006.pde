

  public void setup() {
    algorithms = new Algorithms();
    size(windowWidth, windowHeight, JAVA2D);
    frameRate(animationRate);
    inventory = new Stockroom(maxInventorySize, numberOfAisles, width, height);
    font = createFont("Arial", objectIdFontSize, true);
  }

  public void draw() {
    // Update the inventory
    inventory.removeStaleObjects(algorithms);
    if (currentPrintJob == null && inventory.hasCapacity()) {
      currentPrintJob = algorithms.newPrintJob();
    }
    if (currentPrintJob != null) {
      currentPrintJob.update();
      if (currentPrintJob.isReady()) {
        InventoryItem item = new InventoryItem(inventory.nextId(), currentPrintJob);
        algorithms.placeItem(item, inventory);
        currentPrintJob = null;
      }
    }
    // Draw the infrastructure
    background(255);
    stroke(color(0));
    strokeWeight(0.5);
    for (Aisle aisle : inventory.getAisles()) {
      line(aisle.start.x, aisle.start.y, aisle.end.x, aisle.end.y);
    }
    // Draw the inventory of objects
    noFill();
    for (Aisle aisle : inventory.getAisles()) {
      for (InventoryItem item : aisle.getItems()) {
        stroke(color(0));
        strokeWeight(1f);
        item.object.shape.draw(item.x, item.y, item.rotation);
      }
    }
    if (showObjectId) {
      textFont(font, objectIdFontSize);
      fill(100);
      for (Aisle aisle : inventory.getAisles()) {
        for (InventoryItem item : aisle.getItems()) {
          text(item.getId(), round((float)item.x), round((float)item.y));
        }
      }
    }
  }
  
  /**
   * @author ewan
   *
   */
  class Algorithms {
    
    public ArrayList<Aisle> buildAisles(int numberOfAisles, int width, int height) {
      ArrayList<Aisle> aisles = new ArrayList<Aisle>();
      for (int i=0; i<numberOfAisles; i++) {
        PVector start = new PVector((width+height)/numberOfAisles * (i+1), 0);
        PVector end = new PVector(start.x - height, height);
        aisles.add(new Aisle(start, end));
      }
      return aisles;
    }

    public PrintedObject newPrintJob() {
      int shapeType = floor(map(random(0, 4), 0, 1, 0, 1));
      float scaleFactor = (1 - sqrt(sqrt(random(0, 1)))) * baseScale;
      return new PrintedObject(shapeType, scaleFactor);
    }

    public boolean inventoryItemIsStale(InventoryItem item) {
      boolean stale = item.object.ageInSeconds() >= (maximumObjectAge * item.object.scaleFactor/10); // Larger objects hang around longer
      return stale;
    }

    public void placeItem(InventoryItem item, Stockroom inventory) {
      // Get the axis that has fewest items and add the item
      Aisle aisle = null;
      for (Aisle a : inventory.getAisles()) {
        if (aisle == null) {
          aisle = a;
        } else {
          aisle = a.itemCount() < aisle.itemCount() ? a : aisle;
        }
      }
      // rotate
      int rotation = round(random(0, 359));
      item.setRotation(rotation);
      // find a good position
      float ratio = random(0, 1);
      int x = round(lerp(aisle.start.x, aisle.end.x, ratio));
      int y = round(lerp(aisle.start.y, aisle.end.y, ratio));
      // Randomly shift position
      x += random(-30, 30);
      y += random(-30, 30);
      item.setPosition(x, y);
      aisle.addItem(item);
    }
  }

  /**
   * @author ewan
   *
   */
  class InventoryItem {

    double x, y;
    int rotation;
    PrintedObject object;
    int id;

    public InventoryItem(int id, PrintedObject obj) {
      this.id = id;
      this.object = obj;
    }

    public void setRotation(int rotation) {
      this.rotation = rotation;
    }

    public void setPosition(double x, double y) {
      this.x = x;
      this.y = y;
    }
    
    public int getId() {
      return id;
    }
  }

  /**
   * @author ewan
   *
   */
  class PrintedObject {

    float scaleFactor;
    long timeCreated;
    float w, h;
    Polygon2D shape;
    float progress;

    public PrintedObject(int shapeType, float scaleFactor) {
      this.scaleFactor = scaleFactor;
      this.shape = new ShapeLibrary().getShape(shapeType);
      this.shape.scale(scaleFactor);
      timeCreated = System.currentTimeMillis();
      progress = 0;
    }
    
    void update() {
      // Do some printing on the object
      progress += printSpeed;
    }
    
    boolean isReady() {
      return progress >= scaleFactor;
    }

    public int ageInSeconds() {
      return round((System.currentTimeMillis() - timeCreated) / 1000.0);
    }
  }

  /**
   * @author ewan
   *
   */
  class ShapeLibrary {
    
    double[][][] shapes = {
        {
          {385.4, 295.4},
          {364, 258.3},
          {342.5, 258.3},
          {313.5, 241.5},
          {236.4, 266.6},
          {257.4, 303},
          {297.2, 325.9},
          {363.2, 308.2},
          {385.4, 295.4},
          {228.2, 395.8},
          {262.6, 455.7},
          {318.5, 470.1},
          {359.4, 503.8},
          {396, 476.2},
          {370.8, 443},
          {337.6, 354.9},
          {278.6, 378.2},
          {248.6, 378.2},
          {228.2, 395.8},
          {185.7, 617.5},
          {201.2, 655},
          {226.2, 680.2},
          {282.2, 693.8},
          {298.8, 710.5},
          {351, 701.2},
          {385.2, 676},
          {385.2, 648.9},
          {404.9, 637.6},
          {398.1, 609.2},
          {415.8, 578.6},
          {326.4, 584.4},
          {273.8, 580.4},
          {252.2, 575.2},
          {185.7, 617.5},
          {349.5, 219.2},
          {389.1, 196.3},
          {356.2, 187.4},
          {333.9, 174.6},
          {318.5, 171.2},
          {302.2, 159.1},
          {279.3, 157.3},
          {288.4, 173},
          {296.2, 194.1},
          {296.2, 205.8},
          {304.1, 209},
          {319.5, 210.8},
          {341.4, 220.3},
          {349.5, 219.2},
          {380.4, 143.2},
          {381.8, 133.5},
          {383.6, 128},
          {383.1, 123},
          {382.7, 120},
          {383.7, 114.6},
          {382.4, 110.4},
          {375.6, 106.5},
          {352.6, 111.4},
          {344.3, 115.8},
          {347.7, 120.3},
          {349.2, 121.2},
          {352.1, 126.1},
          {357.4, 132.3},
          {361.6, 137.4},
          {371.1, 140.2},
          {377, 142.5},
          {380.4, 143.2}
        }
    };

    public Polygon2D getShape(int type) {
      try {
        return new Polygon2D(shapes[type]).normalize();
      } catch (Exception e) {
        e.printStackTrace();
        return null;
      }
    }
  }
  
  class Polygon2D {
    
    double[][] verts;
    double scaleFactor = 1;
    
    public Polygon2D(double[][] points) {
      verts = new double[points.length][2];
      for (int i=0; i<points.length; i++) {
        verts[i][0] = points[i][0];
        verts[i][1] = points[i][1];
      }
    }
    
    public Polygon2D normalize() {
      // Find the min x and y and max x and y
      double xMin = verts[0][0], xMax = verts[0][0], yMin = verts[0][1], yMax = verts[0][1];
      for (int i=1; i<verts.length; i++) {
        xMin = Math.min(xMin, verts[i][0]);
        xMax = Math.max(xMax, verts[i][0]);
        yMin = Math.min(yMin, verts[i][1]);
        yMax = Math.max(yMax, verts[i][1]);
      }
      for (int i=0; i<verts.length; i++) {
        verts[i][0] = verts[i][0] - xMin;
        verts[i][1] = verts[i][1] - yMin;
        verts[i][0] = verts[i][0] / Math.abs(xMax - xMin);
        verts[i][1] = verts[i][1] / Math.abs(yMax - yMin);
      }
      return this;
    }
    
    public void scale(double factor) {
      this.scaleFactor = factor;
    }
    
    public void draw(double x, double y, int rotationDegrees) {
      pushMatrix();
      translate((float)x, (float)y);
      rotate(radians(rotationDegrees));
      for (int i=0; i<verts.length; i++) {
        float x1 = (float)verts[i][0];
        float y1 = (float)verts[i][1];
        float x2 = (float)(i < verts.length - 1 ? verts[i+1][0] : verts[0][0]);
        float y2 = (float)(i < verts.length - 1 ? verts[i+1][1] : verts[0][1]);
        // Scale (don't use matrix scale because we want to preserve line weight thickness
        x1 *= scaleFactor;
        y1 *= scaleFactor;
        x2 *= scaleFactor;
        y2 *= scaleFactor;
        line(x1, y1, x2, y2);
      }
      popMatrix();
    }
    
  }


  /**
   * @author ewan
   *
   */
  class Stockroom {

    int maxSize;
    ArrayList<Aisle> aisles;
    int id;

    public Stockroom(int maxSize, int numberOfAisles, int width, int height) {
      this.maxSize = maxSize;
      this.aisles = algorithms.buildAisles(numberOfAisles, width, height);
      this.id = 0;
    }
    
    public int nextId() {
      return this.id++;
    }

    public void removeStaleObjects(Algorithms algorithms) {
      // Stale objects can be picked up and removed from inventory
      for (Aisle aisle : aisles) {
        ArrayList<InventoryItem> stale = new ArrayList<InventoryItem>();
        for (InventoryItem item : aisle.getItems()) {
          if (algorithms.inventoryItemIsStale(item)) {
            //println("STALE");
            stale.add(item);
          }
        }
        aisle.remove(stale);
      }
    }

    public boolean hasCapacity() {
      return this.size() < maxSize;
    }

    public int size() {
      int size = 0;
      for (Aisle aisle : aisles) {
        size += aisle.getItems().size();
      }
      return size;
    }
    
    public ArrayList<Aisle> getAisles() {
      return this.aisles;
    }
  }
  
  /**
   * @author ewan
   *
   */
  class Aisle {
    
    PVector start, end;
    ArrayList<InventoryItem> items = new ArrayList<InventoryItem>();
    
    public Aisle(PVector start, PVector end) {
      this.start = start;
      this.end = end;
    }
    
    public void addItem(InventoryItem item) {
      this.items.add(item);
    }
    
    public ArrayList<InventoryItem> getItems() {
      return items;
    }
    
    public void remove(ArrayList<InventoryItem> itemsToRemove) {
      items.removeAll(itemsToRemove);
    }
    
    public int itemCount() {
      return items.size();
    }
    
  }

