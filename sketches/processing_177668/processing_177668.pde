
/*

second step to the simulated asteroids

the profit is added, and also lines of connections for groups of asteroids near to each other

the orbital elements are normally loaded from http://www.asterank.com/

for this sketch on Openprocessing the loaded orbital elements of the ateroids are stored in an array

the orbits are calculated using the formulas on: http://www.stjarnhimlen.se/comp/ppcomp.html#16

Since this is a game, the impression of rotating asteroids is more important than "reality".

Beam 2014, for the lecture on OPEN SOURCE ASTRONOMY

*/


int loadingByArray = 1;

float orbitelementsArray[] = {
  1.6753271,0.07582276,2.767506,0.003736359,522.0,
3.9916327,0.11527806,3.1394365,0.0030924587,481.0,
0.28970554,0.15558548,2.740242,0.0037922598,317.0,
2.623477,0.27528444,2.760265,0.0037510705,350.0,
0.4292082,0.14877763,2.423695,0.0045589465,328.0,
0.66450226,0.17174837,2.5251431,0.0042869896,453.0,
2.469053,0.07354022,3.1094491,0.003137302,371.0,
5.4611816,0.22748648,3.0937896,0.0031611514,314.0,
0.42842066,0.19828638,2.7105954,0.0038546452,339.0,
0.6910808,0.12659745,2.6812112,0.003918185,797.0,
6.1663527,0.17050102,2.976951,0.0033490679,358.0,
4.8844805,0.17411299,2.7575672,0.003756577,490.0,
0.3540316,0.20728537,2.8555477,0.0035648996,343.0,
3.0275257,0.08180029,2.4319239,0.004535827,456.0,
0.58663857,0.23654062,2.3617284,0.004739544,304.0,
4.5718946,0.10381967,3.1864088,0.0030243304,312.0,
4.229226,0.1958324,2.6653397,0.0039532348,278.0,
3.790148,0.08077484,2.7317433,0.0038099706,539.0,
1.0865874,0.13548106,2.677219,0.0039269524,836.0,
5.7963943,0.13413322,3.4497418,0.002684736,278.0,
1.5079476,0.12491356,2.7521996,0.0037675719,394.0,
6.000633,0.13435082,2.4183168,0.0045741634,847.0,
1.6812488,0.07377601,2.761587,0.003748378,675.0,
2.2949162,0.22688137,2.7278457,0.0038181392,360.0,
0.25048858,0.11504093,2.3796208,0.0046861893,720.0,
0.8404782,0.20601387,2.7439063,0.0037846658,388.0,
5.9644985,0.17906475,3.167129,0.0030519878,270.0,
5.3104806,0.18119976,2.6777673,0.0039257463,270.0,
1.6183091,0.24958163,2.7962997,0.0036787977,299.0,
5.46532,0.10452287,3.0108461,0.0032926728,324.0,
3.9340894,0.04320088,2.647214,0.0039939065,531.0,
1.2008903,0.17432423,2.553063,0.00421686,759.0,
5.4313064,0.13129234,3.1456463,0.0030833061,427.0,
1.9540195,0.08101035,2.3388088,0.004809384,298.0,
3.4420016,0.22172324,2.3600357,0.0047446443,747.0,
6.0125666,0.06628979,2.724846,0.0038244461,803.0,
0.9599356,0.11127907,2.4065228,0.0046078307,287.0,
4.6165333,0.15962094,3.212293,0.0029878498,972.0,
2.6036031,0.09603834,2.2512465,0.005092686,379.0,
2.783574,0.095124975,3.0178444,0.0032812261,613.0,
3.9749715,0.16672505,2.6108274,0.0040776897,369.0,
4.6531014,0.0674406,2.9700944,0.003360672,532.0,
1.1439785,0.070188716,2.7470245,0.0037782239,912.0,
5.885203,0.097762726,2.6493297,0.0039891233,557.0,
4.5194383,0.1738678,3.120727,0.0031203104,519.0,
5.780016,0.16328757,3.1426613,0.0030877,554.0,
1.4930307,0.086380325,2.7844067,0.0037023926,796.0,
1.1308882,0.2453133,2.6365125,0.0040182476,997.0,
3.207203,0.2239203,2.7387388,0.0037953823,649.0,
3.8881059,0.07869959,2.8076007,0.003656608,340.0,
4.9114437,0.18686211,3.1336656,0.0031010052,609.0,
1.3104205,0.2145791,4.0141883,0.0021388722,430.0,};


int numberOfAsteroids = 500;
float profitLimit = 250.0;
float distanceForConnection = 30.0 ;

int linesOn = 1;

String totalStringAll = "";
String totalString = "";

ArrayList Orbits;
ArrayList Planets;
Sun sun;

int solarSystemX = 50;
int solarSystemY = 50;

float dayNumber = 0;

class Planet {
  float ma  ;
  float e  ;
  float a   ;
  float n  ;
  String name;
  color col;
  int size;
  PVector position;
  Planet( String nameI, float maI, float eI, float aI, float nI, color colI, int sizeI) {
    name = nameI;
    ma = maI; 
    e = eI; 
    a = aI; 
    n = nI;
    col = colI;
    size = sizeI;
    position = new PVector(0, 0);
  }
  void drawPlanetOnDayNumber(float dayNumber, Sun sun) {
    float M = ma + n * dayNumber;
    float E0 = M + e*   sin(ma ) * ( 1.0 + e * cos(ma ));

    float E1 = E0 - ( E0 - e * sin(E0) - M ) / ( 1 - e* cos(E0) );

    while ( abs ( E1 - E0 ) > .05 ) {
      E0 = E1;
      E1 = E0 - ( E0 - e*  sin(E0 ) - M ) / ( 1 - e * cos(E0 ) );
    }

    float xv =  a * ( cos(E1 ) - e );
    float yv =  a * ( sqrt(1.0 - e*e) * sin(E1) );

    fill(col);
    //ellipse( width/2 + xv*solarSystemX, height/2 + yv*solarSystemY, size, size/2 );
    text( name.substring(0, 2), width/2 + xv*solarSystemX, height/2 + yv*solarSystemY );
  }
}

class Sun { //actually the earth :-)
  //orbital elements of the Sun (=Earth)
  // float N = 0.0;
  //float i = 0.0;
  // float w = 282.9404 + 4.70935E-5 * d;
  float a = 1.000000 ;
  float e = 0.016709;
  float ma = 356.0470/180.0*PI ;
  float n = 0.9856002585/180.0*PI ;
  PVector position;
  Sun() {
    position = new PVector(0, 0);
  }
  float[] drawSunOnDayNumber(float d) {
    // N = 0.0;
    // i = 0.0;
    // w = 282.9404 + 4.70935E-5 * d;
    // a = 1.000000 ;
    // float M = (356.0470 + 0.9856002585 * d)/180*PI;

    float M = (ma + n * d);
    float E0 = M + e*   sin(ma ) * ( 1.0 + e * cos(ma ));

    float xv =  a * ( cos(E0 ) - e );
    float yv =  a * ( sqrt(1.0 - e*e) * sin(E0) );

    float[] sunCoordinates = {
      xv, yv
    };


    fill(255, 0, 0);
    ellipse( width/2 + xv*solarSystemX, height/2 + yv*solarSystemY, 10, 10 );

    return sunCoordinates;
  }
}

class Orbit {
  float ma  ;
  float e  ;
  float a   ;
  float n  ;
  float profit;
  PVector position;
  Orbit(   float maI, float eI, float aI, float nI, float profitI) {
    ma = maI; 
    e = eI; 
    a = aI; 
    n = nI;
    profit = profitI;
    position = new PVector(0, 0);
  }
  void drawOrbitOnDayNumber(float dayNumber, Sun sun) {
    float M = ma + n * dayNumber;
    float E0 = M + e*   sin(ma ) * ( 1.0 + e * cos(ma ));

    float E1 = E0 - ( E0 - e * sin(E0) - M ) / ( 1 - e* cos(E0) );

    while ( abs ( E1 - E0 ) > .0005 ) {
      E0 = E1;
      E1 = E0 - ( E0 - e*  sin(E0 ) - M ) / ( 1 - e * cos(E0 ) );
    }

    float xv =  a * ( cos(E1 ) - e );
    float yv =  a * ( sqrt(1.0 - e*e) * sin(E1) );

    position.x = width/2 + xv*solarSystemX;
    position.y = height/2 + yv*solarSystemY;

    //float[] sunCoordinates = sun.drawSunOnDayNumber(dayNumber);

    //xv -= sunCoordinates[0];
    //yv -= sunCoordinates[1];

    //fill(255, 0, 0);
    //ellipse( width/2 + sunCoordinates[0]*250, height/2 + sunCoordinates[1]*100, 10, 10 );

    if ( a > .5)
      fill(0, 255, 0);
    else
      fill(0, 0, 255);

    ellipse( position.x, position.y, profit/30, profit/30 );
  }
}


void setup() {

  size(640, 640);

  Orbits = new ArrayList();

  sun = new Sun();

  Planets = new ArrayList(); 

  // Planets.add ( new Planet ( name, ma, e, a, n, color, size ) );
  Planets.add ( new Planet ( "Mercury", 168.6562/180.0*PI, 0.205635, 0.387098, 4.0923344368/180.0*PI, color(255, 100, 100), 5 ) );
  Planets.add ( new Planet ( "Venus", 48.0052/180.0*PI, 0.006773, 0.723330, 1.6021302244/180.0*PI, color(255, 255, 100), 10 ));
  Planets.add ( new Planet ( "Mars", 18.6021/180.0*PI, 0.093405, 1.523688, 0.5240207766/180.0*PI, color(255, 100, 255), 10 ));
  Planets.add ( new Planet ( "Jupiter", 19.8950/180.0*PI, 0.048498, 5.20256, 0.0830853001/180.0*PI, color(255, 100, 255), 20));

 
 if ( loadingByArray == 0 ) {
  //filtering on profit
  String lines[] = loadStrings("http://asterank.com/api/asterank?query={\"a\":{\"$gt\":0.1},\"a\":{\"$lt\":10.0}}&limit="+str(numberOfAsteroids));

  for (int i = 0 ; i < lines.length; i++) {
    totalStringAll+=lines[i];
  }
  int myCharNum = 0;

  while ( myCharNum < (totalStringAll.length () - 10) ) {
    totalString = "";
    while ( ! ( (totalStringAll.substring ( myCharNum, myCharNum+1)).equals("}"))) {
      totalString += totalStringAll.substring(myCharNum, myCharNum+1);
      myCharNum++;
    }

    float ma = extractedValue("\"ma\"")/180.0*PI;
    float e = extractedValue("\"e\"") ;
    float a = extractedValue("\"a\"") ;
    float n = extractedValue("\"n\"")/180.0*PI ;
    float profit = extractedValue("\"profit\"") ;//in trillions ( or something)

    if ( profit > profitLimit ) {
      Orbits.add ( new Orbit ( ma, e, a, n, profit ) );
      println ( "added " +ma + " " +e+ " " +a+ " " +n+ " " + profit   );
    }
    else {
      // println ( "NOT added " +ma + " " +e+ " " +a+ " " +n+ " " + profit   );
    }


    myCharNum++;//skip an }

    // for ( int i = 0; i < 100 ; i++)
    //   calculateCoordinates(i, ma, e, a, n );
  }
  
    }

  if ( loadingByArray == 1 ) {
    
      for ( int i = 0; i < orbitelementsArray.length/5 - 1 ; i++) {
      float ma = orbitelementsArray[i*5+0];
      float e =  orbitelementsArray[i*5+1];
      float a =  orbitelementsArray[i*5+2];
      float n =  orbitelementsArray[i*5+3];
       float profit =   orbitelementsArray[i*5+4];
      println ( ma + " " +e+ " " +a+ " " +n   );
      Orbits.add ( new Orbit ( ma, e, a, n, profit ) );
    }

    
  }

  println( "added number of asteroids " + Orbits.size());


  fill( (255), (255), (255));
}


float extractedValue(String searchStr ) {
  int eIndex = totalString.indexOf(searchStr);

  int eEnd = eIndex;
  while ( ! ( (totalString.substring ( eEnd, eEnd+1)).equals(","))) {
    eEnd++;
  }

  //println(totalString.substring(eIndex, eEnd));
  String eStr = totalString.substring(eIndex + 5, eEnd);


  if ( searchStr.equals("\"profit\"")) {
    if ( eStr.length()> 20 )
      eStr = totalString.substring(eIndex + 10, eEnd-15);
    else
      eStr = "0.0";
  }

  float e = float(eStr);
  return ( e);
}

float distance(PVector pos, PVector pos2) {
  return sqrt(((pos.x-pos2.x)*(pos.x-pos2.x))+((pos.y-pos2.y)*(pos.y-pos2.y)));
}

void draw() {
  background(0);
  text ( "added number of asteroids " + Orbits.size(), 10, 10);
  dayNumber+=.5;

  for (int i = Planets.size()-1; i >= 0; i--) {
    Planet b = (Planet) Planets.get(i);
    b.drawPlanetOnDayNumber(dayNumber, sun);
  }

  sun.drawSunOnDayNumber(dayNumber);

  for (int i = Orbits.size()-1; i >= 0; i--) {
    Orbit b = (Orbit) Orbits.get(i);
    b.drawOrbitOnDayNumber(dayNumber, sun);
  }
 
  if ( linesOn == 1 ) {
    strokeWeight(2);
    fill(150);
    stroke(200, 100, 50);
    for (int i1 = Orbits.size()-1; i1 >= 0; i1--) {
      Orbit a = (Orbit) Orbits.get(i1);
      float dt = 100000000;
      for (int i2 = Orbits.size()-1; i2 >= 0; i2--) {
        if ( i1 != i2 ) {
          Orbit b = (Orbit) Orbits.get(i2);
          float dd = distance ( a.position, b.position );
          if ( dd < dt ) dt = dd;
          if ( dd < distanceForConnection )
            line ( a.position.x, a.position.y, b.position.x, b.position.y);
        }
      }
    }
  }
}

void mousePressed() {

  solarSystemX = (width/2 - mouseX);
  solarSystemY = (height/2 - mouseY);
}

