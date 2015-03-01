

/*

first step to the simulated asteroids

the orbital elements are normally loaded from http://www.asterank.com/

for this sketch on Openprocessing the loaded orbital elements of the ateroids are stored in an array

the orbits are calculated using the formulas on: http://www.stjarnhimlen.se/comp/ppcomp.html#16

Since this is a game, the impression of rotating asteroids is more important than "reality".

Beam 2014, for the lecture on OPEN SOURCE ASTRONOMY

*/

int numberOfAsteroids = 100;

String totalStringAll = "";
String totalString = "";

ArrayList Orbits;
ArrayList Planets;
Sun sun;

int solarSystemX = 50;
int solarSystemY = 50;

float dayNumber = 0;

int loadingByArray = 1;

float orbitelementsArray[] = {
  1.6753271, 0.07582276, 2.767506, 0.003736359,
1.3653486, 0.23127362, 2.7716062, 0.0037280712,
0.5773052, 0.25544825, 2.6707003, 0.003941339,
0.36414275, 0.08874017, 2.3617933, 0.0047393483,
4.5411644, 0.19113548, 2.573809, 0.0041659777,
0.5098847, 0.20144904, 2.4253514, 0.004554277,
1.2592316, 0.23079447, 2.3866599, 0.004665473,
1.2538224, 0.15633713, 2.2019582, 0.00526463,
3.6597052, 0.122290134, 2.3864348, 0.0046661333,
3.9916327, 0.11527806, 3.1394365, 0.0030924587,
3.9765065, 0.10002542, 2.4525008, 0.0044788625,
0.8927001, 0.22129148, 2.3334823, 0.00482586,
2.9098241, 0.08379036, 2.5770445, 0.004158135,
2.5404642, 0.16608316, 2.5866828, 0.004134916,
4.843804, 0.18745941, 2.6439147, 0.0040013846,
5.840844, 0.13635282, 2.9227853, 0.0034425964,
4.4985857, 0.13249214, 2.4719532, 0.004426099,
3.0330427, 0.21892563, 2.295006, 0.004947726,
2.5095642, 0.15880102, 2.4415882, 0.0045089233,
0.9774289, 0.14289056, 2.4088137, 0.004601259,
5.0442667, 0.1645949, 2.4345186, 0.0045285774,
4.1948214, 0.09971791, 2.9107244, 0.0034640152,
5.669627, 0.23547328, 2.624823, 0.00404512,
1.2509477, 0.12580894, 3.1349473, 0.0030991035,
1.9027251, 0.25555694, 2.3994105, 0.0046283333,
1.7509471, 0.09032202, 2.6550324, 0.003976278,
4.477914, 0.17227703, 2.3470857, 0.004783965,
5.0941043, 0.15145291, 2.7752419, 0.0037207475,
4.529727, 0.07211219, 2.5551434, 0.0042117108,
5.5203834, 0.12675078, 2.3657198, 0.004727554,
2.895625, 0.22198504, 3.1552017, 0.0030693102,
0.23995507, 0.08016216, 2.5872884, 0.004133465,
0.31885198, 0.33667526, 2.8674018, 0.003542816,
2.2531366, 0.10459775, 2.6879294, 0.0039035045,
4.7243533, 0.22690277, 2.9919171, 0.0033239701,
5.493444, 0.3021321, 2.7492688, 0.003773598,
5.8358784, 0.17352946, 2.6426933, 0.004004159,
0.28970554, 0.15558548, 2.740242, 0.0037922598,
5.5877085, 0.11391897, 2.76895, 0.0037334368,
0.11624069, 0.046741627, 2.2671595, 0.0050391625,
2.623477, 0.27528444, 2.760265, 0.0037510705,
2.6326606, 0.22192347, 2.4439752, 0.004502319,
0.2723586, 0.16873914, 2.2032619, 0.0052599586,
0.4292082, 0.14877763, 2.423695, 0.0045589465,
0.809449, 0.08332384, 2.720722, 0.0038331447,
0.66450226, 0.17174837, 2.5251431, 0.0042869896,
1.5844799, 0.13287716, 2.8791122, 0.0035212233,
2.469053, 0.07354022, 3.1094491, 0.003137302,
5.4611816, 0.22748648, 3.0937896, 0.0031611514,
2.6624193, 0.28538305, 2.649919, 0.0039877924,
0.40318188, 0.06691852, 2.3651633, 0.004729222,
5.354298, 0.10766831, 3.0944388, 0.0031601565,
0.90129143, 0.20641404, 2.6169968, 0.0040632794,
0.42842066, 0.19828638, 2.7105954, 0.0038546452,
0.32904014, 0.14232212, 2.7597191, 0.0037521839,
4.01177, 0.23696098, 2.598552, 0.004106618,
3.8563905, 0.11449485, 3.1520233, 0.0030739538,
5.303109, 0.044166293, 2.7016566, 0.0038737915,
2.890503, 0.119251974, 2.7120442, 0.0038515565,
2.4916945, 0.18364032, 2.3927865, 0.0046475655,
5.681941, 0.16737796, 2.9832644, 0.0033384417,
5.5430927, 0.17130843, 3.1282809, 0.003109015,
1.2906426, 0.12768784, 2.3949523, 0.0046412623,
0.6910808, 0.12659745, 2.6812112, 0.003918185,
0.22494863, 0.11066458, 3.428311, 0.002709949,
0.22359921, 0.17055462, 2.6463861, 0.0039957804,
3.8397574, 0.18452413, 2.4224768, 0.0045623863,
4.906777, 0.18717796, 2.7809978, 0.0037092022,
6.1663527, 0.17050102, 2.976951, 0.0033490679,
1.0047033, 0.18216455, 2.614903, 0.0040681604,
4.8844805, 0.17411299, 2.7575672, 0.003756577,
4.6122255, 0.1208874, 2.265895, 0.005043382,
2.677278, 0.044019293, 2.663823, 0.003956612,
5.1447177, 0.23999321, 2.7783313, 0.0037145428,
5.598436, 0.30566734, 2.6722474, 0.003937916,
0.57535464, 0.16605805, 3.4178538, 0.0027223954,
4.93673, 0.13067949, 2.6697786, 0.0039433795,
5.3383894, 0.20752752, 2.6185827, 0.004059588,
3.0825422, 0.19154921, 2.4441388, 0.0045018676,
0.07917415, 0.20008741, 2.2957954, 0.004945175,
0.3540316, 0.20728537, 2.8555477, 0.0035648996,
3.3608603, 0.21861655, 2.7655146, 0.0037403952,
3.0275257, 0.08180029, 2.4319239, 0.004535827,
0.58663857, 0.23654062, 2.3617284, 0.004739544,
3.7620895, 0.19347356, 2.6531672, 0.0039804713,
1.1234072, 0.20967133, 3.1148787, 0.003129102,
3.662222, 0.09170145, 3.4801207, 0.002649659,
1.169868, 0.16422242, 2.7675638, 0.003736242,
1.9310242, 0.1827667, 2.5525682, 0.004218086,
3.8969285, 0.16458906, 3.1510737, 0.003075343,
2.6177962, 0.10678813, 2.5895236, 0.0041281134,
4.5718946, 0.10381967, 3.1864088, 0.0030243304,
2.3114152, 0.14116979, 2.7539275, 0.0037640266,
0.4847507, 0.08965608, 3.1590185, 0.0030637493,
2.4388688, 0.1524545, 3.0643854, 0.0032067592,
2.9374366, 0.13898855, 3.052329, 0.0032257775,
5.404985, 0.25457227, 2.6707046, 0.0039413287,
2.2345407, 0.1858524, 2.6886482, 0.0039019387,
4.229226, 0.1958324, 2.6653397, 0.0039532348,
5.5093265, 0.16824843, 3.0891473, 0.0031682795,};


class Planet {
  float ma  ;
  float e  ;
  float a   ;
  float n  ;
  String name;
  color col;
  int size;
  Planet( String nameI, float maI, float eI, float aI, float nI, color colI, int sizeI) {
    name = nameI;
    ma = maI; 
    e = eI; 
    a = aI; 
    n = nI;
    col = colI;
    size = sizeI;
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
  Sun() {
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
  Orbit(   float maI, float eI, float aI, float nI ) {
    ma = maI; 
    e = eI; 
    a = aI; 
    n = nI;
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

    float[] sunCoordinates = sun.drawSunOnDayNumber(dayNumber);

    //xv -= sunCoordinates[0];
    //yv -= sunCoordinates[1];

    //fill(255, 0, 0);
    //ellipse( width/2 + sunCoordinates[0]*250, height/2 + sunCoordinates[1]*100, 10, 10 );

    if ( a > .5)
      fill(0, 255, 0);
    else
      fill(0, 0, 255);

    ellipse( width/2 + xv*solarSystemX, height/2 + yv*solarSystemY, 3, 3 );
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

  //Pallas
  //String lines[] = loadStrings("http://asterank.com/api/asterank?query={\"e\":{\"$lt\":0.22263338430942921},\"e\":{\"$gt\":0.22263338430942920}}&limit=1");

  //
  if ( loadingByArray == 0 ) {
    String lines[] = loadStrings("http://asterank.com/api/asterank?query={\"a\":{\"$gt\":0.2},\"a\":{\"$lt\":7.0}}&limit="+str(numberOfAsteroids));

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

      float ma =  extractedValue("\"ma\"")/180.0*PI;
      float e =  extractedValue("\"e\"") ;
      float a =  extractedValue("\"a\"") ;
      float n =  extractedValue("\"n\"")/180.0*PI ;

      println ( ma + " " +e+ " " +a+ " " +n   );

      Orbits.add ( new Orbit ( ma, e, a, n ) );

      myCharNum++;//skip an }

      // for ( int i = 0; i < 100 ; i++)
      //   calculateCoordinates(i, ma, e, a, n );
    }
  }

  if ( loadingByArray == 1 ) {

    for ( int i = 0; i < orbitelementsArray.length/4 - 1 ; i++) {
      float ma = orbitelementsArray[i*4+0];
      float e =  orbitelementsArray[i*4+1];
      float a =  orbitelementsArray[i*4+2];
      float n =  orbitelementsArray[i*4+3];
      println ( ma + " " +e+ " " +a+ " " +n   );
      Orbits.add ( new Orbit ( ma, e, a, n ) );
    }


  }

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

  float e = float(eStr);
  return ( e);
}

void draw() {
  background(0);

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
  // println( dayNumber );
}

void mousePressed() {

  solarSystemX = (width/2 - mouseX);
  solarSystemY = (height/2 - mouseY);
}

