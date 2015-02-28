
/**
 * spxlSliceOfPixels01
 * 2010-02-07 by subpixel
 * http://subpixels.com
 *
 * Demo using direct buffers for taking slices from the
 * pixels[] array for further procesing.
 *
 * Copying into separate structures and farting about with
 * the Buffer methods introduces significant overhead compared
 * with just accessing the pixels[] array directly in order of
 * rows (~7 times faster) and/or columns (20+ times faster, at
 * least so far as the existing not paricularly optimised code
 * goes) in runtime (timed based on millis()) tests.
 *
 * See Java docs on Buffers:
 * - http://java.sun.com/j2se/1.5.0/docs/api/java/nio/Buffer.html
 * - http://java.sun.com/j2se/1.5.0/docs/api/java/nio/ByteBuffer.html
 * - http://java.sun.com/j2se/1.5.0/docs/api/java/nio/IntBuffer.html
 */

//import processing.opengl.*;
import java.nio.*;

static final int WIDTH = 640;
static final int HEIGHT = 480;

int totalPixels;

int debugLevel = 9;

long timerStart;
long pixelCount;

boolean processRow = true;
boolean processCol = true;
boolean processAll = false;
boolean processSimple = false;

boolean showTimes = false;

int maxDimension; // The larger of height and width

// Full buffer - as in full sreen buffer (all pixels)
ByteBuffer FBB;
IntBuffer FIB;

// Slice buffer - buffer containing a single row (or column) of pixels
ByteBuffer SBB;
IntBuffer SIB;

void setup()
{
  debugPrintln(1, "*** setup()");
  size(WIDTH, HEIGHT, P3D); // Make this much bigger for benchmarking
  totalPixels = width * height;
  debugPrintln(1, "size: " + width + "x" + height + " = " + totalPixels + " pixels");
  
  maxDimension = max(width, height);
  debugPrintln(1, "maxDimension: " + maxDimension);

  // Magic "direct buffer" allocated OUTSITE of the heap.
  // Note: 4 bytes (A,R,G,B) per pixel
  FBB = ByteBuffer.allocateDirect(totalPixels * 4);
  buffInfo(3, "FBB", FBB);

  // An IntBuffer "view" of the ByteBuffer; same data, accessed 4 bytes at a time
  FIB = FBB.asIntBuffer();
  buffInfo(3, "FIB", FIB);
  
  // Magic "direct buffer" allocated OUTSITE of the heap.
  // Note: 4 bytes (A,R,G,B) per pixel
  SBB = ByteBuffer.allocateDirect(maxDimension * 4);
  buffInfo(3, "SBB", SBB);

  // An IntBuffer "view" of the ByteBuffer; same data, accessed 4 bytes at a time
  SIB = SBB.asIntBuffer();
  buffInfo(3, "SIB", SIB);
  
  background(0);
}

void draw()
{
  debugPrintln(2, "\n*** draw(): frameCount: " + frameCount);
  
  putStuffOnScreen();
  
  loadPixels(); // Processing rule to do this before accessing pixels[]
  
  int row = mouseY;
  int column = mouseX;
  
  if (processAll) processAllPixels();
  if (processRow) processSingleRow(row);
  if (processCol) processSingleColumn(column);
  if (processSimple) simpleProcessAllPixels();
  
  debugLevel = 0;
  showTimes = false;
}

void processAllPixels()
{
  debugPrintln(2, "\n** processAllPixels()");
  
  //////////////////////////////////////////
  // Copy all pixels into the full buffer
  //////////////////////////////////////////

  startTimer();
  
  buffInfo(3, "FIB", FIB);
  FIB.clear(); // Set position = 0, limit = capacity, ready for filling
  buffInfo(3, "FIB after clear()", FIB);
  FIB.put(pixels); // Bulk put entire array into buffer
  buffInfo(3, "FIB after put(pixels)", FIB);
  FIB.flip(); // Prepare for processing
  buffInfo(3, "FIB after flip", FIB);

  showTimer("Copy all pixels");

  //////////////////////////////////////////
  // Do something with a row slice
  //////////////////////////////////////////
  
  debugPrintln(3, "--- ROW SLICES ---");

  startTimer();
  for (int row = 0; row < height; row++)
  {
    debugPrintln(4, "row: " + row);

    FIB.position(row * width); // Position to start of row
    buffInfo(5, "FIB after position()", FIB);
  
    IntBuffer FIBslice = FIB.slice();
    buffInfo(5, "FIBslice", FIBslice);
  
    FIBslice.limit(width); // Don't want to access beyond row's data
    buffInfo(5, "FIBslice after limit()", FIBslice);
    
    processSlice(FIBslice);
  }
  showTimer("processAllPixels, " + height + " rows");

  //////////////////////////////////////////
  // Do something with column slices
  //////////////////////////////////////////

  debugPrintln(3, "--- COLUMN SLICES ---");

  startTimer();
  for (int column = 0; column < width; column++)
  {
    debugPrintln(4, "column: " + column);
    
    buffInfo(5, "SIB", SIB);
    SIB.clear(); // Reset position and limit ready for filling
    buffInfo(5, "SIB after clear()", SIB);
    
    int count = 0;
    
    int index = column;
    for (int y = 0; y < height; y++)
    {
      SIB.put(FIB.get(index)); // Put single pixel's int into buffer
      index += width; // advance by one row's worth of pixels
      count++;
    }
    
    buffInfo(5, "SIB after " + count + " put()'s", SIB);
    
    SIB.flip(); // Prepare for processing
    buffInfo(5, "SIB after flip()", SIB);
    
    processSlice(SIB);
  }
  showTimer("processAllPixels, " + width + " cols");
}

void processSingleRow(int row)
{
  debugPrintln(2, "\n** processSingleRow(" + row + ")");

  startTimer();
  
  // Copy single row of pixels into the slice buffer
  buffInfo(3, "SIB", SIB);
  SIB.clear(); // Reset position and limit ready for filling
  buffInfo(3, "SIB after clear()", SIB);

  SIB.put(pixels, row * width, width); // Bulk put one row's ints into buffer
  buffInfo(3, "SIB after put()", SIB);

  SIB.flip(); // Prepare for processing
  buffInfo(3, "SIB after flip()", SIB);
  
  showTimer("Bulk transfer (copy) single row");

  processSlice(SIB);
  
  showTimer("Copy + proces single row");
}

void processSingleColumn(int column)
{
  debugPrintln(2, "\n** processSingleColumn(" + column + ")");

  startTimer();
  
  // Copy single column of pixels into the slice buffer
  buffInfo(3, "SIB", SIB);
  SIB.clear(); // Reset position and limit ready for filling
  buffInfo(3, "SIB after clear()", SIB);
  
  int count = 0;
  
  int index = column;
  for (int y = 0; y < height; y++)
  {
    SIB.put(pixels[index]); // Put single pixel's int into buffer
    index += width; // advance by one row's worth of pixels
    count++;
  }
  
  buffInfo(3, "SIB after " + count + " put()'s", SIB);
  
  SIB.flip(); // Prepare for processing
  buffInfo(3, "SIB after flip()", SIB);
  
  showTimer("Copy single column");
  
  processSlice(SIB);

  showTimer("Copy + process single column");
}

void processSlice(IntBuffer slice)
{
  debugPrintln(4, "\n** processSlice()");
  buffInfo(4, "slice", slice);

  slice.mark(); // Remember current position

  int count = 0;
  int pixel;
  
  while (slice.hasRemaining())
  {
    count++;
    pixel = slice.get();
    
    // Do something with the pixel here!
    processPixel(pixel);
  }
  
  debugPrintln(4, "\ncount: " + count);
  
  slice.reset(); // Return to marked position
}

void simpleProcessAllPixels()
{
  int base = 0;
  
  int count;

  // Process rows
  startTimer();
  count = 0;
  for (base = 0; base < totalPixels; base += width)
  {
    count++;
    processSlice(pixels, base, width, 1);
  }
  showTimer("simpleProcessAllPixels, " + count + " rows");

  // Process columns
  startTimer();
  count = 0;
  for (base = 0; base < width; base++)
  {
    count++;
    processSlice(pixels, base, height, 1);
  }
  showTimer("simpleProcessAllPixels, " + count + " cols");
}

// Process a slice of n=elements items from pixelArray[], starting at {base}
// and moving in increments of {step}
void processSlice(int[] pixelArray, int base, int elements, int step)
{
  final int end = base + elements * step;
  for (int i = base; i < end; i += step)
  {
    processPixel(pixelArray[i]);
  }
}

void processPixel(int pixel)
{
  pixelCount++;
}

void buffInfo(int level, String title, ByteBuffer bb)
{
  debugPrintln(level, title + ": " + bb + ", isDirect: " + bb.isDirect() + " (ByteBuffer)");
}

void buffInfo(int level, String title, IntBuffer ib)
{
  debugPrintln(level, title + ": " + ib + ", isDirect: " + ib.isDirect() + " (IntBuffer)");
}

void debugPrintln(int level, String msg)
{
  if (debugLevel >= level) println(msg);
}

void putStuffOnScreen()
{
  background(0);

  noLights();
  float t = millis() * 0.001;
  directionalLight(255, 255, 255, cos(t), sin(t), 0);
  
  translate(width >> 1, height >> 1);
  rotateZ(PI/6);
  rotateX(PI/3);
  rotateY(t/8);
  
  strokeWeight(3);
  stroke(255, 255, 0, 255);
  noFill();
  sphereDetail(20);
  sphere(250);

  rotateZ(t/2);

  strokeWeight(15);
  stroke(255, 0, 0, 255);
  fill(0, 0, 255, 255);
  sphereDetail(0);
  sphere(200);
}

void keyPressed()
{
  if (key == CODED) switch(keyCode)
  {
    case UP:
    case DOWN:
    case LEFT:
    case RIGHT:
  }
  else switch(key)
  {
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
      debugLevel = Character.digit(key, 10);
      break;

    case 't': showTimes = true; break;
    
    case 'a': processAll = !processAll; break;
    case 'r': processRow = !processRow; break;
    case 'c': processCol = !processCol; break;
    case 's': processSimple = !processSimple; break;
  }
}

void startTimer()
{
  timerStart = millis();
  pixelCount = 0;
}

void showTimer(String title)
{
  if (showTimes) println("[" + title + ": " + (millis() - timerStart) + "ms, " + pixelCount + " pixels]");
}


