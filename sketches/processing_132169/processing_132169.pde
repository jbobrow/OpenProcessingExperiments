
import processing.pdf.*;

import controlP5.*;

ControlP5 cp5;
PImage gui;
PFont font;
PFont fontBold;
PFont fontSmall;

PShape epfl_logo;

int scaleSlider = 10;
int traveesSlider = 3;
int etagesSlider = 3;
float largeurSlider = 8.0;
float hauteurSlider = 2.8;
int greySlider = 0;
int opaciteSlider = 50;
float maSlider = 1;
boolean jointsToggle = true;
boolean cadreToggle = false;

int dim;

float poids;
float surface;

boolean cadre;
boolean record;

int calepinage;
float scale_select;

public Textlabel txtClaim;
Textlabel txtSchool;
Textlabel txtVersion;
Textlabel txtDim;

Textlabel txtObs;
Textlabel txtMeno;
Textlabel txtAleg;

Textlabel txtMat;
Textlabel txtSurf;
Textlabel txtPoid;
Textlabel txtExp;

Textlabel txtErr;






public void setup() {

  font = createFont("Helvatika.ttf", 10);
  fontBold = createFont("HelvatikaBold.ttf", 10);
  fontSmall = createFont("Helvatika.ttf", 6);

  epfl_logo = loadShape("epfl_logo.svg");

  gui = loadImage("wand_bgnd_v3.00.png");

  size(606, 606);
  background(255);

  cadre = false;
  record = false;
  calepinage = 0;
  dim = 0;

  control();
}








public void draw() {

  background(255);
  image(gui, 0, 0);
  stroke(0);
  line(10, 30, 596, 30);

  Window window = new Window(maSlider, opaciteSlider, largeurSlider, hauteurSlider, traveesSlider, etagesSlider, scale_select, greySlider, jointsToggle, cadreToggle);

  // Begin PDF record
  if (record == true) {
    beginRecord(PDF, "prefa_####.pdf");
  }

  pushMatrix();
  translate(10, 130);
  window.calc_values();
  
  // If recording PDF, move to the right and down about 4.5mm
  // to keep good margin on the left or top when printing centered on A4
  if (record == true) {
  translate(13,20);
  }
  
  window.display_wall_sides_left();
  window.display_wall();
  popMatrix();

  // End PDF record + stamp data
  if (record == true) {
  translate(13,13);
    fill(0, 0, 0, 255);

    float poids_out = window.poids * 100;
    poids_out = round(poids_out);
    poids_out /= 100;
    float meneau_out = window.meneau * 100;
    meneau_out = round(meneau_out/scaleSlider);
    meneau_out /= 100;
    float allege_out = window.allege * 100;
    allege_out = round(allege_out/scaleSlider);
    allege_out /= 100;

    image(gui, 3, 48, 72, 20);

    shape(epfl_logo, 10,10);
    
    textFont(fontSmall);
    text("Output : Wand V1.16, on " + year() + "-" + month() + "-" + day() + " @ " + hour() + ":" + minute() + ":" + second(), 90, 56);
    text("EPFL/ENAC/IA - Laboratoire d'architecture urbaine et réflexion énergétique", 90, 66);
    textFont(font);
    text("Ouverture " + opaciteSlider + "%", 90, 88);
    text("Element " + str(hauteurSlider) + "x" + str(largeurSlider) + "m, poids " + str(poids_out) + "t, ", 90, 104);
    text("Meneau " + meneau_out + "m, allege " + allege_out + "m", 90, 120);
    


    endRecord();
    record = false;
  }

  txtClaim.draw(this);
  txtSchool.draw(this);
  txtVersion.draw(this);

  rectMode(CORNER);
  fill(0);
  rect(10, 36, 128, 12);
  rectMode(CENTER); 
  txtDim.draw(this);

  rectMode(CORNER);
  fill(0);
  rect(170, 36, 128, 12);
  rectMode(CENTER); 
  txtObs.draw(this);

  float meno_r = round(((window.meneau/window.scale))*100);
  if (window.error == false) {
    txtMeno.setValue("" + meno_r/100);
    txtMeno.draw(this);
  } 
  else {
    txtMeno.setColor(color(255, 0, 0));
    txtMeno.setValue("ERR.");
    txtMeno.draw(this);
    txtMeno.setColor(0);
  }

  float aleg_r = round(((window.allege/window.scale))*100);
  if (window.error == false) {
    txtAleg.setValue("" + aleg_r/100);
    txtAleg.draw(this);
  } 
  else {
    txtAleg.setColor(color(255, 0, 0));
    txtAleg.setValue("ERR.");
    txtAleg.draw(this);
    txtAleg.setColor(0);
  }

  rectMode(CORNER);
  fill(0);
  rect(330, 36, 96, 12);
  rectMode(CENTER); 
  txtMat.draw(this);
  float surface_r = round(window.surface*100);
  txtSurf.setValue("SURFACE (M2) : " + surface_r/100);
  txtSurf.draw(this);
  float poids_r = round(window.poids*100);
  txtPoid.setValue("POIDS (T) : " + poids_r/100);
  txtPoid.draw(this);

  rectMode(CORNER);
  fill(0);
  rect(458, 36, 138, 12);
  rectMode(CENTER); 
  txtExp.draw(this);

  if (window.error == true) {
    txtErr.draw(this);
  }
}
class Window { 
  float ratio;
  float largeur;
  float hauteur;
  float allege;
  float meneau_master;
  float meneau;
  int travees;
  int etages;
  float maslider;
  float surface;
  float poids;

  boolean error;

  float scale;
  int grey;
  boolean joints;

  // The Constructor is defined with arguments.
  Window(float t_maslider, float t_ratio, float t_largeur, float t_hauteur, int t_travees, int t_etages, float t_scale, int t_grey, boolean t_joints, boolean t_cadre) { 
    ratio = t_ratio;
    scale = t_scale;
    largeur = t_largeur*scale;
    hauteur = t_hauteur*scale;
    travees = t_travees;
    etages = t_etages;
    grey = t_grey;
    joints = t_joints;
    cadre = t_cadre;
    maslider = t_maslider;
  }

  public void calc_values() {
    // Calculate surface and weight for 14+14+7 wall
    float irationeg = 100-ratio;
    surface = (largeur/scale) * (hauteur/scale) * (irationeg/100);
    poids = surface * 0.21 * 2.4;

    // Calculate meneau
    float exp1 = (largeur + hauteur) / 2;
    float exp2 = ((ratio/100) * largeur * hauteur);
    float exp3 = (largeur * hauteur);
    float expqrt = exp1 * exp1;
    float exp4 = sqrt((expqrt + exp2) - exp3);
    float exp5 = (exp1 - exp4) / 2;
    meneau_master = exp5;

    // Applying factor from maSlider
    meneau = meneau_master*maslider;

    // Calculate allege after factored meneau
    exp1 = hauteur / 2;
    exp2 = ((ratio/100) * largeur * hauteur);
    float exp3a = 4 * meneau;
    float exp3b = 2 * largeur;
    float exp3c = exp3a - exp3b;
    exp4 = exp2 / exp3c;
    exp5 = exp1 + exp4;

    allege = exp5;
  }

  public void display() {

    if (meneau > 0 && allege > 0) {

      error = false;

      stroke(0);
      rectMode(CENTER);

      fill(0, 0, 0, grey);
      if (joints==true) {
        stroke(0, 0, 0, 15);
      } 
      else {
        stroke(0, 0, 0, 0);
      }

      rect(largeur/2, hauteur/2, largeur, hauteur);
      fill(255, 255, 255, 255);
      stroke(0, 0, 0, 255);
      rect(largeur/2, hauteur/2, largeur-(meneau*2), hauteur-(allege*2));

      if (calepinage == 1) {
        fill(255, 255, 255, 0);
        rect(largeur/2, hauteur/2, largeur, hauteur);
      }
      else if (calepinage == 2) {
        line(0, hauteur-allege, meneau, hauteur-allege);
        line(largeur-meneau, hauteur-allege, largeur, hauteur-allege);
        line(largeur/2, 0, largeur/2, allege);
        line(largeur/2, hauteur-allege, largeur/2, hauteur);
      }
      else if (calepinage == 3) {
        // Horizontal joints
        line(0, allege, meneau, allege);
        line(largeur-meneau, allege, largeur, allege);
        line(0, hauteur-allege, meneau, hauteur-allege);
        line(largeur-meneau, hauteur-allege, largeur, hauteur-allege);

        // Vertical joints
        // +0.0001 compensates for small discrepancy between "cadre" and these vertical lines
        //        line(0, 0, 0, allege);
        line(largeur+0.0001, 0, largeur+0.0001, allege);
        //        line(0, hauteur-allege, 0, hauteur);
        line(largeur+0.0001, hauteur-allege, largeur+0.0001, hauteur);
      }
    } 
    else {
      error = true;
    }
  }

  public void display_frame() {
    rectMode(CORNER);
    stroke(0);
    fill(255, 255, 255, 0);
    rect(0, 0, travees*largeur, etages*hauteur);
    rectMode(CENTER);
  }

  public void display_wall() {

    for (float y = 0; y < (etages*hauteur)-1; y = y+hauteur) {
      for (float x = 0; x < (travees*largeur)-1; x = x+largeur) {

        pushMatrix();
        translate(x+meneau, y);
        display();
        popMatrix();
      }
    }
    if (error == false) {
      if (cadre) {
        display_frame();
      }
    }
  }

  public void display_wall_sides_left() {

    for (float y = 0; y < (etages*hauteur)-1; y = y+hauteur) {

      rectMode(CENTER);

      stroke(0, 0, 0, 0);


      pushMatrix();
      translate(0, y);
      fill(0, 0, 0, grey);
      rect(meneau/2, hauteur/2, meneau, hauteur);

      // Draw structural pattern -- or not
      if (joints==true) {
        stroke(0, 0, 0, 15);
      } 
      else {
        stroke(0, 0, 0, 0);
      }
      
      rect(meneau/2, hauteur/2, meneau, hauteur);

      if (calepinage > 0) {
        stroke(0, 0, 0, 255);
      }










      if (calepinage == 1) {
        fill(255, 255, 255, 0);
        rect(meneau/2, hauteur/2, meneau, hauteur);
      }
      else if (calepinage == 2) {
        line(0, hauteur-allege, meneau, hauteur-allege);
      } 
      else if (calepinage == 3) {
        line(0, hauteur-allege, meneau, hauteur-allege);
        line(0, allege, meneau, allege);
      }

      popMatrix();
    }
  }

  //  public void display_wall_sides_right() {
  //
  //    for (float y = 0; y < (etages*hauteur)-1; y = y+hauteur) {
  //
  //      rectMode(CENTER);
  //
  //      fill(0, 0, 0, grey);
  //
  //      if (joints==true) {
  //        stroke(0, 0, 0, 15);
  //      } 
  //      else {
  //        stroke(0, 0, 0, 0);
  //      }
  //      pushMatrix();
  //      translate(0, y);
  //      rect(meneau/2, hauteur/2, meneau, hauteur);
  //      popMatrix();
  //    }
  //  }
}

public void control() {  
  cp5 = new ControlP5(this);

  cp5.setColorForeground(0x66000000);
  cp5.setColorBackground(0x11000000);
  cp5.setColorActive(0xff000000);
  cp5.setColorLabel(0);
  cp5.setColorCaptionLabel(0);

  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'scaleSlider' 
  cp5.addSlider("traveesSlider")
    .setPosition(10, 53)
      .setSize(64, 9)
        .setRange(1, 36)
          .setLabel("travees")
            .setNumberOfTickMarks(36)
              .showTickMarks(false);

  cp5.addSlider("etagesSlider")
    .setPosition(10, 68)
      .setSize(64, 9)
        .setRange(1, 36)
          .setLabel("etages")
            .setNumberOfTickMarks(36)
              .showTickMarks(false);

  cp5.addSlider("largeurSlider")
    .setPosition(10, 83)
      .setSize(64, 9)
        .setRange(3, 8)
          .setLabel("largeur")
            .setNumberOfTickMarks(51)
              .showTickMarks(false);

  cp5.addSlider("hauteurSlider")
    .setPosition(10, 98)
      .setSize(64, 9)
        .setRange(2.4, 3.6)
          .setLabel("hauteur")
            .setNumberOfTickMarks(13)
              .showTickMarks(false);

  cp5.addSlider("opaciteSlider")
    .setPosition(170, 53)
      .setSize(71, 9)
        .setRange(30, 65)
          .setLabel("ouverture %")
            .setNumberOfTickMarks(36)
              .showTickMarks(false);

  cp5.addSlider("maSlider")
    .setPosition(170, 83)
      .setSize(128, 9)
        .setRange(0.2, 2.5)
          .setLabel("");

  cp5.addBang("middleBang")
    .setPosition(209, 92)
      .setSize(52, 15)
        .setLabel("<egaliser>")
          .setColorLabel(0xffffffff)
            .setColorForeground(0x6f000000)
              .setColorBackground(0x11000000)
                .setColorActive(0xff000000)
                  ;

  // These two sliders only used to get "meneau" and "allege" captions in the right typeface...
  cp5.addSlider("ghost1Slider")
    .setPosition(170, 91)
      .setSize(0, 0)
        .setRange(0, 0)
          .setLabel("meneau");

  cp5.addSlider("ghost2Slider")
    .setPosition(271, 91)
      .setSize(0, 0)
        .setRange(0, 0)
          .setLabel("allege");

  cp5.addSlider("ghost3Slider")
    .setPosition(458, 49)
      .setSize(0, 0)
        .setRange(0, 0)
          .setLabel("1 :");

  cp5.addRadioButton("scaleRadio")
    .setPosition(469, 53)
      .setSize(9, 9)
        .setColorBackground(0x11000000)
          .setColorForeground(0xff000000)
            .setColorActive(0x66000000)
              .setColorLabel(0xff000000)
                .setItemsPerRow(4)
                  .setSpacingColumn(22)
                    .addItem("1000", 1000)
                    .addItem("500", 500)
                      .addItem("200", 200)
                        .addItem("100", 100)
                          ;

  cp5.addSlider("greySlider")
    .setPosition(458, 68)
      .setSize(65, 9)
        .setRange(0, 64)
          .setLabel("nuance")
            .showTickMarks(false);

  cp5.addToggle("jointsToggle")
    .setPosition(458, 83)
      .setSize(9, 9)
        .setLabel("structure")
          .setColorForeground(0xff000000)
            .setColorBackground(0x11000000)
              .setColorActive(0x66000000)
                ;

  cp5.addToggle("cadreToggle")
    .setPosition(514, 83)
      .setSize(9, 9)
        .setLabel("cadre")
          .setColorForeground(0xff000000)
            .setColorBackground(0x11000000)
              .setColorActive(0x66000000)
                ;

  cp5.addRadioButton("calepRadio")
    .setPosition(458, 98)
      .setSize(9, 9)
        .setColorBackground(0x11000000)
          .setColorForeground(0xff000000)
            .setColorActive(0x66000000)
              .setColorLabel(0xff000000)
                .setItemsPerRow(4)
                  .setSpacingColumn(19)
                    .addItem("O", 1)
                      .addItem("T", 2)
                        .addItem("M-A", 3)
                          ;

  cp5.addBang("pdfBang")
    .setPosition(575, 83)
      .setSize(21, 24)
        .setLabel(" PDF")
          .setColorLabel(0xffffffff)
            .setColorForeground(0x6f000000)
              .setColorBackground(0x11000000)
                .setColorActive(0xff000000)
                  .setTriggerEvent(Bang.RELEASE)
                    ;


  cp5.getController("jointsToggle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPaddingX(12);
  cp5.getController("cadreToggle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPaddingX(12);
  cp5.getController("middleBang").getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
  cp5.getController("pdfBang").getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
  cp5.getController("maSlider").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);

  cp5.getController("1000").getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPaddingX(11);

  // Clearing value label on the meneau-allege slider
  cp5.getController("maSlider").getValueLabel().setVisible(false);

  // Removing value label on these as they are only used for their caption
  cp5.getController("ghost1Slider").getValueLabel().setVisible(false);
  cp5.getController("ghost2Slider").getValueLabel().setVisible(false);
  cp5.getController("ghost3Slider").getValueLabel().setVisible(false);

  txtSchool = new Textlabel(cp5, "EPFL/ENAC/IA/LAURE", 133, 7, 0, 0);
  txtSchool.setColor(0);

  txtClaim = new Textlabel(cp5, "OUTIL DE COMPOSITION POUR LA FACADE EN BETON PREFABRIQUE", 133, 17, 0, 0);
  txtClaim.setColor(0);

  txtVersion = new Textlabel(cp5, "V1.16 | 2014-02-02", 515, 7, 0, 0);
  txtVersion.setColor(220);

  txtDim = new Textlabel(cp5, "DIMENSIONS", 10, 38, 0, 0);
  txtDim.setColor(255);

  txtObs = new Textlabel(cp5, "OUVERTURE/OPACITE", 170, 38, 0, 0);
  txtObs.setColor(255);

  txtMeno = new Textlabel(cp5, "0", 166, 83, 0, 0);
  txtMeno.setColor(0);
  txtMeno.getValueLabel().align(ControlP5.RIGHT, ControlP5.LEFT_OUTSIDE).setPaddingX(0);
  txtAleg = new Textlabel(cp5, "0", 299, 83, 0, 0);
  txtAleg.setColor(0);

  txtMat = new Textlabel(cp5, "MATIERE", 330, 38, 0, 0);
  txtMat.setColor(255);

  txtSurf = new Textlabel(cp5, "SURFACE (M2) : ", 428, 53, 0, 0);
  txtSurf.setColor(0);
  txtSurf.getValueLabel().align(ControlP5.RIGHT, ControlP5.LEFT_OUTSIDE).setPaddingX(0);

  txtPoid = new Textlabel(cp5, "POIDS (T) : " + poids, 428, 68, 0, 0);
  txtPoid.setColor(0);
  txtPoid.getValueLabel().align(ControlP5.RIGHT, ControlP5.LEFT_OUTSIDE).setPaddingX(0);

  txtExp = new Textlabel(cp5, "DESSIN", 458, 38, 0, 0);
  txtExp.setColor(255);

  txtErr = new Textlabel(cp5, "HOUSTON, WE HAVE AN ERROR - PLEASE LOOK UP YOUR DATA", 6, 130, 0, 0);
  txtErr.setColor(color(255, 0, 0));

  cp5.getTooltip().setDelay(500);
  cp5.getTooltip().setColorBackground(0xff666666);
  cp5.getTooltip().setColorLabel(0xffffffff);
  cp5.getTooltip().register("traveesSlider", "Nombre de travees");
  cp5.getTooltip().register("etagesSlider", "Nombre d'etages");
  cp5.getTooltip().register("largeurSlider", "Largeur de l'element (m)");
  cp5.getTooltip().register("hauteurSlider", "Hauteur de l'element (m)");
  cp5.getTooltip().register("opaciteSlider", "Ouverture de la facade");
  cp5.getTooltip().register("maSlider", "Proportion meneau-allege (m)");
  cp5.getTooltip().register("middleBang", "Egaliser meneau et allege");
  cp5.getTooltip().register("scaleSlider", "Echelle de representation");
  cp5.getTooltip().register("greySlider", "Densite de gris");
  cp5.getTooltip().register("jointsToggle", "Trame structurelle");
  cp5.getTooltip().register("O", "Calepinage \"O\" standard");
  cp5.getTooltip().register("T", "Calepinage \"T\" standard");
  cp5.getTooltip().register("M-A", "Calepinage \"meneau-allege\" standard");
}

public void middleBang() {
  cp5.getController("maSlider").setValue(1);
}

public void pdfBang() {
  record = true;
}

public void calepRadio(int r) {
  calepinage = r;
}

public void scaleRadio(int s) {
  if (s == 1000) {
    scale_select = 2.83466798951173;
  } 
  else if (s == 500) {
    scale_select = 5.66933597902346;
  } 
  else if (s == 200) {
    scale_select = 14.17333994755864;
  } 
  else {
    scale_select = 28.34667989511728;
  }
  println(s);
}



