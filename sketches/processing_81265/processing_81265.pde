
/*Title: A3_01 Animation for Sorting Algorithm 
 Description: Using procedural programming, generte a vector that contains all the integers between[1:99] in random order and create an animation that visualizes a sorting algorithm while it orders them in increasing order.
 Created: Nov. 2nd, 2012
 by: Min Fan
 Email:mfan1028@gmail.com
 */


/************Create a new array to restore 0-99 in random orders. ****************/
//Declare a global variable named vector in a type of array and assign it a new array with 100 elements.
int[] vector = new int[100];


//--------Initilize the setup of canvas and generate the 0-99 in random orders------------/
void setup () {

  //Set the size of canvas
  size(1000, 300);
  //Set the background to black
  background(0);

  /*Declare the local varibles*/
  //Create the size for the arraylist
  int size =100;
  //Create the index for the vector array
  int j=0;

  /*Add 0-99 in the arraylist*/
  //Create a new arraylist named list in the type of integer with the size of 100
  ArrayList<Integer> list = new ArrayList<Integer>(size);
  //For loop to add 1-99 to list
  for (int i = 0; i <size; i++) {
    list.add(i);
  }

  /*----Get 0-99 from arraylist randomly and put it into the verctor array--------*/
  //Create a random object
  Random rand = new Random();
  /*While loop to get random value from arraylist and put it into the vector array, and then romove this value from arraylist in order to avoid repeating.*/
  while (list.size () > 0) {
    //Get a random integer value within the 100
    int index = rand.nextInt(list.size());
    //Assign this value to the element of vector array
    vector[j]=list.remove(index); 
    //Go to the next element in vector array
    j++;
  }
}

/*------------Draw method to generate the animation for sorting algorithm--------------*/
void draw() {
  //Update the background 
  background(0);
  //Set the framerate to 30
  frameRate(30);

  /*Display the animation for the procss of element exchanging their positions*/
  //Start with the second element in vector array and go through the whole array by for loop
  for (int i = 1; i<vector.length; i++) {
    //Compared with all the elements before with the current element
    for (int j=i;j>=0;j--) {
      //Call the insertion sort method
      insertionSort(vector, i);
      //Turn on the stroke function with random colors
      stroke(random(255), random(255), random(255));   

      /*Start drawing animation*/
      //Draw the first vector:Even out the width into 200 parts, and draw wave-like vector from left to right with different hights.
      //Start drawing: 
      beginShape();
      //The highest of every wave is vector[i]+100.
      vertex(width/(100*2)*(i*2+1), vector[i]+150);
      //The lowest  every wave is height.
      vertex(width/(100*2)*(i*2+2), height);
      //Finish drawing
      endShape();  

      //Draw the mirror one of the first vector with vertical axis. 
      beginShape();
      vertex(width-(width/(100*2)*(i*2+1)), vector[i]+150);
      vertex(width-(width/(100*2)*(i*2+2)), height);
      endShape();

      //Draw the second vector:Even out the width into 200 parts, and draw wave-like vector from left to right with different hights.
      beginShape();
      //The highest of every wave is vector[i]+200.
      vertex(width/(100*2)*(i*2+1), vector[i]+200);
      vertex(width/(100*2)*(i*2+2), height);
      endShape();

      //Draw the mirror one of the second vector with vertical axis. 
      beginShape();
      vertex(width-(width/(100*2)*(i*2+1)), vector[i]+200);
      vertex(width-(width/(100*2)*(i*2+2)), height);
      endShape();

      //Draw the first dot line with text showing above
      beginShape();
      vertex(width/(100*2)*(i*2+1), vector[i]);
      textSize(6);
      text(vector[i], width/(100*2)*(i*2+1), 10);
      endShape();
      //Draw the mirrow one of the first dot line with text showing above
      beginShape();
      vertex(width-(width/(100*2)*(i*2+1)), vector[i]);
      endShape();

      //Draw the second dot line 
      beginShape();
      vertex(width/(100*2)*(i*2+1), vector[i]+50);
      endShape();  
      //Draw the mirrow one of the second dot line 
      beginShape();
      vertex(width-(width/(100*2)*(i*2+1)), vector[i]+50);
      endShape();  

      //Draw the third dot line 
      beginShape();
      vertex(width/(100*2)*(i*2+1), vector[i]+100);
      endShape(); 
      //Draw the mirrow one of the third dot line 
      beginShape();
      vertex(width-(width/(100*2)*(i*2+1)), vector[i]+100);
      endShape();  

      //Draw the fourth dot line 
      beginShape();
      vertex(width/(100*2)*(i*2+1), vector[i]+150);
      endShape();  
      //Draw the mirrow one of the fourth dot line 
      beginShape();
      vertex(width-(width/(100*2)*(i*2+1)), vector[i]+150);
      endShape();
    }
  }
}


/*--------------Insertion sort------------------*/
void insertionSort(int[] arry, int s) {
  //Declare the temp variable to restore the current value of the element in the array when exchanging values
  int temp;
  //Assign the currnet value vecotr[i] to a placehoder temp first 
  temp = arry[s];
  //Conditional: if the previous element is larger than the current one, exchange their values 
  if ( arry[s - 1] > temp) {
    //Assign the previous element's value to the current one
    arry[s] = arry[s - 1];
    //Assign the temp's value to the previous value.
    arry[s-1] = temp;
  }
}



