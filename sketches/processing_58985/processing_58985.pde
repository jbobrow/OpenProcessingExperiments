
Car myCar1;
Car myCar2;
Car myCar3;
Car myCar4;
Car myCar5;
Car myCar6; // Six objects!
PImage bg;
PImage NV;
PImage involved;
int studentType;
PImage student1;
PImage student2;
PImage student3;
int onTrack = 145;
int stateSelect = 0;
int oldMouseX;
int oldMouseY;
int numGraduated;
int classSize;
long startFallTime;
long currentTime;
int[] colorPicker = {
     1, 2, 3, 4, 4, 4, 4, 4, 4, 4
};
PImage[] student = {
     student1, student2, student3
};
int[] gradByState = {
     69, 69, 70, 77, 71, 76, 71, 75, 82, 72, 56, 66, 65, 76, 80, 80, 74, 86, 79, 74, 63, 79, 80, 87, 76, 86, 64, 82, 82, 84, 51, 83, 85, 67, 71, 73, 84, 79, 78, 77, 83, 76, 84, 75, 73, 74, 89, 77, 72, 77, 90, 76
};


void setup() {
     size(400, 800);
     // Parameters go inside the parentheses when the object is constructed.
     myCar1 = new Car(colorPicker[int(random(7))], 0, onTrack, 2, int(random(2))); 
     myCar2 = new Car(colorPicker[int(random(7))], 0, onTrack, 1, int(random(2)));
     myCar3 = new Car(colorPicker[int(random(7))], 0, onTrack, 2.1, int(random(2))); 
     myCar4 = new Car(colorPicker[int(random(7))], 0, onTrack, 2.3, int(random(2)));
     myCar5 = new Car(colorPicker[int(random(7))], 0, onTrack, 1.5, int(random(2))); 
     myCar6 = new Car(colorPicker[int(random(7))], 0, onTrack, 1.8, int(random(2)));
     bg = loadImage ("Background.jpg");
     NV = loadImage ("Nevada.jpg");
     student1 = loadImage("Student1.png");
     student2 = loadImage("Student2.png");
     student3 = loadImage("Student3.png");
     involved = loadImage("Involve.jpg");
}


void draw() {
     didwewin();
     if (didwewin() == false)
     {

          if (stateSelect<1) {
               background(NV);
               if (mouseX >16 && mouseX < 379 && mouseY >641 && mouseY < 753 && mousePressed == true)
                    stateSelect = 10;
          }
          else {
               //noStroke();
               background(bg);
               myCar1.drive();
               myCar1.display();
               myCar2.drive();
               myCar2.display();
               myCar3.drive();
               myCar3.display();
               myCar4.drive();
               myCar4.display();
               myCar5.drive();
               myCar5.display();
               myCar6.drive();
               myCar6.display();
               textAlign(RIGHT);
               fill(0);
               text(numGraduated, 190, 50);
               text("/", 200, 50);
               textAlign(LEFT);
               text(classSize, 200, 50);
               fill(#FFFFFF);
               rectMode(CENTER);
               rect ((mouseX+oldMouseX)/2, (oldMouseY+mouseY)/2, 60, 12);
               fill(255);
               text("Source: Chris Chapman - National Center for Eduaction Statistics", 20, 790);
               oldMouseX = mouseX;
               oldMouseY = mouseY;
          }
     }
}
// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Car { 
     color c;
     float xpos;
     float ypos;
     float xspeed;
     float yspeed;
     Boolean isFalling = false;
     long startFall;
     int gradRate = 55;
     int dropPlace;
     float oldypos = ypos;
     float oldxpos = xpos;
     int studentType;

     // The Constructor is defined with arguments.
     Car(color tempC, float tempXpos, float tempYpos, float tempXspeed, int tempStudentType) { 
          c = tempC;
          xpos = tempXpos;
          ypos = tempYpos;
          studentType = tempStudentType;

          xspeed = tempXspeed;
     }

     void display() {
          //noStroke();
          if (studentType ==0) {
               image(student1, xpos, ypos);
          }
          if (studentType ==1) {
               image(student2, xpos, ypos);
          }
          if (studentType ==2) {
               image(student3, xpos, ypos);
          }
     }
     void drive() {
          xpos = xpos + xspeed;
          ypos = ypos + yspeed;

          if (isFalling == true && oldxpos < startFall) {   //If it just started falling, mark the time. 
               startFallTime = millis();
          }


          //ypos = ypos - (millis() - startFall)*(millis()-startFall);
          if (isFalling == true && xpos > dropPlace) {
               currentTime = millis() - startFallTime;               
               if ( (mouseX-40)<xpos && xpos<(mouseX+30) && (ypos + yspeed)>(mouseY -30) && (oldypos + yspeed) <(mouseY-30) )
               { 
                    yspeed = (0 - yspeed) -2 ;
               } 
               else {
                    if ( oldypos<onTrack && (ypos + (yspeed +.25))>onTrack) {
                         yspeed = 0;
                         isFalling = false;
                    }
                    else {
                         yspeed = yspeed + .25;
                    }
               }
          }

          if (xpos > width) {
               xpos = 0;
               yspeed = 0;
               classSize++;
               studentType = int(random(2));
               if (ypos < onTrack + 1) {
                    numGraduated++;
                    print ("yes");
               }
               if (isFalling == true) {
                    isFalling = false;
                    ypos = onTrack;
               }
               if (random(99) > gradRate) {
                    isFalling = true;
                    dropPlace = int(random(200));                                          //So far we have picked which ones drop, but we need to set the graduation rate, and make them fall if they are supposed to fall.
               }
          }
          oldxpos = xpos;
          oldypos = ypos;
     }
}

Boolean didwewin() {
     if (classSize>99 && numGraduated > 56) {
          background(involved);
          return true;
     }
     else{
          return false;
}
}


