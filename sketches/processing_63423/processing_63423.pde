
//LOST SEARCH ENGINE
//Created by Lucas Gonzalez-Fernandez
//Organize your facts and cross-reference! Try typing in words like 'alone','science','faith','monster','dynamite','ship' and such and see the connections!
import ddf.minim.*;

PFont searchFont;
PFont infoFont;
PFont questionFont;
PFont smallFont;
PFont largeFont;
PFont HUDFont;
Minim minim;
AudioPlayer lostSong;
AudioPlayer createSound;
AudioPlayer lostIntro;
InfoNode[] infoNodes;
ArrayList searchNodes;
ArrayList interNodes;
ArrayList shockwaves;
String currentInput = "";
int speedCoefficient;
int mouseHighlightZone;
float nodeSpeed;
float nodeDistance;
float terminalSpeed;
boolean pathing;
boolean dynamicColorz;
float spreadOut;
boolean somethingHighlighted;
boolean threedee;
float cameraposx;
float cameraposy;
float cameraposz;
float camerax;
float cameray;
float cameraz;
float camspeed;
boolean loadingStart;
boolean playIntroSong;
int currentMode;
float fadeIn;
float fadeInLost;

float introPosx;
float introPosy;
float introPosz;
float introx;
float introy;
float introz;
boolean diagonalText;

void setup()
{
  size(1024,768, P3D);
  ellipseMode(CENTER);
  rectMode(CENTER);
  noStroke();
  frameRate(60);
  searchFont = loadFont("Impact-16.vlw");
  HUDFont = loadFont("DisposableDroidBB-22.vlw");
  infoFont = loadFont("Impact-12.vlw");
  questionFont = loadFont("Andalus-26.vlw");
  smallFont = loadFont("LetterOMatic-6.vlw");
  //largeFont = loadFont("Futura-Medium-48.vlw");
  largeFont = loadFont("Futura-Normal-96.vlw");
  textAlign(CENTER);
  spreadOut = 20;
  //infoNodes = new InfoNode[8];
  mouseHighlightZone = 20;
  nodeSpeed = 1000;
  nodeDistance = 80;
  //terminalSpeed = huh
  minim = new Minim(this);
  lostSong = minim.loadFile("Lost- Locke'd out again.mp3");
  createSound = minim.loadFile("lostendsound.wav");
  lostIntro = minim.loadFile("lostintro.wav");
  pathing = true;
  dynamicColorz = true;
  somethingHighlighted = false;
  infoNodes = new InfoNode[153];
  loadingStart = true;
  searchNodes = new ArrayList();
  interNodes = new ArrayList();
  shockwaves = new ArrayList();
  threedee = false;
  cameraposx = 0;
  cameraposy = 0;
  cameraposz = 0;
  camerax = 0;
  cameray = 0;
  cameraz = 0;
  camspeed = 20;
  currentMode = 1;
  playIntroSong = true;
  fadeIn = 255;
  fadeInLost = 255;
  diagonalText = false;
}

void draw()
{
  if (playIntroSong)
  {
    lostIntro.play();
    playIntroSong = false;
    introPosx = width/2;
    introPosy = height/2;
    introPosz = 100;
    introx = 20;
    introy = -60;
    introz = -10;
  }
  if (loadingStart)
  {
    if (lostIntro.isPlaying())
    {
      background(0);
      if (introPosz < 665)
      {
        pushMatrix();
        translate(introPosx,introPosy,introPosz);
        rotateX(radians(introx));
        rotateY(radians(introy));
        rotateZ(radians(introz));
        fill(255);
        textFont(largeFont);
        text("L O S T", 0,0,0);
        popMatrix();
        introPosx += -.04;
        introPosy += .055;
        introPosz += .9;
        introx += .01;
        introy += .1;
        introz += .06;
      }
      if (fadeInLost > 0)
      {
        fill(0, 0, 0, fadeInLost);
        rect(width/2,height/2,width,height);
        fadeInLost -= 1;
      }
    }
    else
    {
      addInfoNodes();
      loadingStart = false;
    }
  }
  else
  {
    background(10,20,30);
    if (!(lostSong.isPlaying()))
    {
          lostSong.loop();
    }
    
    if (!threedee)
    {
      mouseHelp();
    }
    pushMatrix();
    translate(cameraposx,cameraposy,cameraposz);
    rotateX(radians(camerax));
    rotateY(radians(cameray));
    rotateZ(radians(cameraz));
    displayAllSearchNodes();
    displayAllInfoNodes();
    displayAllShockwaves();
    popMatrix();
    drawHud();
    if (fadeIn > 0)
    {
      fill(0,0,0,fadeIn);
      rect(width/2,height/2,width,height);
      fadeIn--;
    }
  }
}

void drawHud()
{
  if (!threedee)
  {
    textFont(HUDFont);
    textAlign(CORNER);
    fill(50,160,50);
    text("Input: " + currentInput, 10, height-10);
    text("Type in input with alphanumeric keys and BACKSPACE. Press ENTER to create. Press DELETE to remove a node.", 0, 20);
    text("( + ) 2D/3D Mode\n( - ) Visual Mode\n( [ ) Orbit/Path\n( ] ) Diagonal Text", 850, 700);
    textAlign(CENTER);
  }
  else
  {
    textFont(HUDFont);
    textAlign(CORNER);
    fill(50,160,50);
    text("A-Z,S-X,D-C for movement, U-J,I-K,O-L for camera control.", 0, 20);
    text("( + ) 2D/3D Mode\n( - ) Visual Mode\n( [ ) Orbit/Path\n( ] ) Diagonal Text", 850, 700);
    textAlign(CENTER);
  }
}

void mouseHelp()
{
  int i = 0;
  for (i = 0; i < searchNodes.size(); i++)
  {
    SearchNode searchTemp = (SearchNode) searchNodes.get(i);
    
    float mouseXdist = mouseX - searchTemp.location.x;
    float mouseYdist = mouseY - searchTemp.location.y;
    
    if ((mouseXdist < mouseHighlightZone && mouseXdist > -mouseHighlightZone) && (mouseYdist < mouseHighlightZone && mouseYdist > -mouseHighlightZone))
    {
      if (!somethingHighlighted)
      {
        searchTemp.highlighted = true;
        somethingHighlighted = true;
      }
    }
    else
    {
      searchTemp.highlighted = false;
    }
  }
  for (i = 0; i < infoNodes.length; i++)
  {
    InfoNode infoTemp = infoNodes[i];
    
    float mouseXdist = mouseX - infoTemp.location.x;
    float mouseYdist = mouseY - infoTemp.location.y;
    
    if ((mouseXdist < mouseHighlightZone && mouseXdist > -mouseHighlightZone) && (mouseYdist < mouseHighlightZone && mouseYdist > -mouseHighlightZone))
    {
      if (!somethingHighlighted)
      {
        infoTemp.highlighted = true;
        somethingHighlighted = true;
      }
    }
    else
    {
      infoTemp.highlighted = false;
    }
  }
  
  //now check globally to see if nothing is highlighted
  boolean checkingGlobal = false;
  for (i = 0; i < searchNodes.size(); i++)
  {
    SearchNode searchTemp = (SearchNode) searchNodes.get(i);
    
    if (searchTemp.highlighted)
    {
      checkingGlobal = true;
    }
  }
  for (i = 0; i < infoNodes.length; i++)
  {
    InfoNode infoTemp = infoNodes[i];
    
    if (infoTemp.highlighted)
    {
      checkingGlobal = true;
    }
  }
  somethingHighlighted = checkingGlobal;
}

void mousePressed()
{
  int i = 0;
  for (i = 0; i < searchNodes.size(); i++)
  {
    SearchNode searchTemp = (SearchNode) searchNodes.get(i);
    
    if (searchTemp.highlighted)
    {
      searchTemp.difx = mouseX-searchTemp.location.x;
      searchTemp.dify = mouseY-searchTemp.location.y;
    }
  }
  for (i = 0; i < infoNodes.length; i++)
  {
    InfoNode infoTemp = infoNodes[i];
    
    if (infoTemp.highlighted)
    {
      try
      {
          java.awt.Desktop.getDesktop().browse(infoTemp.URIpage);
          //com.apple.eio.FileManager.openURL(infoTemp.URIpage.toString());
      }
      catch(Exception e)
      {
        println("browser cannot open");
      }
    }
  }
}

void mouseDragged()
{
  int i = 0;
  
  for (i = 0; i < searchNodes.size(); i++)
  {
    SearchNode searchTemp = (SearchNode) searchNodes.get(i);
    
    if (searchTemp.highlighted)
    {
      searchTemp.location.x = mouseX-searchTemp.difx;
      searchTemp.location.y = mouseY-searchTemp.dify;
    }
  }
}

void keyPressed()
{
  if (!threedee)
  {
    if ( ((key>='A')&&(key<='Z')) || ((key>='a')&&(key<='z')) || ((key>='0')&&(key<='9')) )
    {
      currentInput+= key;
    }
    //if ( (key==' ') )
    //{
    //  currentInput+= " ";
    //  println(currentInput);
    //}
    if ( (key==BACKSPACE) )
    {
      if (currentInput.length() > 0)
      {
        currentInput = currentInput.substring(0,currentInput.length()-1);
      }
    }
    if ( (key==DELETE) )
    {
      int i = 0;
      for (i = 0; i < searchNodes.size(); i++)
      {
        SearchNode temp = (SearchNode) searchNodes.get(i);
        if (temp.highlighted)
        {
          //DELETE IT
          
          for (int j = 0; j < temp.related.size(); j++)
          {
            InfoNode tempa = (InfoNode) temp.related.get(j);
            for (int k = 0; k < tempa.related.size(); k++)
            {
              SearchNode tempb = (SearchNode) tempa.related.get(k);
              if (tempb.word.equals(temp.word))
              {
                tempa.related.remove(k);
                j = -1;
                k = -1;
              }
            } 
          }
        
          for (int j = 0; j < infoNodes.length; j++)
          {
            InfoNode tempa = (InfoNode) infoNodes[j];
            for (int k = 0; k < tempa.related.size(); k++)
            {
              SearchNode tempb = (SearchNode) tempa.related.get(k);
              if (tempb.word.equals(temp.word))
              {
                tempa.related.remove(k);
                j = -1;
                k = -1;
              }
            }
          }
          
          searchNodes.remove(i);
          i = -1;
        }
      }
      for (int j = 0; j < searchNodes.size(); j++)
      {
            SearchNode tempa = (SearchNode) searchNodes.get(j);
            tempa.update();
      }
    }
    if ( (key=='=') )
    {
      for (int i = 0; i < searchNodes.size(); i++)
      {
        SearchNode tempa = (SearchNode) searchNodes.get(i);
        tempa.boost();
      }
      threedee = true;
    }
    if ( (key==ENTER) || (key==RETURN) )
    {
      if (currentInput.length() > 0)
      {
        //check if it already exists
        int abc = 0;
        boolean alreadyExists = false;
        for (abc = 0; abc < searchNodes.size(); abc++)
        {
          SearchNode blarh = (SearchNode) searchNodes.get(abc);
          if (blarh.word.equals(currentInput))
          {
            alreadyExists = true;
          }
        }
        if (!alreadyExists)
        {
          SearchNode temp = (new SearchNode(random(100,900), random(100,600),currentInput));
          Shockwave youWaShock = new Shockwave(temp.location.x, temp.location.y, temp.location.z);
          shockwaves.add(youWaShock);
          temp.update();
          searchNodes.add(temp);
          int i = 0;
          for (i = 0; i < searchNodes.size(); i++)
          {
            SearchNode tempTest = (SearchNode) searchNodes.get(i);
            int j = 0;
            for (j = 0; j < tempTest.related.size(); j++)
            {
              InfoNode tempInfo = (InfoNode) tempTest.related.get(j);
            if (tempInfo.related.size() > 1)
              {
                tempTest.related.remove(j);
                j = -1;
              }
            }
          }
          for (i = 0; i < searchNodes.size(); i++)
          {
            SearchNode tempBlah = (SearchNode) searchNodes.get(i);
            tempBlah.reconfigDesires();
          }
        }
        currentInput = "";
        createSound.play(1);
      }
    }
  }
  else
  {
    if ( (key=='=') )
    {
      for (int i = 0; i < searchNodes.size(); i++)
      {
        SearchNode tempa = (SearchNode) searchNodes.get(i);
        tempa.unboost();
      }
      threedee = false;
      camerax = 0;
      cameray = 0;
      cameraz = 0;
      cameraposx = 0;
      cameraposy = 0;
      cameraposz = 0;
    }
    if ( (key=='a') )
    {
      cameraposx = cameraposx + camspeed;
    }
    if ( (key=='z') )
    {
      cameraposx = cameraposx - camspeed;
    }
    if ( (key=='s') )
    {
      cameraposy = cameraposy + camspeed;
    }
    if ( (key=='x') )
    {
      cameraposy = cameraposy - camspeed;
    }
    if ( (key=='d') )
    {
      cameraposz = cameraposz + camspeed;
    }
    if ( (key=='c') )
    {
      cameraposz = cameraposz - camspeed;
    }
    if ( (key=='u') )
    {
      camerax = camerax + 1;
    }
    if ( (key=='j') )
    {
      camerax = camerax - 1;
    }
    if ( (key=='i') )
    {
      cameray = cameray + 1;
    }
    if ( (key=='k') )
    {
      cameray = cameray - 1;
    }
    if ( (key=='o') )
    {
      cameraz = cameraz + 1;
    }
    if ( (key=='l') )
    {
      cameraz = cameraz - 1;
    }
  }
  //outside of the loop, since mode can be changed 3d or 2d
  if ( (key == '-') )
  {
    currentMode++;
    dynamicColorz = true;
    if (currentMode == 2)
    {
      dynamicColorz = false;
    }
    if (currentMode > 2)
    {
      currentMode = 1;
    }
  }
  if ( (key == '[' ) )
  {
    pathing = !pathing;
  }
  if ( (key == ']' ) )
  {
    diagonalText = !diagonalText;
  }
}

void displayAllShockwaves()
{
  int i = 0;
  int theSize = shockwaves.size();
  for (i = 0; i < theSize; i++)
  {
    Shockwave temp = (Shockwave) shockwaves.get(i);
    temp.step();
  }
  for (i = 0; i < shockwaves.size(); i++)
  {
    Shockwave temp = (Shockwave) shockwaves.get(i);
    if (temp.alive)
    {
      //do nothing
    }
    else
    {
      shockwaves.remove(i);
      i = -1;
    }
  }
}

void displayAllInfoNodes()
{
  int i = 0;
  for (i = 0; i < infoNodes.length; i++)
  {
    infoNodes[i].step();
  }
}

void displayAllSearchNodes()
{
  int i = 0;
  int theSize = searchNodes.size();
  for (i = 0; i < theSize; i++)
  {
    SearchNode temp = (SearchNode) searchNodes.get(i);
    temp.step();
  }
}

void addInfoNodes()
{
  //int i = 0;
  //for (i = 0; i < infoNodes.length; i++)
  //{
  //  infoNodes[i] = new InfoNode(random(100,900),random(100,600), Integer.toString(i), Integer.toString(i) + ".txt");
  //}
  
  
  infoNodes[0] = new InfoNode("Jack Shephard", "/Lostpedia/001Jack_Shepard.txt", "http://lostpedia.wikia.com/wiki/Jack_Shephard");
  infoNodes[1] = new InfoNode("Kate Austen", "/Lostpedia/002Kate_Austen.txt", "http://lostpedia.wikia.com/wiki/Kate_Austen");
  infoNodes[2] = new InfoNode("James Sawyer Ford", "/Lostpedia/003James_Sawyer_Ford.txt", "http://lostpedia.wikia.com/wiki/James_%22Sawyer%22_Ford");
  infoNodes[3] = new InfoNode("Hugo Hurley Reyes", "/Lostpedia/004Hugo_Hurley_Reyes.txt", "http://lostpedia.wikia.com/wiki/Hugo_%22Hurley%22_Reyes");
  infoNodes[4] = new InfoNode("John Locke", "/Lostpedia/005John_Locke.txt", "http://lostpedia.wikia.com/wiki/John_Locke");
  infoNodes[5] = new InfoNode("Sayid Jarrah", "/Lostpedia/006Sayid_Jarrah.txt", "http://lostpedia.wikia.com/wiki/Sayid_Jarrah");
  infoNodes[6] = new InfoNode("Jin-Soo Kwon", "/Lostpedia/007Jin-Soo_Kwon.txt", "http://lostpedia.wikia.com/wiki/Jin-Soo_Kwon");
  infoNodes[7] = new InfoNode("Sun-Hwa Kwon", "/Lostpedia/008Sun-Hwa_Kwon.txt", "http://lostpedia.wikia.com/wiki/Sun-Hwa_Kwon");
  infoNodes[8] = new InfoNode("Charlie Pace", "/Lostpedia/009Charlie_Pace.txt", "http://lostpedia.wikia.com/wiki/Charlie_Pace");
  infoNodes[9] = new InfoNode("Claire Littleton", "/Lostpedia/010Claire_Littleton.txt", "http://lostpedia.wikia.com/wiki/Claire_Littleton");
  infoNodes[10] = new InfoNode("Michael Dawson", "/Lostpedia/011Michael_Dawson.txt", "http://lostpedia.wikia.com/wiki/Michael_Dawson");
  infoNodes[11] = new InfoNode("Benjamin Linus", "/Lostpedia/012Benjamin_Linus.txt", "http://lostpedia.wikia.com/wiki/Benjamin_Linus");
  infoNodes[12] = new InfoNode("Juliet Burke", "/Lostpedia/013Juliet_Burke.txt", "http://lostpedia.wikia.com/wiki/Juliet_Burke");
  infoNodes[13] = new InfoNode("Desmond Hume", "/Lostpedia/014Desmond_Hume.txt", "http://lostpedia.wikia.com/wiki/Desmond_Hume");
  infoNodes[14] = new InfoNode("Walt Lloyd", "/Lostpedia/015Walt_Lloyd.txt", "http://lostpedia.wikia.com/wiki/Walt_Lloyd");
  infoNodes[15] = new InfoNode("Shannon Rutherford", "/Lostpedia/016Shannon_Rutherford.txt", "http://lostpedia.wikia.com/wiki/Shannon_Rutherford");
  infoNodes[16] = new InfoNode("Boone Carlyle", "/Lostpedia/017Boone_Carlyle.txt", "http://lostpedia.wikia.com/wiki/Boone_Carlyle");
  infoNodes[17] = new InfoNode("Ana Lucia Cortez", "/Lostpedia/018Ana_Lucia_Cortez.txt", "http://lostpedia.wikia.com/wiki/Ana_Lucia_Cortez");
  infoNodes[18] = new InfoNode("Eko", "/Lostpedia/019Eko.txt", "http://lostpedia.wikia.com/wiki/Eko");
  infoNodes[19] = new InfoNode("Elizabeth Libby Smith", "/Lostpedia/020Elizabeth_Libby_Smith.txt", "http://lostpedia.wikia.com/wiki/Elizabeth_%22Libby%22_Smith");
  infoNodes[20] = new InfoNode("Daniel Faraday", "/Lostpedia/021Daniel_Faraday.txt", "http://lostpedia.wikia.com/wiki/Daniel_Faraday");
  infoNodes[21] = new InfoNode("Charlotte Lewis", "/Lostpedia/022Charlotte_Lewis.txt", "http://lostpedia.wikia.com/wiki/Charlotte_Lewis");
  infoNodes[22] = new InfoNode("Miles Straume", "/Lostpedia/023Miles_Straume.txt", "http://lostpedia.wikia.com/wiki/Miles_Straume");
  infoNodes[23] = new InfoNode("Richard Alpert", "/Lostpedia/024Richard_Alpert.txt", "http://lostpedia.wikia.com/wiki/Richard_Alpert");
  infoNodes[24] = new InfoNode("Frank Lapidus", "/Lostpedia/025Frank_Lapidus.txt", "http://lostpedia.wikia.com/wiki/Frank_Lapidus");
  infoNodes[25] = new InfoNode("Ilana Verdansky", "/Lostpedia/026Ilana_Verdansky.txt", "http://lostpedia.wikia.com/wiki/Ilana");
  infoNodes[26] = new InfoNode("Nikki Fernandez", "/Lostpedia/027Nikki_Fernandez.txt", "http://lostpedia.wikia.com/wiki/Nikki_Fernandez");
  infoNodes[27] = new InfoNode("Paulo", "/Lostpedia/028Paulo.txt", "http://lostpedia.wikia.com/wiki/Paulo");
  infoNodes[28] = new InfoNode("Charles Widmore", "/Lostpedia/029Charles_Widmore.txt", "http://lostpedia.wikia.com/wiki/Charles_Widmore");
  infoNodes[29] = new InfoNode("Jacob", "/Lostpedia/030Jacob.txt", "http://lostpedia.wikia.com/wiki/Jacob");
  infoNodes[30] = new InfoNode("The Man In Black", "/Lostpedia/031The_Man_In_Black.txt", "http://lostpedia.wikia.com/wiki/The_Man_in_Black");
  infoNodes[31] = new InfoNode("Vincent", "/Lostpedia/032Vincent.txt", "http://lostpedia.wikia.com/wiki/Vincent");
  infoNodes[32] = new InfoNode("Rose Nadler", "/Lostpedia/033Rose_Nadler.txt", "http://lostpedia.wikia.com/wiki/Rose_Nadler");
  infoNodes[33] = new InfoNode("Penelope Penny Hume", "/Lostpedia/034Penelope_Penny_Hume.txt", "http://lostpedia.wikia.com/wiki/Penelope_Hume");
  infoNodes[34] = new InfoNode("Naomi Dorrit", "/Lostpedia/035Naomi_Dorrit.txt", "http://lostpedia.wikia.com/wiki/Naomi_Dorrit");
  infoNodes[35] = new InfoNode("Martin Keamy", "/Lostpedia/036Martin_Keamy.txt", "http://lostpedia.wikia.com/wiki/Martin_Keamy");
  infoNodes[36] = new InfoNode("Leslie Arzt", "/Lostpedia/037Leslie_Arzt.txt", "http://lostpedia.wikia.com/wiki/Leslie_Arzt");
  infoNodes[37] = new InfoNode("Kelvin Inman", "/Lostpedia/038Kelvin_Inman.txt", "http://lostpedia.wikia.com/wiki/Kelvin_Inman");
  infoNodes[38] = new InfoNode("Eloise Hawking", "/Lostpedia/039Eloise_Hawking.txt", "http://lostpedia.wikia.com/wiki/Eloise_Hawking");
  infoNodes[39] = new InfoNode("Danielle Rousseau", "/Lostpedia/040Danielle_Rousseau.txt", "http://lostpedia.wikia.com/wiki/Danielle_Rousseau");
  infoNodes[40] = new InfoNode("Cindy Chandler", "/Lostpedia/041Cindy_Chandler.txt", "http://lostpedia.wikia.com/wiki/Cindy_Chandler");
  infoNodes[41] = new InfoNode("Caesar", "/Lostpedia/042Caesar.txt", "http://lostpedia.wikia.com/wiki/Caesar");
  infoNodes[42] = new InfoNode("Bernard Nadler", "/Lostpedia/043Bernard_Nadler.txt", "http://lostpedia.wikia.com/wiki/Bernard_Nadler");
  infoNodes[43] = new InfoNode("Aaron Littleton", "/Lostpedia/044Aaron_Littleton.txt", "http://lostpedia.wikia.com/wiki/Aaron_Littleton");
  infoNodes[44] = new InfoNode("Pilot Part 1", "/Lostpedia/045Pilot_Part_1.txt", "http://lostpedia.wikia.com/wiki/Pilot,_Part_1");
  infoNodes[45] = new InfoNode("Pilot Part 2", "/Lostpedia/046Pilot_Part_2.txt", "http://lostpedia.wikia.com/wiki/Pilot,_Part_2");
  infoNodes[46] = new InfoNode("Tabula Rasa", "/Lostpedia/047Tabula_Rasa.txt", "http://lostpedia.wikia.com/wiki/Tabula_Rasa");
  infoNodes[47] = new InfoNode("Walkabout", "/Lostpedia/048Walkabout.txt", "http://lostpedia.wikia.com/wiki/Walkabout");
  infoNodes[48] = new InfoNode("White Rabbit", "/Lostpedia/049White_Rabbit.txt", "http://lostpedia.wikia.com/wiki/White_Rabbit");
  infoNodes[49] = new InfoNode("House of the Rising Sun", "/Lostpedia/050House_Of_The_Rising_Sun.txt", "http://lostpedia.wikia.com/wiki/House_of_the_Rising_Sun");
  infoNodes[50] = new InfoNode("The Moth", "/Lostpedia/051The_Moth.txt", "http://lostpedia.wikia.com/wiki/The_Moth");
  infoNodes[51] = new InfoNode("Confidence Man", "/Lostpedia/052Confidence_Man.txt", "http://lostpedia.wikia.com/wiki/Confidence_Man");
  infoNodes[52] = new InfoNode("Solitary", "/Lostpedia/053Solitary.txt", "http://lostpedia.wikia.com/wiki/Solitary");
  infoNodes[53] = new InfoNode("Raised By Another", "/Lostpedia/054Raised_By_Another.txt", "http://lostpedia.wikia.com/wiki/Raised_by_Another");
  infoNodes[54] = new InfoNode("All the Best Cowboys Have Daddy Issues", "/Lostpedia/055All_The_Best_Cowboys_Have_Daddy_Issues.txt", "http://lostpedia.wikia.com/wiki/All_the_Best_Cowboys_Have_Daddy_Issues");
  infoNodes[55] = new InfoNode("Whatever the Case May Be", "/Lostpedia/056Whatever_The_Case_May_Be.txt", "http://lostpedia.wikia.com/wiki/Whatever_the_Case_May_Be");
  infoNodes[56] = new InfoNode("Hearts and Minds", "/Lostpedia/057Hearts_And_Minds.txt", "http://lostpedia.wikia.com/wiki/Hearts_and_Minds");
  infoNodes[57] = new InfoNode("Special", "/Lostpedia/058Special.txt", "http://lostpedia.wikia.com/wiki/Special");
  infoNodes[58] = new InfoNode("Homecoming", "/Lostpedia/059Homecoming.txt", "http://lostpedia.wikia.com/wiki/Homecoming");
  infoNodes[59] = new InfoNode("Outlaws", "/Lostpedia/060Outlaws.txt", "http://lostpedia.wikia.com/wiki/Outlaws");
  infoNodes[60] = new InfoNode("...In Translation", "/Lostpedia/061In_Translation.txt", "http://lostpedia.wikia.com/wiki/...In_Translation");
  infoNodes[61] = new InfoNode("Numbers", "/Lostpedia/062Numbers.txt", "http://lostpedia.wikia.com/wiki/Numbers_%28episode%29");
  infoNodes[62] = new InfoNode("Deus Ex Machina", "/Lostpedia/063Deus_Ex_Machina.txt", "http://lostpedia.wikia.com/wiki/Deus_Ex_Machina");
  infoNodes[63] = new InfoNode("Do No Harm", "/Lostpedia/064Do_No_Harm.txt", "http://lostpedia.wikia.com/wiki/Do_No_Harm");
  infoNodes[64] = new InfoNode("The Greater Good", "/Lostpedia/065The_Greater_Good.txt", "http://lostpedia.wikia.com/wiki/The_Greater_Good");
  infoNodes[65] = new InfoNode("Born To Run", "/Lostpedia/066Born_To_Run.txt", "http://lostpedia.wikia.com/wiki/Born_to_Run");
  infoNodes[66] = new InfoNode("Exodus Part 1", "/Lostpedia/067Exodus_Part_1.txt", "http://lostpedia.wikia.com/wiki/Exodus,_Part_1");
  infoNodes[67] = new InfoNode("Exodus Part 2", "/Lostpedia/068Exodus_Part_2.txt", "http://lostpedia.wikia.com/wiki/Exodus,_Part_2");
  infoNodes[68] = new InfoNode("Man of Science, Man of Faith", "/Lostpedia/069Man_Of_Science_Man_Of_Faith.txt", "http://lostpedia.wikia.com/wiki/Man_of_Science,_Man_of_Faith");
  infoNodes[69] = new InfoNode("Adrift", "/Lostpedia/070Adrift.txt", "http://lostpedia.wikia.com/wiki/Adrift");
  infoNodes[70] = new InfoNode("Orientation", "/Lostpedia/071Orientation.txt", "http://lostpedia.wikia.com/wiki/Orientation");
  infoNodes[71] = new InfoNode("Everybody Hates Hugo", "/Lostpedia/072Everybody_Hates_Hugo.txt", "http://lostpedia.wikia.com/wiki/Everybody_Hates_Hugo");
  infoNodes[72] = new InfoNode("...And Found", "/Lostpedia/073And_Found.txt", "http://lostpedia.wikia.com/wiki/...And_Found");
  infoNodes[73] = new InfoNode("Abandoned", "/Lostpedia/074Abandoned.txt", "http://lostpedia.wikia.com/wiki/Abandoned");
  infoNodes[74] = new InfoNode("The Other 48 Days", "/Lostpedia/075The_Other_48_Days.txt", "http://lostpedia.wikia.com/wiki/The_Other_48_Days");
  infoNodes[75] = new InfoNode("Collision", "/Lostpedia/076Collision.txt", "http://lostpedia.wikia.com/wiki/Collision");
  infoNodes[76] = new InfoNode("What Kate Did", "/Lostpedia/077What_Kate_Did.txt", "http://lostpedia.wikia.com/wiki/What_Kate_Did");
  infoNodes[77] = new InfoNode("The 23rd Psalm", "/Lostpedia/078The_23rd_Psalm.txt", "http://lostpedia.wikia.com/wiki/The_23rd_Psalm");
  infoNodes[78] = new InfoNode("The Hunting Party", "/Lostpedia/079The_Hunting_Party.txt", "http://lostpedia.wikia.com/wiki/The_Hunting_Party");
  infoNodes[79] = new InfoNode("Fire + Water", "/Lostpedia/080Fire_+_Water.txt", "http://lostpedia.wikia.com/wiki/Fire_%2B_Water");
  infoNodes[80] = new InfoNode("The Long Con", "/Lostpedia/081The_Long_Con.txt", "http://lostpedia.wikia.com/wiki/The_Long_Con");
  infoNodes[81] = new InfoNode("One Of Them", "/Lostpedia/082One_Of_Them.txt", "http://lostpedia.wikia.com/wiki/One_of_Them");
  infoNodes[82] = new InfoNode("Maternity Leave", "/Lostpedia/083Maternity_Leave.txt", "http://lostpedia.wikia.com/wiki/Maternity_Leave");
  infoNodes[83] = new InfoNode("The Whole Truth", "/Lostpedia/084The_Whole_Truth.txt", "http://lostpedia.wikia.com/wiki/The_Whole_Truth");
  infoNodes[84] = new InfoNode("Lockdown", "/Lostpedia/085Lockdown.txt", "http://lostpedia.wikia.com/wiki/Lockdown");
  infoNodes[85] = new InfoNode("Dave", "/Lostpedia/086Dave.txt", "http://lostpedia.wikia.com/wiki/Dave");
  infoNodes[86] = new InfoNode("S.O.S.", "/Lostpedia/087SOS.txt", "http://lostpedia.wikia.com/wiki/S.O.S.");
  infoNodes[87] = new InfoNode("Two for the Road", "/Lostpedia/088Two_For_The_Road.txt", "http://lostpedia.wikia.com/wiki/Two_for_the_Road");
  infoNodes[88] = new InfoNode("?", "/Lostpedia/089Question_Mark.txt", "http://lostpedia.wikia.com/wiki/%3F");
  infoNodes[89] = new InfoNode("Three Minutes", "/Lostpedia/090Three_Minutes.txt", "http://lostpedia.wikia.com/wiki/Three_Minutes");
  infoNodes[90] = new InfoNode("Live Together, Die Alone", "/Lostpedia/091Live_Together_Die_Alone.txt", "http://lostpedia.wikia.com/wiki/Live_Together,_Die_Alone,_Part_1");
  
  infoNodes[91] = new InfoNode("A Tale of Two Cities", 92);
  infoNodes[92] = new InfoNode("The Glass Ballerina", 93);
  infoNodes[93] = new InfoNode("Further Instructions", 94);
  infoNodes[94] = new InfoNode("Every Man for Himself", 95);
  infoNodes[95] = new InfoNode("The Cost of Living", 96);
  infoNodes[96] = new InfoNode("I Do", 97);
  infoNodes[97] = new InfoNode("Not in Portland", 98);
  infoNodes[98] = new InfoNode("Flashes Before Your Eyes", 99);
  infoNodes[99] = new InfoNode("Stranger in a Strange Land", 100);
  infoNodes[100] = new InfoNode("Tricia Tanaka Is Dead", 101);
  infoNodes[101] = new InfoNode("Enter 77", 102);
  infoNodes[102] = new InfoNode("Par Avion", 103);
  infoNodes[103] = new InfoNode("The Man from Tallahassee", 104);
  infoNodes[104] = new InfoNode("Exposé", 105);
  infoNodes[105] = new InfoNode("Left Behind", 106);
  infoNodes[106] = new InfoNode("One of Us", 107);
  infoNodes[107] = new InfoNode("Catch-22", 108);
  infoNodes[108] = new InfoNode("D.O.C.", 109);
  infoNodes[109] = new InfoNode("The Brig", 110);
  infoNodes[110] = new InfoNode("The Man Behind the Curtain", 111);
  infoNodes[111] = new InfoNode("Greatest Hits", 112);
  infoNodes[112] = new InfoNode("Through the Looking Glass", 113);
  infoNodes[113] = new InfoNode("The Beginning of the End", 114);
  infoNodes[114] = new InfoNode("Confirmed Dead", 115);
  infoNodes[115] = new InfoNode("The Economist", 116);
  infoNodes[116] = new InfoNode("Eggtown", 117);
  infoNodes[117] = new InfoNode("The Constant", 118);
  infoNodes[118] = new InfoNode("The Other Woman", 119);
  infoNodes[119] = new InfoNode("Ji Yeon", 120);
  infoNodes[120] = new InfoNode("Meet Kevin Johnson", 121);
  infoNodes[121] = new InfoNode("The Shape of Things to Come", 122);
  infoNodes[122] = new InfoNode("Something Nice Back Home", 123);
  infoNodes[123] = new InfoNode("Cabin Fever", 124);
  infoNodes[124] = new InfoNode("There's No Place Like Home, Part 1", 125);
  infoNodes[125] = new InfoNode("There's No Place Like Home, Part 2", 126);
  infoNodes[126] = new InfoNode("Because You Left", 127);
  infoNodes[127] = new InfoNode("The Lie", 128);
  infoNodes[128] = new InfoNode("Jughead", 129);
  infoNodes[129] = new InfoNode("The Little Prince", 130);
  infoNodes[130] = new InfoNode("This Place Is Death", 131);
  infoNodes[131] = new InfoNode("316", 132);
  infoNodes[132] = new InfoNode("The Life and Death of Jeremy Bentham", 133);
  infoNodes[133] = new InfoNode("LaFleur", 134);
  infoNodes[134] = new InfoNode("Namaste", 135);
  infoNodes[135] = new InfoNode("He's Our You", 136);
  infoNodes[136] = new InfoNode("Whatever Happened, Happened", 137);
  infoNodes[137] = new InfoNode("Dead Is Dead", 138);
  infoNodes[138] = new InfoNode("Some Like It Hoth", 139);
  infoNodes[139] = new InfoNode("The Variable", 140);
  infoNodes[140] = new InfoNode("Follow the Leader", 141);
  infoNodes[141] = new InfoNode("The Incident", 142);
  infoNodes[142] = new InfoNode("Adam and Eve", 143);
  infoNodes[143] = new InfoNode("Black Rock", 144);
  infoNodes[144] = new InfoNode("Blast_door_map", 145);
  infoNodes[145] = new InfoNode("Candidates", 146);
  infoNodes[146] = new InfoNode("DHARMA Initiative", 147);
  infoNodes[147] = new InfoNode("Discharge", 148);
  infoNodes[148] = new InfoNode("Flight 815", 149);
  infoNodes[149] = new InfoNode("Hanso Foundation", 150);
  infoNodes[150] = new InfoNode("Healing properties", 151);
  infoNodes[151] = new InfoNode("Hieroglyphics", 152);
  infoNodes[152] = new InfoNode("The Island", 153);
  
}

//class interNode
//{
//  PVector location;
//  SearchNode one;
//  SearchNode two;
//}

class SearchNode
{
  PVector location;
  String word;
  boolean highlighted;
  float difx;
  float dify;
  ArrayList related;
  
  SearchNode(float x, float y, String wrd)
  {
    this.location = new PVector(x, y, 0);
    this.word = wrd;
    this.highlighted = false;
    this.related = new ArrayList();
  }
  
  void step()
  {
    drawLinesToNodes();
    drawSelf();
    reconfigDesires();
  }
  
  void boost()
  {
    this.location.z = this.location.z + (word.hashCode()%500);
  }
  
  void unboost()
  {
    this.location.z = 0;
  }
  
  void drawLinesToNodes()
  {
    int i = 0;
    for (i = 0; i < related.size(); i++)
    {
      //stroke(255,0,0);
      //strokeWeight(1);
      InfoNode drawToFirst = (InfoNode) related.get(i);
      //line(this.location.x,this.location.y,drawToFirst.location.x,drawToFirst.location.y);
      if (i+1 >= related.size())
      {
        InfoNode drawToSecond = (InfoNode) related.get(0);
        //stroke(10,10,90);
        //strokeWeight(2+2);
        //line(drawToFirst.location.x,drawToFirst.location.y,drawToSecond.location.x,drawToSecond.location.y);
        if (dynamicColorz)
        {
          colorMode(HSB);
          int colorz = word.hashCode()%255;
          stroke(colorz, 200, 200);
          strokeWeight(3);
          line(drawToFirst.location.x,drawToFirst.location.y,drawToFirst.location.z,drawToSecond.location.x,drawToSecond.location.y,drawToSecond.location.z);
          colorMode(RGB);
        }
        else
        {
          stroke(25,25,162);
          strokeWeight(3);
          line(drawToFirst.location.x,drawToFirst.location.y,drawToFirst.location.z,drawToSecond.location.x,drawToSecond.location.y,drawToSecond.location.z);
        }
      }
      else
      {
        InfoNode drawToSecond = (InfoNode) related.get(i+1);
        //stroke(10,10,90);
        //strokeWeight(2+2);
        //line(drawToFirst.location.x,drawToFirst.location.y,drawToSecond.location.x,drawToSecond.location.y);
        if (dynamicColorz)
        {
          colorMode(HSB);
          int colorz = word.hashCode()%255;
          stroke(colorz, 200, 200);
          strokeWeight(3);
          line(drawToFirst.location.x,drawToFirst.location.y,drawToFirst.location.z,drawToSecond.location.x,drawToSecond.location.y,drawToSecond.location.z);
          colorMode(RGB);
        }
        else
        {
          stroke(25,25,162);
          strokeWeight(3);
          line(drawToFirst.location.x,drawToFirst.location.y,drawToFirst.location.z,drawToSecond.location.x,drawToSecond.location.y,drawToSecond.location.z);
        }
      }
    }
    noStroke();
  }
  
  void drawSelf()
  {
    noFill();
    if (this.highlighted == true)
    {
      fill(255,255,255,100);
    }
    stroke(255,240,220);
    strokeWeight(1);
    pushMatrix();
    translate(0,0,location.z);
    ellipse(location.x,location.y,23,23);
    popMatrix();
    noStroke();
    fill(220,80,120);
    textFont(questionFont);
    text("?", location.x+1,location.y+10,location.z);
    fill(255,255,255);
    textFont(searchFont);
    text(word, location.x,location.y+25, location.z);
  }
  
  void reconfigDesires()
  {
    int relatedSize = related.size();              
                    
                    if (relatedSize == 1)
                    {
                      InfoNode tempa = (InfoNode) related.get(0);
                      tempa.desiredLocation = new PVector(this.location.x, this.location.y+nodeDistance, this.location.z);
                    }
                    else if (relatedSize == 2)
                    {
                      InfoNode tempa = (InfoNode) related.get(0);
                      InfoNode tempb = (InfoNode) related.get(1);
                      tempa.desiredLocation = new PVector(this.location.x+nodeDistance, this.location.y, this.location.z);
                      tempb.desiredLocation = new PVector(this.location.x-nodeDistance, this.location.y, this.location.z);
                    }
                    else if (relatedSize == 3)
                    {
                      InfoNode tempa = (InfoNode) related.get(0);
                      InfoNode tempb = (InfoNode) related.get(1);
                      InfoNode tempc = (InfoNode) related.get(2);
                      tempa.desiredLocation = new PVector(this.location.x, this.location.y+nodeDistance, this.location.z);
                      tempb.desiredLocation = new PVector(this.location.x+((sqrt(3)/2.0)*nodeDistance), this.location.y+((-1.0/2)*nodeDistance), this.location.z);
                      tempc.desiredLocation = new PVector(this.location.x+((-sqrt(3)/2.0)*nodeDistance), this.location.y+((-1.0/2)*nodeDistance), this.location.z); 
                    }
                    else if (relatedSize == 4)
                    {
                      InfoNode tempa = (InfoNode) related.get(0);
                      InfoNode tempb = (InfoNode) related.get(1);
                      InfoNode tempc = (InfoNode) related.get(2);
                      InfoNode tempd = (InfoNode) related.get(3);
                      tempa.desiredLocation = new PVector(this.location.x, this.location.y+nodeDistance, this.location.z);
                      tempb.desiredLocation = new PVector(this.location.x+nodeDistance, this.location.y, this.location.z);
                      tempc.desiredLocation = new PVector(this.location.x, this.location.y-nodeDistance, this.location.z);
                      tempd.desiredLocation = new PVector(this.location.x-nodeDistance, this.location.y, this.location.z);
                    }
                    else if (relatedSize == 5)
                    {
                      InfoNode tempa = (InfoNode) related.get(0);
                      InfoNode tempb = (InfoNode) related.get(1);
                      InfoNode tempc = (InfoNode) related.get(2);
                      InfoNode tempd = (InfoNode) related.get(3);
                      InfoNode tempe = (InfoNode) related.get(4);
                      tempa.desiredLocation = new PVector(this.location.x, this.location.y+nodeDistance, this.location.z);
                      tempb.desiredLocation = new PVector(this.location.x+nodeDistance, this.location.y, this.location.z);
                      tempc.desiredLocation = new PVector(this.location.x+((sqrt(2)/2)*nodeDistance), this.location.y+((-sqrt(2)/2)*nodeDistance), this.location.z);
                      tempd.desiredLocation = new PVector(this.location.x+((-sqrt(2)/2)*nodeDistance), this.location.y+((-sqrt(2)/2)*nodeDistance), this.location.z);
                      tempe.desiredLocation = new PVector(this.location.x-nodeDistance, this.location.y, this.location.z);
                    }
                    else if (relatedSize == 6)
                    {
                      InfoNode tempa = (InfoNode) related.get(0);
                      InfoNode tempb = (InfoNode) related.get(1);
                      InfoNode tempc = (InfoNode) related.get(2);
                      InfoNode tempd = (InfoNode) related.get(3);
                      InfoNode tempe = (InfoNode) related.get(4);
                      InfoNode tempf = (InfoNode) related.get(5);
                      tempa.desiredLocation = new PVector(this.location.x+((1.0/2)*nodeDistance), this.location.y+((sqrt(3)/2)*nodeDistance), this.location.z);
                      tempb.desiredLocation = new PVector(this.location.x+nodeDistance, this.location.y, this.location.z);
                      tempc.desiredLocation = new PVector(this.location.x+((1.0/2)*nodeDistance), this.location.y+((-sqrt(3)/2)*nodeDistance), this.location.z);
                      tempd.desiredLocation = new PVector(this.location.x+((-1.0/2)*nodeDistance), this.location.y+((-sqrt(3)/2)*nodeDistance), this.location.z);
                      tempe.desiredLocation = new PVector(this.location.x-nodeDistance, this.location.y, this.location.z);
                      tempf.desiredLocation = new PVector(this.location.x+((-1.0/2)*nodeDistance), this.location.y+((sqrt(3)/2)*nodeDistance), this.location.z);
                      //tempa.desiredLocation = new PVector(this.location.x, this.location.y+nodeDistance, this.location.z);
                      //tempb.desiredLocation = new PVector(this.location.x+((sqrt(3)/2.0)*nodeDistance), this.location.y+((1.0/2)*nodeDistance), this.location.z);
                      //tempc.desiredLocation = new PVector(this.location.x+((sqrt(3)/2.0)*nodeDistance), this.location.y+((-1.0/2)*nodeDistance), this.location.z);
                      //tempd.desiredLocation = new PVector(this.location.x, this.location.y-nodeDistance, this.location.z);
                      //tempe.desiredLocation = new PVector(this.location.x+((-sqrt(3)/2.0)*nodeDistance), this.location.y+((-1.0/2)*nodeDistance), this.location.z);
                      //tempf.desiredLocation = new PVector(this.location.x+((-sqrt(3)/2.0)*nodeDistance), this.location.y+((1.0/2)*nodeDistance), this.location.z);
                    }
                    else if (relatedSize == 7)
                    {
                      InfoNode tempa = (InfoNode) related.get(0);
                      InfoNode tempb = (InfoNode) related.get(1);
                      InfoNode tempc = (InfoNode) related.get(2);
                      InfoNode tempd = (InfoNode) related.get(3);
                      InfoNode tempe = (InfoNode) related.get(4);
                      InfoNode tempf = (InfoNode) related.get(5);
                      InfoNode tempg = (InfoNode) related.get(6);
                      tempa.desiredLocation = new PVector(this.location.x, this.location.y+nodeDistance, this.location.z);
                      tempb.desiredLocation = new PVector(this.location.x+((sqrt(3)/2.0)*nodeDistance), this.location.y+((1.0/2)*nodeDistance), this.location.z);
                      tempc.desiredLocation = new PVector(this.location.x+((sqrt(3)/2.0)*nodeDistance), this.location.y+((-1.0/2)*nodeDistance), this.location.z);
                      tempd.desiredLocation = new PVector(this.location.x+((1.0/2)*nodeDistance), this.location.y+((-sqrt(3)/2.0)*nodeDistance), this.location.z);
                      tempe.desiredLocation = new PVector(this.location.x+((-1.0/2)*nodeDistance), this.location.y+((-sqrt(3)/2.0)*nodeDistance), this.location.z);
                      tempf.desiredLocation = new PVector(this.location.x+((-sqrt(3)/2.0)*nodeDistance), this.location.y+((-1.0/2)*nodeDistance), this.location.z);
                      tempg.desiredLocation = new PVector(this.location.x+((-sqrt(3)/2.0)*nodeDistance), this.location.y+((1.0/2)*nodeDistance), this.location.z);
                    }
                    else if (relatedSize == 8)
                    {
                      InfoNode tempa = (InfoNode) related.get(0);
                      InfoNode tempb = (InfoNode) related.get(1);
                      InfoNode tempc = (InfoNode) related.get(2);
                      InfoNode tempd = (InfoNode) related.get(3);
                      InfoNode tempe = (InfoNode) related.get(4);
                      InfoNode tempf = (InfoNode) related.get(5);
                      InfoNode tempg = (InfoNode) related.get(6);
                      InfoNode temph = (InfoNode) related.get(7);
                      tempa.desiredLocation = new PVector(this.location.x+((1.0/2)*nodeDistance), this.location.y+((sqrt(3)/2.0)*nodeDistance), this.location.z);
                      tempb.desiredLocation = new PVector(this.location.x+((sqrt(3)/2.0)*nodeDistance), this.location.y+((1.0/2)*nodeDistance), this.location.z);
                      tempc.desiredLocation = new PVector(this.location.x+((sqrt(3)/2.0)*nodeDistance), this.location.y+((-1.0/2)*nodeDistance), this.location.z);
                      tempd.desiredLocation = new PVector(this.location.x+((1.0/2)*nodeDistance), this.location.y+((-sqrt(3)/2.0)*nodeDistance), this.location.z);
                      tempe.desiredLocation = new PVector(this.location.x+((-1.0/2)*nodeDistance), this.location.y+((-sqrt(3)/2.0)*nodeDistance), this.location.z);
                      tempf.desiredLocation = new PVector(this.location.x+((-sqrt(3)/2.0)*nodeDistance), this.location.y+((-1.0/2)*nodeDistance), this.location.z);
                      tempg.desiredLocation = new PVector(this.location.x+((-sqrt(3)/2.0)*nodeDistance), this.location.y+((1.0/2)*nodeDistance), this.location.z);
                      temph.desiredLocation = new PVector(this.location.x+((-1.0/2)*nodeDistance), this.location.y+((sqrt(3)/2.0)*nodeDistance), this.location.z);
                      //tempa.desiredLocation = new PVector(this.location.x, this.location.y+nodeDistance, this.location.z);
                      //tempb.desiredLocation = new PVector(this.location.x+((sqrt(2)/2)*nodeDistance), this.location.y+((sqrt(2)/2)*nodeDistance), this.location.z);
                      //tempc.desiredLocation = new PVector(this.location.x+nodeDistance, this.location.y, this.location.z);
                      //tempd.desiredLocation = new PVector(this.location.x+((sqrt(2)/2)*nodeDistance), this.location.y+((-sqrt(2)/2)*nodeDistance), this.location.z);
                      //tempe.desiredLocation = new PVector(this.location.x, this.location.y-nodeDistance, this.location.z);
                      //tempf.desiredLocation = new PVector(this.location.x+((-sqrt(2)/2)*nodeDistance), this.location.y+((-sqrt(2)/2)*nodeDistance), this.location.z);
                      //tempg.desiredLocation = new PVector(this.location.x-nodeDistance, this.location.y, this.location.z);
                      //temph.desiredLocation = new PVector(this.location.x+((-sqrt(2)/2)*nodeDistance), this.location.y+((sqrt(2)/2)*nodeDistance), this.location.z);
                    }
  }
  
  void update()
  {
    int i = 0;
    PriorityQueue priQ = new PriorityQueue(10, new InfoNodeComparator(word));
    for (i = 0; i < infoNodes.length; i++)
    {
      InfoNode tempo = infoNodes[i];
      if (tempo.wordMap.containsKey(word))
      {
        priQ.add(tempo);
        //remember to only put largest in later
        //if (related.size() < 8)
        //{
        //  related.add(tempo);
        //  tempo.related.add(this);
        //}
      }
    }
    
    //now that it's filled let's get em
    int timez = 8;
    if (8 > priQ.size())
    {
      timez = priQ.size();
    }
    for (i = 0; i < timez; i++)
    {
      InfoNode bah = (InfoNode) priQ.poll();
      if (related.contains(bah))
      {
      }
      else
      {
        if (bah.related.size() > 1)
        {
        }
        else
        {
          related.add(bah);
        }
      }
      if (bah.related.contains(this))
      {
      }
      else
      {
        bah.related.add(this);
      }
    }
    //reconfigDesires();
  }
}




class Shockwave
{
  PVector location;
  boolean alive;
  int currentFrame;
  
  Shockwave(float x, float y, float z)
  {
    this.location = new PVector(x, y, z);
    this.alive = true;
    this.currentFrame = 0;
  }
  
  void step()
  {
    drawSelf();
    currentFrame+=6;
    if (currentFrame > 254)
    {
      this.alive = false;
    }
  }
  
  void drawSelf()
  {
    noStroke();
    fill(255,255,255,255-currentFrame);
    ellipse(location.x,location.y, currentFrame+10,currentFrame+10);
    strokeWeight(3);
    stroke(255,255,255,255-(currentFrame*2));
    noFill();
    ellipse(location.x,location.y, (currentFrame*3)+10,(currentFrame*3)+10);
  }
  
}



class InfoNode
{
  PVector location;
  PVector desiredLocation;
  String word;
  HashMap wordMap;
  float xspeed;
  float yspeed;
  float zspeed;
  ArrayList related;
  String snapshot;
  int currentTarget;
  boolean highlighted;
  URI URIpage;
  
  InfoNode(String wrd, int num)
  {
    this.location = new PVector(random(spreadOut, width-spreadOut), random(spreadOut, height-spreadOut), 0);
    this.word = wrd;
    this.xspeed = 0;
    this.yspeed = 0;
    this.zspeed = 0;
    this.highlighted = false;
    //NEW
    String realword = wrd.replaceAll(" ", "_");
    //NEW
    try
    {
      //NEW
      this.URIpage = new URI("http://lostpedia.wikia.com/wiki/" + realword);
      //NEW
    }
    catch (Exception e)
    {
      println("URI error.");
    }
    //NEW
    String numero = null;
    if (num >= 100)
    {
      numero = "" + num + "";
    }
    else
    {
      numero = "0" + num + "";
    }
    String textFile = "/Lostpedia/" + numero + realword + ".txt";
    //NEW
    String[] tokens;
    String[] lines = loadStrings(textFile);
    String allText = join(lines, " ");
    tokens = splitTokens(allText, " ,.?!:;[]-()");
    
    int xxc = 0;
    for (xxc = 0; xxc < tokens.length; xxc++)
    {
      //get rid of quotation marks and parens and make them lowercase and do anyway with apostrophe?
      tokens[xxc] = tokens[xxc].replaceAll("\"", "");
      tokens[xxc] = tokens[xxc].replaceAll("'s", "");
      tokens[xxc] = tokens[xxc].toLowerCase();
    }
    wordMap = new HashMap();
    
    int i = 0;
    for (i = 0; i < tokens.length; i++)
    {
      if (wordMap.containsKey(tokens[i]))
      {
        Integer temp = (Integer) wordMap.get(tokens[i]);
        wordMap.put(tokens[i],(temp+1));
      }
      else
      {
        wordMap.put(tokens[i],1);
      }
    }
    //println(wordMap);
    snapshot = "";
    int snapshotSize = tokens.length/1000;
    int lineLength = (int) random(2,5);
    for (i = 0; i < snapshotSize; i++)
    {
      snapshot = snapshot + tokens[i] + " ";
      if (i%lineLength == 0 && i != 0)
      {
        snapshot = snapshot + "\n";
        lineLength = (int) random(2,5);
      }
    }
    this.related = new ArrayList();
    this.currentTarget = 0;
  }
  
  
  
  
  InfoNode(String wrd, String textFile, String url)
  {
    this.location = new PVector(random(spreadOut, width-spreadOut), random(spreadOut, height-spreadOut), 0);
    this.word = wrd;
    this.xspeed = 0;
    this.yspeed = 0;
    this.zspeed = 0;
    this.highlighted = false;
    try
    {
      this.URIpage = new URI(url);
    }
    catch (Exception e)
    {
      println("URI error.");
    }
    
    String[] tokens;
    String[] lines = loadStrings(textFile);
    String allText = join(lines, " ");
    tokens = splitTokens(allText, " ,.?!:;[]-()");
    
    int xxc = 0;
    for (xxc = 0; xxc < tokens.length; xxc++)
    {
      //get rid of quotation marks and parens and make them lowercase and do anyway with apostrophe?
      tokens[xxc] = tokens[xxc].replaceAll("\"", "");
      tokens[xxc] = tokens[xxc].replaceAll("'s", "");
      tokens[xxc] = tokens[xxc].toLowerCase();
    }
    wordMap = new HashMap();
    
    int i = 0;
    for (i = 0; i < tokens.length; i++)
    {
      if (wordMap.containsKey(tokens[i]))
      {
        Integer temp = (Integer) wordMap.get(tokens[i]);
        wordMap.put(tokens[i],(temp+1));
      }
      else
      {
        wordMap.put(tokens[i],1);
      }
    }
    //println(wordMap);
    snapshot = "";
    int snapshotSize = tokens.length/1000;
    int lineLength = (int) random(2,5);
    for (i = 0; i < snapshotSize; i++)
    {
      snapshot = snapshot + tokens[i] + " ";
      if (i%lineLength == 0 && i != 0)
      {
        snapshot = snapshot + "\n";
        lineLength = (int) random(2,5);
      }
    }
    this.related = new ArrayList();
    this.currentTarget = 0;
  }
  
  void step()
  {
    drawLinesToNodes();
    drawSelf();
    
    if (related.size() == 0)
    {
      //hover around?
      //this.xspeed += noise(this.location.x, this.location.y)-.5;
      //this.yspeed += noise(this.location.y, this.location.x)-.5;
      this.xspeed = this.xspeed * .95;
      this.yspeed = this.yspeed * .95;
      this.zspeed = this.zspeed * .95;
    }
    else if (related.size() == 1)
    {
      //this is related to one search, so go to it
      float dx = this.location.x - this.desiredLocation.x;
      float dy = this.location.y - this.desiredLocation.y;
      float dz = this.location.z - this.desiredLocation.z;
        
      //if (PVector.dist(this.location,this.desiredLocation) < nodeDistance)
      //{
        //do nothing, kill speed
      //}
      //else
      //{
        this.xspeed += dx/(nodeSpeed);
        this.yspeed += dy/(nodeSpeed);
        this.zspeed += dz/(nodeSpeed);
      //}
      this.xspeed = this.xspeed * .95;
      this.yspeed = this.yspeed * .95;
      this.zspeed = this.zspeed * .95;
    }
    else if (related.size() > 1)
    {
      //this is related to multiple search, so find the equilibrium
      if (pathing)
      {
        if (currentTarget >= related.size())
          {
            currentTarget = related.size() - 1;
          }
          
        SearchNode target = (SearchNode) related.get(currentTarget);
        
        if (PVector.dist(this.location,target.location) < 40)
        {
          currentTarget++;
          if (currentTarget >= related.size())
          {
            currentTarget = 0;
          }
        }
        float dx = this.location.x - target.location.x;
        float dy = this.location.y - target.location.y;
        float dz = this.location.z - target.location.z;
        
        this.xspeed += dx/(nodeSpeed);
        this.yspeed += dy/(nodeSpeed);
        this.zspeed += dz/(nodeSpeed);
        
        this.xspeed = this.xspeed * .95;
        this.yspeed = this.yspeed * .95;
        this.zspeed = this.zspeed * .95;
      }
      else
      {
        int i = 0;
        float longestDistance = 0;
        SearchNode target = null;
        for (i = 0; i < related.size(); i++)
        {
          SearchNode temp = (SearchNode) related.get(i);
          if (PVector.dist(this.location,temp.location) > longestDistance)
          {
            target = temp;
            longestDistance = PVector.dist(this.location,temp.location);
          }
        }
      
        float dx = this.location.x - target.location.x;
        float dy = this.location.y - target.location.y;
        float dz = this.location.z - target.location.z;
      
        this.xspeed += dx/(nodeSpeed);
        this.yspeed += dy/(nodeSpeed);
        this.zspeed += dz/(nodeSpeed);
      
        //this.xspeed = this.xspeed * .95;
        //this.yspeed = this.yspeed * .95;
      }
    }
    
    if (this.highlighted)
    {
      //cancel all speed
      this.xspeed = 0;
      this.yspeed = 0;
      this.zspeed = 0;
    }
    
    this.location.x -= xspeed;
    this.location.y -= yspeed;
    this.location.z -= zspeed;
  }
  
  void drawSelf()
  {
    fill(255,255,255,20);
    pushMatrix();
    translate(0,0,location.z);
    ellipse(location.x,location.y,20,20);
    popMatrix();
    if (related.size() > 0)
    {
      noFill();
      stroke(240,30,50);
      strokeWeight(1);
      pushMatrix();
      translate(0,0,location.z);
      ellipse(location.x,location.y,25,25);
      rect(location.x+(word.hashCode()%20),location.y-(word.hashCode()%15),word.hashCode()%25,word.hashCode()%25);
      rect(location.x-(word.hashCode()%30),location.y+(word.hashCode()%10),word.hashCode()%15,word.hashCode()%25);
      popMatrix();
      noStroke();
    }
    if (this.highlighted)
    {
      textFont(infoFont);
      fill(255,255,255);
      text(word, location.x,location.y+5,location.z);
    }
    textFont(smallFont);
    if (this.related.size() > 0)
    {
      fill(130,130,100);
    }
    else
    {
      fill(80,80,40,100);
    }
    pushMatrix();
    translate(location.x,location.y+20,location.z);
    if (diagonalText)
    {
      rotate(radians(word.hashCode()%45));
    }
    text(snapshot, 0, 0, 0);
    popMatrix();
  }
  
  void drawLinesToNodes()
  {
    int i = 0;
    for (i = 0; i < related.size(); i++)
    {
      SearchNode tempg = (SearchNode) related.get(i);
      //stroke(0,0,80);
      //strokeWeight(2);
      //line(this.location.x,this.location.y,tempg.location.x,tempg.location.y);
      Integer wordConnection = (Integer) this.wordMap.get(tempg.word);
      int wordConn = wordConnection.intValue();
      if (wordConn > 255)
      {
        wordConn = 255;
      }
      if (dynamicColorz)
      {
        colorMode(HSB);
        int colorz = tempg.word.hashCode()%255;
        stroke(colorz, 200, 200, wordConn);
      }
      else
      {
        stroke(0,0,255, wordConn);
      }
      strokeWeight(1);
      line(this.location.x,this.location.y,this.location.z,tempg.location.x,tempg.location.y,tempg.location.z);
      noStroke();
      colorMode(RGB);
    }
  }
}

void stop()
{
  lostSong.close();
  createSound.close();
  minim.stop();
  super.stop();
}


class InfoNodeComparator implements Comparator
{
  String word;
  
  public InfoNodeComparator(String wrd)
  {
    word = wrd;
  }
  
  public int compare(Object a, Object b)
  {
    InfoNode aReal = (InfoNode) a;
    InfoNode bReal = (InfoNode) b;
    if ((Integer) aReal.wordMap.get(word) > (Integer) bReal.wordMap.get(word))
    {
      return -1;
    }
    if ((Integer) aReal.wordMap.get(word) < (Integer) bReal.wordMap.get(word))
    {
      return 1;
    }
    return 0;
  }
}

