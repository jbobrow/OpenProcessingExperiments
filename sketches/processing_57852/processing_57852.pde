
//claire gustavson, Homework 12,  2012 copywrite. 


//HI I'M IN OTHER CLUSTER, COME FIND ME IF YOU NEED MORE HELP/ I'LL EXPLAIN WHY IT WASN'T WORKING BEFORE. SHMEEEE

float [ ] obesity = {
  32.2, 24.5, 24.3, 30.1, 24.0, 21.0, 22.5, 28.0, 22.2, 26.6, 29.6, 22.7, 26.5, 28.2, 29.6, 28.4, 29.4, 31.3, 31.0, 26.8, 27.1, 23.0, 30.9, 24.8, 34.0, 30.5, 23.0, 26.9, 22.4, 25.0, 23.8, 25.1, 23.9, 27.8, 27.2, 29.2, 30.4, 26.8, 28.6, 25.5, 31.5, 27.3, 30.8, 31.0, 22.5, 23.2, 26.0, 25.5, 32.5, 26.3, 25.1
};

String [] stateNames ={"alabama", "alaska", "arizona", "arkansas", "california", "colorado", "connecticut", "delaware", "district of columbia", "florida", "georgia","hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "new hampshire", "new jersey", "new mexico", "new york", "north carolina", "north dakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhode island", "south carolina", "south dakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "west virginia", "wisconsin", "wyoming"};

PImage b;
float arrayMax = 50; 
  int x;
  float mySize;
  String myName;
  
void setup () {  
  size (screen.width, screen.height);

smooth ();
  b = loadImage("fries.png");
  imageMode (CENTER);
   textAlign (CENTER);
x=0;
mySize=obesity [0];
myName=stateNames[0];
}

void draw () {
  background (255);
  fill (255);
  rect (0, 0, width, height);
  hamburger();
  name ();
}



void hamburger () {

  //for (int i=0; i<=arrayMax; i++) {
    //if (i<=arrayMax) {
      image(b, width/2, height/2, 20*mySize, 20*mySize);
    }
    //else {
      //i=0;
    //}
  //}
//}

void name(){
//for (int i=0; i<=arrayMax; i++) {
   // if (i<=arrayMax) {
      fill (0);
      text(myName, width/2, height*.90); 
    }
    //else {
      //i=0;
    //}
 //}
//}


void mousePressed () {


    x=x+1;
    mySize=obesity [x];
    myName=stateNames [x];
    println (mySize);
    if (x==50) {
     x=0;
     }
}


