
//Maria Fedorova, mfedorov@sfu.ca
//Date: November 10, 2012
//Description: Sorting algorythm. The program visualizes two arrays - unsorted and sorted. 
//It starts to sort the  unsorted array when mouse is pressed. To make it more visual,
//the numbers on the screen are coloured to show on which position the sorting is.

//create arrays - sorted and unsorted - and the copy of array to find min values there, 
//variables for x and y positions, set increment level, upload font
int [] unsortedArray;
int []sortedArray;
int x;
int y;
int unsortedArrayPos;
int increment=30;
PFont myFont; //create a font variable to plug in a font
boolean sorting=false;
int sortedArrayCurrentPos=0;
int [] unsortedArrayCopy=new int [99];

void setup() {
  //set canvas size, stroke render and frame rate
  size (1000, 600);
  noStroke();
  frameRate(3);
  unsortedArray = new int[99];
  sortedArray = new int[99];
  
  //use for loop to go through the array
  for (x=1; x<=99; x++) {
    unsortedArrayPos = (int)random (0,99);
    while (unsortedArray[unsortedArrayPos] != 0){
      unsortedArrayPos=(int)random (0,99);     
    }
    unsortedArray[unsortedArrayPos]=x; 
    println(x + " goes to pos "   +   unsortedArrayPos);
  } 
  
 //copy array to fill  
  System.arraycopy(unsortedArray, 0, unsortedArrayCopy, 0, unsortedArray.length);
  
  
  
}

void draw(){
  //find the minimum value of the array to sort it in increasing order
  int minPosition = 0;
  if (sorting==true){
    int i = 0;  
    int min=unsortedArrayCopy[i]; 
    for (i=0; i<99; i++) {
      if (unsortedArrayCopy[i]<min){
        min=unsortedArrayCopy[i];
        minPosition=i;
      }      
     }
     //assign the value 1000 to the copy of unsorted array so that it 
     //doesn't put the same value in each array "box"
     unsortedArrayCopy[minPosition]=1000;
     
     sortedArray[sortedArrayCurrentPos]=min;
     sortedArrayCurrentPos++;
     if (sortedArrayCurrentPos>98){
       sorting = false;     
      }      
    }
  //erase the background
  background(0);
  x = 50;
  y = 50;
  //load text fonts
  myFont = createFont("FFScala", 20);
  textFont(myFont);
  //set text colour to white
  fill(255);

  //allign text on the center of the canvas
  textAlign( CENTER );
  text ("Unsorted array", 500, 20);
  //print unsorted array, make numbers light up with random colour 
  //when we reach the same number as in sorted array
  for (int i=0; i<99; i++) {
    if (sorting==true && i==minPosition){
      fill (random(255), random(255), random(255));
    }
    //if we doesn't, let numbers stay white
     else {
       fill(255);
     }
     
    //print unsorted array with the fixed increment
    text (new Integer(unsortedArray[i]).toString(), x, y+20);
    x+=50;
    if(x >= width){
      x = increment;
      y = y + increment;
    }
  }
  
   //print sorted array with the fixed increment
   fill(255);
   text ("Sorted array", 500, 220); 
   for(int i=0; i<99; i++) {
    fill(155, 200, 55);
    text (new Integer(sortedArray[i]).toString(), x, y+70);
    x+=50;
    if(x >= width){
      x = increment;
      y = y + increment;
    }
  }
  //write a text and set a condition to sort array when mouse is pressed
  fill(255);
  text ("Press the mouse to sort", width/2, height-10);
   //set condition to carry out sorting
  if (mousePressed){
      sorting=true;
  }
      
}




