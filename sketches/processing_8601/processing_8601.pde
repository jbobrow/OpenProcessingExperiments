
class WorldMap {
  
  static final int PROJECTION_EQUIRECTANGULAR = 0;
  static final int PROJECTION_MERCATOR = 1;
  
  int x, y, w, h;
  PImage raster;
  int projection = PROJECTION_EQUIRECTANGULAR;
  
  WorldMap() {
    this(0, 0, width, height, PROJECTION_EQUIRECTANGULAR);
  }
  
  WorldMap(int projection) {
    this(0, 0, width, height, projection);
  }
  
  WorldMap(int x, int y, int w, int h, int projection) {
    
    switch (projection) {
      case PROJECTION_EQUIRECTANGULAR:
        raster = loadImage("world_longlatwgs84.png");
        break;
      case PROJECTION_MERCATOR:
        raster = loadImage("world_mercator.jpg");
        break;
    }
    float ratio = (float)raster.width/raster.height;
    
    if (h >= w/ratio) {
      this.w = w;
      this.h = int(w/ratio);
      this.x = x;
      this.y = int((h - this.h)/2);
    }
    else {
      this.h = h;
      this.w = int(ratio*h);
      this.x = int((w - this.w)/2);
      this.y = y;
    }
    
    this.setProjection(projection);
    
  }
  
  /**
   * Draw the background map
   */
  void drawBackground() {
    image(raster, x, y, w, h);
  }
  
  /**
   * Returns the screen coordinates for given WGS84 lat/long
   * 
   * @param float latitude
   * @param float longitude
   * @return PVector
   */
  PVector getPoint(float latitude, float longitude) {
    PVector coordinates = getCoordinates(latitude, longitude);
    return new PVector(
      this.x + this.w*coordinates.x,
      this.y + this.h*(1 - coordinates.y)
    );
  }
  
  /**
   * Returns the coordinates for given WGS84 lat/long
   * 
   * @param float latitude
   * @param float longitude
   * @return PVector
   */
  PVector getCoordinates(float latitude, float longitude, int projection) {
    float x = 0;
    float y = 0;
    switch (projection) {
      case PROJECTION_EQUIRECTANGULAR:
        x = (180 + longitude)/360;
        y = (90 + latitude)/180;
        break;
      case PROJECTION_MERCATOR:
        x = (180 + longitude)/360;
        y = log(tan(0.25*PI + 0.5*(180 + latitude)/360));
        break;
    }
    return new PVector(x, y);
  }
  
  /**
   * Returns the coordinates according to actual projection for given WGS84 lat/long
   * 
   * @param float latitude
   * @param float longitude
   * @return PVector
   */
  PVector getCoordinates(float latitude, float longitude) {
    return this.getCoordinates(latitude, longitude, this.projection);
  }
  
  /**
   * Sets the projection
   *
   * @param int projection
   */
  void setProjection(int projection) {
    this.projection = projection;
  }
  
}


