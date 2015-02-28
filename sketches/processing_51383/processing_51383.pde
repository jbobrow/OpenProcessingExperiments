

/*
Declare ArrayList.
An ArrayList stores a variable number of objects.
*/
ArrayList numbers = new ArrayList();


// minimum and maximum values
int minNumber = MAX_INT; // maximum possible integer
int maxNumber = MIN_INT; // minimum possible integer


void setup() {
  
  // add 100 random numbers to the ArrayList
  for (int i = 0; i < 100; i++) {
    
    int r = (int) random(MIN_INT, MAX_INT); // randomize in entire possible range of integers
    
    numbers.add(r); // adds value to ArrayList. "remove" removes an index
    
    // feed the random number into the getMinMax() function to check whether it is a new minimum and maximum number
    getMinMax(r);
  }
 
 
  // print the contents of the ArrayList to the console
  for (int i = 0; i < numbers.size(); i++) {
    
    /*
    An ArrayList stores objects, not primitive values.
    Extract Integer value from the ArrayList object. Note: We have to use Integer, not int, for the converstion since it cannot be a primitive value!
    */
    Integer number = (Integer) numbers.get(i);
    
    // map number to a percentage range between the minimum and maximum number
    float percent = map(number, minNumber, maxNumber, 0, 100);
    
    // print number and percentage to the console
    println(number + " : " + percent);
  }  
}


void getMinMax(int number) {
  
  if (number > maxNumber) {
    maxNumber = number;
  }
  if (number < minNumber) {
    minNumber = number;
  }
}

