
// ObliX Tweak on v0.2 by Daniel Wibbing, 14th of December 2014

// Tweaks:
// 1. Use more precise pressure formula: p(h) = p_0 *  [1 - (L*alitude)/T_gnd_c]^[(g*M_air)/(R*L)]
// 2. Use pressure formula p_t only dependent on temperature in case of rigid hull ("fix vs. volume" deactivated).
// 3. Change all units to SI standard [m, kg, Pa, K, s, mol, l, J]
// 4. Make atomspheric pressure adjustable

// Usage:
// LIFT fix vs. volume:
//   If "LIFT fix vs. volume" active == Lifting gas may expand freely, e.g. by use of a ballonet.
//   Else if "LIFT fix vs. volume" not active == Volume of lifting gas is fix, i.e. lifting gas not able to expand, 
//     e.g. because of rigid hull without ballonet.
//   Thus SUPERHEAT does not affect LIFT if "LIFT fix vs. volume" not active. 
//    This is because, if the lifting gas in not able to expand, then superheating the lifting gas does not
//    change its density and consequently does also not change the LIFT.
//
//    Before "fix vs. volume" is activated, ALTITUDE has to be 0 m and VOLUME has to be adjusted to the volume of
//    lifting gas that is filled into the hull. Next, ALTITUDE and the other parameters can be adjusted as desired.
//    If ALTITUDE is not 0 m when activating "fix vs. volume" then VOLUME increases immediately because the adjusted
//    volume is always considered to be the one on the ground at 0 m.
//    /!\ Changing VOLUME after having changed ALTITUDE does not allow adjusting a precise value any more. This might be a bug!
//    When "fix vs. volume" is deactivated, VOLUME jumps back to the original volume before activating "fix vs. volume"
//    and LIFT decreases accordingly.


HScrollbar hs1, hs2, hs3, hs4, hs5;  // The scrollbars
HSButton B1, B2, B3, B4, B5;    // The buttons
PFont f;
PFont f_bold;

byte background_col = 2;

//global variables

// Window size
int window_width = 500;
int window_height = 700;

// Volume range
int v_max_small = 2; // Maximum adjustable gas volume for small ship [m^3]
int v_max_big = 20; // Maximum adjustable gas volume for big ship [m^3]
float v_scale_small = window_width / (v_max_small * 100); // 100 is used to generate two decimal places
float v_scale_big = window_width / (v_max_big * 100.0); // 100 is used to generate two decimal places

// Altitude range
// Formulars are valid only for max. altitude of 11 km (Troposphere).
float h_max_small = 1000; // Maximum adjustable altitude for small ship [m]
float h_max_big = 10000; // Maximum adjustable altitude for big ship [m]
float h_scale_small = window_width / h_max_small / 1.0;
float h_scale_big = window_width / h_max_big / 1.0;

// Pressure range
int p_gnd_max = 105000; // Max. atmospheric pressure [Pa]
int p_gnd_min = 95000; // Min. atmospheric pressure [Pa]
//float p_gnd_scale = window_width / p_gnd_max / 1.0;



float V_lift_gnd = 0.000; // [m3]
float V_lift_h = 0; // [m3]
float h = 0.123; //h over the sea [m]
float T_gnd_c = 25; //outside T_gnd_c [°C]
float T_h_c = 0;
float T_h_k = 0;
float T_lift_c = 0;
float T_lift_k = 0;
float dT_super_c = 0; //difference of lifting gas to outside temperatuer [°C]
float V_lift_mol_h = 0;
float V_lift_mol_gnd = 0; // molar volume of helium on the ground
float n_lift = 0; // mole of V_lift_gnd
float M_air = 0.028949; //average molar mass of air [kg/mol]
float M_lift = 0.004; //molar mass for helium [kg/mol]
float R = 8.3144621; //ideal gas constant [J/(mol * K)]
float L = 0.0065; // T_gnd_c lapse rate [K/m]
int p_gnd = 101325; // sea level standard atmospheric p_h [Pa]
float g = 9.80665; // earth-surface gravitational acceleration [m/s^2]
byte lifting_gas = 0; //0=He 1=Ballonium 2=H2 3=Air  [kg]


float lift = 1; //resulting lift in [kg]

boolean update_flag = true;

boolean clicked = false;


void setup () {
  size(window_width, window_height); //   size(400, 600);
  background(background_col);
  hs1 = new HScrollbar(0, 200, width, 32, 10);
  hs2 = new HScrollbar(0, 300, width, 32, 0);
  hs3 = new HScrollbar(0, 400, width, 32, width/14*9-13);
  hs4 = new HScrollbar(0, 500, width, 32, width/21-1);
  hs5 = new HScrollbar(0, 600, width, 32, round(map(101325, p_gnd_min, p_gnd_max, 0, window_width))-21);
  //hs5 = new HScrollbar(0, 600, width, 32, 379);
  B1 = new HSButton(25, 660, 100, 40, "He", true);
  B2 = new HSButton((window_width/2)-50, 660, 100, 40, "H2", false);
  B4 = new HSButton(window_width - 125, 660, 100, 40, "Air", false);
  B3 = new HSButton(0, 100, width/2-2, 40, "volume expandable", false);
  B5 = new HSButton(width/2+2, 100, width/2-2, 40, "big ship", false);

  f = createFont("Arial", 20);
//  float fsize = 20.0;
//  boolean fsmooth = false;
  f_bold = createFont("Arial Bold", 24);
  textFont(f);
  
}


void draw () {

  background(background_col);
  hs1.update();
  hs2.update();
  hs3.update();
  hs4.update();
  hs5.update();
  hs1.display();
  hs2.display();
  hs3.display();
  hs4.display();
  hs5.display();

  B1.update();
  B1.display();
  B2.update();
  B2.display();
  B3.update();
  B3.display();
  B4.update();
  B4.display();
  B5.update();
  B5.display();

  //Texts
  textAlign(CENTER);
  textFont(f_bold);
  text("Windreiter Lift Calc - ObliX tweak", window_width/2, 32);
  textFont(f);
  textAlign(LEFT);
  text("LIFT [kg]", 4, 70);
  text("VOLUME [m3]", 4, 170);
  text("ALTITUDE [m]", 4, 270);
  text("TEMPERATURE [°C]", 4, 370);
  text("SUPERHEAT [°C]", 4, 470);
  text("ATMOSPHERIC PRESSURE [Pa]", 4, 570);

  textAlign(RIGHT);
  text(lift, width-4, 70);
  text(V_lift_h, width-4, 170);
  text(h, width-4, 270);
  text(round(T_gnd_c), width-4, 370);
  text(round(dT_super_c), width-4, 470);
  text(p_gnd, width-4, 570);


  check_lifting_gas();


  //retrieve the new parameters:    
  T_gnd_c = round(map(hs3.getPos(), 0, width-1, -20, 50));
  dT_super_c = round(map(hs4.getPos(), 0, width-1, -10, 200));
  p_gnd = round(map(hs5.getPos(), 0, width-1, p_gnd_min , p_gnd_max)/25)*25; // Number format: XXXXX +/- 25 => round(value)
  if (B5.Bchecked() == true) {
    V_lift_gnd = round(hs1.getPos()/v_scale_big/10) / 10.0; // Number format: X.X00 => round(value/10) / 10
    h = round(hs2.getPos()/h_scale_big/50)*50; // Number format: X.000 +/- 50.0 => round(value)
  }
  else {
    V_lift_gnd = round(hs1.getPos()/v_scale_small) / 100.0; // Number format: X.XX0 => round(value) / 100
    h = round(hs2.getPos()/h_scale_small/5)*5; // Number format: X.000 +/- 5.0 => round(value)
  }

  //check the lifting gas:

  switch(lifting_gas) {
  case 0:
    M_lift = 0.0041; //molar mass Ballonium [kg/mol]
    break;

  case 1:
    M_lift = 0.002; //molar mass H2 [kg/mol]
    break;

  case 2:
    M_lift = 0.028949; //molar mass Air [kg/mol]
    break;
  }

  // Calculate variables
  // TO DO: Variables are still a little chaotic in position and point of definition. Clean it up!
  float T_gnd_k = T_gnd_c + 273.15; // convert ground temperature from °C to K
  float p_h = p_gnd * pow( (1 - ((L * h)/T_gnd_k)), ((g * M_air)/(R * L)) ); // calculate pressure as function of altitude h and ground temperature T_gnd_c as found on http://en.wikipedia.org/wiki/Atmospheric_pressure

  T_h_c = (-L * h) + T_gnd_c;
  T_h_k = T_h_c + 273.15;
  T_lift_c = T_h_c + dT_super_c;
  T_lift_k = T_lift_c + 273.15;
  V_lift_mol_h = (1 * R * T_lift_k) / p_h;
  V_lift_mol_gnd = (R * T_gnd_k) / p_gnd; // molar volume of helium on the ground
  n_lift = V_lift_gnd / V_lift_mol_gnd; // mole of V_lift_gnd

  float roh_lift = M_lift / V_lift_mol_h;
  float V_air_mol = (1 * R * T_h_k) / p_h; //universal gas formula: http://de.wikipedia.org/wiki/Ideales_Gas 
  float roh_air = M_air / V_air_mol; // air density in altitude h
  
  //calculating lift or V_lift_h 
  if (B3.Bchecked()) { //"fix vs. volume"
    // Lifting gas volume can freely expand and is thus dependend on altitude.
    // Density of lifting gas changes in the same way as density of surrounding air. Thus lift remains constant.
    V_lift_h = V_lift_mol_h * n_lift; // volume of lifting gas in altitude h
    lift = (roh_air - roh_lift) * V_lift_h;
  }
  else {
    // Lifting gas volume can not expand and is thus not dependedn on altitude.
    // Density of lifting gas decreases with increasing temperature and thus decreases lift.
    float p_t = (n_lift * R * T_lift_k) / V_lift_gnd;
    float V_lift_mol_t = (1 * R * T_lift_k) / p_t;
    float roh_lift_t = M_lift / V_lift_mol_t;
    V_lift_h = V_lift_gnd; // V_lift_h is the output value which equals the input value in this case.
    lift = (roh_air - roh_lift_t) * V_lift_gnd;
  }
}


void check_lifting_gas() {

  if ((B1.Bchecked())&&((lifting_gas==1)||(lifting_gas ==2))) {
    lifting_gas = 0;
    B2.Bcheck(false);
    B4.Bcheck(false);
  }
  if ((B2.Bchecked())&&((lifting_gas==0)||(lifting_gas ==2))) {
    lifting_gas = 1;
    B1.Bcheck(false);
    B4.Bcheck(false);
  }

  if ((B4.Bchecked())&&((lifting_gas==0)||(lifting_gas ==1))) {
    lifting_gas = 2;
    B1.Bcheck(false);
    B2.Bcheck(false);
  }

  if (lifting_gas == 0) B1.Bcheck(true);
  if (lifting_gas == 1) B2.Bcheck(true);
  if (lifting_gas == 2) B4.Bcheck(true);
}



class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;


  HScrollbar (float xp, float yp, int sw, int sh, int startV) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = startV;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = 2;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } 
    else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed || !over) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } 
    else {
      return false;
    }
  }

  void display() {
    noStroke();

    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } 
    else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }

  void setPos(int newPos) {
    spos = newPos / ratio;
  }
}



class HSButton {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  String BText;

  HSButton (float xp, float yp, int sw, int sh, String ButtonText, boolean lo) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    BText = ButtonText;
    locked = lo;
  }



  void update() {
    if (overEvent()) {
      over = true;
    } 
    else {
      over = false;
    }
    if (clicked && over) {
      locked = !locked;
      clicked = false;
    }
  }


  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } 
    else {
      return false;
    }
  }

  void display() {
    noStroke();



    if (locked) {
      fill(200, 200, 200);
    }
    else {
      fill(50, 50, 50);
    }
    rect(xpos, ypos, swidth, sheight);


    fill(255);
    textAlign(CENTER);
    text(BText, xpos+swidth/2, ypos+sheight/2+4);
  }

  boolean Bchecked() {
    return locked;
  }

  void Bcheck(boolean lock) {
    locked = lock;
  }
}


void mouseClicked() {
  clicked = true;
}

