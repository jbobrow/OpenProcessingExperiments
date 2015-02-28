
int n[];
int sortedIndex;
int barWidth = 3;

void setup() {
  size(800, 400);
  stroke(255);
  background(255);
  smooth();

  // make enough bars to fill the window width
  n=new int[width/barWidth];

  // we are looking for the biggest and swapping it with end of the array
  // so every itteration the size of the un sorted arry will decrece by 1
  sortedIndex = n.length;

  //populate our array n with random numbers
  //random gives us floats so we need to convert to intigers
  for (int i=0;i<n.length;i++) {
    n[i]= int(random(100, height));
  }

  //pull down the frame rate so it is observable
  frameRate(10);
}

void draw() {
  //refreash the screen
  background(255);

//  if there is stuff to sort go for it !
  if (sortedIndex > 0) {
    
    //used to store the lrges calue in teh array
    int biggest=0;
    //used to store the index of the larges value
    int indexOfBiggest=0;

    //step through the un sorted portion of our array n 
    for (int i=0;i<sortedIndex;i++) {
      
      //if the current value n[i] is bigger than the biggest thing we have seen so far..
      if (n[i] > biggest) {
        
        //update our biggest value variabel
        biggest = n[i];
        //update out index of biggest value variable
        indexOfBiggest = i;
      }
    }
    //variable used when drawing our rectangles
    int x=0;
    //step through all of our array
    for (int i =0;i<n.length;i++) {
      
      //if we are on the biggest un sorted value that we just found....
      if (i== indexOfBiggest) {
        //change the fill to red
        fill(255, 0, 0);
      }
      else {
        //for all the others keep it black
        fill(0);
      }
      //drw the bar (x,y,width,height)
      rect( x, height-n[i], barWidth, n[i]);
      //move out x position by barWidth
      x+=barWidth;
    }
    
        //decreade the portion of our array that is not sorted
    sortedIndex--;
    
    //each frame swap the largest value with the last item in the unsorted part of the array
    int temp = n[sortedIndex];
    n[sortedIndex] = n[indexOfBiggest];
    n[indexOfBiggest] = temp;
    

  }
  else {
    
    //if we are not sorting then just draw teh graph
    int x=0;
    for (int i =0;i<n.length;i++) {

      rect( x, height-n[i], barWidth, n[i]);
      x+=barWidth;
    }
  }
}

// when a key is pressed re initilise our array with a bunch of random values
// make sure we initilies the end of the unsorted portion of our array
void keyPressed() {
  background(255);
  sortedIndex = n.length-1;
  for (int i=0;i<n.length;i++) {
    n[i]= int(random(100, height));
  }
}
