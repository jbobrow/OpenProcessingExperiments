
//Eric Liu
//CTIN101, Fall 2014
//13 Second Time Cycle

/*
Using a state machine, my goal was to visually demonstrate the relationship betwee size of shapes and duration of time.
As such, the fibonacci sequence and the 'golden spiral' (beginning with 1, 1, 2, 3, 5, 8...) inspired the visual design for the project.
The smallest blocks represent a single second while the sum of the two previous blocks equal the duration of time, producing a 13 second cycle.
*/

int s;
int tOne = 1000;
int tTwo = 2000;
int tThree = 3000;
int tFive = 5000;
int tEight = 8000;
color c1 = color(0, 55);
color c2 = color(0, 95);
color c3 = color(0, 135);
color c4 = color(0, 175);
color c5 = color(0, 215);
color c6 = color(0, 255);
color blue = color(0, 146, 255);

void setup() {
  size(650, 400);
  fill(255);
  background(0, 146, 255); 
  s = millis();
  smooth();
}

void draw() {
  int p = millis() - s;
  
    // rect 1 
    noStroke();
    fill(c1);
    rect(250, 0, 400, 400);
    
    // rect 2 
    noStroke();
    fill(c2);
    rect(0, 150, 250, 250);
    
    // rect 3 
    noStroke();
    fill(c3);
    rect(0, 0, 150, 150);
    
    // rect 4
    noStroke();
    fill(c4);
    rect(150, 0, 100, 100);
    
     // rect 5
    noStroke();
    fill(c5);
    rect(150, 100, 50, 50);
    
    // rect 6
    noStroke();
    fill(c6);
    rect(200, 100, 50, 50);
    
         if (p > tOne) {
            c5=color(0, 146, 0);
            c6=color(0, 146, 40);
        }
        
        else if (p < tOne) {
          c5 = color(0, 15);
          c6 = color(0, 35);
        }

        if (p > tTwo) {
            c4=color(0, 146, 80);
        }
        
        else if (p < tTwo) {
          c4 = color(0, 45);
        }
        
        if (p > tThree) {
            c3=color(0, 146, 120);
        }
        
        else if (p < tThree) {
          c3 = color(0, 75);
        }
        if (p > tFive) {
            c2=color(0, 146, 160);
        }
        
        else if (p < tFive) {
          c2 = color(0, 115);
        }
        
        if (p > tEight) {
            c1=color(0, 146, 200);
            s = millis();
        }
        
        else if (p < tEight) {
          c1 = color(0, 185);
        }
        
        if (p > 13000) {
            s = millis();
            background(255);
        }
}


