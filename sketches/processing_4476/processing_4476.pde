
class blockStack{
  int currElement, interval, count;
  int column, elements, size;

  boolean elem[];
  
  boolean solid = true, inverted = false;
  boolean drawFill = true, drawEdge=true;
  
  color edge = color(0);
  color fill = color(255);

  boolean stop = false;

  //block size, #elements, column#
  blockStack(int s, int e, int col){
    column = col;
    size = s;
    currElement=0;

    elements = e;
    elem = new boolean[elements];
    for(int i=0; i<elements; i++){
      elem[i]=true;
    }

    interval = (int) random(0, 10);
  }

  //for this version, element 0 will be at the top of the window.
  void handle(){
    if(!stop){
      //increment the counter (run every frame)
      count++;
      //if the counter has hit the interval
      if(count>interval){
        //determine a range
        int range;
        if(solid) range = 1;
        else range = (int) random(-10/4, 10/2);

        //determine a random element a random range from the current element
        int e = constrain(currElement+((int) random(-range, range)), 0, elements-1);

        //invert the element's color
        elem[e]=inverted;

        //update the changed element
        update(e);

        //increment the current element
        currElement+=1;

        //reset the counter
        count = 0;
        //set a new random interval until next event
        //between 0 and one second (# frames in a second)
        interval = (int) random(0, frameRate);

        //if the current element is the last element, stop the blockStack from doing much of any updating
        if(currElement==elements) stop = true;
      }
    }
  }
  
  //updating an element
  void update(int element){
    //set the mode for drawing the rectangle/ellipse
    rectMode(CORNER);
    ellipseMode(CORNER);
    
    //turn off fill and stroke, they may or may not be turned on
    noFill();
    noStroke();
    
    //element is "on" or "off"
    if(elem[element]){
      if(drawFill)fill(fill);
      if(drawEdge)stroke(edge);
    }
    else{
      if(drawFill)fill(edge);
      if(drawEdge)stroke(fill);
    }
    rect(size*column, size*element, size, size);
  }
  
  boolean isStopped(){ 
    return stop; 
  }

  //this will flip how it sets the blocks, but not what colors they use.
  void invert(){
    inverted=!inverted;
  }
  
  //resets the blockStack
  void reset(){
    //inverted=false;
    interval=0;
    count=0;
    currElement=0;
    for(int i=0; i<elements; i++){
      elem[i]=true;
      update(i);
    }
    stop = false;
  }
}

