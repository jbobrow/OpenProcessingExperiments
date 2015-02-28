
class WorldMap {

  static final int PROJECTION_EQUIRECTANGULAR = 0;
  //static final int PROJECTION_MERCATOR = 1;

  float startLat, endLat, startLon, endLon;

  int x, y, w, h;
  PImage raster;
  int projection = PROJECTION_EQUIRECTANGULAR;

  WorldMap() {
    this(0, 0, width, height, PROJECTION_EQUIRECTANGULAR);
  }

  WorldMap( float slon, float elon, float slat, float elat, int projection) {
    this(0, 0, width, height, slat, elat, slon, elon, projection);
  }

  WorldMap(int x, int y, int w, int h, float _startLon, float _endLon, float _startLat, float _endLat, int projection) {

    startLon = _startLon;
    endLon = _endLon;
    startLat = _startLat;
    endLat = _endLat;

    float ratio = (endLon - startLon) / (endLat - startLat);
    ratio = abs(ratio);


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
      // x = (180 + longitude)/360;
      // y = (90 + latitude)/180;

      x = (longitude - startLon) / (endLon - startLon);
      y = (latitude - startLat) / (endLat - startLat);

      break;
     /* 
    case PROJECTION_MERCATOR:
      x = (longitude - startLon)/(endLon - startLon);
      y = log(tan(0.25*PI + 0.5*(180 + latitude)/360));
      break;
      */
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

  void setZoom(float zoomfactor) {

    float invzoom = 1/zoomfactor;

    float midLat = (endLat + startLat) / 2.0;
    float midLon = (endLon + startLon) / 2.0;

    startLat = midLat + ((startLat - midLat)*invzoom);
    endLat = midLat + ((endLat- midLat)*invzoom);

    startLon = midLon + ((startLon - midLon)*invzoom);
    endLon = midLon + ((endLon - midLon)*invzoom);
    println("lon:"+startLon +" " + endLon+" "+ startLat+" "+ endLat);
  }

  void setPan(float panLon, float panLat) {

    float lonWindow = endLon - startLon;
    float latWindow = endLat - startLat;

    startLon += (lonWindow*panLon);
    endLon += (lonWindow*panLon);

    startLat += (latWindow*panLat);
    endLat += (latWindow*panLat);
    //println("lon:"+startLon +" " + endLon+" "+ startLat+" "+ endLat);
  }
}


