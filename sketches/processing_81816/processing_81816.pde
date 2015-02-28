
void setup() { 
  size(600, 400);
}


void draw() { 
  background(0); 

  // start counter at 0
  int counter =0; 

  // as long as counter is less than 10 
  // keep running the code within the curly
  // brackets
  while (counter<10) { 
    // draw a rectangle
    rect(counter * 20, 200, 10, 10); 
    // increment the counter
    counter++;
  }
}
