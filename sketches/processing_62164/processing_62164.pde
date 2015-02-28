
PImage p;
float zoom = 1.0;
PFont font;

//Buildings
Building RKC;
Building Blum;
Building Film;
Building Levy;
Building Museum;
Building FSA; //Fisher studio arts
Building FA; //Fisher Annex
Building Albee;
Building Hegeman;
Building Olin;
Building OlinL;
Building FisherC; //Fisher Center
Building bANDg; //Buildings and Grounds
Building CC; //Campus Center
Building Kline;
Building Manor;
Building Library;
Building SG; // Stevenson Gymnasium
Building LFSC; //Lorenzo Fararri Soccer Complex
Building Ludlow;
Building DTR;
Building CV; //Cruger Village
Building SO; //Security Office
Building Village;
Building SR; //Stone Row
Building Aspinwall;
Building cANDh; //Catskill and Hudson
Building OldRobbins;
Building NewRobbins;
Building Tewksbury;
Building HH; //Honey House
Building NT;//new toasters
Building OT; //Old Toasters
Building OH; //Old Henderson
Building NH; //New Henderson lab
Building Chapel;
Building WardGate;

//Bus stops
Bus Robbins;
Bus WardgateS;
Bus KlineS;
Bus Blithewood;


class Building {
  String name;
  int x1, y1, x2, y2;
  color textColor;
  int align;
  int opened;
  int closed;

  Building(String buildingName, int top_bound, int bottom_bound, int left_bound, int right_bound, color txtColor, int alignment, int opens, int closes)
  {
    name = buildingName;
    x1 = left_bound;
    y1 = top_bound;
    x2 = right_bound;
    y2 = bottom_bound;
    textColor = txtColor;
    align = alignment;
    opened = opens;
    closed = closes;
  }
  
    void activate () {
      if ((mouseX > x1 && mouseX < x2) && (mouseY > y2 && mouseY < y1))
      {
        //println (name);
        fill (textColor);
        textAlign (align);
        text (name, mouseX*3, mouseY*3);

        //println(hour());
        if (hour() > opened && hour() < closed)
        {
          stroke(0, 255, 0);
        }
        else
        {
          stroke (255, 0, 0);
        }

        noFill();
        if (align == LEFT)
        {
          ellipse(mouseX*3 + (name.length()  + 30), mouseY*3 - 30, 10, 10);
        }
        else if (align == RIGHT)
        {
          ellipse(mouseX*3 - (name.length() + 60), mouseY*3 - 30, 10, 10);
        }
        else
        {
          ellipse(mouseX*3, mouseY*3 - 30, + 10, 10);
        }
        stroke(0);
      }
    }
  }

class Bus {
  String busstop;
  int x1, y1, x2, y2;
  color textColor;
  int align;
  int opened;
  int closed;

  Bus(String BusstopName, int top_bound, int bottom_bound, int left_bound, int right_bound, color txtColor, int alignment)
  {
    busstop = BusstopName;
    x1 = left_bound;
    y1 = top_bound;
    x2 = right_bound;
    y2 = bottom_bound;
    textColor = txtColor;
    align = alignment;
  }
  
  void busActivate() {
    if ((mouseX > x1 && mouseX < x2) && (mouseY > y2 && mouseY < y1))
      {
        //println (name);
        fill (textColor);
        textAlign (align);
        text (busstop, mouseX*3 -30, mouseY*3 +50);
        ellipse (mouseX*3 - 30, mouseY*3 + 20, + 20, 20);
      }
  }
}


  void setup() 
  {
    size(700, 430);
    p = loadImage("bard_map.png");
    //println(p);
    frameRate(50);

    RKC = new Building ("RKC", 275, 246, 110, 171, color(255, 250, 205), CENTER, 8, 24);
    Blum = new Building ("Blum", 100, 91, 36, 60, color(255, 250, 205), LEFT, 7, 23);
    Film = new Building ("Film Building", 121, 101, 38, 79, color(255, 250, 205), LEFT, 7, 23);
    Levy = new Building ("Levy Economics", 64, 41, 139, 183, color(255), LEFT, 8, 21);
    Museum = new Building ("Museum of Arts", 109, 82, 96, 165, color(255), LEFT, 8, 21);
    FSA = new Building ("Fisher Studio Arts", 179, 157, 186, 228, color(255, 250, 205), CENTER, 8, 21);
    FA = new Building ("Fisher Annex", 153, 148, 187, 214, color(255, 250, 205), CENTER, 8, 21);
    Albee = new Building ("Albee", 322, 278, 249, 259, color(255, 250, 205), CENTER, 8, 21);
    Hegeman = new Building ("Hegeman", 298, 271, 259, 284, color(255, 250, 205), CENTER, 8, 24);
    Olin = new Building ("Olin(Main)", 335, 303, 303, 359, color(255, 250, 205), CENTER, 8, 23);
    OlinL = new Building ("Olin Language Center", 343, 321, 361, 386, color(255, 250, 205), CENTER, 8, 23);
    FisherC = new Building ("Fisher Center", 333, 293, 643, 699, color(255), RIGHT, 8, 24);
    bANDg = new Building ("Buildings and Grounds", 293, 276, 92, 124, color(255), LEFT, 9, 16);
    CC = new Building ("Campus Center", 210, 161, 142, 187, color(255), CENTER, 9, 24);
    Kline = new Building ("Kline Commons", 271, 244, 265, 303, color(255, 165, 0), CENTER, 8, 19);
    Manor = new Building ("Manor", 232, 216, 630, 664, color(255, 165, 0), RIGHT, 8, 19);
    Library = new Building ("Library", 283, 250, 337, 372, color(255), CENTER, 8, 24);
    SG = new Building ("Stevenson Gymnasium", 193, 164, 309, 349, color(255), CENTER, 7, 22);
    LFSC = new Building ("Lorenzo Fararri Soccer Complex", 161, 130, 303, 378, color(255), CENTER, 1, 24);
    Ludlow =  new Building ("Ludlow", 273, 249, 176, 186, color(255), CENTER, 9, 17);
    DTR = new Building ("                                                             Down the Road Cafe", 180, 165, 158, 168, color(255, 165, 0), CENTER, 7, 24);
    CV =  new Building ("Cruger Village", 171, 150, 463, 506, color (175, 238, 238), RIGHT, 0, 24);
    SO =  new Building ("Security Office", 359, 324, 271, 302, color (255), CENTER, 0, 24);
    Village = new Building ("The Village", 213, 181, 374, 463, color (175, 238, 238), CENTER, 0, 24);
    SR = new Building ("Stone Row", 286, 260, 208, 238, color (175, 238, 238), CENTER, 0, 24);
    Aspinwall = new Building ("Aspinwall", 281, 263, 187, 207, color (255, 250, 205), CENTER, 9, 17);
    cANDh = new Building ("Catskill and Hudson", 200, 150, 560, 630, color (175, 238, 238), RIGHT, 0, 24);
    OldRobbins = new Building ("Old Robbins", 237, 213, 530, 555, color (175, 238, 238), RIGHT, 0, 24);
    NewRobbins = new Building ("New Robbins", 253, 224, 556, 594, color (175, 238, 238), RIGHT, 0, 24);
    Tewksbury = new Building ("Tewksbury", 235, 203, 74, 117, color (175, 238, 238), LEFT, 0, 24);
    HH = new Building ("Honey House", 158, 147, 95, 107, color (175, 238, 238), LEFT, 0, 24);
    NT = new Building ("New Toaster", 154, 138, 108, 154, color (175, 238, 238), LEFT, 0, 24);
    OT = new Building ("Old Toaster", 200, 159, 66, 99, color (175, 238, 238), LEFT, 0, 24);
    OH = new Building ("Old Henderson", 296, 281, 193, 216, color (255, 250, 205), CENTER, 9, 24);
    NH = new Building ("New Henderson", 334, 318, 213, 246, color (255, 250, 205), CENTER, 0, 24);
    Chapel = new Building ("Chapel of the Holy Innocents", 227, 194, 221, 245, color (255), CENTER, 9, 24);
    WardGate = new Building ("Ward Gate", 230, 205, 479, 502, color (255, 250, 205), CENTER, 9, 22);
    
    //Bus stops
    Robbins = new Bus ("Robbins Bus Stop", 263, 245, 554,582, color (255,255,0), CENTER);
    WardgateS = new Bus ("Ward Gate Bus Stop", 230,213,463,486, color (255, 255, 0), CENTER);
    KlineS = new Bus ("Kline Bus Stop", 230, 215, 277, 303, color (255,255,0), CENTER);
    Blithewood = new Bus ("Blithewood Bus Stop", 257, 240, 60, 77, color (255,255,0), LEFT);
  }

  void draw() 
  {
    //zoom in and out effect by pressing the mouse
    if (mousePressed) {
      zoom +=0.005;
    }
    else {
      zoom -=0.01;
    }
    zoom = constrain (zoom, 1.0, 3.0);
    scale (zoom);

    //call the image and translate the image
    println (mouseX +"  "+mouseY);
    font = loadFont ("Arial-Black-48.vlw");
    textFont (font);
    background(255);
    float tx = -mouseX*2; 
    float ty = -mouseY*2;
    translate(tx, ty);
    imageMode (CENTER);
    image(p, 900, 500);

    // Size of the text of the label
    stroke (0);
    strokeWeight (5);
    textSize (30);

//activate
    RKC.activate();
    Blum.activate();
    Film.activate();
    Levy.activate();
    Museum.activate();
    FSA.activate();
    FA.activate();
    Albee.activate();
    Hegeman.activate();
    Olin.activate();
    OlinL.activate();
    FisherC.activate();
    bANDg.activate();
    CC.activate();
    Kline.activate();
    Manor.activate();
    Library.activate();
    SG. activate();
    LFSC.activate();
    Ludlow.activate();
    DTR.activate();
    CV.activate();
    SO.activate();
    Village.activate();
    SR.activate();
    Aspinwall.activate();
    cANDh.activate();
    OldRobbins.activate();
    NewRobbins.activate();
    Tewksbury.activate();
    HH.activate();
    NT.activate();
    OT.activate();
    OH.activate();
    NH.activate();
    Chapel.activate();
    WardGate.activate();
    
    Robbins.busActivate();
    WardgateS.busActivate();
    KlineS.busActivate();
    Blithewood.busActivate();
  }


