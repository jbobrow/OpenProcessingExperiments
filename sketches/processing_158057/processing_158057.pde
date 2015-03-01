
/*
credit for the earth goes to Herberth, sketch 31341
*/

World world;
TweeterMap tweeterMap;

void setup()
{
  size(700, 700, OPENGL);
  frameRate(30);
  sphereDetail(10);
  world = new World();
  tweeterMap = new TweeterMap();
}

void draw()
{
  pushMatrix();
  world.display();
  popMatrix();
  tweeterMap.displayFocusedTweet();
}

void mouseDragged()
{
  float coeff = map(world.R, world.R_MIN, world.R_MAX, 1.4, .35);
  world.rotXspeed = map(mouseY - pmouseY, -height, height, PI, -PI) * coeff;
  world.rotZspeed = map(mouseX - pmouseX, -width, width, -PI, PI) * coeff;
}

void mouseWheel(MouseEvent event) {
  world.zoom(event.getCount());
}

void keyPressed()
{
  println(key);
  if (key == CODED)
  {
    switch(keyCode)
    {
    case UP:
      world.zoom(-1);
      break;
    case DOWN:
      world.zoom(1);
      break;
    }
  }
}

class Tweet
{
  String msg;
  PVector coor = new PVector(0, 0, 0);//absolute tweet position
  String country;//tweet country
  PVector screen = new PVector(0, 0);//tweet screen position
  Boolean isOnMap = true;//indicates whether the tweet is actually displayed
  float lon, lat;//longitude and latitude of the tweet

    Tweet(String[] p_data)
  {
    country = p_data[0];
    //order of the Tweet api: longitude then latitude
    lon = float(p_data[1]);
    lat = float(p_data[2]);
    msg = p_data[3];
    //println(lon + "   " + lat + "   " + msg);
  }
}

class TweeterMap
{
  Tweet[] tweets;
  int nbTweets;
  final float TWEET_RAD_MIN = 2;
  final float TWEET_RAD_MAX = 5;
  float tweetRad = TWEET_RAD_MAX;
  PFont myFont = createFont("", 20, true);//Verdana.ttf //should find a font with all alphabets...
  final color TARGET_UNFOCUS_COLOR = color(200, 0, 243);
  final color TARGET_FOCUS_COLOR = color(255, 128, 0);
  final color TARGET_STROKE_COLOR = color(60, 200);
  final color TWEET_MSG_COLOR = color(133, 225, 0);
  final float TWEET_MSG_SIZE = 21;
  final color TWEET_COUNTRY_COLOR = color(255, 128, 0);
  final float TWEET_COUNTRY_SIZE = 35;
  final float TEXT_BOX_WIDTH = width;
  final float TEXT_BOX_HEIGHT = height/2;
  final float TEXT_MARGIN = 10;
  Tweet focusedTweet;

  TweeterMap()
  {
    String lines[] = loadStrings("tweets-combo.txt");
    nbTweets = lines.length;
    String[][] stringTweets = new String[nbTweets][];
    tweets = new Tweet[nbTweets];
    for (int i = 0; i < nbTweets; i++)
    {
      stringTweets[i] = new String[3];
      stringTweets[i] = lines[i].split(",,, ");
      tweets[i] = new Tweet(stringTweets[i]);
    }
    println("there are " + nbTweets + " Tweets");
  }

  void display()
  {
    //beginDraw();
    //fill(TARGET_UNFOCUS_COLOR);
    stroke(TARGET_STROKE_COLOR);
    strokeWeight(2);
    tweetRad = map(world.R, world.R_MIN, world.R_MAX, TWEET_RAD_MAX, TWEET_RAD_MIN);
    for (int i = 0; i < nbTweets; i++)
    {
      place(tweets[i]);
    }
    //endDraw();
  }

  void place(Tweet p_tweet)
  {
    float x, y, z;
    pushMatrix();
    rotateZ(radians(p_tweet.lon) - HALF_PI);
    rotateX(radians(p_tweet.lat) + PI);
    translate(0, world.R, 0);
    x = modelX(0, 0, 0);//get the x position of the tweet
    y = modelY(0, 0, 0);//get the y position of the tweet
    z = modelZ(0, 0, 0);//get the z position of the tweet
    p_tweet.coor = new PVector(x, y, z);
    p_tweet.isOnMap = (0 < z) && (z < world.R);

    if (p_tweet.isOnMap)
    {
      line(0, 0, 0, 0, 10, 0);
      //box(3, 3, 3);
      //sphere(3);
      //rotateX(HALF_PI);
      //ellipse(0, 0, tweetRad, tweetRad);      
    }
    popMatrix();
  }

  void displayFocusedTweet()
  {
    float minDist = width * width;
    focusedTweet = null;

    PVector mouse = new PVector(mouseX, mouseY);
    float dist;
    Tweet tweet;
    for (int i = 0; i < nbTweets; i++)
    {
      tweet = tweets[i];
      if (tweet.isOnMap)
      {
        float x1, y1;
        x1 = screenX(tweet.coor.x, tweet.coor.y, tweet.coor.z);
        y1 = screenY(tweet.coor.x, tweet.coor.y, tweet.coor.z);
        tweet.screen = new PVector(x1, y1);
        dist = PVector.dist(mouse, tweet.screen);
        if (dist < min(30, minDist))//detects the closest target to the mouse
        {
          minDist = dist;
          focusedTweet = tweet;
        }
      }
    }

    if (focusedTweet != null)
    {
      //draw a sphere
      pushMatrix();
      //noStroke();
      //fill(TARGET_FOCUS_COLOR);
      translate(focusedTweet.coor.x, focusedTweet.coor.y, focusedTweet.coor.z);
      //sphere(tweetRad/2);
      stroke(255, 0, 0);
      strokeWeight(3);
      line(0, 0, 0, 0, 0, 40);
      popMatrix();

      translate(TEXT_MARGIN, TWEET_COUNTRY_SIZE + TEXT_MARGIN);
      //hint(DISABLE_DEPTH_TEST);//disables the z dimension
      
      
      //draw country text
      textFont(myFont, 32);
      textAlign(LEFT);//RIGHT does not seem to be working as expected
      //fill(0);
      text(focusedTweet.country, 1, 1);
      
      //draw tweet msg text
      textFont(myFont, TWEET_MSG_SIZE);
      textLeading(18);//vertical space between lines
      textAlign(LEFT);
      //fill(0);
      text(focusedTweet.msg, 1, 9 + 1, TEXT_BOX_WIDTH - 2*TEXT_MARGIN, TEXT_BOX_HEIGHT);      
    }
  }
}

/* @pjs preload="w.png"; */
class World
{
  // Sphere Variables
  final float R_MIN = 100;
  final float R_MAX = 500;
  float R = 210;
  int xDetail = 40;
  int yDetail = 30;
  float[] xGrid = new float[xDetail+1];
  float[] yGrid = new float[yDetail+1];
  float[][][] allPoints = new float[xDetail+1][yDetail+1][3];
  // Rotation Variables
  float camDistance = 0;
  PImage texmap;
  float rotX, rotZ, rotXspeed, rotZspeed;
  final float ROT_FRICTION = .82;

  World() {
    noStroke();
    texmap = loadImage("w.png");
    setupSphere();
  }

  void display() {
    background(50);
    hint(ENABLE_DEPTH_TEST);
    translate(width/2, height/2, camDistance);

    pushMatrix();
    rotateX(-HALF_PI);

    rotX += rotXspeed;
    rotZ += rotZspeed;
    rotXspeed *= ROT_FRICTION;
    rotZspeed *= ROT_FRICTION;
    rotateX(rotX);
    rotateZ(rotZ);
    drawSphere(texmap);
    tweeterMap.display();
    popMatrix();
  }

  void setupSphere() {
    // Create a 2D grid of standardized mercator coordinates
    for (int i = 0; i <= xDetail; i++) 
    {
      xGrid[i]= i / (float) xDetail;
    }
    for (int i = 0; i <= yDetail; i++) 
    {
      yGrid[i]= i / (float) yDetail;
    }
    textureMode(NORMAL);
    // Transform the 2D grid into a grid of points on the sphere, using the inverse mercator projection
    for (int i = 0; i <= xDetail; i++)
    {
      for (int j = 0; j <= yDetail; j++)
      {
        allPoints[i][j] = mercatorPoint(xGrid[i], yGrid[j]);
      }
    }
  }

  float[] mercatorPoint(float p_x, float p_y) {
    float[] thisPoint = new float[3];
    float phi = p_x*2*PI;
    float theta = PI - p_y*PI;
    thisPoint[0] = R*sin(theta)*cos(phi);
    thisPoint[1] = R*sin(theta)*sin(phi);
    thisPoint[2] = R*cos(theta);
    return thisPoint;
  }

  void drawSphere(PImage Map)
  {
    noStroke();
    for (int j = 0; j < yDetail; j++)
    {
      beginShape(TRIANGLE_STRIP);
      texture(Map);
      //noFill();//useless
      for (int i = 0; i <= xDetail; i++)
      {
        vertex(allPoints[i][j+1][0], allPoints[i][j+1][1], allPoints[i][j+1][2], xGrid[i], yGrid[j+1]);
        vertex(allPoints[i][j][0], allPoints[i][j][1], allPoints[i][j][2], xGrid[i], yGrid[j]);
      }
      endShape(CLOSE);
    }
  }

  void zoom(float p_zoomValue)
  {
    R = constrain(R - 5 * p_zoomValue, R_MIN, R_MAX);
    setupSphere();
  }
}



