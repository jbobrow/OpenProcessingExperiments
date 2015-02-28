
/* @pjs font = HoeflerText-Roman.otf; */
import controlP5.*;
ControlP5 cp5;
String textValue;
Textfield myTextfield;

///////////////////////////////////////libraries /////////////////////////////
import com.getflourish.stt.*;
import rita.wordnet.*;

STT stt;
RiWordnet wordnet = new RiWordnet(this);
import rita.*;
import processing.serial.*;
import cc.arduino.*;
Serial myPort;
PFont Font;

///////////////////////////////////////////////////////////////////////////////
/////////////////////////////// GLOBAL VAR ////////////////////////////////////

String word=null;
RiText[] lines = null;
//String Coordinate= null;
//int index=0;
Close First=null;

//float   yPos = 0;
//float xPos = 0;
PFont font = createFont("Georgia", 14);

boolean a = false;
boolean b = false;
boolean c = false;
boolean d = false;

///////////////////////////////////////SETUP ////////////////////////////////

void setup () {
  frameRate(20);
  size(displayWidth, displayHeight-70);
  textFont(createFont("Georgia", 14));
  fill(0, 102, 153);

  cp5 = new ControlP5(this);
 myTextfield = cp5.addTextfield("Type a word")
.setFont(font)
.setColorActive(color(#d3ccbe))
    .setPosition(width/2-140, 50)
      .setSize(300, 40)
        .setColor(#FFFFFF)
          .setAutoClear(false)
            .setFont(font)
              .setFocus(true)
                .setColorBackground(#e6e1d7) 
                .setColor(color(#4a4342))
                  ;

  myTextfield.
  setAutoClear(true).keepFocus(true);

  cp5.addButton("Search", 50,width/2-90, 100, 190, 40)
            .setColorForeground(color(#866e6b))
                  .setColorBackground(color(#bab3a1))
                      .setColorActive(color(#d84e2e))

                 
      ;
      
cp5.getController("Search")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(15)
        .setColor(#201f1f)
    ;
    
    cp5.getController("Search")
     .getCaptionLabel().getStyle().marginLeft = 70
     
     ;

  Font = createFont("HoeflerText-Roman.otf", 40);
  MainSetup ();
}

void MainSetup () {
  background(#F5F3EB);
  loadPixels();

  smooth();
  // println(Serial.list());
  //    myPort = new Serial(this, Serial.list()[6], 115200);

  //  myPort.buffer(6);
  // myPort.clear();

  word=null;
  lines = null;
  // Coordinate= null;
  //  index=0;
  First=null;
}
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


void draw () {
}

void clear(int theValue) {
  myTextfield.clear();
}
void Search(int theValue) {

  word = myTextfield.getText();
  myTextfield.clear();
  background(#FFFEFC);
  if (wordnet.exists(word)==true) {
    drawDISTANCE();
    createStop();
    a = false; 
    b = false; 
    c = false;


    if ((!a)&&(!b)&&(!c)&&(!d)) {
      fill(#F5F3EB);
      noStroke();
    //  println("aasss");
      rect(width/5, height/3-40, width/5*3, height/2);
    }
  }
}


///////////////////////////////////////////////////////////////////////////////

void drawDISTANCE() {
  First = new Close (word, "", null);
  drawFirstStop();
}

////////////////////////////////////////////////////////////////////////////////////////





void keyPressed() {




  if (key == '1') {
    a = true; 

    background(#F5F3EB);
    drawFirstStop();
    noStroke();
    fill(#F5F3EB);
    rect(width/5, height/3-40, width/5*2, height/2);
  }
  if (key == '2') {
    b = true; 
    background(#F5F3EB);
    drawFirstStop();
     noStroke();
    fill(#F5F3EB);
    rect(width/5*2, height/3-40, width/5, height/2);
  }
   if (key == '3') {
    c = true; 
    background(#F5F3EB);
    drawFirstStop();
  }
  if (key == '\t') {
cp5.getController("Search");
    
  }
}
////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////

void serialEvent (Serial myPort) {

  int Progress = 0;

  if (myPort.read() ==1) 
    Progress =1;
  if (myPort.read() ==2) 
    Progress =2;
  if (myPort.read() ==3) 
    Progress =3;
  if (myPort.read() ==4) 
    Progress =4;
}




///////////////////////////////////////////////////////////////////////////////////////////////


void createStop() {
  Close temp;
  temp = First;
  temp.createSon();

  while (temp.isThereSon ()) {

    temp = temp.getSon();
    temp.createSon();
  }
  drawFirstStop();
  temp.createSon();
  drawFirstStop();

  println("aaa");

  //  drawFirstStop(Progress);
}




void drawFirstStop() {
  Close temp;
  int level=0;
  temp = First;
  while (temp!=null) {
    temp.draw(level++);

    temp = temp.getSon();
  }
}

String[] parts;
float animationPull=0.0;




////////////////////////////  declaration of class - //////////////////////////////////////
/////  what parameters sould he remembre for every object /////

class Close {
  String word;
  String gloss;
  String SonWord;
  String sonGloss;
  String dadGloss;
  Close Son;
  Close Son1;
  Close Son2;
  Close father;
  float xStart, yStart, xEnd, yEnd;      


  ////////////////////////////  Constructor of class //////////////////////////////////////
  /////  parameters the class gets from his father /////

  Close (String w, String g, Close f) {
    word = w;
    gloss = g;
    Son = null;
    Son1 = null;
    Son2 = null;
    father = f;
    xStart=70;
    yStart=190;

    ;
  }



  ////////////////////////////  Constructor of class //////////////////////////////////////
  /////  Creates the next word and gives it the parameters it re  requirs /////


  public void createSon() {

    if (wordSense()) {

      Son = new Close(SonWord, sonGloss, this);
    }
  }

  //////////////////////////////////////////////////////////////////////////////////////


  boolean isThereSon() {

    if (Son!=null) {

      return true;
    }
    else

        return false;
  }

  //////////////////////////////////////////////////////////////////////////////////////

  Close getSon() {

    return Son;
  }

  String getWord() {
    return word;
  }
  //////////////////////////////////////////////////////////////////////////////////////


  //////////////////////////////////////////////////////////////////////////////////////

  boolean wasThere(String oneWord) {
    if (word.equals(oneWord))
      return true;
    else {
      if (father != null) {
        return father.wasThere(oneWord);
      }    
      else
        return false;
    }
  }


  //////////////////////////////////////////////////////////////////////////////////////
  public void deleteSon() {

    Son = null;
  }


  boolean wordSense() {
    // add getpos
    int SynseCounter = 0;
    String [] ListOfSynse = new String[1000];
    int  index=-1;

    String Coordinate= null;
    String explanation=null;
    // Meyutar     if  (wordnet.exists(word)==true) {
    String[] Synse = null;

    String var = null;
    int Mean =-1;
    if (Meanings(word)!=-1) {
      Mean  = Meanings(word);
      if (wordnet.getAllSynonyms(Mean)!= null) {
        Synse =( wordnet.getAllSynonyms(Mean));
      }
      for (int i = 0;i < Synse.length; i++) {
        if (!wasThere (Synse[i]))
          if (i==0)
            ListOfSynse[SynseCounter] = Synse[i];
          else
            ListOfSynse[SynseCounter++] = Synse[i];
      }
      index =int (random(SynseCounter));
      if (ListOfSynse[index]!=null) {

        SonWord = ListOfSynse[index];
        sonGloss = wordnet.getDescription(SpecificMeanings(SonWord));
        dadGloss = wordnet.getDescription(Mean);

        // Coordinate = ListOfSynse[index];

        return true;
      }
    }
    return false;
  }

  /////////////////////////////////////////////////////////////////////////////////////////


  int Meanings (String aWord) {
    int index=-1;
    int  meamning = -1;
    int[]  Senses = null;
    int [] ListOfSenses = new int[1000];
    int SonId;
    int sensesCounter=0;

    if ( word!=null) {
      String[]pos = wordnet.getPos(word);
      for (int i = 0;i < pos.length; i++) {
        if (wordnet.getSenseIds(word, pos[i]) != null) {
          Senses = wordnet.getSenseIds(word, pos[i]);
          //  println(Senses);
          for (int j = 0;j < Senses.length; j++) {
            if ((wordnet.getAllSynonyms (Senses[j]))!= null) {  
              ListOfSenses[sensesCounter++] = Senses[j];
            }
          }
        }
      }

      if (sensesCounter>0) {
        index =int (random(sensesCounter)); 
        meamning = ListOfSenses[index];
        SonId= meamning ;
        //   gloss = wordnet.getGloss(ListOfSynse[index],wordnet.getBestPos(ListOfSynse[index]));
      }
    }
    return meamning;
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  int SpecificMeanings (String sonny) {
    int  SpecificMeaning = -1;
    int[]  Senses = null;
    int [] ListOfSenses = new int[1000];
    int sensesCounter=0;
     String [] CachSynonyms;
  //  int k =-1;

    if ( word!=null) {
      String[]pos = wordnet.getPos(sonny);
      for (int i = 0;i < pos.length; i++) {
        if (wordnet.getSenseIds(sonny, pos[i]) != null) {
          Senses = wordnet.getSenseIds(sonny, pos[i]);
          //  println(Senses);
          for (int j = 0;j < Senses.length; j++) {
            if ((wordnet.getAllSynonyms (Senses[j]))!= null) {  
              ListOfSenses[sensesCounter++] = Senses[j];
            }
          }
        }
      }
               println(sonny);


      // while  (SpecificMeaning == -1) {
      for (int m = 0;m < sensesCounter; m++) {

        CachSynonyms = wordnet.getAllSynonyms(ListOfSenses[m]);

       println (wordnet.getDescription(ListOfSenses[m]));
       println(CachSynonyms);
        for (int l = 0;l < CachSynonyms.length; l++) {
          if (CachSynonyms[l].equals(word)){
           println("--->"+CachSynonyms[l]);
          SpecificMeaning= ListOfSenses[m];
          if (SpecificMeaning != -1){
    return  SpecificMeaning;
          }
          
        }
      }
      }
    }
            println("!!!!!!!"+SpecificMeaning);
         //int  index =int (random(CachSynonyms.length)); 
    return  SpecificMeaning= ListOfSenses[int( random(sensesCounter))] ;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  public void draw(int level) {
    float  xPos, yPos;
    xPos= 30;
    yPos= height/3;
    switch (level) {
    case 0:
      background(#F5F3EB);
      fill(20);
      textFont(Font, 35);
      text(word, xPos, yPos); 
      println (gloss);
      drawsFirstStep (30, yPos);


      break;

    case 1:
      xPos=  width/5;

      noFill();
      textFont(Font, 35);
      fill(0);
      text(word, xPos, yPos);
      drawsStep (width/5, yPos);
      break;

    case 2:
      xPos =width/5*2 ;

      noFill();
      textFont(Font, 35);
      fill(0);
      text(word, xPos, yPos);
      drawsStep (width/5*2, yPos);



      break;

    case 3:
      xPos =width/5*3 ;
      noFill();
      textFont(Font, 35);
      fill(0);
      text(word, xPos, yPos);
      drawsStep (width/5*3, yPos);


      break;

    case 4:
      xPos =width/5*4 ;
      noFill();
      textFont(Font, 35);
      fill(0);
      text(word, xPos, yPos);
      drawsStep (width/5*4, yPos);


      break;
    }
  }

  void  drawsStep (float xlinePos, float ylinePos) {
    textAlign(LEFT);

    if (gloss != null) {
      textFont(Font, 13);
      fill(0);
      String refinedGloss= null;


      if (gloss != null) {   
        String[] parts = gloss.split(";");
        refinedGloss=  join(parts, "\n");

        textFont(Font, 16);    
        fill(50);
        text(refinedGloss, xlinePos, ylinePos+=10, 200, height);
      }
    }
  }



  void  drawsFirstStep (float xlinePos, float ylinePos) {
    textAlign(LEFT);

    if (dadGloss != null) {
      textFont(Font, 13);
      fill(0);
      String refinedGloss= null;


      if (dadGloss != null) {   
        String[] parts = dadGloss.split(";");
        refinedGloss=  join(parts, "\n");

        textFont(Font, 16);    
        fill(50);
        text(refinedGloss, xlinePos, ylinePos+=10, 200, height);
      }
    }
  }
}



