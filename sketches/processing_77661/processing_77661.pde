
//Hannah Lingle
//-128.0566,32.1756,-111.9727,46.0732

PImage myMap;
MercatorMap mercatorMap; 

void setup() {
  size(800,868);
  myMap = loadImage("californiaearthquakes_139481.png"); //image from tileMill
  mercatorMap = new MercatorMap(800, 868, 46.0732, 32.1756, -128.0566, -111.9727); //reordered coordinates
  smooth();
  noStroke();
  mapVis();
  fill(0,73,149);
  textFont(createFont("LetterGothicStd", 50));
  text("California Earthquakes",30,100);
  textFont(createFont("LetterGothicStd", 10));
}
//void draw (){
  //translate(-10000,-10000);
  //scale(10);
  //String[] data=loadStrings("earthquaketext.tsv");
  //for(int i = 1;i<data.length;i++){
    //String[] pieces = split(data[i],",");
    //float x=parseFloat(pieces[6]);
    //float y=parseFloat(pieces[7]);
    //println (pieces[6]+":" +pieces [7]);
    //x=map (x,34.0180,37.5690, 0,600);
    //y=map (y,-116.7427,-118.8652, 0,600);
    //ellipse((x+500),(y+500),5,5);

void mapVis(){
  image(myMap,0,0);
  String[] data = loadStrings("earthquaketext.tsv");
  for(int i = 1; i < data.length; i++){
    String[] pieces = split(data[i],",");
      float lat = (parseFloat(pieces[6]));
      float lon = (parseFloat(pieces[7]));
      float x = mercatorMap.getScreenLocation(new PVector(lat,lon)).x;
      float y = mercatorMap.getScreenLocation(new PVector(lat,lon)).y;
      println("x-coord: " + x + " y-coord: " + y);
      ellipse((x),(y),5,5);
     fill(0,39,106);
    text(pieces[8],x,y);
    text(pieces[8]+":"+ pieces[6],x,y);
    fill(255,153,0); 
  
  }
}  


/**
 * Utility class to convert between geo-locations and Cartesian screen coordinates.
 * Can be used with a bounding box defining the map section.
 *
 * (c) 2011 Till Nagel, tillnagel.com
 */
public class MercatorMap {
  
  public static final float DEFAULT_TOP_LATITUDE = 80;
  public static final float DEFAULT_BOTTOM_LATITUDE = -80;
  public static final float DEFAULT_LEFT_LONGITUDE = -180;
  public static final float DEFAULT_RIGHT_LONGITUDE = 180;
  
  /** Horizontal dimension of this map, in pixels. */
  protected float mapScreenWidth;
  /** Vertical dimension of this map, in pixels. */
  protected float mapScreenHeight;

  /** Northern border of this map, in degrees. */
  protected float topLatitude;
  /** Southern border of this map, in degrees. */
  protected float bottomLatitude;
  /** Western border of this map, in degrees. */
  protected float leftLongitude;
  /** Eastern border of this map, in degrees. */
  protected float rightLongitude;

  private float topLatitudeRelative;
  private float bottomLatitudeRelative;
  private float leftLongitudeRadians;
  private float rightLongitudeRadians;

  public MercatorMap(float mapScreenWidth, float mapScreenHeight) {
    this(mapScreenWidth, mapScreenHeight, DEFAULT_TOP_LATITUDE, DEFAULT_BOTTOM_LATITUDE, DEFAULT_LEFT_LONGITUDE, DEFAULT_RIGHT_LONGITUDE);
  }
  
  /**
   * Creates a new MercatorMap with dimensions and bounding box to convert between geo-locations and screen coordinates.
   *
   * @param mapScreenWidth Horizontal dimension of this map, in pixels.
   * @param mapScreenHeight Vertical dimension of this map, in pixels.
   * @param topLatitude Northern border of this map, in degrees.
   * @param bottomLatitude Southern border of this map, in degrees.
   * @param leftLongitude Western border of this map, in degrees.
   * @param rightLongitude Eastern border of this map, in degrees.
   */
  public MercatorMap(float mapScreenWidth, float mapScreenHeight, float topLatitude, float bottomLatitude, float leftLongitude, float rightLongitude) {
    this.mapScreenWidth = mapScreenWidth;
    this.mapScreenHeight = mapScreenHeight;
    this.topLatitude = topLatitude;
    this.bottomLatitude = bottomLatitude;
    this.leftLongitude = leftLongitude;
    this.rightLongitude = rightLongitude;

    this.topLatitudeRelative = getScreenYRelative(topLatitude);
    this.bottomLatitudeRelative = getScreenYRelative(bottomLatitude);
    this.leftLongitudeRadians = getRadians(leftLongitude);
    this.rightLongitudeRadians = getRadians(rightLongitude);
  }

  /**
   * Projects the geo location to Cartesian coordinates, using the Mercator projection.
   *
   * @param geoLocation Geo location with (latitude, longitude) in degrees.
   * @returns The screen coordinates with (x, y).
   */
  public PVector getScreenLocation(PVector geoLocation) {
    float latitudeInDegrees = geoLocation.x;
    float longitudeInDegrees = geoLocation.y;

    return new PVector(getScreenX(longitudeInDegrees), getScreenY(latitudeInDegrees));
  }

  private float getScreenYRelative(float latitudeInDegrees) {
    return log(tan(latitudeInDegrees / 360f * PI + PI / 4));
  }

  protected float getScreenY(float latitudeInDegrees) {
    return mapScreenHeight * (getScreenYRelative(latitudeInDegrees) - topLatitudeRelative) / (bottomLatitudeRelative - topLatitudeRelative);
  }
  
  private float getRadians(float deg) {
    return deg * PI / 180;
  }

  protected float getScreenX(float longitudeInDegrees) {
    float longitudeInRadians = getRadians(longitudeInDegrees);
    return mapScreenWidth * (longitudeInRadians - leftLongitudeRadians) / (rightLongitudeRadians - leftLongitudeRadians);
  }
}


