
import processing.pdf.*;

import controlP5.*;

ControlP5 cp5;

PShape epfl_logo;

PImage gui;
PFont font;
PFont fontBold;
PFont fontSmall;

int calepinage_main;
float epaisseur;
float meneau_pass;

float ratio_lock_val;

Facade facade;




public void setup() {
  size(825, 578);
  background(255);

  font = createFont("Helvatika.ttf", 9);
  fontBold = createFont("HelvatikaBold.ttf", 9);
  fontSmall = createFont("Helvatika.ttf", 6);

  epfl_logo = loadShape("epfl_logo.svg");

  gui = loadImage("wand_bgnd_v3.00.png");

  control();
}





public void draw() {
  background(255);
//  line(248, 0, 248, 578);


  facade = new Facade(
  ouvertureSld, 
  traveesSld, 
  etagesSld, 
  rezSld, 
  acroSld, 

  // ELEMENT CONTROLS
  largeurSld, 
  hauteurSld, 
  epaisseur, 
  ratioSld, 
  // there's the "EGALISER" Bang right here but it doesn't need a variable -- it runs its function when hit
  ratioLockTgl, 

  // DRAWING CONTROLS
  draw_structurelTgl, 
  draw_nuanceTgl, 
  draw_elementTgl, 
  calepinage_main, 
  jointLeftTgl, 
  jointRightTgl, 
  jointLeftAltTgl, 
  jointRightAltTgl, 
  jointLeftFlipSwitch, 
  jointRightFlipSwitch, 
  nuanceSld, 
  scale_select
    );


  facade.calc_values();
  facade.calc_epaisseur();

  if (record == true) {
    beginRecord(PDF, "prefa_####.pdf");
  }

  image(gui, 3, 48, 72, 20);

  shape(epfl_logo, 10, 10);

  pushMatrix();
  translate(275, 500);

  facade.draw_wall(nuanceSld);

  popMatrix();


  endRecord();
  record = false;
}

class Facade { 

  float gaucheadd;
  float droiteadd;
  float rezadd;
  float acroadd;

  // FACADE VARS
  float ouverture;
  int travees;
  int etages;
  float rez;
  float acro;

  // ELEMENT CONTROLS
  float largeur;
  float hauteur;
  float largeur_extra; // used for facade angle elements
  float hauteur_extra; // used for facade rez and acroterre elements
  float epaisseur_fn;
  float ratio;
  // there's the "EGALISER" Bang right here but it doesn't need a variable -- it runs its function when hit
  boolean ratioLock;
  float meneau;
  float meneau_master;
  float allege;
  float largeur_window;
  float hauteur_window;
  float surface;
  float poids;

  // Corrected values for angles, rez and acroterre
  float meneau_window_added;
  float allege_window_added;
  float hauteur_window_added;

  // DRAWING CONTROLS
  boolean draw_structurel;
  boolean draw_element;
  boolean draw_nuance;
  int calepinage;
  boolean jointLeft;
  boolean jointRight;
  boolean jointLeftAlt;
  boolean jointRightAlt;
  boolean jointLeftFlip;
  boolean jointRightFlip;

  int nuance;
  float scale;

  float meneau_locked;




  // WALL BUILDER CURSOR VARS
  // Used to locate the panel being drawn in relation
  // to the 4 edges of the facade (rez, acroterre, gouche, droite)
  boolean cursor_on_rez;
  boolean cursor_on_acro;
  boolean cursor_on_gauche;
  boolean cursor_on_droite;

  //------------------------------------------------------------------------------------------
  Facade(

  // FACADE VARS
  float ouverture_t, 
  int travees_t, 
  int etages_t, 
  float rez_t, 
  float acro_t, 

  // ELEMENT CONTROLS
  float largeur_t, 
  float hauteur_t, 
  float epaisseur_t, 
  float ratio_t, 
  // there's the "EGALISER" Bang right here but it doesn't need a variable -- it runs its function when hit
  boolean ratioLock_t, 

  // DRAWING CONTROLS
  boolean draw_structurel_t, 
  boolean draw_nuance_t, 
  boolean draw_element_t, 
  int calepinage_t, 
  boolean jointLeft_t, 
  boolean jointRight_t, 
  boolean jointLeftAlt_t, 
  boolean jointRightAlt_t, 
  boolean jointLeftFlip_t, 
  boolean jointRightFlip_t, 
  int nuance_t, 
  float scale_t) {

    // FACADE VARS
    ouverture = ouverture_t;
    travees = travees_t;
    etages = etages_t;
    rez = rez_t*scale_t;
    acro = acro_t*scale_t;

    // ELEMENT CONTROLS
    largeur = largeur_t*scale_t;
    hauteur = hauteur_t*scale_t;
    epaisseur_fn = (epaisseur_t/100)*scale_t;
    ratio = ratio_t;
    // there's the "EGALISER" Bang right here but it doesn't need a variable -- it runs its function when hit
    ratioLock = ratioLock_t;

    // DRAWING CONTROLS
    draw_structurel = draw_structurel_t;
    draw_nuance = draw_nuance_t;
    draw_element = draw_element_t;
    calepinage = calepinage_t;
    jointLeft = jointLeft_t;
    jointRight = jointRight_t;
    jointLeftAlt = jointLeftAlt_t;
    jointRightAlt = jointRightAlt_t;
    jointLeftFlip = jointLeftFlip_t;
    jointRightFlip = jointRightFlip_t;

    nuance = nuance_t;
    scale = scale_t;
  }








  //-ALGEBRA------------------------------------------------
  //--------------------------------------------------------
  void calc_values() {

    // If ratio lock is OFF, algebra is normal
    if (ratioLock == false) {
      // Calculate surface and weight for wall
      float irationeg = 100-ouverture;
      surface = (largeur/scale * hauteur/scale) * (irationeg/100);
      poids = surface * ((murPorteurNumbox + murParementNumbox)/100) * 2.45;

      // Calculate meneau
      float exp1 = (largeur + hauteur) / 2;
      float exp2 = ((ouverture/100) * largeur * hauteur);
      float exp3 = (largeur * hauteur);
      float expqrt = exp1 * exp1;
      float exp4 = sqrt((expqrt + exp2) - exp3);
      float exp5 = (exp1 - exp4) / 2;
      meneau_master = exp5;

      // Applying factor from ratioSld
      meneau = meneau_master*ratio;
      meneau_pass = meneau;
      // Calculate allege after factored meneau
      exp1 = hauteur / 2;
      exp2 = ((ouverture/100) * largeur * hauteur);
      float exp3a = 4 * meneau;
      float exp3b = 2 * largeur;
      float exp3c = exp3a - exp3b;
      exp4 = exp2 / exp3c;
      exp5 = exp1 + exp4;

      allege = exp5;

      // Defining window size variables
      largeur_window = largeur-(meneau*2);
      hauteur_window = hauteur-(allege*2);
    }


    // If ratio lock is ON, algebra is based on a locked meneau value
    else {
    }
  }




  //-EDGE CHECK---------------------------------------------
  //--------------------------------------------------------
  void check_edges(int x_t, int y_t) {
    // Check if panel being drawn is on edge
    if (x_t == 0) {
      cursor_on_gauche = true;
      gaucheadd = epaisseur;
    } 
    else {
      cursor_on_gauche = false;
      gaucheadd = 0;
    }

    if (y_t == 0) {
      cursor_on_rez = true;
      rezadd = rez;
    } 
    else {
      cursor_on_rez = false;
      rezadd = 0;
    }

    if (x_t == travees-1) {
      cursor_on_droite = true;
      droiteadd = epaisseur;
    } 
    else {
      cursor_on_droite = false;
      droiteadd = 0;
    }

    if (y_t == etages-1) {
      cursor_on_acro = true;
      acroadd = acro;
    } 
    else {
      cursor_on_acro = false;
      acroadd = 0;
    }
  }





  //-DRAW NUANCE BACKGROUND-------------------------------------------
  //--------------------------------------------------------
  void draw_nuance() {
    noStroke();
    fill(0, 0, 0, nuance*2.55);
    rectMode(CORNER);

    rect(0, 0, -(largeur+gaucheadd+droiteadd), hauteur+rezadd+acroadd);
  }






  //-DRAW TRAME-------------------------------------------
  //--------------------------------------------------------
  void draw_trame() {
    stroke(0, 0, 0, 32);
    noFill();

    rectMode(CORNER);

    rect(0-droiteadd, 0, -largeur, hauteur+rezadd+acroadd);
  }



  //-DRAW ELEMENT O-------------------------------------------
  //--------------------------------------------------------
  void draw_element_o() {
    stroke(0);
    noFill();
    rectMode(CORNER);

    rect(0, 0, -(largeur+gaucheadd+droiteadd), hauteur+rezadd+acroadd);
  }



  //-DRAW ELEMENT T-------------------------------------------
  //--------------------------------------------------------
  void draw_element_t() {
    stroke(0);
    noFill();
    // Two vertical, window-centered joints
    line(-largeur/2-droiteadd, 0, -largeur/2-droiteadd, allege+acroadd);
    line(-largeur/2-droiteadd, hauteur-allege+acroadd, -largeur/2-droiteadd, hauteur+acroadd);

    // Two horizontal, allege-high joints
    if (cursor_on_rez == false) {
      line(0, hauteur-allege+acroadd, -meneau-droiteadd, hauteur-allege+acroadd);
      line(-largeur+meneau-droiteadd, hauteur-allege+acroadd, -largeur-gaucheadd-droiteadd, hauteur-allege+acroadd);
    } 
    else {
      line(0, hauteur+rezadd, -meneau-droiteadd, hauteur+rezadd);
      line(-largeur+meneau-droiteadd, hauteur+rezadd, -largeur-gaucheadd-droiteadd, hauteur+rezadd);
    }

    // Finish acroterre and sides

    if (cursor_on_acro == true) {
      line(0, 0, -largeur-droiteadd-gaucheadd, 0);
    } 

    if (cursor_on_gauche == true) {
      line(-largeur-gaucheadd, 0, -largeur-gaucheadd, hauteur+acroadd+rezadd);
    } 
    else if (cursor_on_droite == true) {
      line(0, 0, 0, hauteur+acroadd+rezadd);
    }
  }



  //-DRAW ELEMENT M-A -------------------------------------------
  //--------------------------------------------------------
  void draw_element_ma() {
    stroke(0);
    noFill();

    // Four horizontal, allege-high joints
    if (cursor_on_rez == false) {
      line(0, hauteur-allege+acroadd, -meneau-droiteadd, hauteur-allege+acroadd);
      line(-largeur+meneau-droiteadd, hauteur-allege+acroadd, -largeur-gaucheadd-droiteadd, hauteur-allege+acroadd);
    } 
    else {
      line(0, hauteur+rezadd, -meneau-droiteadd, hauteur+rezadd);
      line(-largeur+meneau-droiteadd, hauteur+rezadd, -largeur-gaucheadd-droiteadd, hauteur+rezadd);
    }

    line(0, allege+acroadd, -meneau-droiteadd, allege+acroadd);
    line(-largeur+meneau-droiteadd, allege+acroadd, -largeur-gaucheadd-droiteadd, allege+acroadd);


    // Two vertical joints (except on cursor_on_droite)
    if (cursor_on_droite == false) {
      if (cursor_on_rez == false) {
        line(0, 0, 0, allege+acroadd);
        line(0, hauteur-allege+acroadd, 0, hauteur+acroadd);
      } 
      else {
        line(0, 0, 0, allege+acroadd);
      }
    }



    // Finish acroterre and sides

    if (cursor_on_acro == true) {
      line(0, 0, -largeur-droiteadd-gaucheadd, 0);
    } 

    if (cursor_on_gauche == true) {
      line(-largeur-gaucheadd, 0, -largeur-gaucheadd, hauteur+acroadd+rezadd);
    } 
    else if (cursor_on_droite == true) {
      line(0, 0, 0, hauteur+acroadd+rezadd);
    }
  }






  //- DRAW CORNER JOINTS -------------------------------------------
  //--------------------------------------------------------
  void draw_corner_joints_L() {
    stroke(0);
    noFill();

    if (cursor_on_gauche == true) {
      if (calepinage == 1) {
        line(-largeur, 0, -largeur, hauteur + rezadd + acroadd);
      } 
      else if (calepinage == 2) {
        if (cursor_on_acro) {
          line(-largeur, 0, -largeur, -allege + hauteur + rezadd + acroadd);
        } 
        else if (cursor_on_rez) {
          line(-largeur, -allege, -largeur, -allege + hauteur + allege + rezadd + acroadd);
        } 
        else {
          line(-largeur, -allege, -largeur, -allege + hauteur + rezadd + acroadd);
        }
      }
      else {
        if (cursor_on_acro == true) {
          line(-largeur, 0, -largeur, allege+acroadd);
        }
        else {
          line(-largeur, -allege, -largeur, allege);
        }
      }
    }
  }

  void draw_corner_joints_R() {
    stroke(0);
    noFill();

    if (cursor_on_droite == true) {
      if (calepinage == 1) {
        line(-epaisseur, 0, -epaisseur, hauteur + rezadd + acroadd);
      }
      else if (calepinage == 2) {
        if (cursor_on_acro) {
          line(-epaisseur, 0, -epaisseur, -allege + hauteur + rezadd + acroadd);
        } 
        else if (cursor_on_rez) {
          line(-epaisseur, -allege, -epaisseur, -allege + hauteur + allege + rezadd + acroadd);
        } 
        else {
          line(-epaisseur, -allege, -epaisseur, -allege + hauteur + rezadd + acroadd);
        }
      }
      else {
        if (cursor_on_acro == true) {
          line(-epaisseur, 0, -epaisseur, allege+acroadd);
        }
        else {
          line(-epaisseur, -allege, -epaisseur, allege);
        }
      }
    }
  }







  //- DRAW WINDOW -------------------------------------------
  //--------------------------------------------------------
  void calc_window() {
    // Move window to the left when on right angle of facade
    if (cursor_on_droite == true) {
      meneau_window_added = meneau + epaisseur;
    } 
    else {
      meneau_window_added = meneau;
    }

    // Move window down when on acroterre
    if (cursor_on_acro == true) {
      allege_window_added = allege + acro;
    } 
    else {
      allege_window_added = allege;
    }

    // Make window taller for rez
    if (cursor_on_rez == true) {
      hauteur_window_added = hauteur_window + allege + rez;
    } 
    else {
      hauteur_window_added = hauteur_window;
    }
  }

  void draw_window() {

    stroke(0);
    fill(255);
    rectMode(CORNER);

    rect(-meneau_window_added, allege_window_added, -largeur_window, hauteur_window_added);
  }










  //- CALCULATE EPAISSEUR ---------------------------------------------
  //-------------------------------------------------------------------
  void calc_epaisseur() {
    if (calepinage < 2) {
      epaisseur = ((murPorteurNumbox/2 + murIsolationNumbox + murParementNumbox)/100)*scale;
    } 
    else {
      epaisseur = meneau;
    }
  }











  //-WALL DRAW----------------------------------------------
  //--------------------------------------------------------
  void draw_wall(int nuance_t) {

    float cursor_x = 0;
    float cursor_y = 0;

    for (int y = 0; y < etages; y+=1) {

      check_edges(0, y);
      cursor_x = 0;
      cursor_y -= hauteur;


      if (cursor_on_rez == true) {
        cursor_y -= rezadd;
      } 
      else if (cursor_on_acro == true) {
        cursor_y -= acroadd;
      }

      for (int x = 0; x < travees; x+=1) {
        check_edges(x, y);

        cursor_x += largeur;

        if (cursor_on_gauche == true) {
          if (calepinage < 2) {
            //            cursor_x += (murPorteurNumbox/2 + murIsolationNumbox + murParementNumbox)/scale;
            cursor_x += epaisseur;
          } 
          else {
            cursor_x += meneau;
          }
        }

        if (cursor_on_droite == true) {
          cursor_x += droiteadd;
        }



        // UPDATING VALUES DISPLAY 
        float longueur_round = (travees*largeur+(epaisseur*2))/scale;
        longueur_round = round(longueur_round*100);
        largeurFacLab.setValue("LONGUEUR : " + longueur_round/100);

        float hauteur_round = (etages*hauteur+acro+rez)/scale;
        hauteur_round = round(hauteur_round*100);
        hauteurFacLab.setValue("HAUTEUR : " + hauteur_round/100);

        float surface_round = surface;
        surface_round = round(surface_round*10);
        surfaceLab.setValue("SURFACE : " + surface_round/10);

        float poids_round = poids;
        poids_round = round(poids_round*10);
        poidsLab.setValue("POIDS : " + poids_round/10);

        float winL_round = (largeur-(meneau*2))/scale;
        winL_round = round(winL_round*100);
        winLLab.setValue("LARGEUR FENETRE : " + winL_round/100);

        float winH_round = (hauteur-(allege*2))/scale;
        winH_round = round(winH_round*100);
        winHLab.setText("HAUTEUR FENETRE : " + winH_round/100);

        float meneau_round = meneau/scale;
        meneau_round = round(meneau_round*100);
        meneauLab.setValue("MENEAU : " + meneau_round/100);

        float allege_round = allege/scale;
        allege_round = round(allege_round*100);
        allegeLab.setValue("ALLEGE : " + allege_round/100);




        // GROUND LINE
        stroke(0);
        noFill();
        line(-15, 0, (epaisseur*2)+(largeur*travees)+15, 0);



        pushMatrix();
        translate(cursor_x, cursor_y);

        // NUANCE BACKGROUND
        if (draw_nuance == true) {
          draw_nuance();
        }


        // TRAME
        if (draw_structurel == true) {
          draw_trame();
        }

        // ELEMENT
        if (draw_element == true) {
          if (calepinage == 1) {
            draw_element_o();
          } 
          else if (calepinage == 2) {
            draw_element_t();
          } 
          else {
            draw_element_ma();
          }
        }

        // CORNER JOINTS
        // Only draw corner joints if calepinage is drawn
        if (draw_element == true) {
          if (jointLeft == true) {
            if (jointLeftAlt == true) {
              if (jointLeftFlip == true) {
                if (y%2 == 0) {
                  draw_corner_joints_L();
                }
              } 
              else {
                if (y%2 != 0) {
                  draw_corner_joints_L();
                }
              }
            }
            else {
              draw_corner_joints_L();
            }
          }
        }

        // Only draw corner joints if calepinage is drawn
        if (draw_element == true) {
          if (jointRight == true) {
            if (jointRightAlt == true) {
              if (jointRightFlip == true) {
                if (y%2 == 0) {
                  draw_corner_joints_R();
                }
              } 
              else {
                if (y%2 != 0) {
                  draw_corner_joints_R();
                }
              }
            }
            else {
              draw_corner_joints_R();
            }
          }
        }



        // WINDOW
        calc_window();

        draw_window();

        popMatrix();
      }
    }

    cursor_y = 0;
  }
}

// FACADE CONTROLS
int ouvertureSld = 50;
int traveesSld = 3;
int etagesSld = 3;
float rezSld = 0;
float acroSld = 0;
Textlabel largeurFacLab;
Textlabel hauteurFacLab;

// ELEMENT CONTROLS
float largeurSld = 6;
float hauteurSld = 2.8;
float murPorteurNumbox = 14;
float murIsolationNumbox = 14;
float murParementNumbox = 7;
float ratioSld = 1;
// there's the "EGALISER" Bang right here but it doesn't need a variable -- it runs its function when hit
boolean ratioLockTgl = false;
Textlabel meneauLab; // Value is set later in the control() function below
Textlabel allegeLab; // Value is set later in the control() function below
Textlabel winLLab; // Value is set later in the control() function below
Textlabel winHLab; // Value is set later in the control() function below
Textlabel surfaceLab; // Value is set later in the control() function below
Textlabel poidsLab; // Value is set later in the control() function below

// DRAWING CONTROLS
boolean draw_structurelTgl = true;
boolean draw_elementTgl = true;
boolean draw_nuanceTgl = true;
RadioButton r;
int calepinage;
RadioButton rr;
boolean jointLeftTgl = false;
boolean jointRightTgl = false;
boolean jointLeftAltTgl = false;
boolean jointRightAltTgl = false;
boolean jointLeftFlipSwitch = false;
boolean jointRightFlipSwitch = false;
int nuanceSld = 10;
float scale_select = 0;

boolean record = false;



void control() {  
  cp5 = new ControlP5(this);

  cp5.setColorForeground(0x66000000);
  cp5.setColorBackground(0x33000000);
  cp5.setColorActive(0xff000000);
  cp5.setColorLabel(0);
  cp5.setColorCaptionLabel(0);






  // FACADE INPUTS ----------------------------------------------------------------------------------
  cp5.addSlider("ouvertureSld", 0, 100).setPosition(10, 106);
  cp5.addSlider("traveesSld", 2, 16).setPosition(10, 122).setNumberOfTickMarks(15).snapToTickMarks(true).showTickMarks(false);
  cp5.addSlider("etagesSld", 2, 20).setPosition(10, 138).setNumberOfTickMarks(19).snapToTickMarks(true).showTickMarks(false);
  cp5.addSlider("rezSld", -2, 3).setPosition(10, 154);
  cp5.addSlider("acroSld", 0, 1).setPosition(10, 170).setNumberOfTickMarks(11).snapToTickMarks(true).showTickMarks(false);
  largeurFacLab = cp5.addTextlabel("largeurFacLab").setText("LONGUEUR : ").setPosition(6, 186).setColorValue(0xff000000);
  hauteurFacLab = cp5.addTextlabel("hauteurFacLab").setText("HAUTEUR : ").setPosition(125, 186).setColorValue(0xff000000);
  // Change caption labels ----------------------------------------------------------------------------------
  cp5.getController("ouvertureSld").setCaptionLabel("ouverture");
  cp5.getController("traveesSld").setCaptionLabel("travees");
  cp5.getController("etagesSld").setCaptionLabel("etages");
  cp5.getController("rezSld").setCaptionLabel("rez+");
  cp5.getController("acroSld").setCaptionLabel("acroterre+");

  // Apply styles  and round values off ----------------------------------------------------------------------------------
  styleSliders("ouvertureSld");
  styleSliders("traveesSld");
  styleSliders("etagesSld");
  styleSliders("rezSld");
  styleSliders("acroSld");






  // ELEMENT INPUTS ----------------------------------------------------------------------------------
  cp5.addSlider("largeurSld", 0, 10).setPosition(10, 250);
  cp5.addSlider("hauteurSld", 2.4, 3.6).setPosition(10, 266).setNumberOfTickMarks(13).snapToTickMarks(true).showTickMarks(false);
  cp5.addNumberbox("murPorteurNumbox").setPosition(10, 282).setMin(14).setMax(25).setMultiplier(-0.1).setDirection(Controller.VERTICAL).setDecimalPrecision(0);
  cp5.addNumberbox("murIsolationNumbox").setPosition(92, 282).setMin(7).setMax(30).setMultiplier(-0.1).setDirection(Controller.VERTICAL).setDecimalPrecision(0);
  cp5.addNumberbox("murParementNumbox").setPosition(173, 282).setMin(6).setMax(15).setMultiplier(-0.1).setDirection(Controller.VERTICAL).setDecimalPrecision(0);
  cp5.addSlider("ratioSld", 0.2, 2.5).setPosition(10, 298).setWidth(228).setHeight(16);
  cp5.addToggle("ratioLockTgl").setPosition(10, 314).setHeight(11).setWidth(113); 
  cp5.addBang("equalizeBang").setPosition(125, 314).setHeight(11).setWidth(113);
  meneauLab = cp5.addTextlabel("meneauLab").setText("MENEAU : ").setPosition(6, 330).setColorValue(0xff000000);
  allegeLab = cp5.addTextlabel("allegeLab").setText("ALLEGE : ").setPosition(125, 330).setColorValue(0xff000000);
  winLLab = cp5.addTextlabel("winLLab").setText("LARGEUR FENETRE : ").setPosition(6, 342).setColorValue(0xff000000);
  winHLab = cp5.addTextlabel("winHLab").setText("HAUTEUR FENETRE : ").setPosition(125, 342).setColorValue(0xff000000);
  surfaceLab = cp5.addTextlabel("surfaceLab").setText("SURFACE : ").setPosition(6, 354).setColorValue(0xff000000);
  poidsLab = cp5.addTextlabel("poidsLab").setText("POIDS : ").setPosition(125, 354).setColorValue(0xff000000);
  // Change caption labels ----------------------------------------------------------------------------------
  cp5.getController("largeurSld").setCaptionLabel("largeur");
  cp5.getController("hauteurSld").setCaptionLabel("hauteur");
  cp5.getController("murPorteurNumbox").setCaptionLabel("porteur");
  cp5.getController("murIsolationNumbox").setCaptionLabel("isolation");
  cp5.getController("murParementNumbox").setCaptionLabel("parement");
  cp5.getController("ratioSld").setCaptionLabel("RATIO MENEAU-ALLEGE");
  cp5.getController("ratioSld").getCaptionLabel().getStyle().setPadding(4, 0, 0, 0);
  cp5.getController("ratioSld").getCaptionLabel().setColor(color(255, 255, 255, 255));
  cp5.getController("ratioSld").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.LEFT_OUTSIDE);
  cp5.getController("ratioLockTgl").setCaptionLabel("meneau lock");
  cp5.getController("ratioLockTgl").setColorCaptionLabel(color(255, 255, 255, 255));
  cp5.getController("ratioLockTgl").getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
  cp5.getController("ratioLockTgl").setColorForeground(color(0, 0, 0, 255));
  cp5.getController("ratioLockTgl").setColorBackground(color(0, 0, 0, 50));
  cp5.getController("ratioLockTgl").setColorActive(color(0, 0, 0, 128));
  cp5.getController("equalizeBang").setCaptionLabel("egaliser");
  cp5.getController("equalizeBang").setColorCaptionLabel(color(255, 255, 255, 255));
  cp5.getController("equalizeBang").setColorForeground(color(0, 0, 0, 50));
  cp5.getController("equalizeBang").getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
  // Apply styles ----------------------------------------------------------------------------------
  styleSliders("largeurSld");
  styleSliders("hauteurSld");
  styleNumboxes("murPorteurNumbox");
  styleNumboxes("murIsolationNumbox");
  styleNumboxes("murParementNumbox");







  // REPRESENTATION INPUTS ----------------------------------------------------------------------------------
  cp5.addToggle("draw_structurelTgl").setPosition(10, 410).setLabel("trame structurelle");  
  cp5.addToggle("draw_nuanceTgl").setPosition(10, 426).setLabel("nuance gris");  
  cp5.addToggle("draw_elementTgl").setPosition(10, 442).setLabel("calepinage");  

  r = cp5.addRadioButton("calepinageRadio")
    .setPosition(127, 410)
      .setSize(11, 11)
        .setColorForeground(color(0, 0, 0, 255))
          .setColorBackground(color(0, 0, 0, 50))
            .setColorActive(color(0, 0, 0, 128))
              .setItemsPerRow(1)
                .setSpacingRow(5)
                  .setNoneSelectedAllowed(false)
                    .addItem("\"O\"", 1)
                      .addItem("\"T\"", 2)
                        .addItem("meneau-allege", 3)
                          .activate("\"O\"")
                            ;

  cp5.addToggle("jointLeftTgl").setPosition(10, 458).setLabel("joints angle gauche");  
  cp5.addToggle("jointRightTgl").setPosition(127, 458).setLabel("joints angle droit");  
  cp5.addToggle("jointLeftAltTgl").setPosition(10, 474).setLabel("alternance");  
  cp5.addToggle("jointRightAltTgl").setPosition(127, 474).setLabel("alternance");  
  cp5.addToggle("jointLeftFlipSwitch").setPosition(10, 490).setLabel("pair/impair").setMode(ControlP5.SWITCH);  
  cp5.addToggle("jointRightFlipSwitch").setPosition(127, 490).setLabel("pair/impair").setMode(ControlP5.SWITCH);  

  rr = cp5.addRadioButton("scaleRadio")
    .setPosition(10, 522)
      .setSize(11, 11)
        .setColorForeground(color(0, 0, 0, 255))
          .setColorBackground(color(0, 0, 0, 50))
            .setColorActive(color(0, 0, 0, 128))
              .setItemsPerRow(4)
                .setSpacingColumn(28)
                  .setNoneSelectedAllowed(false)
                    .addItem("1000", 1000.000)
                      .addItem("500", 500.000)
                        .addItem("200", 200.000)
                          .addItem("100", 100.000)
                            .activate("200")
                              ;

  cp5.getController("200").setValue(200);
  cp5.getController("\"O\"").setValue(1);

  cp5.addSlider("nuanceSld", 0, 25).setPosition(10, 506).setNumberOfTickMarks(26).snapToTickMarks(true).showTickMarks(false);
  // Change caption labels ----------------------------------------------------------------------------------
  cp5.getController("nuanceSld").setCaptionLabel("nuance");
  // Apply styles ----------------------------------------------------------------------------------
  styleToggles("draw_structurelTgl");
  styleToggles("draw_nuanceTgl");
  styleToggles("draw_elementTgl");
  styleToggles("jointLeftTgl");
  styleToggles("jointRightTgl");
  styleToggles("jointLeftAltTgl");
  styleToggles("jointRightAltTgl");
  styleToggles("jointLeftFlipSwitch");
  styleToggles("jointRightFlipSwitch");
  styleSliders("nuanceSld");








  // PDF banger
  cp5.addBang("pdfBang")
    .setPosition(10, 550)
      .setSize(21, 24)
        .setLabel(" PDF")
          .setColorLabel(0xffffffff)
            .setColorForeground(0x6f000000)
              .setColorBackground(0x11000000)
                .setColorActive(0xff000000)
                  .setTriggerEvent(Bang.RELEASE)
                    ;
}







// Styling functions ----------------------------------------------------------------------------------
void styleSliders(String theControllerName) {
  Controller c = cp5.getController(theControllerName);
  c.setHeight(11);
  c.setWidth(228);
  c.getCaptionLabel().getStyle().setPadding(1, 0, 0, 0);
  c.getCaptionLabel().getStyle().setMargin(0, 0, 0, 0);
  c.getCaptionLabel().setColorBackground(color(255, 255, 255, 0));
  c.getCaptionLabel().setColor(color(255, 255, 255, 255));
  c.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.LEFT_OUTSIDE);
}


void styleNumboxes(String theControllerName) {
  Controller c = cp5.getController(theControllerName);
  c.setHeight(11);
  c.setWidth(65);
  c.getCaptionLabel().getStyle().setMarginLeft(-3);
  c.getCaptionLabel().getStyle().setMarginTop(1);
  c.getCaptionLabel().setColor(color(255, 255, 255, 255));
  c.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.LEFT_OUTSIDE);
}

void styleToggles(String theControllerName) {
  Controller c = cp5.getController(theControllerName);
  c.getCaptionLabel().getStyle().setMarginTop(1);
  c.setSize(11, 11);
  c.setColorForeground(0xff000000);
  c.setColorBackground(0x33000000);
  c.setColorActive(0x88000000);
  c.getCaptionLabel().align(ControlP5.LEFT, ControlP5.RIGHT_OUTSIDE).setPadding(15, 0);
}


void scaleRadio(int s) {
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
}

void calepinageRadio(int w) {
  calepinage_main = w;
}

void equalizeBang() {
  cp5.getController("ratioSld").setValue(1);
}

void pdfBang() {
  record = true;
}

void ratioLockTgl() {
  ratio_lock_val = facade.meneau;
}



