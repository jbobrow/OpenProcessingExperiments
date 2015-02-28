

//variable declaration 
int hrs;//hours
int mins;//minutes
int sec;//seconds
int mills;// milliseconds across the life of the app
int milliSec;//my janky verson of mills constricting it to 1 second at a time
float hrsToCol;//map hrs to color
float minsToCol;//map mins to color
float secToCol;//map sec to color
color filler;//mapped color
float[] scaleXY;//scaling of the squares for pulsating feeling--this will be generated from the returnScaleXY() function

void setup() {
  background(0);
  size(325, 325);
  frameRate(25);
}

void draw() {
 // print(frameCount);
  background(255);
  //set the values of time here to get new values every time the draw() is called
  hrs = hour();
  mins = minute();
  sec = second();
  mills = millis();
  //this uses the modulus to confine the millis() function to milliseconds
  //every second as opposed to millisecons since the start of the program
  milliSec = mills %  1000;
  //this is an array that is being populated by a function that returns an array from 2 parameters
  scaleXY = returnScaleXY(float(milliSec/20), float(milliSec/20));

  //squares this double for loop generates the grid of squares
  for(int k= 0; k<width; k+=30) {
    for (int l = 0; l<height; l+=30) {
      noStroke();
      fill(timeToColor());
      rect(k, l, scaleXY[0], scaleXY[1]);
    }
  }
}

//function to map hours seconds and minutes into color
color timeToColor() {
  float hrsToColor = map(hrs, 0, 23, -1, -256);//mapping hrs to color
  float minsToColor = map(mins, 0, 59, -1, -256);//mapping mins to color
  float secToColor = map(sec, 0, 59, -1, -256);//mapping secs to color
  float mainColor = hrsToColor * minsToColor * secToColor;
  return int(mainColor);// cast as int to fit into the fill() function
}

//function to return the scaled width and height of the squares
float[] returnScaleXY(float xnumber, float ynumber) {  
  //these number is going to be a scaling down 
  float xnum; 
  float ynum;
  if(xnumber >= 25) {
    //if its greater than the half way point 
    //getting a negative value here to scale back down to 0  
    xnum = (49-xnumber) * -1;
  }
  else {
    // if xnumber is 0 to 24 let it pass into the returned array 
    xnum = xnumber; //
  }

  if(ynumber >= 25) {
    ynum = (49-ynumber) * -1;
  }
  else {
    ynum = ynumber;
  }

  float[] widthHeight = new float[2];
  widthHeight[0] = xnum;
  widthHeight[1] = ynum;
  return widthHeight;
}


