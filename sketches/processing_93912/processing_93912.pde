
//Font deklarieren
PFont font;

//Button erzeugen
Button b1 = new Button(760, 24, 42, 42, "FB1", #64F7E5);
Button b2 = new Button(809, 24, 42, 42, "FB2", #E80505);
Button b3 = new Button(858, 24, 42, 42, "FB3", #052CE8);
Button b4 = new Button(907, 24, 42, 42, "FB4", #FFE603);
Button b5 = new Button(956, 24, 42, 42, "FB5", #2DD33E);
Button b6 = new Button(1005, 24, 42, 42, "FB6", #882DD3);
Button b7 = new Button(1053, 24, 42, 42, "FB7", #F05000);
Button bBB = new Button(500, 24, 250, 54, "Fachbereiche", #B3CBB3);
Button bKosten = new Button(494, 654, 170, 32, "Kosten", #B3CBB3);
Button bHelp = new Button (1340, 654, 33, 33, "?", #B3CBB3);

/*_________________________________________________________________________________________________
 *Boxen erzeugen
 __________________________________________________________________________________________________*/

//FachbereichBox(x,y,w,h,"BoxName",BoxFarbe);
FachbereichBox fb1 = new FachbereichBox(524, 124, 360, 182, "Architektur", #64F7E5);
FachbereichBox fb2 = new FachbereichBox(902, 124, 178, 356, "Design", #E80505);
FachbereichBox fb3= new FachbereichBox(1094, 124, 254, 150, "Elektrotechnik", #052CE8);
FachbereichBox fb4= new FachbereichBox(1094, 288, 256, 189, "Maschinenbau", #FFE603);
FachbereichBox fb5= new FachbereichBox(902, 492, 448, 130, "Medien", #2DD33E);
FachbereichBox fb6= new FachbereichBox(704, 328, 180, 298, "Sozial & Kulturwissenschaften", #882DD3);
FachbereichBox fb7 = new FachbereichBox(524, 328, 158, 298, "Wirtschaft", #F05000);

//Kostenträger Boxen erzeugen_______________________________________________________________________________(Für Joni)<<<<<<<<<<<--------------
//FachbereichBox(x,y,w,h,BoxFarbe,"BoxName",FachbereichNr);
//Kostenträger aus dem Fachbereich Architektur
Box fb1_box1 = new Box(537, 124, 370, 125, #64F7E5, "Holzwerkstatt", 1);
Box fb1_box2 = new Box(537, 254, 103, 371, #64F7E5, "Laserdrucker", 1);
Box fb1_box3 = new Box(646, 254, 260, 187, #64F7E5, "Konferenztechn", 1);
Box fb1_box4 = new Box(771, 449, 135, 176, #64F7E5, "Expeditionen", 1);
Box fb1_box5 = new Box(646, 449, 118, 86, #64F7E5, "Gehälter", 1);
Box fb1_box6 = new Box(646, 542, 118, 84, #64F7E5, "Ausstellungen", 1);
Box fb1_box7 = new Box(914, 124, 178, 247, #64F7E5, "Lehrmaterial", 1);
Box fb1_box8 = new Box(1099, 124, 135, 156, #64F7E5, "Architektur", 1);
Box fb1_box9 = new Box(1241, 124, 118, 84, #64F7E5, "Architektur", 1);
Box fb1_box10 = new Box(1241, 215, 118, 64, #64F7E5, "Architektur", 1);
Box fb1_box11 = new Box(1099, 287, 260, 84, #64F7E5, "Architektur", 1);
Box fb1_box12 = new Box(914, 378, 89, 247, #64F7E5, "Architektur", 1);
Box fb1_box13 = new Box(1010, 378, 349, 247, #64F7E5, "Architektur", 1);
//Kostenträger aus dem Fachbereich Design
Box fb2_box1 = new Box(537, 124, 370, 125, #E80505, "Holzwerkstatt", 2);
Box fb2_box2 = new Box(537, 254, 103, 371, #E80505, "Laserdrucker", 2);
Box fb2_box3 = new Box(646, 254, 260, 187, #E80505, "Konferentechn", 2);
Box fb2_box4 = new Box(771, 449, 135, 176, #E80505, "Expeditionen", 2);
Box fb2_box5 = new Box(646, 449, 118, 86, #E80505, "Gehälter", 2);
Box fb2_box6 = new Box(646, 542, 118, 84, #E80505, "Ausstellungen", 2);
Box fb2_box7 = new Box(914, 124, 178, 247, #E80505, "Lehrmaterial", 2);
Box fb2_box8 = new Box(1099, 124, 135, 156, #E80505, "Design", 2);
Box fb2_box9 = new Box(1241, 124, 118, 84, #E80505, "Design", 2);
Box fb2_box10 = new Box(1241, 215, 118, 64, #E80505, "Design", 2);
Box fb2_box11 = new Box(1099, 287, 260, 84, #E80505, "Design", 2);
Box fb2_box12 = new Box(914, 378, 89, 247, #E80505, "Design", 2);
Box fb2_box13 = new Box(1010, 378, 349, 247, #E80505, "Design", 2);
//Kostenträger aus dem Fachbereich Elektrotechnik
Box fb3_box1 = new Box(537, 124, 370, 123, #052CE8, "Elektrotechnik", 3);
Box fb3_box2 = new Box(536, 254, 227, 187, #052CE8, "Reinraum", 3);
Box fb3_box3 = new Box(771, 254, 135, 371, #052CE8, "Gehälter", 3);
Box fb3_box4 = new Box(536, 449, 102, 176, #052CE8, "techn. Ausstattung", 3);
Box fb3_box5 = new Box(646, 542, 118, 84, #052CE8, "Labore", 3);
Box fb3_box6 = new Box(646, 449, 118, 85, #052CE8, "Forschung", 3);
Box fb3_box7 = new Box(914, 124, 178, 247, #052CE8, "Entwicklung", 3);
Box fb3_box8 = new Box(1099, 124, 135, 156, #052CE8, "Computertechnik", 3);
Box fb3_box9 = new Box(1241, 124, 118, 156, #052CE8, "Elektrotechnik", 3);
Box fb3_box10 = new Box(1099, 287, 260, 84, #052CE8, "Elektrotechnik", 3);
Box fb3_box11 = new Box(914, 378, 445, 247, #052CE8, "Elektrotechnik", 3);
//Kostenträger aus dem Fachbereich Maschinenbau
Box fb4_box1 = new Box(537, 124, 370, 125, #FFE603, "Gehälter", 4);
Box fb4_box2 = new Box(537, 254, 103, 371, #FFE603, "Forschung", 4);
Box fb4_box3 = new Box(646, 254, 260, 187, #FFE603, "Werkshalle", 4);
Box fb4_box4 = new Box(771, 449, 135, 176, #FFE603, "Maschinenbau", 4);
Box fb4_box5 = new Box(646, 449, 118, 86, #FFE603, "Einkauf", 4);
Box fb4_box6 = new Box(646, 542, 118, 84, #FFE603, "Material", 4);
Box fb4_box7 = new Box(914, 124, 178, 247, #FFE603, "Expeditionen", 4);
Box fb4_box8 = new Box(1099, 124, 135, 156, #FFE603, "Fertigungsstraße", 4);
Box fb4_box9 = new Box(1241, 124, 118, 84, #FFE603, "Metallwekstatt", 4);
Box fb4_box10 = new Box(1241, 215, 118, 64, #FFE603, "Maschinenbau", 4);
Box fb4_box11 = new Box(1099, 287, 260, 84, #FFE603, "Maschinenbau", 4);
Box fb4_box12 = new Box(914, 378, 89, 247, #FFE603, "Maschinenbau", 4);
Box fb4_box13 = new Box(1010, 378, 349, 247, #FFE603, "Maschinenbau", 4);
//Kostenträger aus dem Fachbereich Medien
Box fb5_box1 = new Box(537, 124, 370, 123, #2DD33E, "Gehälter", 5);
Box fb5_box2 = new Box(536, 254, 227, 187, #2DD33E, "VS/VR", 5);
Box fb5_box3 = new Box(771, 254, 135, 371, #2DD33E, "Tonlabor", 5);
Box fb5_box4 = new Box(536, 449, 102, 176, #2DD33E, "PC-Pools", 5);
Box fb5_box5 = new Box(646, 542, 118, 84, #2DD33E, "Expeditionen", 5);
Box fb5_box6 = new Box(646, 449, 118, 85, #2DD33E, "Lehre", 5);
Box fb5_box7 = new Box(914, 124, 178, 247, #2DD33E, "Medien", 5 );
Box fb5_box8 = new Box(1099, 124, 135, 156, #2DD33E, "Medien", 5 );
Box fb5_box9 = new Box(1241, 124, 118, 156, #2DD33E, "Medien", 5 );
Box fb5_box10 = new Box(1099, 287, 260, 84, #2DD33E, "Medien", 5 );
Box fb5_box11 = new Box(914, 378, 445, 247, #2DD33E, "Medien", 5 );
//Kostenträger aus dem Fachbereich Sozial
Box fb6_box1 = new Box(537, 124, 370, 125, #882DD3, "Gehälter", 6);
Box fb6_box2 = new Box(537, 254, 103, 371, #882DD3, "Lehre", 6);
Box fb6_box3 = new Box(646, 254, 260, 187, #882DD3, "Forschung", 6);
Box fb6_box4 = new Box(771, 449, 135, 176, #882DD3, "Gastvorträge", 6);
Box fb6_box5 = new Box(646, 449, 118, 86, #882DD3, "Tagungen", 6);
Box fb6_box6 = new Box(646, 542, 118, 84, #882DD3, "Kulturveranst", 6);
Box fb6_box7 = new Box(914, 124, 178, 247, #882DD3, "Expeditionen", 6);
Box fb6_box8 = new Box(1099, 124, 135, 156, #882DD3, "Sozial", 6);
Box fb6_box9 = new Box(1241, 124, 118, 84, #882DD3, "Sozial", 6);
Box fb6_box10 = new Box(1241, 215, 118, 64, #882DD3, "Sozial", 6);
Box fb6_box11 = new Box(1099, 287, 260, 84, #882DD3, "Sozial", 6);
Box fb6_box12 = new Box(914, 378, 89, 247, #882DD3, "Sozial", 6);
Box fb6_box13 = new Box(1010, 378, 349, 247, #882DD3, "Sozial", 6);
//Kostenträger aus dem Fachbereich Wirtschaft
Box fb7_box1 = new Box(537, 124, 370, 125, #F05000, "Gehälter", 7);
Box fb7_box2 = new Box(537, 254, 103, 371, #F05000, "Lehre", 7);
Box fb7_box3 = new Box(646, 254, 260, 187, #F05000, "Expeditionen", 7);
Box fb7_box4 = new Box(771, 449, 135, 176, #F05000, "Forschung", 7);
Box fb7_box5 = new Box(646, 449, 118, 86, #F05000, "Förderungen", 7);
Box fb7_box6 = new Box(646, 542, 118, 84, #F05000, "Weiterbildung", 7);
Box fb7_box7 = new Box(914, 124, 178, 247, #F05000, "Konferenztechn", 7);
Box fb7_box8 = new Box(1099, 124, 135, 156, #F05000, "Wirtschaft", 7);
Box fb7_box9 = new Box(1241, 124, 118, 84, #F05000, "Wirtschaft", 7);
Box fb7_box10 = new Box(1241, 215, 118, 64, #F05000, "Wirtschaft", 7);
Box fb7_box11 = new Box(1099, 287, 260, 84, #F05000, "Wirtschaft", 7);
Box fb7_box12 = new Box(914, 378, 89, 247, #F05000, "Wirtschaft", 7);
Box fb7_box13 = new Box(1010, 378, 349, 247, #F05000, "Wirtschaft", 7);
//___________________________________________________________________________________________________________________<<<<<<<-------------(Für Joni)
//deklaration
PImage helpImage;
PImage BGImage;


//Leitstelle erzeugen
Leitstelle KomandoZentrale = new Leitstelle();


/*Variablen _______________________________________________________________________________________
 __________________________________________________________________________________________________*/
boolean helpClick = false;
boolean kostenClick = false;//macht alle Preisschilder der Boxen sichtbar
float globalBoxDrag =  666.66;  //verhindert das wenn eine Box bewegt wird eine ander auch bewegt wird

//Screenshot Variablen
int screenShot1 = 0;
int screenShot2 = 0;


/*Setup _______________________________________________________________________________________
 __________________________________________________________________________________________________*/
void setup()
{
  size(1400, 700);
  smooth();
  frameRate(60);
  noStroke();

  helpImage = loadImage("PopUpHelp.png");
  BGImage = loadImage("BG.png");
  font = loadFont("PrestigeEliteStd-Bd-48.vlw");
}

/*Draw Methode _______________________________________________________________________________________
 __________________________________________________________________________________________________*/

void draw()
{

  image(BGImage, 0, 0, 1400, 700);

  KomandoZentrale.loopLeitselle();
  drawAllBoxes();
  //MenuButton zeichnen
  menuZeichnen();    //Button werden gezeichnet
  takeAPicture();
}


/*Methoden _______________________________________________________________________________________
 __________________________________________________________________________________________________*/

void menuZeichnen()
{

  //Button zeichen
  bBB.drawButton();
  b1.drawButton();
  b2.drawButton();
  b3.drawButton();
  b4.drawButton();
  b5.drawButton();
  b6.drawButton();
  b7.drawButton();
  bKosten.drawButton();
  bHelp.drawButton();

  if (bKosten.getButtonClick() && mouseButton == LEFT)
  {
    if (kostenClick)
    {
      kostenClick = false;
    }
    else {
      kostenClick = true;
    }
  }

  if (bHelp.getButtonClick() && mouseButton == LEFT)
  {

    if (helpClick)
    {
      helpClick = false;
    }
    else {
      helpClick = true;
    }
  }

  if (helpClick)
  {
    image(helpImage, 700, 100, 640, 540);
  }
}

//Aufruf zum zeichnen aller Variablen
void drawAllBoxes()
{
  fb1_box1.drawBox();
  fb1_box2.drawBox();
  fb1_box3.drawBox();
  fb1_box4.drawBox();
  fb1_box5.drawBox();
  fb1_box6.drawBox();
  fb1_box7.drawBox();
  fb1_box8.drawBox();
  fb1_box9.drawBox();
  fb1_box10.drawBox();
  fb1_box11.drawBox();
  fb1_box12.drawBox();
  fb1_box13.drawBox();

  fb2_box1.drawBox();
  fb2_box2.drawBox();
  fb2_box3.drawBox();
  fb2_box4.drawBox();
  fb2_box5.drawBox();
  fb2_box6.drawBox();
  fb2_box7.drawBox();
  fb2_box8.drawBox();
  fb2_box9.drawBox();
  fb2_box10.drawBox();
  fb2_box11.drawBox();
  fb2_box12.drawBox();
  fb2_box13.drawBox();

  fb3_box1.drawBox();
  fb3_box2.drawBox();
  fb3_box3.drawBox();
  fb3_box4.drawBox();
  fb3_box5.drawBox();
  fb3_box6.drawBox();
  fb3_box7.drawBox();
  fb3_box8.drawBox();
  fb3_box9.drawBox();
  fb3_box10.drawBox();
  fb3_box11.drawBox();

  fb4_box1.drawBox();
  fb4_box2.drawBox();
  fb4_box3.drawBox();
  fb4_box4.drawBox();
  fb4_box5.drawBox();
  fb4_box6.drawBox();
  fb4_box7.drawBox();
  fb4_box8.drawBox();
  fb4_box9.drawBox();
  fb4_box10.drawBox();
  fb4_box11.drawBox();
  fb4_box12.drawBox();
  fb4_box13.drawBox();

  fb5_box1.drawBox();
  fb5_box2.drawBox();
  fb5_box3.drawBox();
  fb5_box4.drawBox();
  fb5_box5.drawBox();
  fb5_box6.drawBox();
  fb5_box7.drawBox();
  fb5_box8.drawBox();
  fb5_box9.drawBox();
  fb5_box10.drawBox();
  fb5_box11.drawBox();


  fb6_box1.drawBox();
  fb6_box2.drawBox();
  fb6_box3.drawBox();
  fb6_box4.drawBox();
  fb6_box5.drawBox();
  fb6_box6.drawBox();
  fb6_box7.drawBox();
  fb6_box8.drawBox();
  fb6_box9.drawBox();
  fb6_box10.drawBox();
  fb6_box11.drawBox();
  fb6_box12.drawBox();
  fb6_box13.drawBox();

  fb7_box1.drawBox();
  fb7_box2.drawBox();
  fb7_box3.drawBox();
  fb7_box4.drawBox();
  fb7_box5.drawBox();
  fb7_box6.drawBox();
  fb7_box7.drawBox();
  fb7_box8.drawBox();
  fb7_box9.drawBox();
  fb7_box10.drawBox();
  fb7_box11.drawBox();
  fb7_box12.drawBox();
  fb7_box13.drawBox();
}

void takeAPicture()
{

  if (key == 'x' && keyPressed)  // Sceenshot vom ganzen Programm
  {
    save("Screenshot/picture1.tif");
    screenShot1++;
  }
  else if (key == 'y' && keyPressed)  // Screenshot vom linken Teil des Programms
  { 
    PImage cp = get (0, 0, 480, 700);
    cp.save("Screenshot/picture1a.tif");
    screenShot2++;
  }
}

class Box
{
  /*Argumente_______________________________________________________________________________________
   __________________________________________________________________________________________________*/
  float x, y;
  float w, h;
  float wH, hH;  //Variablen für h und w halbe
  float a;  //Fläche der Box
  color boxColor;
  String boxName;
  int Fachbereich;
  int wertBox;
  //Die initialisierungswerte werden in diesen Variabeln gespeichert
  float xAnfang;   
  float yAnfang;
  float wAnfang;
  float hAngang;
  float boxID;  //mit einer random ID lässt sich die Box identifizieren
  float grenze; //ab welchem X Wert wird die Box durchgehend gezeichnet

  int i = 1; //aktivToggle

  // Mouse EventHandling Variablen
  boolean boxOver;
  boolean boxPress;
  boolean boxClick;
  boolean boxReleased;
  boolean mousePressedT1 = false;
  boolean clickStart = false;
  boolean boxAktiv = false;
  boolean drawBox = false;

  //Konstuktor Box  
  Box(float tx, float ty, float tw, float th, color tc1, String tname, int tFachbereich)
  {
    x = tx;
    y = ty;
    w = tw;
    h = th;
    wH = tw/2;
    hH = th/2;
    xAnfang = tx;
    yAnfang = ty;
    wAnfang = tw;
    hAngang = th;
    boxColor = tc1;
    boxName = tname;
    Fachbereich = tFachbereich;
    wertBox = int(w*h);

    boxID = random(1000000);
    grenze = 480;

    a = w*h;
  }




  /*Methoden _______________________________________________________________________________________
   __________________________________________________________________________________________________*/


  void drawBox()
  {
    if (drawBox)
    {

      //sammelt alle MousVariablen und aktualisiert sie
      mouseBoxDaten();



      //Box Farbe und Cursor bestimmen abhänig von boxOver
      if (boxOver)
      {
        fill(boxColor, 180);
      }
      else {
        fill(boxColor, 128);
      }

      //Makieren wenn Box Aktiv ist - rot Umranden
      if (boxAktiv)
      {
        strokeWeight(6);
        stroke(255, 0, 0);
        boxTransformation();
      }
      else {
        noStroke();
      }


      //      if (mousePressed && boxOver)
      //      {
      //        x = lerp(x, - w/2, 0.2) ;
      //        y = lerp(y, mouseY- h/2, 0.2) ;
      //      }

      if (globalBoxDrag == boxID)
      {
        //Box wird verschoben
        if (mousePressed && boxOver)
        {
          x = x+mouseX-pmouseX;
          y = y+mouseY-pmouseY;
        }
      }


      //Box zeichnen
      rect(x, y, w, h, 2, 20, 20, 20);
      noStroke();
      drawText();

      //Kosten Tags zeichnen
      if (kostenClick)
      {
        fill(50);
        textSize(15);
        textAlign(RIGHT, BOTTOM);
        text(wertBox+" €", x+w-w/8, y+h-h/8);
      }
    }
  }

  //Text zeichnen
  void drawText()
  {

    textFont(font);    // geladenen Font benutzen

    //Box Bezeichnung drucken
    fill(0);
    textSize(15);
    textAlign(LEFT, TOP);
    text(boxName, x+ w/13, y+ h/13, w-5, h-5); //Packt Text in eine Box die genau so groß ist wie die Box selber
  }



  //Methode die alle für die aktualiserung der MouseDaten sorgt
  void mouseBoxDaten()    
  {  
    boxClick = false;
    overEvent();
    pressEvent();

    BoxMouseReleased();
    mousePressedT1 = mousePressed;

    boxClick();
    boxAktiv();
  }





  //Box Transformation - mit w und s kann man die Boxen proportional skalieren
  void boxTransformation()
  {
    if (key == 'w' && keyPressed)
    {
      if (h < 500)
      {
        h += 2;
      }
      else {
        h = 500;
      }
    }
    if (key == 's' && keyPressed)
    {
      if (h > 20)
      {
        h -= 2;
      }
      else {
        h = 20;
      }
    }

    w = a/h;
    wH = w/2;
    hH = h/2;
  }


  //SetGet Funktionen für drawVariable

  //setzt drawBox auf 
  void setDraw(boolean drawVariable)
  {
    if (x > grenze)
    {
      drawBox = drawVariable;
      x = xAnfang;
      y = yAnfang;
      w = wAnfang;
      h = hAngang;
    }
  }

  boolean getDraw()
  {
    return drawBox;
  }




  //MouseEventHandling#############


  //ist die Maus über der Box?
  void overEvent()        
  {
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h)
    {
      boxOver = true;
      if (globalBoxDrag == boxID || globalBoxDrag == 666.66)
      {
        globalBoxDrag = boxID;
        println(boxID);
      }
    } 
    else {
      boxOver = false;
    }
  }


  //ist die Maus über der Box und ist sie gedrückt?
  void pressEvent()
  {


    {
      if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h)
      {

        boxPress = true;
        boxClick = false;
        clickStart = true;
      } 
      else 
      {
        boxPress = false;
        if (globalBoxDrag == boxID)
        {
          globalBoxDrag = 666.66;
        }
      }
    }
  }


  //Wurde innerhalb der Box gecklickt?
  void boxClick() 
  {
    if (boxReleased == true && clickStart == true && boxOver == true)
    {
      boxClick = true;
    }
    else
    {
      boxClick = false;
    }
  }

  void BoxMouseReleased()
  {
    if (mousePressedT1 == true && mousePressed == false)
    {
      boxReleased = true;
    }
    else 
    {
      boxReleased = false;
    }
  }

  void boxAktiv()
  {
    if (boxClick && mouseButton == RIGHT)
    {
      i = i * -1;
    }

    if (i == -1)
    {
      boxAktiv = true;
    }
    else
    {
      boxAktiv = false;
    }
  }



  boolean getboxClick()
  {
    // println(boxClick);
    return boxClick;
  }
}

class Button
{

  //Variabeln_________________________________________________________________________
  float x;
  float y;
  float w;
  float h;
  String buttonName;
  color farbe;


  // Mouse EventHandling Variablen
  boolean boxOver;
  boolean boxPress;
  boolean boxClick;
  boolean boxReleased;
  boolean mousePressedT1 = false;
  boolean clickStart = false;
  boolean boxAktiv = false;

  //Konstruktor_________________________________________________________________________

  Button(float _x, float _y, float _w, float _h, String _buttonName, color _farbe)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    buttonName = _buttonName;
    farbe = _farbe;
  }

  //Methoden_________________________________________________________________________
  
  void drawButton()
  {
    mouseBoxDaten();
    
    if (boxOver)
    {
      fill(farbe, 255);
    }
    else {
      fill(farbe, 128);
    }
    
    
    rect(x,y,w,h,2,2,2,2);
    drawText();
  }
  
  //Methoden_________________________________________________________________________
  
  void mouseBoxDaten()    //Methode die alle für die aktualiserung der MouseDaten sorgt
  {  
    boxClick = false;
    overEvent();
    pressEvent();

    BoxMouseReleased();
    mousePressedT1 = mousePressed;

    boxClick();

  }
  
  
  void drawText()
  {

    textFont(font);    // geladenen Font benutzen

    //Box Bezeichnung drucken
    fill(0);
    textSize(20);
    textAlign(LEFT, TOP);
    text(buttonName, x+ w/13, y+ h/13);
  }
  
  
  
  //MouseEventHandling#############


  //ist die Maus über der Box?
  void overEvent()        
  {
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h)
    {
      boxOver = true;
    } 
    else {
      boxOver = false;
    }
  }


  //ist die Maus über der Box und ist sie gedrückt?
  void pressEvent()
  {

    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h)
    {
      boxPress = true;
      boxClick = false;
      clickStart = true;
    } 
    else 
    {
      boxPress = false;
    }
  }


  //Wurde innerhalb der Box gecklickt?
  void boxClick() 
  {
    if (boxReleased == true && clickStart == true && boxOver == true)
    {
      boxClick = true;
    }
    else
    {
      boxClick = false;
    }
  }

  void BoxMouseReleased()
  {
    if (mousePressedT1 == true && mousePressed == false)
    {
      boxReleased = true;
    }
    else 
    {
      boxReleased = false;
    }
  }

  
  boolean getButtonClick()
  {
    // println(boxClick);
    return boxClick;
  }

}

class FachbereichBox
{
  //Variablen_________________________________________________________________________
  float x;
  float y;
  float w;
  float h;
  String fachbereichName;
  color farbe;
  int wertBox;

  // Mouse EventHandling Variablen
  boolean boxOver;
  boolean boxPress;
  boolean boxClick;
  boolean boxReleased;
  boolean mousePressedT1 = false;
  boolean clickStart = false;
  boolean boxAktiv = false;


  //Konstruktor_________________________________________________________________________

  FachbereichBox(float _x, float _y, float _w, float _h, String _fachbereichName, color _farbe)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    fachbereichName = _fachbereichName;
    farbe = _farbe;
    wertBox = int(w*h*25);
  }

  void drawFachbereichBox()
  {
    mouseBoxDaten();

    if (boxOver)
    {
      fill(farbe, 255);
    }
    else {
      fill(farbe, 128);
    }


    rect(x, y, w, h, 20, 20, 20, 20);
    drawText();
  }

  //Methoden_________________________________________________________________________

  void mouseBoxDaten()    //Methode die alle für die aktualiserung der MouseDaten sorgt
  {  
    boxClick = false;
    overEvent();
    pressEvent();

    BoxMouseReleased();
    mousePressedT1 = mousePressed;

    boxClick();
  }


  void drawText()
  {

    textFont(font);    // geladenen Font benutzen

    //Box Bezeichnung drucken
    fill(0);
    textSize(18);
    textAlign(CENTER, CENTER);
    text(fachbereichName, x, y,w,h);

    if (kostenClick)
    {
      fill(50);
      textSize(12);
      textAlign(RIGHT, BOTTOM);
      text(wertBox+" €", x+w-w/8, y+h-h/8);
    }
  }



  //MouseEventHandling#############


  //ist die Maus über der Box?
  void overEvent()        
  {
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h)
    {
      boxOver = true;
    } 
    else {
      boxOver = false;
    }
  }


  //ist die Maus über der Box und ist sie gedrückt?
  void pressEvent()
  {

    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h)
    {
      boxPress = true;
      boxClick = false;
      clickStart = true;
    } 
    else 
    {
      boxPress = false;
    }
  }


  //Wurde innerhalb der Box gecklickt?
  void boxClick() 
  {
    if (boxReleased == true && clickStart == true && boxOver == true)
    {
      boxClick = true;
    }
    else
    {
      boxClick = false;
    }
  }

  void BoxMouseReleased()
  {
    if (mousePressedT1 == true && mousePressed == false)
    {
      boxReleased = true;
    }
    else 
    {
      boxReleased = false;
    }
  }


  void setboxClick(boolean setBoxClick)
  {
    boxClick = setBoxClick;
  }



  boolean getboxClick()
  {
    // println(boxClick);
    return boxClick;
  }
}

class Leitstelle
{






  //Variablen___________________________________________________________________________

  //int aktuellerFachbereich = 0;  //Welcher Fachbereich soll zurzeit gezeichnet werden.
  boolean vHauptmenu = true;

  //Konstruktor_________________________________________________________________________

  Leitstelle()
  {
  }





  //Methoden_________________________________________________________________________

  void loopLeitselle()
  {
    //FachbereicheButton wird gedrückt
    if (bBB.getButtonClick())
    {
      vHauptmenu = true;
      setFachbereich1(false);
      setFachbereich2(false);
      setFachbereich3(false);
      setFachbereich4(false);
      setFachbereich5(false);
      setFachbereich6(false);
      setFachbereich7(false);
    }
    if (vHauptmenu)
    {
      drawHauptmenu();
    }

    //Button1 wird gedrückt
    if (b1.getButtonClick() && mouseButton == LEFT || fb1.getboxClick() && mouseButton == LEFT)
    {
      fb1.setboxClick(false);
      vHauptmenu = false;
      setFachbereich1(true);
      setFachbereich2(false);
      setFachbereich3(false);
      setFachbereich4(false);
      setFachbereich5(false);
      setFachbereich6(false);
      setFachbereich7(false);
    }

    //Button 2 wird gedrückt
    if (b2.getButtonClick() && mouseButton == LEFT || fb2.getboxClick() && mouseButton == LEFT)
    {
      fb2.setboxClick(false);
      vHauptmenu = false;
      setFachbereich1(false);
      setFachbereich2(true);
      setFachbereich3(false);
      setFachbereich4(false);
      setFachbereich5(false);
      setFachbereich6(false);
      setFachbereich7(false);
    }
    //Button 3 wird gedrückt
    if (b3.getButtonClick() && mouseButton == LEFT || fb3.getboxClick() && mouseButton == LEFT)
    {
      fb3.setboxClick(false);
      vHauptmenu = false;
      setFachbereich1(false);
      setFachbereich2(false);
      setFachbereich3(true);
      setFachbereich4(false);
      setFachbereich5(false);
      setFachbereich6(false);
      setFachbereich7(false);
    }
    //Button 4 wird gedrückt
    if (b4.getButtonClick() && mouseButton == LEFT || fb4.getboxClick() && mouseButton == LEFT)
    {
      fb4.setboxClick(false);
      vHauptmenu = false;
      setFachbereich1(false);
      setFachbereich2(false);
      setFachbereich3(false);
      setFachbereich4(true);
      setFachbereich5(false);
      setFachbereich6(false);
      setFachbereich7(false);
    }
    //Button 5 wird gedrückt
    if (b5.getButtonClick() && mouseButton == LEFT || fb5.getboxClick() && mouseButton == LEFT)
    {
      fb5.setboxClick(false);
      vHauptmenu = false;
      setFachbereich1(false);
      setFachbereich2(false);
      setFachbereich3(false);
      setFachbereich4(false);
      setFachbereich5(true);
      setFachbereich6(false);
      setFachbereich7(false);
    }
    //Button 6 wird gedrückt
    if (b6.getButtonClick() && mouseButton == LEFT || fb6.getboxClick() && mouseButton == LEFT)
    {
      fb6.setboxClick(false);
      vHauptmenu = false;
      setFachbereich1(false);
      setFachbereich2(false);
      setFachbereich3(false);
      setFachbereich4(false);
      setFachbereich5(false);
      setFachbereich6(true);
      setFachbereich7(false);
    }
    //Button 7 wird gedrückt
    if (b7.getButtonClick() && mouseButton == LEFT || fb7.getboxClick() && mouseButton == LEFT)
    {
      fb7.setboxClick(false);
      vHauptmenu = false;
      setFachbereich1(false);
      setFachbereich2(false);
      setFachbereich3(false);
      setFachbereich4(false);
      setFachbereich5(false);
      setFachbereich6(false);
      setFachbereich7(true);
    }
  }


  //Draw Methoden
  void drawHauptmenu()
  {
    fb1.drawFachbereichBox();
    fb2.drawFachbereichBox();
    fb3.drawFachbereichBox();
    fb4.drawFachbereichBox();
    fb5.drawFachbereichBox();
    fb6.drawFachbereichBox();
    fb7.drawFachbereichBox();
  }

  //setzt alle Boxen des Fachbereiches mit Variable
  void setFachbereich1(boolean drawVariable)
  {
    fb1_box1.setDraw(drawVariable);
    fb1_box2.setDraw(drawVariable);
    fb1_box3.setDraw(drawVariable);
    fb1_box4.setDraw(drawVariable);
    fb1_box5.setDraw(drawVariable);
    fb1_box6.setDraw(drawVariable);
    fb1_box7.setDraw(drawVariable);
    fb1_box8.setDraw(drawVariable);
    fb1_box9.setDraw(drawVariable);
    fb1_box10.setDraw(drawVariable);
    fb1_box11.setDraw(drawVariable);
    fb1_box12.setDraw(drawVariable);
    fb1_box13.setDraw(drawVariable);
    
  }

  void setFachbereich2(boolean drawVariable)
  {
    fb2_box1.setDraw(drawVariable);
    fb2_box2.setDraw(drawVariable);
    fb2_box3.setDraw(drawVariable);
    fb2_box4.setDraw(drawVariable);
    fb2_box5.setDraw(drawVariable);
    fb2_box6.setDraw(drawVariable);
    fb2_box7.setDraw(drawVariable);
    fb2_box8.setDraw(drawVariable);
    fb2_box9.setDraw(drawVariable);
    fb2_box10.setDraw(drawVariable);
    fb2_box11.setDraw(drawVariable);
    fb2_box12.setDraw(drawVariable);
    fb2_box13.setDraw(drawVariable);
  }

  void setFachbereich3(boolean drawVariable)
  {
    fb3_box1.setDraw(drawVariable);
    fb3_box2.setDraw(drawVariable);
    fb3_box3.setDraw(drawVariable);
    fb3_box4.setDraw(drawVariable);
    fb3_box5.setDraw(drawVariable);
    fb3_box6.setDraw(drawVariable);
    fb3_box7.setDraw(drawVariable);
    fb3_box8.setDraw(drawVariable);
    fb3_box9.setDraw(drawVariable);
    fb3_box10.setDraw(drawVariable);
    fb3_box11.setDraw(drawVariable);
  }


  void setFachbereich4(boolean drawVariable)
  {
    fb4_box1.setDraw(drawVariable);
    fb4_box2.setDraw(drawVariable);
    fb4_box3.setDraw(drawVariable);
    fb4_box4.setDraw(drawVariable);
    fb4_box5.setDraw(drawVariable);
    fb4_box6.setDraw(drawVariable);
    fb4_box7.setDraw(drawVariable);
    fb4_box8.setDraw(drawVariable);
    fb4_box9.setDraw(drawVariable);
    fb4_box10.setDraw(drawVariable);
    fb4_box11.setDraw(drawVariable);
    fb4_box12.setDraw(drawVariable);
    fb4_box13.setDraw(drawVariable);
  }

  void setFachbereich5(boolean drawVariable)
  {
    fb5_box1.setDraw(drawVariable);
    fb5_box2.setDraw(drawVariable);
    fb5_box3.setDraw(drawVariable);
    fb5_box4.setDraw(drawVariable);
    fb5_box5.setDraw(drawVariable);
    fb5_box6.setDraw(drawVariable);
    fb5_box7.setDraw(drawVariable);
    fb5_box8.setDraw(drawVariable);
    fb5_box9.setDraw(drawVariable);
    fb5_box10.setDraw(drawVariable);
    fb5_box11.setDraw(drawVariable);
    
  }

  void setFachbereich6(boolean drawVariable)
  {
    fb6_box1.setDraw(drawVariable);
    fb6_box2.setDraw(drawVariable);
    fb6_box3.setDraw(drawVariable);
    fb6_box4.setDraw(drawVariable);
    fb6_box5.setDraw(drawVariable);
    fb6_box6.setDraw(drawVariable);
    fb6_box7.setDraw(drawVariable);
    fb6_box8.setDraw(drawVariable);
    fb6_box9.setDraw(drawVariable);
    fb6_box10.setDraw(drawVariable);
    fb6_box11.setDraw(drawVariable);
    fb6_box12.setDraw(drawVariable);
    fb6_box13.setDraw(drawVariable);
  }

  void setFachbereich7(boolean drawVariable)
  {
    fb7_box1.setDraw(drawVariable);
    fb7_box2.setDraw(drawVariable);
    fb7_box3.setDraw(drawVariable);
    fb7_box4.setDraw(drawVariable);
    fb7_box5.setDraw(drawVariable);
    fb7_box6.setDraw(drawVariable);
    fb7_box7.setDraw(drawVariable);
    fb7_box8.setDraw(drawVariable);
    fb7_box9.setDraw(drawVariable);
    fb7_box10.setDraw(drawVariable);
    fb7_box11.setDraw(drawVariable);
    fb7_box12.setDraw(drawVariable);
    fb7_box13.setDraw(drawVariable);
  }
}



