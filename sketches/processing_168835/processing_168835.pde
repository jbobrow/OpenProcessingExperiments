
class xyPt{
  public float x,y;
  xyPt(float in_x, float in_y)
  {
    x = in_x;
    y = in_y;
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
}


class linkItem<T> {
  private T t;
  private linkItem nextLink, prevLink;
  void set(T t) { 
    this.t = t;
  }
  T get() { 
    return t;
  }
  linkItem() { 
    prevLink = null;
    nextLink = null;
  }
  linkItem(T in_t) {
    t = in_t; 
    prevLink = null;
    nextLink = null;
  }
  linkItem prev() { 
    return this.prevLink;
  }
  linkItem next() { 
    return this.nextLink;
  }
  void setPrev(linkItem L) { 
    this.prevLink = L;
  }
  void setNext(linkItem L) { 
    this.nextLink = L;
  }
  
  linkItem addAfterThis(linkItem L){
    // insert L into the list after this
    linkItem oldNext = this.next();
    this.setNext(L);
    
    if(oldNext != null)
    {
      oldNext.setPrev(L);
    }
    if (L != null)
    {
      L.setPrev(this);
      L.setNext(oldNext);
    }
    return L;
  }
  linkItem addBeforeThis(linkItem L){
    // insert L into the list before this
    linkItem oldPrev = this.prev();
    this.setPrev(L);
    
    if(oldPrev != null)
    {
      oldPrev.setNext(L);
    }
    if (L != null)
    {
      L.setNext(this);
      L.setPrev(oldPrev);
    }
    return L;
  }
  
  linkItem getItem(int index)
  {
    // pretending that this is the first item in the list, return the indexth item in the list
    // if index is larger than the list size, returns the first/last element of the list
    linkItem currItem = this;
    
    if (index > 0){
      for (int j = 0; j < index; j++){
        if (currItem.next() != null){
          currItem = currItem.next();
        }else{
          break;
        }
      }
    }else{
      // iterate backwards
      for (int j = index-1; j > 0; j++){
        if (currItem.next() != null){
          currItem = currItem.prev();
        }else{
          break;
        }
      }
    }
    return currItem;
  }
  
  int size()
  {
    // pretending that this is the first item in the list, count how many valid next items there are in the list
    int count = 1;
    linkItem currItem = this;
    while(true){
      currItem = currItem.next();
      if (currItem == null)
        break;
      count++;
    }
    return count;
  }
  
} // class


void testLinkItem()
{
  // exercise the linkedItem doubly-linked-list class
  linkItem<Integer> first = new linkItem<Integer>(-1);
  
  
  println("item : " + first.get() + "\n");

  linkItem<Integer> currItem = first;
  linkItem<Integer> last = first;

  // add some items
  int size = 15+1;
  for (int i = 0; i <= size-1; i++)
  {
    println("adding " + i);
    linkItem<Integer> tmp = new linkItem<Integer>(i*2);
    currItem.addAfterThis(tmp);
    last = tmp;
    
    println("currNext " + currItem.next().get() + " tmpPrev:"+tmp.prev().get());
    currItem = tmp; 
  }

  // iterate through list, print values
  currItem = first;
  while (true) {
    println("item : " + currItem.get());
    currItem = currItem.next();
    if (currItem == null)
      break;
  }
  println("size of list " + first.size());
  //if(true){
  //  return;
  // }
  
  println("\nadding stuff\n");
  // test inserting items
  for (int i = 0; i < 5; i++)
  {
    // choose a random index, insert a value
    int index = (int)random(size);
    int value = index + 100;
    boolean useLastNotCurr = false;
    currItem = first;
    println ("chose index "+index);
    for (int j = 0; j < index; j++){
      print("next...");
      if (currItem == last){
        useLastNotCurr = true;
      }
      currItem = currItem.next();
    }
      
    print("\n");
    linkItem<Integer> newItem = new linkItem<Integer>(value);
    linkItem<Integer> tmp;
    if (useLastNotCurr){
      // end of list, currItem is null
      newItem.setPrev(last);
      last.setNext(newItem);
      last = newItem;
    }else{    
      tmp = currItem.prev();
    
      // inserting requires putting newItem in front of currItem...
      currItem.setPrev(newItem);
      newItem.setPrev(tmp);
      if (tmp != null){
        // beginning of list
        tmp.setNext(newItem);
      }else{
        first = newItem;
      }
      newItem.setNext(currItem);
    }
  }
  
  
  // iterate through list, print values
  currItem = first;
  while (true) {
    println("item : " + currItem.get());
    currItem = currItem.next();
    if (currItem == null)
      break;
  }
  
}

/*
Generates a fractal line
 uses a homemade linked list class because the JAVA one was annoying.
 
 Math and code adapted from:
 http://rectangleworld.com/blog/archives/413
 
 */

int numSteps = 10;
int numCurves = 1500;
int currNumCurves = 0;
int currStep = 0;
int screenHeight = 256;//1080; //256;
int screenWidth = 1024;//1920;//screenHeight*4;

int alphaFade = 64; // 256 - full wipe, 0 = no wipe
int alphaFade2 = 12; // 256 - full wipe, 0 = no wipe

int program = 2;

linkItem<xyPt> first, last;

void setup() {

  //colorMode(RGB, 256.0, 256.0, 256.0, 256.0);
  size(screenWidth, screenHeight);
  //background(256, 256, 256);
  stroke(0);
  strokeWeight(1);

  initializeCurve();

  if (program==1) {
    doProgram1(numSteps);
  } else {
    doProgram2(numSteps, numCurves);
  }
}

void initializeCurve() {
  first = new linkItem<xyPt>(new xyPt(0.0, 0.5));
  last = new linkItem<xyPt>(new xyPt(1.0, 0.5));
  first.addAfterThis(last);
  linkItem currItem = first;
}

void doProgram1(int numSteps) {
  currStep = 0;
}

void draw(){
  
  if(program == 1)
  {
  //while (true) {
    // draw a curve under construction, fading out past iterations by the alphaFade value
    println("step is " + currStep);

    fill(200, 255, 200, alphaFade); // choose a fill color
    rect(0, 0, screenWidth, screenHeight);
    stroke(0);
    drawCurveData();
    doStep();

    // halt drawing 
    if (currStep > numSteps) {
      normalizeCurveData();
      drawCurveData();
      println("DONE");
      noLoop();
    }
  }else{
    //program 2
    //for (int i = 0; i < numCurves; i++) {

      if (currNumCurves % 100 == 0){
        println("handling curve "+currNumCurves);
      }
      initializeCurve();
      for (int j = 0; j < numSteps; j++) {
        doStep();
      }
      normalizeCurveData();
      stroke(random(64), random(128), random(64), alphaFade2);
      drawCurveData();
    //}
    currNumCurves++;
    if (currNumCurves >= numCurves)
    {
      noLoop();
      println("DONE");
    }  
  }
}

void doProgram2(int numSteps, int numCurves) {

  fill(200, 255, 200, 256); // choose a fill color
  rect(0, 0, screenWidth, screenHeight);
  
  currNumCurves = 0;
  println("DONE");
}


void doStep() {
  linkItem<xyPt> currLink = first;

  float dx;
  float minY = 1.0;
  float maxY = 1.0;
  float newX, newY;
  xyPt pt;

  linkItem<xyPt> next;
  while (currLink.next () != null)
  {
    // insert a new data point;
    next = currLink.next();
    dx = next.get().x - currLink.get().x;
    float split = random(0.3333,0.6666); // using 0.5 creates a midpoint bias
    newX = split*currLink.get().x + (1-split)*next.get().x; 
    newY = split*currLink.get().y + (1-split)*next.get().y;
    newY += dx*(random(2.0)-1);

    pt = new xyPt(newX, newY);

    currLink.addAfterThis(new linkItem<xyPt>(pt));
    currLink = next;
  }
  currStep++;
}

void normalizeCurveData()
{
  float minY=2.0, maxY=-1.0;


  linkItem<xyPt> currLink = first;
  float newY = currLink.get().y;
  while (currLink != null) {
    newY = currLink.get().y;
    if (newY < minY)
      minY = newY;
    else if (newY > maxY)
      maxY = newY;
    currLink = currLink.next();
  }


  // normalize data
  if (minY != maxY)
  {
    float normalizeRate = 1/(maxY - minY);
    currLink = first;
    while (currLink != null)
    {
      currLink.get().y = normalizeRate*(currLink.get().y-minY);
      currLink = currLink.next();
    }
  } else {
    while (currLink != null)
    {
      currLink.get().y = 1.0;
      currLink = currLink.next();
    }
  }
}

void drawCurveData()
{
  strokeWeight(1);

  int dataSize = first.size();
  if (dataSize <= 1) {
    return;
  }
  //println("size of curve " + dataSize);


  linkItem<xyPt> currLink = first;
  linkItem<xyPt> next = first;
  int stepNumber = 0;
  while (currLink.next () != null)
  {
    next = currLink.next();
    line(currLink.get().x*screenWidth, currLink.get().y*screenHeight, next.get().x*screenWidth, next.get().y*screenHeight);
    stepNumber++;
    currLink = next;
  }
  //  if (currLink == last)
  //  {
  //    println("curr == last");
  //  }else{
  //    println("curr != last");
  //    println("firstVals: "+first.get().x+", "+first.get().y);
  //    println("currVals: "+currLink.get().x+", "+currLink.get().y);
  //    println("nextVals: "+next.get().x+", "+next.get().y);
  //    println("lastVals: "+last.get().x+", "+last.get().y);
  //  }
}


