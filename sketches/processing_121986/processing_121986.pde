
//sets the maximum size for the circles
float max_size;
float dist;
float radius;

// gets the real date and time
int day = day();
int month = month();
int year = year();
int minute = minute();
int hour = hour();

// sets the due dates
int duedate1;
int duedate2;
int duedate3;
int duedate4;
int duedate5;
int duedate6;
int daysleft1;
int daysleft2;
int daysleft3;
int daysleft4;
int daysleft5;
int daysleft6;


// makes sure t is for text
String t;

//creates an array containing six circles
Circle[] assignment = new Circle[6];


void setup() {

  size(900, 600);

  //the co-ordinates of the circles start from the centre of the text
  textAlign(CENTER, CENTER);

  //maximum size of the circles
  max_size = 200;

  // background colour and writing in top left hand side
  background(63, 63, 63);

  // displays the text and the circles in the top left hand corner
  textSize(21);
  noStroke();
  text("Politics", 50, 20);
  fill(255, 123, 172);
  ellipse(100, 23, 20, 20);
  fill(255, 123, 172, 30);
  ellipse(125, 23, 20, 20);

  fill(255);
  text("Psychology", 70, 45);
  fill(175, 216, 162);
  ellipse(140, 48, 20, 20);
  fill(175, 216, 172);
  ellipse(165, 48, 20, 20);
  fill(175, 216, 172, 30);
  ellipse(190, 48, 20, 20);

  fill(255);
  text("Career Planning", 94, 70);
  fill(154, 181, 222);
  ellipse(190, 73, 20, 20);

  // the date the assignments are due
  duedate1 = 27;
  duedate2 = 28;
  duedate3 = 30;
  duedate4 = 3;
  duedate5 = 6;
  duedate6 = 10;

  // calculates how many days left depending on the date and the due date
  daysleft1 = duedate1 - day;
  daysleft2 = duedate2 - day;
  daysleft3 = duedate3 - day;
  daysleft4 = (30 - day) + duedate4;
  daysleft5 = (30 - day) + duedate5;
  daysleft6 = (30 - day) + duedate6;


  //establishes the start position of the circles. (x, y, number of days to go, text, R, G, B, days left)
  assignment[0] = new Circle(500, 140, duedate1 - day, "Assignment", 255, 123, 172, daysleft1);
  assignment[1] = new Circle(200, 220, duedate2 - day, "Interview", 154, 181, 222, daysleft2);
  assignment[2] = new Circle(450, 400, duedate3 - day, "Exam", 255, 123, 172, daysleft3); 
  assignment[3] = new Circle(700, 490, (30 - day) + duedate4, "WorkBook", 175, 216, 162, daysleft4);
  assignment[4] = new Circle(750, 200, (30 - day) + duedate5, "Exam", 175, 216, 162, daysleft5);
  assignment[5] = new Circle(190, 430, (30 - day) + duedate6, "Exam", 175, 216, 162, daysleft6);

}

void draw() {

  // for loop displays all the circles in the array
  for (int i=0; i<assignment.length; i++) {
    assignment[i].display();
  }

  // calls the clock function
  clock();
}

void mousePressed() {
  //checks if the mouse has been clicked on a circle
  for (int i=0; i<assignment.length; i++) {
    assignment[i].clicked();
  }
}

void clock() {
  // displays the time and date in the bottom left hand corner
  fill(63, 63, 63);
  noStroke();
  rect(10, 500, 150, 90);
  
  String date = day + "." + month + "." + year;
  fill(173, 173, 173);
  textSize(20);
  text(date, 80, 570);
  fill(173, 173, 173);
  textSize(50);
  text(nf(hour(), 2) + ":" + nf(minute(), 2), 80, height-75);
}

// attributes for the circles in the array
class Circle {
  float x;
  float y; 
  float w; 
  float h;
  int days; 
  String t;
  float t_size;
  color col;
  int r;
  int g;
  int b;


  // imports values from the individual circles in the array
  Circle(float t_x, float t_y, float t_d, String t_t, int t_r, int t_g, int t_b, int t_days) {

    x = t_x;
    y = t_y;
    days = t_days;
    // sets the size of the circle depending on the number of days left
    float size = map(days, 16, 0, 50, 200);
    w = size;
    h = size;
    t = t_t;
    // sets the size of the text depending on the number of days left
    t_size = map(days, 16, 0, 10, 30);

    // sets the colour of the individual circles 
    r = t_r;
    g = t_g;
    b = t_b;
    col=color(r, g, b);
  }

  void display() {

    // displays the circles
    stroke(63, 63, 63);
    fill(col);
    ellipse(x, y, w, h);
    // displays the text on the circles 
    fill(255);
    textSize(t_size);
    text(t, x, y + 9);
    textSize(t_size + 10);
    text(days, x, y-20);
  }

  void clicked() {
    //background (63, 63, 63);
    // Use Pythagorus Theorum to check the distance from
    // mouse pointer to centre of the circle to discover if it has been clicked
    dist = (mouseX - x) * (mouseX - x) + (mouseY - y) * (mouseY - y);
    dist = sqrt(dist);
    radius = w/2;



    //if the circle has been clicked, adds a circle with low opactiy on top
    if (dist < radius) {
      fill(r, g, b, 30);
      ellipse(x, y, w + 30, h + 30);
    } 
    else {
      // leave it as it is
    }
  }
}



