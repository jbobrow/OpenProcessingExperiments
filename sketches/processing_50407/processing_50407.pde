
// declare arrays
Student[] students = new Student[26];
String[] names = new String[26]; // sort array

// initial settings
boolean sorted = false;
float easing = 0.1;
int cols = 9;
int spacer = 20;
int rowHeight = 95;
float colWidth;

void setup() {

  size(640, 480);
  frameRate(60);
  smooth();
  
  // set column width
  colWidth = (width - spacer) / cols;
  
  // declare and initialize student objects
  students[0] = new Student("James Atkins", 'M', false);
  students[1] = new Student("Greg Bertsch", 'M', false);
  students[2] = new Student("Laura Black", 'F', false);
  students[3] = new Student("Aleta Corboy", 'F', false);
  students[4] = new Student("Kari Davidson", 'F', false);
  students[5] = new Student("Jacquelyn Edwards", 'F', false);
  students[6] = new Student("Michelle Frappier", 'F', false);
  students[7] = new Student("Katherine Grabar", 'F', false);
  students[8] = new Student("Kinsey Gross", 'F', false);
  students[9] = new Student("Tracy Hughes", 'F', false);
  students[10] = new Student("Eunice Lee", 'F', false);
  students[11] = new Student("Michelle McArdel", 'F', false);
  students[12] = new Student("Hannah Pederson", 'F', false);
  students[13] = new Student("Ellen Peterson", 'F', false);
  students[14] = new Student("Taylor Raquer", 'F', false);
  students[15] = new Student("Jonathan Sikov", 'M', false);
  students[16] = new Student("Stephanie Smythies", 'F', false);
  students[17] = new Student("Felix Wong", 'M', false);
  students[18] = new Student("Ti Wu", 'F', false);
  students[19] = new Student("Nicole Yeo", 'F', false);
  students[20] = new Student("Yu Zhang", 'F', false);
  students[21] = new Student("Andrew Salituri", 'M', true);
  students[22] = new Student("Dan Ostrowski", 'M', true);
  students[23] = new Student("Sergei Larionov", 'M', true);
  students[24] = new Student("Katie Suskin", 'F', false);
  students[25] = new Student("Amy Keeling", 'F', true);
  
  // build sort array
  for (int i = 0; i < students.length; i++) {
    names[i] = students[i].name;
  }
  
  // initialize icons incl. posX, posY
  for (int i = 0; i < names.length; i++) {
    
    // get index
    int index = 0;
    for (int n = 0; n < students.length; n++) {
      if (names[i].equals(students[n].name)) {
        index = n;
      }
    }
    
    // get cols, rows
    int col = i % cols;
    int row = int(i / cols);
    
    // set posX, posY
    float posX = spacer + col * colWidth;
    float posY = spacer + row * (rowHeight + spacer);
    
    // position students
    students[index].position(posX, posY);
  }
}

void draw() {
  
  background(255);
  noStroke();

  drawIcons();
  drawLabels();
}


void drawIcons() {
  
  float targetX, targetY;

  for (int i = 0; i < names.length; i++) {
    
    int index = 0;
    
    // get index
    for (int n = 0; n < students.length; n++) {
      if (names[i].equals(students[n].name)) {
        index = n;
      }
    }
    
    // get cols, rows
    int col = i % cols;
    int row = int(i / cols);
    
    targetX = spacer + col * colWidth;
    targetY = spacer + row * (rowHeight + spacer);
        
    // tween x, y towards target
    float dx = targetX - students[index].x;
    float dy = targetY - students[index].y;
    float posX = students[index].x + dx * easing;
    float posY = students[index].y + dy * easing;
    
    // draw student   
    students[index].position(posX, posY);
    students[index].display(mouseX, mouseY);
  }
}


void drawLabels() {

  float targetX, targetY;

  for (int i = 0; i < names.length; i++) {
    
    int index = 0;
    
    // get index
    for (int n = 0; n < names.length; n++) {
      if (names[i].equals(students[n].name)) {
        index = n;
      }
    }

    students[index].displayLabel(mouseX, mouseY);
  }
}


void keyPressed() {
  
  // set sort array
  if (!sorted) {
    names = sort(names);
    sorted = true;
  } else {
    // reset array
    for (int i = 0; i < students.length; i++) {
      names[i] = students[i].name;
    }
    sorted = false;
  }
}

