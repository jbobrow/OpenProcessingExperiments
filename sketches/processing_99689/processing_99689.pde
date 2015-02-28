

String[] Voyager1;
String current_time_string;
String epoch_0_string;
String epoch_1_string;
String dist_0_v1_string;
String dist_1_v1_string;
String dist_0_v1s_string;
String dist_1_v1s_string;

String current_time_list_string;
String epoch_0_list_string;
String epoch_1_list_string;
String dist_0_v1_list_string;
String dist_1_v1_list_string;
String dist_0_v1s_list_string;
String dist_1_v1s_list_string;

double dist_0_v1_double;
double dist_1_v1_double;
double dist_0_v1s_double;
double dist_1_v1s_double;

int current_time;
int current_time_old;
int epoch_0;
int epoch_1;

String dist_0_v1_array;
String dist_0_v1s_array;

float step1_e;
float step2_e;

float ellips;

double step4_v1;
double step4_v1s;
double step5_v1;
double step5_v1s;

double current_dist_km_v1;
double current_dist_km_v1s;
int current_dist_km_sun;

float step4_sun;
float step5_sun;

float sun_pwm;
float earth_pwm;
float E_S_pwm;

float A_angle_color;
float B_angle_color;
float C_angle_color;

int x = 500;
int y = 500;

//int current_time;

float offset = 0;


//DAYSTUFF
String[] Day;
String current_day_string;
//String current_day_split = "<span class="du">";
String current_day_list;
int current_day;
int current_dayFR;
int day_count;


int v;

//font stuff
//PFont fontA;

/*
//full screen
 boolean sketchFullScreen() {
 return true;
 }
 */


float offset2 = 0;

void setup() {
  //fullscreen
  //size(displayWidth, displayHeight);

  size(500, 500);

  //font setup
  //fontA = loadFont("CourierNew36.vlw");
  //textFont(fontA, 14);

  day_count = 1000;

  v = 1;
}

void draw() {

  // Check to see if there is new data available
  if (day_count == 1000) {
    Day = loadStrings("http://daycalc.appspot.com/01/01/2013");
  }
  if (v == 1) {
    Voyager1 = loadStrings("http://voyager.jpl.nasa.gov/where/index.html");
  }

  // Render everything
  for (int i = 0; i < Voyager1.length; i++) { 

    fill(0);

    if (i == 18) { 
      epoch_0_string = (Voyager1[i]);
      String[] epoch_0_list = splitTokens(epoch_0_string, " ;");
      epoch_0_list_string = (epoch_0_list[3]);
      epoch_0 = int(epoch_0_list[3]);
    }

    if (i == 19) { 
      epoch_1_string = (Voyager1[i]);
      String[] epoch_1_list = splitTokens(epoch_1_string, " ;");
      epoch_1_list_string = (epoch_1_list[3]);
      epoch_1 = int(epoch_1_list[3]);
    }

    if (i == 21) { 
      current_time_string = (Voyager1[i]);
      String[] current_time_list = splitTokens(current_time_string, " ;");
      current_time_list_string = (current_time_list[3]);
      current_time = int(current_time_list[3]);
    }

    if (i == 23) { 
      dist_0_v1_string = (Voyager1[i]);
      String[] dist_0_v1_list = splitTokens(dist_0_v1_string, " ;");
      dist_0_v1_list_string = (dist_0_v1_list[3]);
      dist_0_v1_double = Double.parseDouble(dist_0_v1_list_string);
    }


    if (i == 24) { 
      dist_1_v1_string = (Voyager1[i]);
      String[] dist_1_v1_list = splitTokens(dist_1_v1_string, " ;");
      dist_1_v1_list_string = (dist_1_v1_list[3]);
      dist_1_v1_double = Double.parseDouble(dist_1_v1_list_string);
    }


    if (i == 29) { 
      dist_0_v1s_string = (Voyager1[i]);
      String[] dist_0_v1s_list = splitTokens(dist_0_v1s_string, " ;");
      dist_0_v1s_list_string = (dist_0_v1s_list[3]);
      dist_0_v1s_double = Double.parseDouble(dist_0_v1s_list_string);
    }


    if (i == 30) { 
      dist_1_v1s_string = (Voyager1[i]);
      String[] dist_1_v1s_list = splitTokens(dist_1_v1s_string, " ;");
      dist_1_v1s_list_string = (dist_1_v1s_list[3]);
      dist_1_v1s_double = Double.parseDouble(dist_1_v1s_list_string);
    }


    if (((epoch_1 - epoch_0) != 0) && (current_time != current_time_old))
    {

      // calculates distance from earth in km  //current_dist_km_v1 = ( ( ( current_time - epoch_0 ) / ( epoch_1 - epoch_0 ) ) * ( dist_1_v1 - dist_0_v1 ) ) + dist_0_v1;

      // calculates distance from sun in km  //current_dist_km_v1s = ( ( ( current_time - epoch_0 ) / ( epoch_1 - epoch_0 ) ) * ( dist_1_v1s - dist_0_v1s ) ) + dist_0_v1s;

      step1_e =  (current_time - epoch_0); 
      step2_e = (epoch_1 - epoch_0);
      ellips = (step1_e/step2_e);

      step4_v1 = (dist_1_v1_double - dist_0_v1_double);
      step5_v1 = (ellips * step4_v1);
      current_dist_km_v1 = (step5_v1 + dist_0_v1_double);

      step4_v1s = (dist_1_v1s_double - dist_0_v1s_double);
      step5_v1s = (ellips * step4_v1s);
      current_dist_km_v1s = (step5_v1s + dist_0_v1s_double);

      float yesterday = float(current_dayFR-1);
      float today = float(current_dayFR);
      float tomorrow = float(current_dayFR+1);

      yesterday = map(yesterday, 0, 365, 0, TWO_PI);
      tomorrow = map(tomorrow, 0, 365, 0, TWO_PI);

      int distance_earth_sun_yesterday = int(149600000*(1-.017*.017)/(1+.017*cos((480*yesterday/487))));
      int distance_earth_sun_tomorrow = int(149600000*(1-.017*.017)/(1+.017*cos((480*tomorrow/487))));

      step4_sun = (distance_earth_sun_tomorrow - distance_earth_sun_yesterday);

      step5_sun = (ellips * step4_sun);

      current_dist_km_sun = (int(step5_sun) + distance_earth_sun_yesterday);

      double a = current_dist_km_v1;
      double b = current_dist_km_sun;
      double c = current_dist_km_v1s;

      double A_angle_double;
      float A_angle;
      double B_angle_double;
      float B_angle;
      double C_angle_double;
      float C_angle;

      A_angle_double = (((c*c) + (b*b) - (a*a)) / (2 * b * c)); 

      B_angle_double = (((a*a) - (b*b) + (c*c)) / (2 * a * c));

      C_angle_double = (((a*a) + (b*b) - (c*c)) / (2 * a * b));

      A_angle = (float)A_angle_double;
      A_angle = acos(A_angle);
      A_angle = map(A_angle, 0, HALF_PI, 0, 90);

      //B_angle = (float)B_angle_double;
      //B_angle = acos(B_angle);
      //B_angle = map(B_angle, 0, HALF_PI, 0, 90);

      C_angle = (float)C_angle_double;
      C_angle = acos(C_angle);
      C_angle = map(C_angle, 0, HALF_PI, 0, 90);

      B_angle = (180 - (A_angle + C_angle));

      A_angle_color = map(A_angle, 0, 180, 0, 255);
      B_angle_color = map(B_angle, 0, 180, 0, 255);
      C_angle_color = map(C_angle, 0, 180, 0, 255);

      color inside = color(A_angle_color, B_angle_color, C_angle_color);

      //String current_dist_km_v1_string = (df(a) + " km");

      String current_dist_km_v1_string = (a + " km");

      //String split_thing = current_dist_km_v1_split;

      String A_angle_string = Float.toString(A_angle);
      String B_angle_string = Float.toString(B_angle);
      String C_angle_string = Float.toString(C_angle);

      A_angle_string = (A_angle_string + " deg");
      B_angle_string = (B_angle_string + " deg");
      C_angle_string = (C_angle_string + " deg");

      background(inside);
      fill(255);
      text(A_angle_string, 5, (y-10));
      text(B_angle_string, 175, (y-10));
      text(C_angle_string, 345, (y-10));

      text(current_dist_km_v1_string, 5, (500-30));
      //text(current_dist_km_v1, 10, (500-30));

      //println(current_dist_km_v1);

      //println("current_dist_km_v1=" + current_dist_km_v1 + " current_dist_km_v1s=" + current_dist_km_v1s + " current_dist_km_sun=" + current_dist_km_sun);
      //println(A_angle + " " + B_angle + " " + C_angle);
      //println("  ");

      current_time_old = current_time;
    }
  }

  offset++;
}






