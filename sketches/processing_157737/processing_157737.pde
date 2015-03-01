
Map map;
TweeterMap tweeterMap;
int drag = -1;
Boolean left = true;

void setup()
{
  size(550, 450, P2D);
  frameRate(30);
  map = new Map();
  tweeterMap = new TweeterMap();
}

void draw()
{
  map.display();
  tweeterMap.display(true);
}

void mouseDragged()
{
  drag++;
  map.updateOffset(pmouseX - mouseX, pmouseY - mouseY);
}

void mousePressed()
{
  left = (mouseButton == LEFT);
}

void mouseReleased()
{
  if(drag == 0)
  {
    if (left)
    {
      map.zoom(true);
    }else if (mouseButton == RIGHT)
    {
      map.zoom(false);
    }
  }
  
  drag = -1;
}
/* @pjs preload="Mercator_projection-o.jpg"; */

class Map
{
  PImage originalImage;
  PImage displayImage;
  int imageW, imageH;
  float nextImageW, nextImageH;//length of the image's pixels that will be displayed
  final float ZOOM_COEFF = 2.2;
  PVector origin = new PVector(0, 0);
  float originalCoeff;//used to have the map fit in the sketch at the beginning
  PVector mouseClick = new PVector(0, 0);//mouse position on the image when user clicks
  PVector offset;//map offset on the stage
  PVector imageOrigin = new PVector(0, 0);//upper left corner pixel of the displayed image
  int nbZooms = 0;
  int outputW, outputH;

  Map()
  {
    originalImage = loadImage("Mercator_projection-o.jpg");//requestImage
    nextImageW = imageW = originalImage.width;
    nextImageH = imageH = originalImage.height;
    originalCoeff = min(width/imageW, height/imageH);
    if (originalCoeff < 1)
    {
      println("image does not fit");
      offset = new PVector((width - imageW*height/imageH)/2, 0);
    } else
    {
      offset = new PVector((width - imageW)/2, (height - imageH)/2);
    }
    outputW = width - int(2*offset.x);
    outputH = height - int(2*offset.y);
    displayImage = createImage(outputW, outputH, RGB);
  }

  void display()
  {
    displayImage.copy(originalImage, (int)imageOrigin.x, (int)imageOrigin.y, (int)(nextImageW), (int)(nextImageH), 0, 0, outputW, outputH);
    image(displayImage, offset.x, offset.y);
  }

  void zoom(Boolean p_zoomIn)
  {
    println("zoom: " + (p_zoomIn));
    if (offset.x < mouseX && mouseX < outputW + offset.x && offset.y < mouseY && mouseY < outputH + offset.y)
    {
      //represents the position of the mouse click, reported to the image, with:
      //imageOrigin.x < x < nextImageW and imageOrigin.y < x < nextImageH

      //start2 + (stop2 - start2) * ((value - start1) / (stop1 - start1))
      //mouseClick.x = map(mouseX, offset.x, outputW + offset.x, imageOrigin.x, imageOrigin.x + nextImageW);
      mouseClick.x = imageOrigin.x + nextImageW * ((mouseX-offset.x) / (outputW));

      //mouseClick.y = map(mouseY, offset.y, outputH + offset.y, imageOrigin.y, imageOrigin.y + nextImageH);
      mouseClick.y = imageOrigin.y + nextImageH * ((mouseY-offset.y) / (outputH));

      float dx = mouseClick.x - imageOrigin.x;
      float dy = mouseClick.y - imageOrigin.y;

      if (p_zoomIn && nbZooms < 4)
      {
        nextImageW /= ZOOM_COEFF;
        nextImageH /= ZOOM_COEFF;        
        imageOrigin.x = mouseClick.x - dx / ZOOM_COEFF;
        imageOrigin.y = mouseClick.y - dy / ZOOM_COEFF;
        nbZooms ++;
      } else if (!p_zoomIn && nbZooms > 0)
      {
        nextImageW *= ZOOM_COEFF;
        nextImageH *= ZOOM_COEFF;
        imageOrigin.x = constrain(mouseClick.x - dx * ZOOM_COEFF, 0, imageW - nextImageW);
        imageOrigin.y = constrain(mouseClick.y - dy * ZOOM_COEFF, 0, imageH - nextImageH);
        nbZooms --;
      }
      tweeterMap.updateCoord(nextImageW, nextImageH, imageOrigin);
    }
  }

  void updateOffset(int p_x, int p_y)
  {    
    imageOrigin.x = constrain(imageOrigin.x + p_x / pow(ZOOM_COEFF, nbZooms-1), 0, imageW - nextImageW);
    imageOrigin.y = constrain(imageOrigin.y + p_y / pow(ZOOM_COEFF, nbZooms-1), 0, imageH - nextImageH);

    //update the tweets' position
    tweeterMap.updateCoord(nextImageW, nextImageH, imageOrigin);
  }
}

class Tweet
{
  String msg;
  PVector coor;
  String country;
  PVector absolute;//original position on the original map
  Boolean isOnMap = true;
  float lon, lat;//longitude and latitude of the tweet

  Tweet(String[] p_data)
  {
    country = p_data[0];
    //order of the Tweet api: longitude then latitude
    lon = float(p_data[1]);
    lat = float(p_data[2]);
    println(lon + "   " + lat);
    msg = p_data[3];
    processCoord();
  }

  void processCoord()
  {
    // longitude: just scale
    float x = (map.imageW * (180 + lon) / 360) % map.imageW;

    // latitude: use Mercator projection
    float y = log(tan((lat*PI/360) + (QUARTER_PI))); // do the Mercator projection (w/ equator of 2pi units)
    y = (map.imageH / 2) - (map.imageW * y / (TWO_PI)); // fit it to our map
    absolute = new PVector(x, y);
    coor = absolute.get();
  }

  void updateCoor(float p_nextImageW, float p_nextImageH, PVector p_imageOrigin)
  {
    //check that the target is actually inside the displayed part of the map
    if ((p_imageOrigin.x < absolute.x) && (absolute.x < p_imageOrigin.x + p_nextImageW)
      && (p_imageOrigin.y < absolute.y) && (absolute.y < p_imageOrigin.y + p_nextImageH))
    {
      isOnMap = true;
      
      //coor.x = map(absolute.x, p_imageOrigin.x, p_imageOrigin.x + p_nextImageW, 0, map.outputW);
      //start2 + (stop2 - start2) * ((value - start1) / (stop1 - start1))
      coor.x = map.outputW * ((absolute.x - p_imageOrigin.x) / (p_nextImageW));

      //coor.y = map(absolute.y, p_imageOrigin.y, p_imageOrigin.y + p_nextImageH, 0, map.outputH);
      coor.y = map.outputH * ((absolute.y - p_imageOrigin.y) / (p_nextImageH));      
    } else
    {
      isOnMap = false;
    }
  }
}

class TweeterMap
{
  PGraphics pg;
  Tweet[] tweets;
  int nbTweets;
  final float RAD = 4;
  PFont myFont = createFont("", 20, true);//Verdana.ttf //should find a font with all alphabets...
  final int nbTweetFiles = 4;
  int tweetFileNb = (int)random(nbTweetFiles);
  final color TARGET_UNFOCUS_COLOR = color(210, 24, 43);
  final color TARGET_FOCUS_COLOR = color(253, 189, 191);
  final color TARGET_STROKE_COLOR = color(60);
  final color CROSS_STROKE_COLOR = color(0);
  final color TWEET_MSG_COLOR = color(133, 225, 0);
  final color TWEET_COUNTRY_COLOR = color(255, 128, 0);
  final float TEXT_BOX_WIDTH = 120;
  final float C = sqrt(2)/2 * RAD;

  TweeterMap()
  {
    pg = createGraphics(map.outputW, map.outputH);
    println(map.outputW + "   " + map.outputH);
    pg.textFont(myFont, 17);
    pg.textLeading(28);//vertical space between lines
    loadTweets();
  }

  void loadTweets()
  {
    println("p");
    tweetFileNb = (tweetFileNb+1) % nbTweetFiles;
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
    updateCoord(map.nextImageW, map.nextImageH, map.imageOrigin);
    println("there are " + nbTweets + " Tweets");
  }

  void display(Boolean p_forceDisplay)
  {
    pg.beginDraw();
    //pg.clear();//does not work in JS
    pg.background(0, 0, 0, 0); 
    pg.stroke(TARGET_STROKE_COLOR);
    pg.fill(TARGET_UNFOCUS_COLOR);
    for (Tweet tweet : tweets)
    {
      if (tweet.isOnMap) pg.ellipse(tweet.coor.x, tweet.coor.y, 2 * RAD, 2 * RAD);
    }
    float minDist = width * width;
    Tweet focusedTweet = null;
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(map.offset);
    for (Tweet tweet : tweets)
    {
      if (tweet.isOnMap)
      {
        float dist = PVector.dist(mouse, tweet.coor);
        if (dist < min(4*RAD, minDist))//detects the closest target to the mouse
        {
          minDist = dist;
          focusedTweet = tweet;
        }
      }
    }

    if (focusedTweet != null)
    {
      float x, y;
      //draw focused tweet's target with a different color
      x = focusedTweet.coor.x;
      y = focusedTweet.coor.y;
      pg.fill(TARGET_FOCUS_COLOR);
      pg.ellipse(x, y, 2 * RAD, 2 * RAD);
      pg.stroke(CROSS_STROKE_COLOR);

      pg.line(x - C, y - C, x + C, y + C);
      pg.line(x + C, y - C, x - C, y + C);

      //texts
      pg.textLeading(17);//vertical space between lines

      //draw tweet msg text
      x = focusedTweet.coor.x > width - 220 ? width - 220 : focusedTweet.coor.x;
      pg.textAlign(LEFT);
      pg.fill(0);
      pg.text(focusedTweet.msg, x + 2, y + 20 + 2, TEXT_BOX_WIDTH, height - y);
      pg.fill(TWEET_MSG_COLOR);
      pg.text(focusedTweet.msg, x, y + 20, TEXT_BOX_WIDTH, height - y);
    }
    pg.endDraw();

    image(pg, map.offset.x, map.offset.y);

    if (focusedTweet != null)
    {
      //draw country text
      float x = max(10, map.offset.x + 5);
      float y = max(30, map.offset.y + 20);
      textFont(myFont, 27);
      textAlign(LEFT);//RIGHT does not seem to be working as expected
      fill(0);
      text(focusedTweet.country, x + 1, y + 1);
      fill(TWEET_COUNTRY_COLOR);
      text(focusedTweet.country, x, y);
    }
  }

  void updateCoord(float p_nextImageW, float p_nextImageH, PVector p_imageOrigin)
  {
    for (int i = 0; i < nbTweets; i++)
    {
      tweets[i].updateCoor(p_nextImageW, p_nextImageH, p_imageOrigin);
    }
  }
}

