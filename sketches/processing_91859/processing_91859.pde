
// Programmer: Te Hao Hsia
// Professor: Kelland Mr. Thomas
// Course: ISTA 301
// Assignment 3
// Last Update: March 4th 2013
// Description: Create a piece of generative visual art using Processing. Your piece should
// make use of Processing’s graphical capabilities, sound capabilities, or both.

public int count;
public boolean stop;

void setup() {
  stop = false;
  count = 0;
  size(1024, 768); 
  // background(100, 156, 100);
  background(0, 0, 0);
  fill(255);
  textSize(30);
  text("Generating!!!!.... Please Wait!!!!!", 270, 350);
}

void draw() {
  
  if (stop == false) {
      background(255, 255, 255);
      
      int begin1 = 0;
      int begin2 = 0;
      int end1 = (int) random(0, 100);
      int end2 = (int) random(0, 100);
      for (int i = 0; i < 60; i++) {
          fill(255);
          for (int j = 0; j < 25; j++) {
              stroke(random(0, 255), random(0, 255), random(0, 255));
              bezier(begin1, begin2,  random(begin1, begin2),  random(end1, end2),  random(begin1, end1),  random(begin2, end2), end1, end2);
          }
          ellipse(begin1, begin2, 55, 55);
          for (int j = 0;  j < 5; j++) {
            stroke(random(0, 255), random(0, 255), random(0, 255));
            fill(random(100, 255), random(100, 255), random(100, 255));
            int op1 =  begin1+ (int) random(1, 6)*5;
            int op2 =  begin2- (int) random(1, 6)*5;
            if (j%2 == 0) {
              ellipse(op1, op2, 20, 20);
              fill(random(150, 255), random(150, 255), random(150, 255));
              for (int k = 0; k < 5; k++) {
                  bezier(op1, op2, op1+random(0, 50), op2-random(0, 50), op1+random(0, 100), op2-random(0, 100), op1+random(0, 200), op2-random(0, 200));
              }
              
            } else {
              ellipse(op1, op2, 20, 20);
              fill(random(150, 255), random(150, 255), random(150, 255));
              for (int k = 0; k < 5; k++) {
                  bezier(op1, op2, op1-random(0, 50), op2+random(0, 50), op1-random(0, 100), op2+random(0, 100), op1-random(0, 200), op2+random(0, 200));
              }
            }
          }
          begin1 = end1;
          begin2 = end2;
          end1 = (int) random(0, 1024);
          end2 = (int) random(0, 1024);

          if (i == 59) {
              stop = true;
              fill(0);
              textSize(15);
              text("Programmer: Te Hao Hsia", 10, 20);
              text("Professor: Kelland Mr. Thomas", 10, 35);
              text("Course: ISTA 301", 10, 50);
              text("Assignment 3", 10, 65);
              text("Note: Randomised Graphic", 10, 80);
          }
      }
  }
 
  
 
  
}
