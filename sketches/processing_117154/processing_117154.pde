
int diameter; 
int arcx;
int arcy;



float point0;

float secondAngle ; //angles at which the ellipse is drawn  
float minuteAngle;
float hourAngle;
float dayAngle;
float monthAngle;

float secondDiameter; //sets the diametes for indiividual arcs 
float minuteDiameter ;
float hourDiameter ;
float dayDiameter ;
float monthDiameter ;



void setup() {
  size(650, 650); // Sets the size of the application
  smooth(); 

  diameter = 200; //sets the base/standard diameter of the arcs 

  arcx = width / 2; // center arcx on the screen
  arcy = height / 2; // center arcy on the screen 

  point0 = map(0, 0, 360, 0, 360)- HALF_PI; //sets the arcs to the '12 o'clock ' position.
  //arc(a, b, c, d, start, stop)

}

void draw() {
  background(0);
  noFill(); // 
  strokeWeight(20); 
  
  text("The time is: " + hour() + ":" + minute() + ":" + second(), 20, 50); //types syatem at (20, 50). 
  text("The date is: " + month() + ":" + day() + ":" + year(), 20, 600); //types system date at (20, 600). 


//sets the arcs to roate at the second, minute, hour, ect. 
  secondAngle = map(second(), 0, 60, 0, TWO_PI) - HALF_PI; 
  minuteAngle = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  hourAngle = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI) - HALF_PI; 
  dayAngle = map(day(), 1, 31, 0, TWO_PI) - HALF_PI; 
  monthAngle= map(month(), 1, 12, 0, TWO_PI) - HALF_PI;  


  secondDiameter = diameter * 2.8;  //setting   
  minuteDiameter = diameter * 2.4; //the 
  hourDiameter = diameter * 2; // diameters
  dayDiameter = diameter * 1.6; //of indivudual 
  monthDiameter = diameter * 1.2 ;//arcs



  // Second Arc
  
  stroke(85, 31, 80); 
  arc(arcx, arcy, secondDiameter-mouseX, secondDiameter-mouseY, point0, secondAngle);

  // Minute Arc
  stroke(85, 51, 80);
  arc(arcx, arcy, minuteDiameter-mouseX, minuteDiameter-mouseY, point0, minuteAngle);

  // Hour Arc
  stroke(85, 71, 80);
  arc(arcx, arcy, hourDiameter-mouseX, hourDiameter-mouseY, point0, hourAngle);

  // Day Arc
  stroke(85, 91, 80);
  arc(arcx, arcy, dayDiameter-mouseX, dayDiameter-mouseY, point0, dayAngle);

  // Month Arc
  stroke(85, 111, 80);
  arc(arcx, arcy, monthDiameter-mouseX, monthDiameter-mouseY, point0, monthAngle);
  




  if (second() == 0) {
    stroke(85, 31, 80);
    ellipse(arcx, arcy, secondDiameter, secondDiameter);

  }
}
