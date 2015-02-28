
/**
 * "Scrolling Through Images"
 * 2010-01-26 (Australia Day): Code massage by subpixel
 *
 * Original code found at:
 * http://processing.org/discourse/yabb2/YaBB.pl?num=1264000831/17#17
 *
 * Issue: I don't have an Arduino board to test any of the serial stuff...
 * Workaround: Arduino initialisation protected with USE_ARDUINO flag
 * Also check that we're not "online"
 * See mousePressed(), mouseDragged(), keyPressed() for alternate controls
 *
 * Issue: processing.video's Capture class doesn't work with my webcam (boo!)
 * Workaround: use try/catch block, and optionally disable use of Capture initialisation with USE_WEBCAM flag
 * Also check that we're not "online"
 */

import processing.video.*;	// import theProcessing video library
import processing.serial.*;     // import the Processing serial library

static final boolean USE_ARDUINO = false;
static final int ARDUINO_SERIAL_INDEX = 1; // index in Seral.list()

static final boolean USE_WEBCAM = true;
static final String WEBCAM_STRING = "USB PC Camera-WDM";

static final int CAM_WIDTH = 320;
static final int CAM_HEIGHT = 240;

static final int MAX_LOAD_ATTEMPTS = 3; // Number of times to try loading a web image

static final String[] feedSetup = new String[] {
  "Adelaide 1 Observer", "http://www.adelaidecitycouncil.com/netcatapps/webcam/images/centralMkt.jpg", // Adelaide Market
//"Vancouver Observer",  "http://www.cbc.ca/bc/webcam/images/webcam.jpg",                              // Vancouver Building Site
  "Adelaide 2 Observer", "http://www.adelaidecitycouncil.com/netcatapps/webcam/images/rundleEast.jpg", // Rundle Mall East & Lantern
  "Colony Observer",     "http://www.draperbee.com/webcam/pic/image.jpg?1262444320177",                // Beehive
  "Adelaide 3 Observer", "http://www.adelaidecitycouncil.com/NetcatApps/webcam/images/bellsth.jpg"     // Adelaide Bell Street South
};


Serial Arduino; // The serial port

boolean showLocalCam = false; // Display the local webcam? 

PFont font; // Description text font
 
// Feeds, current feed index and reference for current feed (from the ArrayList)
private ArrayList feeds;
int feedIndex;           // Current feed index
int camIndex = -1;       // Index of cam (if available)
Feed currentFeed;

float xpos, ypos;	// Starting position of the webcam feed
float specialWidth = 700.0;

float scrollOffset = 0;  // Text scrolling offset
float scrollSpeed = 3;   // Text scrolling speed

int scrolltext;

long clock;  // Realtime clock in milliseconds, based on millis(), updated in ticktock()

void setup()
{
  ticktock();
  
  size(678,510,P3D);

  //font = loadFont("01_Digit-23.vlw"); 
  font = createFont("Arial", 23, true);
  textFont(font, 23);

  if (USE_ARDUINO && !online)
  {
    // List all the available serial ports
    println(Serial.list());
    
    Arduino = new Serial(this, Serial.list()[ARDUINO_SERIAL_INDEX], 9600);

    // read bytes into a buffer until you get a linefeed (ASCII 10):
    Arduino.bufferUntil('\n');
  }
  
  feeds = new ArrayList();

  if (USE_WEBCAM && !online) try
  {
    // List all the available cameras
    println(Capture.list());
    CaptureFeed captureFeed = new CaptureFeed(this, "Camera One", WEBCAM_STRING, CAM_WIDTH, CAM_HEIGHT, 30);
    camIndex = feeds.size();
    feeds.add(captureFeed);
  }
  catch (Exception e)
  {
    println("Error initialising webcam (" + WEBCAM_STRING + "): " + e.getMessage());
  }
  
  // Set up web feeds
  for (int i = 0; i < feedSetup.length; i += 2)
  {
    Feed feed = new WebFeed(feedSetup[i], feedSetup[i+1]);
    feeds.add(feed);
  }
  
  selectFeed(0); // Maybe webcam
}

void draw()
{
  ticktock();
  
  background(0);

  scrollOffset += scrollSpeed;
  if (scrollOffset > width + specialWidth)
  {
    scrollOffset = 0;
  }

  currentFeed.update();
  currentFeed.display();  
}

public void ticktock()
{
  clock = millis();
}

void serialEvent(Serial Arduino)
{
  // Read the serial buffer:
  String myString = Arduino.readStringUntil('\n');
  if (myString == null || myString.isEmpty())
  {
    // Nothing to do
    return;
  }

  myString = trim(myString);

  // split the string at the commas
  // and convert the sections into integers:
  int sensor[] = int(split(myString, ','));

  // print out the values you got:
  print("Sensor Values: ");
  for (int sensorNum = 0; sensorNum < sensor.length; sensorNum++)
  {
    print("[" + sensorNum + "]: " + sensor[sensorNum] + "\t"); 
  }
  // add a linefeed after all the sensor values are printed:
  println();

  if (sensor.length > 1)
  {
    xpos = map(sensor[0], 0, 1023, 0, width - CAM_WIDTH);
    ypos = map(sensor[1], 0, 1023, 0, (height- 50 - CAM_HEIGHT));
    
    // Suspicion: map() extrapolating sensor value outside expected min/max
    // sensor < 0 -> map() < 0; sensor > 1023 -> map() > feeds.size() - 1
    int feedSelection = constrain((int)map(sensor[2], 0, 1023, 0, feeds.size() - 1), 0, feeds.size() - 1);
    selectFeed(feedSelection);

    // Suppose sensor[3] is only 0 (don't use local cam) or 1 (use local cam) ...
    showLocalCam = (sensor[3] == 1);
    
    if (showLocalCam && camIndex >= 0)
    {
      selectFeed(camIndex);
    }

    // I'm guessing this is intended to "scroll" text character-by-character, but isn't currently used
    scrolltext = (int)map(sensor[4], 0, 1023, 0, currentFeed.description.length() - 1);
  }
} 

void keyPressed()
{
  if (key == CODED) switch(keyCode)
  {
    case LEFT:  xpos -= 10; break;
    case RIGHT: xpos += 10; break;
    case UP:    ypos -= 10; break;
    case DOWN:  ypos += 10; break;
  }
  else switch(key)
  {
    case ' ': showLocalCam = !showLocalCam; break;
    case '1': selectFeed(0); break;
    case '2': selectFeed(1); break;
    case '3': selectFeed(2); break;
    case '4': selectFeed(3); break;
    case '5': selectFeed(4); break;
    case '6': selectFeed(5); break;
    case '7': selectFeed(6); break;
    case '8': selectFeed(7); break;
    case '9': selectFeed(8); break;
    case '0': selectFeed(9); break;
  }
}

void mousePressed()
{
  xpos = mouseX;
  ypos = mouseY;
}

void mouseDragged()
{
  xpos = mouseX;
  ypos = mouseY;
}

void displayScrollText(String displayText)
{
  text(displayText, width - scrollOffset, height - 10);
}

public void selectFeed(int feedSelection)
{
  if (feedSelection < 0 || feedSelection >= feeds.size())
  {
    println("Cannot select feedIndex " + feedSelection);
    return;
  }
  
  feedIndex = feedSelection;
  currentFeed = (Feed)feeds.get(feedIndex);
}

//============================================================

/**
 * Feed class
 * Contains feed metadata (description and locator) and
 * proscription for update() and display() methods in subclasses
 */

abstract class Feed
{
  public String description;
  public String locator;
  
  public Feed(String description, String locator)
  {
    this.description = description;
    this.locator = locator;
  }
  
  public abstract void update();  // Must be implemented in subclasses
  public abstract void display(); // Must be implemented in subclasses
}

//============================================================

/**
 * WebFeed class
 * Access periodically-updated image from the web
 * Load image in separate thread so as not to block main thread
 * Delayed refresh (after error or sucessful load)
 */

class WebFeed extends Feed
{
  public int refreshDelay = 2000; // Number of milliseconds to wait between refresh() calls
  public PImage loadedImage;      // Last loaded image

  private PImage loadingImage;    // Used for requestImage()
  private boolean loading;        // Waiting for result from requestImage()?
  private boolean requestRefresh; // Set true when a refresh() is wanted
  private long refreshAt;         // Time (based on millis()) at which to refresh() if requestRefresh true
  private int loadFailures;       // Number of times the load has failed (since last successful load)
  
  public WebFeed(String description, String locator)
  {
    super(description, locator);
    println("new WebFeed(" + description + ", " + locator + ")");
    loadedImage = null;
    refresh();
  }
  
  public void update()
  {
    if (loading)
    {
      if (loadingImage.width == 0)
      {
        // Image is not yet loaded
      }
      else if (loadingImage.width == -1)
      {
        // This means an error occurred during image loading
        println("requestImage() failed for " + description + " [" + locator + "]");
        loading = false;
        loadFailures++;
        if (loadFailures < MAX_LOAD_ATTEMPTS)
        {
          requestRefresh();
        }
      }
      else
      {
        // Image is loaded; save a copy and request a fresh copy
        println("Loaded: " + description);
        loadedImage = loadingImage;
        loading = false;
        loadFailures = 0;
  
        requestRefresh();
      }
    }
    
    if (requestRefresh && clock >= refreshAt)
    {
      refresh();
    }
  }
  
  public void requestRefresh()
  {
    requestRefresh = true;
    refreshAt = clock + refreshDelay;
    println("refreshAt: " + refreshAt + " (now: " + clock + ")");
  }
  
  public void refresh()
  {
    println("Refresh " + description + " [" + locator + "]");
    loadingImage = requestImage(locator);
    loading = true;
    requestRefresh = false;
  }
  
  public void display()
  {
    if (loadedImage == null)
    {
      displayScrollText(description + " LOADING...");
    }
    else
    {
      image(loadedImage, xpos, ypos, CAM_WIDTH, CAM_HEIGHT);
      displayScrollText(description + " ONLINE");
    }
  }
}

//============================================================

class CaptureFeed extends Feed
{
  public Capture capture; // A local webcam
  
  public CaptureFeed(PApplet p5, String description, String locator, int feedWidth, int feedHeight, int fps)
  {
    super(description, locator);
    capture = new Capture(p5, feedWidth, feedHeight, locator, fps);
  }
  
  public void update()
  {
    if (capture.available())
    {
      capture.read();
    }
  }
  
  public void display()
  {
    image(capture, xpos, ypos);
    displayScrollText(description + " LIVE");
  }
}


