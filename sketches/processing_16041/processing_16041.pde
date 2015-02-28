
 PFont font;
 
 // Initialize array of random numbers
 int[] numbers = new int[100];
 int i = 0; // Pointer to update random numbers

void setup() {
 size(800, 800);
 font = loadFont("AndaleMono-15.vlw");
 
 smooth();
 background(0);
 
 // Populate array with random number
 for (int i = 0; i < numbers.length; i++) {
   numbers[i] = ceil(random(0,99));
 }
 println(numbers[50]);
 
}

void draw() {
  background(0);
  smooth();
  
  fill(255, 40);
  noStroke();
  
  // Update random array each time draw() runs  
  numbers[i%numbers.length] = ceil(random(0,99));
  i++;
  
  // Draw list of random numbers
  for (int i = 0; i < numbers.length; i++) {
    ellipse(numbers[i] * 8, width/2, 8, 8);
  }
  
  // Draw a bar graph
  pushMatrix();
  translate(-4, 380);
  barGraph(numbers);
  popMatrix();
  
  // Draw a number grid
  pushMatrix();
  translate(430, 470);
  colorGrid(numbers);
  popMatrix();
  
}

void barGraph(int[] nums) {
  // Create a new array and populate it with zeros
  int[] counts = new int[numbers.length];
  for (int i = 0; i < numbers.length; i++) {
    counts[i] = 0;
  }
  
  // Tally the counts
  for (int i = 0; i < numbers.length; i++) {
    counts[nums[i]]++;
  }
  
  // Draw the bar graph
  strokeWeight(1);
  stroke(0);
  for (int i = 0; i < counts.length; i++) {
    fill(255, counts[i] * 30, 0);
    rect(i * 8, 0, 8, -counts[i] * 15);
  }
}

void colorGrid(int[] nums) {
  // Create a new array and populate it with zeros
  int[] counts = new int[numbers.length];
  for (int i = 0; i < numbers.length; i++) {
    counts[i] = 0;
  }
  
  // Tally the counts
  for (int i = 0; i < numbers.length; i++) {
    counts[nums[i]]++;
  }
  
  // Draw the color number graph
  int spacing = 30;
  smooth();
  
  for (int i = 0; i < numbers.length; i++) {
    fill(counts[i]*40);
    
    textSize(20);
    textFont(font);
    text(i, (i % 10) * spacing, floor(i/10) * spacing);
  }
}

