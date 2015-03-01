
HScrollbar hs1, hs2, hs3, hs4;  // The scrollbars
HSButton B1, B2, B3, B4, B5;    // The buttons
PFont f;

byte background_col = 2;

//global variables
float volume = 100; //volume in l
float altitude = 0; //altitude over the sea [m]
float temperature = 25; //outside temperature [°C]
float superheat = 0; //difference of lifting gas to outside temperatuer [°C]
byte lifting_gas = 0; //0=He 1=Ballonium 2=H2 3=Air 

float lift = 102; //resulting lift in [g]

boolean update_flag = true;

boolean clicked = false;


void setup () {
  size(400, 600);
  background(background_col);
  hs1 = new HScrollbar(0, 200, width, 32, width/20);
  hs2 = new HScrollbar(0, 300, width, 32, 0);
  hs3 = new HScrollbar(0, 400, width, 32, width/14*9-13);
  hs4 = new HScrollbar(0, 500, width, 32, width/21-1);
  B1 = new HSButton(25, 560, 100, 40, "He", true);
  B2 = new HSButton(150, 560, 100, 40, "H2", false);
  B4 = new HSButton(275, 560, 100, 40, "Air", false);
  B3 = new HSButton(0, 100, width/2-2, 40, "fix vs. volume", false);
  B5 = new HSButton(width/2+2, 100, width/2-2, 40, "big ship", false);

  f = createFont("Arial", 20);
  textFont(f);
}


void draw () {

  background(background_col);
  hs1.update();
  hs2.update();
  hs3.update();
  hs4.update();
  hs1.display();
  hs2.display();
  hs3.display();
  hs4.display();

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
  text("Windreiter Lift Calc 0.2", 200, 32);
  textAlign(LEFT);
  text("LIFT [g]", 4, 70);
  text("VOLUME [l]", 4, 170);
  text("ALTITUDE [m]", 4, 270);
  text("TEMPERATURE [°C]", 4, 370);
  text("SUPERHEAT [°C]", 4, 470);

  textAlign(RIGHT);
  text(floor(lift), width-4, 70);
  text(floor(volume), width-4, 170);
  text(floor(altitude), width-4, 270);
  text(floor(temperature), width-4, 370);
  text(floor(superheat), width-4, 470);


  check_lifting_gas();


  //retrieve the new parameters:    
  volume = floor(map(hs1.getPos(), 0, width-1, 0, 2000));
  altitude = floor(map(hs2.getPos(), 0, width-1, 0, 2000));
  temperature = floor(map(hs3.getPos(), 0, width-1, -20, 50));
  superheat = floor(map(hs4.getPos(), 0, width-1, -10, 200));
  if (B5.Bchecked() == true) {
    volume = volume * 20;
    altitude = altitude * 10;
  }

  //check the lifting gas:
  float lift_gas_molar_mass = 0.004; //molar mass for helium [kg/mol]

  switch(lifting_gas) {
  case 0:
    lift_gas_molar_mass = 0.0041; //molar mass Ballonium [kg/mol]
    break;

  case 1:
    lift_gas_molar_mass = 0.002; //molar mass H2 [kg/mol]
    break;

  case 2:
    lift_gas_molar_mass = 0.028949; //molar mass Air [kg/mol]
    break;
  }

  //calculate the new lift:
  //calculating air density
  float air_molar_mass = 0.028949; //average molar mass of air 
  float gas_constant = 8.314; //ideal gas constant

  float pressure = 101.35 * exp(-altitude/7990); //calculating air pressure in kPa for height, estimation only http://de.wikipedia.org/wiki/Luftdruck#Abnahme_mit_der_H.C3.B6he
  float air_mol_volume = (1 * gas_constant * (temperature+273.15)) / pressure; //universal gas formula: http://de.wikipedia.org/wiki/Ideales_Gas 

  float air_density = air_molar_mass / (air_mol_volume*0.001);

  //calculating lift gas density
  float lift_gas_temperature = temperature + superheat;
  float lift_gas_mol_volume = (1 * gas_constant * (lift_gas_temperature+273.15)) / pressure;

  float lift_gas_density = lift_gas_molar_mass / (lift_gas_mol_volume * 0.001);

  //calculating lift or volume 
  if (B3.Bchecked()) { //either update Lift or Volume
    volume = lift / (air_density - lift_gas_density);
  }
  else {
    lift = (air_density - lift_gas_density) * volume;
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

