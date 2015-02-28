
//Global Variables - every function can see them
int seconds, minutes, hours;

void setup() {
  size(400, 400);
  smooth(8);
  
}

void draw() {
  background(191,255,2);
  int seconds = second();
  int minutes = minute();
  int hours = hour();
  int day = day();
  int month = month();
  int year = year();

  float secondRot = map(seconds, 45, 59, 0, -360);
  float secondRotb = map(seconds,45, 59, 0,360);
  float secondRotc = map(seconds,90, 59, 0, 360);
  float secondRotd = map(seconds,45, 59, 90, 360);
  
  float minuteRot = map (minutes, 0, 59, 0, 360);
  float hourRot = map (hours, 0, 23, 0, 360*2);
  float monthRot = map (month, 0, 11, 0, 360);//orange
  float dayRot = map (day, 0, 30, 0, 360);//red
  float yearRot = map (year, 0, 2014, 0, 360);//black
  
 fill(102,72,102);//dk purple
 ellipse(width/2, height/2, 235,235);
 
 
pushMatrix();
  stroke(0);
  fill(255,82,33);//red
  translate(width/2, height/2);
  rotate(radians(secondRotd));
  arc(0, 0, 200, 200, 0, PI+QUARTER_PI, PIE);
  
  popMatrix();

 
  
pushMatrix();
  stroke(0);
  fill(240,33,255);//pink
  translate(width/2, height/2);
  rotate(radians(secondRotc));
  arc(0, 0, 155, 155, 0, PI+QUARTER_PI, PIE);
  
  popMatrix();

pushMatrix();
  stroke(0);
  fill(33,255,101);//green
  translate(width/2, height/2);
  rotate(radians(secondRotb));
  arc(0, 0, 120, 120, 0, PI+QUARTER_PI, PIE);
  popMatrix();

pushMatrix();
  stroke(0);
  fill(255,234,212);//black
  translate(width/2, height/2);
  rotate(radians(secondRot));
  rectMode(CENTER);
  ellipse(0, 0, 50, 50);
  
  popMatrix();
  //MINUTES
  pushMatrix();
  translate(width/2, height/2); //allows you to reset the starting point of the grid
  rotate(radians(minuteRot));
  stroke(2,4,232);
  strokeWeight(5);
  line(0, 10, 0, -90);
  popMatrix();

  //HOURS
  pushMatrix();
  translate(width/2, height/2); //allows you to reset the starting point of the grid
  rotate(radians(hourRot));
  stroke(2,4,232);
  strokeWeight(5);
  line(0, 10, 0, -65);
  popMatrix();
  
  
 //MONTH
  pushMatrix();
  translate(width/2, height/2); //allows you to reset the starting point of the grid
  rotate(radians(monthRot));
  stroke(240,120,7);//orange
  strokeWeight(2);
  line(0, 10, 0, -160);
  popMatrix();
  
  //DAY
  pushMatrix();
  translate(width/2, height/2); //allows you to reset the starting point of the grid
  rotate(radians(dayRot));
  stroke(2,81,255);//red
  strokeWeight(2);
  //line(0, 10, 0, -130);
  popMatrix();
  
  //YEAR
  pushMatrix();
  translate(width/2, height/2); //allows you to reset the starting point of the grid
  rotate(radians(yearRot));
  stroke(33,255,101);
  strokeWeight(2);
  //line(0, 10, 0, -75);
  popMatrix();
  
  /*textSize(12);
  fill(0);
  text("Jan",240,60);
  text("Feb",300,100);
  text("March",340,160);
  text("April",340,240);
  text("May",300,300);
  text("June",240,340);
  text("July",145,340);
  text("Aug",75,300);
  text("Sept",40,240);
  text("Oct",40,160);
  text("Nov",80,100);
  text("Dec",150,60);
    */          
  
  textSize(15);
  text("Time " + hours + ":" + minutes + ":" + seconds, 270, 377);


 textSize(15);
  text("Date: " + month + "/" + day + "/" + year, 20, 377);
}

