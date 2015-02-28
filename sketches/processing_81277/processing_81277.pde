

//*  IAT 800 Instructed by Phillipe Pasquire
//*  submitted by AYINUERGULI KADEER (Aynur Kadir)
//*  Date: 25th, November, 2012
//*  email: akadir@sfu.ca

//*  The aim of this project is to create a touching screen drawing tool
//*  that can apply for drawing, writing and designing uyghur calligraphy. 
//*  My inspiration is comes from  my grandfather who can not speak after 
//*  throat cancer surgery. He always need something to write what he want 
//*  to say, besides, calligraphy is his biggest hobby. However, he complain 
//*  that most of the touching screen drawing apps not easy to navigate, 
//*  can not able to write Uyghur languge properly and not good for design 
//*  calligraphy. I hope I can make a difference and create something useful. 

//*  also referred*@*http://www.openprocessing.org/sketch/28487*@* */

//*  You can find Some Example of Uyghur Calligraphy from app interface, if you want more please visit:
//*  http://jeckblog.com/jeckalbum/Uyghurs/Calligraphy_Xettatliq-Husinhat/01/index.html


PGraphics pg;//Drawing  board
boolean inputBg=false, isInput=false;//open file and input text
PImage paintImg;//import images
//input text
PFont ugfont;//font of Uyghur language
String typedText=" ";//save typed text
int typeRectWidth=10;//width of text background 
float typedTextX=-15, typedTextY=-15;//coordinate of text background

int colours[][]=new int[10][3];  
int position[][]=new int[10][2];
int a, b, c;
PFont font;
int radii=20;
//title Text
String ImageUrl="Uyghur Calligraphy Designing Tool";
//geometrical figure
int xakil=0, xakilNumber=1;

/////////////////////////////////////////
//Initialize pencil thickness
int d=1;
//tools
Tools tool;
Control control;
Message msg;//display type of remind messege 
MouseImage mImage;//control mouse icon 

void setup() {
  size(1024, 600);
  colorMode(RGB);
  smooth();
  background(200);
  frameRate(60);
  //  Load font
  font=loadFont("ArialMT.vlw");
  ugfont= loadFont("ALKATIPBasmaTom-20.vlw");//load Uyghur unicode fonts
  //  txt1=loadFont("Calibri-12.vlw");
  //Setup background

  //drawing canvas
  pg = createGraphics(685, 570);
  //mouse icon
  mImage=new MouseImage();

  noFill();
  stroke(0);
  strokeWeight(3);
  rect(0, 0, 1024, 600); //tools and calligraphy pens external frame
  fill(0);

  //////////////////////////////////////////////////
  //Add colour palete position values in array
  for (int i=0;i<10;i++) {
    if (i%2==0) {
      position[i][0]=width-100; //color bar left side colors
    }
    else {
      position[i][0]=width-50; //color bar right side colors
    }
  }


  //position of different color tools
  position[0][1]=90;
  position[1][1]=90;
  position[2][1]=140;
  position[3][1]=140;
  position[4][1]=190;
  position[5][1]=190;
  position[6][1]=240;
  position[7][1]=240;
  position[8][1]=290;
  position[9][1]=290;
  
  ///////////////////////
  //array value of color
  //Black
  colours[0][0]=0;
  colours[0][1]=0;
  colours[0][2]=0;
  //Grey
  colours[1][0]=130;
  colours[1][1]=130;
  colours[1][2]=130;
  //White
  colours[2][0]=255;
  colours[2][1]=255;
  colours[2][2]=255;
  //Red
  colours[3][0]=255;
  colours[3][1]=0;
  colours[3][2]=0;
  //Orange
  colours[4][0]=255;
  colours[4][1]=165;
  colours[4][2]=0;
  //Yellow
  colours[5][0]=255;
  colours[5][1]=255;
  colours[5][2]=0;
  //Green
  colours[6][0]=0;
  colours[6][1]=255;
  colours[6][2]=0;
  //Blue
  colours[7][0]=0;
  colours[7][1]=0;
  colours[7][2]=255;
  //Indigo
  colours[8][0]=75;
  colours[8][1]=0;
  colours[8][2]=130;
  //Violet
  colours[9][0]=238;
  colours[9][1]=130;
  colours[9][2]=238;

  ////////////////////////////////////////////
  toolbox();   //method

  //tools
  tool=new Tools();
  tool.dorwUpTools();
  tool.dorwShape();
  //control parameter
  control=new Control();
  //status bar texts
  msg=new Message(170, height-10);
  msg.show("Verson 1.0.0");
  //title
  msg.setTytle("Uyghur Calligraphy Designing Tool");
}


void draw() {
  thickness();  //method, monitor ketboard
  colourPicker();  //method
  mImage.drawMouseIcon();//control mouse icon
  //be in order
  pg.beginDraw();
  //import picture
  if (inputBg) {
    pg.image(paintImg, 0, 0);
  }
  pg.stroke(255);

  //////////////////////////////////
  //Drawing tool
  /////////////////////////
  if (mousePressed && (mouseButton == LEFT)) {
    if (!ImageUrl.endsWith(" * ")) {
      ImageUrl+="( unSaved ) * ";// when file modified remind it is not saved yet
      msg.setTytle(ImageUrl);
    }
    msg.show(" Drawing . . . ");//status bar information
    if (isInput) {           
      typedTextX=mouseX;//save mouse X coordinate 
      typedTextY=mouseY;//save mouse Y coordinate 
      typeRectWidth=10;
      typedText=" ";//before input text it is empty
    }
    else { 
      //int xakil=0,xakilNumber=1 
      //println(xakil);
      if (xakil==0) {// line
        pg.stroke(a, b, c); 
        pg.line(pmouseX-163, pmouseY+15, mouseX-163, mouseY+15);
      }
      else if (xakil==1) {//square
        shapePen Square = new shapePen(pg, xakilNumber, a, b, c, mouseX, mouseY, "tecktut"); // creating new square shapePen object
      }
      else if (xakil==2) {//trilateral
        shapePen Triangle = new shapePen(pg, xakilNumber, a, b, c, mouseX, mouseY, "uchbulung");// creating new trilateral shapePen object
      }
      else if (xakil==3) {//circle
        shapePen Circle = new shapePen(pg, xakilNumber, a, b, c, mouseX, mouseY, "chambar");// creating new circle shapePen object
      }
      else if (xakil==4) {//parallelogram
        shapePen Parallel = new shapePen(pg, xakilNumber, a, b, c, mouseX, mouseY, "parallel");// creating new parallelogram shapePen object
      }
      else if (xakil==6) {//calligraphy pen
        calligraphyPen yantu = new calligraphyPen(pg, a, b, c, mouseX, mouseY, "yantu" );// creating new calligraphy pen shapePen object
      }
      else if (xakil==7) {// point
        calligraphyPen taturyantu = new calligraphyPen(pg, a, b, c, mouseX, mouseY, "taturyantu" );// creating new point shapePen object
      }
      else if (xakil==8) {// calligraphy pen
        calligraphyPen chikit = new calligraphyPen(pg, a, b, c, mouseX, mouseY, "chikit" );// creating new calligraphy pen shapePen object
      }
      else if (xakil==9) {//calligraphy pen
        calligraphyPen tik = new calligraphyPen(pg, a, b, c, mouseX, mouseY, "tik" );// creating new calligraphy pen shapePen object
      }
    }
  }

  ////////////////////
  //Eraser
  ////////////////////

  //eraser
  if (mousePressed && (mouseButton == RIGHT)) {
    msg.show(" Drawing . . . ");//status bar info
    pg.stroke(a, b, c); 
    pg.fill(0);
    pg.line(pmouseX-163, pmouseY+15, mouseX-163, mouseY+15);
  }
  //Clear background
  if (keyPressed && key ==' ')clearBG();  //space bar will erase canvas


  ///////////////////////////
  //input text
  //////////////////////////

  if (isInput==true) {
    pg.fill(255);
    noStroke();
    pg.rect(typedTextX-165, typedTextY-17, -typeRectWidth, 23);
    pg.fill(0);
    pg.textFont(ugfont);  
    pg.textAlign(RIGHT); 
    pg.text(typedText+(frameCount/10 % 2 == 0 ? "|" : " "), typedTextX-165, typedTextY);    
    msg.show("Now Input Text...!");
  }

  ///////////////////////
  //End
  ////////////////////
  pg.endDraw();
  inputBg=false;
  image(pg, 163, -15);
}

////////////////////////////////
//Reset Canvas
///////////////////////////////

void clearBG() {
  //Repaint background
  pg.fill(200);
  stroke(0);
  pg.rect(-15, -150, 2000, 2000);
  //Reset colour chosen
  //  pg.stroke(a, b, c);
  //   pg.fill(a, b, c);
}

///////////////////////////////////////////////////////
//Adjust pencil thickness  from Number 1 to 5 
//////////////////////////////////////////////////////

void thickness() {
  msg.setTytle(ImageUrl);
  if (keyPressed && key =='1') d=1;
  if (keyPressed && key =='2') d=3;
  if (keyPressed && key =='3') d=5;
  if (keyPressed && key =='4') d=7;
  if (keyPressed && key =='5') d=9;
  pg.strokeWeight(d);
  fill(98);
  strokeWeight(2);
  rect(20, 425, 120, 20); 
  //Draw current line thickness
  strokeWeight(d);
  stroke(a, b, c);
  line(25, 436, 135, 436); //select line
  // strokeWeight(2);
  //Reset line thickness
}

///////////////////////////
//moniter keyboard data
/////////////////////////////

void keyReleased() {
  if (key != CODED) {    
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0, max(0, typedText.length()-1));
      break;
    case TAB:
      typedText += "    ";
      break;
    case ENTER:
      {
        isInput=false;  
        msg.show("Now Drowing ...!");//status bar info
      }//typedText
    case RETURN:
      // comment out the following two lines to disable line-breaks
      typedText += "\n";
      break;
    case ESC:
    case DELETE:
      break;
      //case 
    default:
      //change text background 
      typeRectWidth+=9;//text background       
      try { 
        char mykey =char(control.keys.get(int(key)));      
        //println(key);
        typedText += mykey;
      }
      catch(Exception e) {
        typedText +=key;
      }
    }
  }
}

////////////////////////
//Draw toolbox  //// texts on canvas
////////////////////////

void toolbox() {
  fill(60);
  stroke(0);
  rect(0, 0, 160, 600); // right tool box
  noFill();
  rect(850, 0, 174, 560);  //left tool box 
  //Labels
  fill(255);
  line(0, 350, 160, 350); //line for middle of tool box
  line(0, 480, 160, 480); //line for copyright info 
  line(850, 50, width, 50);  
  line(850, 330, width, 330); 
  line(160, 560, width, 560); // line for status bar

  fill(0);
  rect(9, 10, 61, 25); //open button
  rect(89, 10, 61, 25); //save button
  fill(255);
  //show texts
  text("Open", 25, 28);
  text("Save", 105, 28);
  fill(255);
  textFont(font, 15);
  text("Erase == Space bar", 15, 530);
  text("Programmer__", 15, 570);
  text("Aynur", 90, 590);
  text("select pencil style 1 - 5", 10, 410);
  line(0, 43, 160, 43);
  line(0, 110, 160, 110);
  line(0, 390, 160, 390);
  noFill();
  rect(9, 420, 142, 32); 
  //Color palete
  for (int i=0;i<10;i++) {
    fill(colours[i][0], colours[i][1], colours[i][2]);
    ellipse(position[i][0]-10, position[i][1], 40, 40);//control position
  }
  //Reset fill colour
  //  fill(a, b, c);
  //  //Current colour box
  //  stroke(0);
  //  rect(10, 70, 140, 30);
  //Reset stroke colour
  stroke(a, b, c);
}


void mousePressed() {

  /////////////////////////////
  // Open / Save buttons
  /////////////////////////////

  //open
  if (mouseX>9&&mouseY>10&& mouseX<70&&mouseY<35) {
    oPenFile();
  }
  //save
  if (mouseX>89&& mouseY>10&& mouseX<150&& mouseY<35) {
    saveImage();// save dialog box method
  }

  /////////////////////////////
  // text / Line buttons
  /////////////////////////////

  //text
  if (mouseX>10&& mouseY>60&& mouseX<70&& mouseY<100) {
    isInput=true;
    typedTextX=-15;
    typedTextY=-15;
    typedText=" ";//erase previous text
  }
  //line
  if (mouseX>90&& mouseY>60&& mouseX<130&& mouseY<100) {
    xakil=0;
  }

  /////////////////////
  //background image
  ///////////////////

  if (mouseX<width && mouseX>width-165 && mouseY>340 && mouseY<555) { // detect if it is in the proper area
    if (mouseY<390) { // 
      paintImg=tool.img1;
    }
    else if (mouseY<450) {
      paintImg=tool.img2;
    }
    else if (mouseY<505) {
      paintImg=tool.img3;
    }
    else {
      paintImg=tool.img4;
    }
    if (paintImg!=null) {
      inputBg=true;
      pg.fill(a, b, c);
      pg.rect(0, 0, 2000, 1500);
    }
  }//end 


  //////////////////////////
  //Pen Selection
  /////////////////////////


  if (mouseX>0 && mouseX<160 && mouseY<400 &&mouseY>350 ) { // detect if it is in the pen selection area
    xakil=0;
    xakilNumber=0;

    if (mouseX<40) { // / style calligraphy pen
      xakil=6;
    }
    else if (mouseX<80) { // . style calligraphy pen
      xakil=7;
    }
    else if (mouseX<120) {// | style calligraphy pen
      xakil=8;
    }
    else { // \ style calligraphy pen
      xakil=9;
    }
  }

  if (mouseX<width-10&&mouseX>width-150 && mouseY>10&& mouseY<42) {
    pg.fill(a, b, c);
    pg.rect(0, 0, 2000, 1500);
  }

  /////////////////////////////////
  //Tool selection
  //////////////////////////////////

  //cheack if it is tool box or not 
  if (mouseX>0 && mouseX<160 && mouseY>110 &&mouseY<350 ) {
    
    //sequre
    xakil=0;
    xakilNumber=0;
    if (mouseY<160) {
      print("1");
      xakil=1;
      if (mouseX< 60) {
        xakilNumber=10;
      }
      else if (mouseX< 110) {
        xakilNumber=20;
      }
      else {
        xakilNumber=30;
      }
    }
   
    //triangle
    else if (mouseY<210) {
      print("2");
      xakil=2;
      if (mouseX<60) {
        xakilNumber=30;
      }
      else if (mouseX<110) {
        xakilNumber=20;
      }
      else {
        xakilNumber=10;
      }
    }
    
    //circle
    else if ( mouseY<265) {
      print("3");
      xakil=3;
      if (mouseX<70) {
        xakilNumber=10;
      }
      else if (mouseX<120) {
        xakilNumber=20;
      }
      else {
        xakilNumber=30;
      }
    }
    
    //sequre
    else if ( mouseY<290) {
      print("4.1");
      xakil=4;
      xakilNumber=10;
    }
    else if ( mouseY<335) {
      print("4.2");
      xakil=4;
      xakilNumber=20;
    }
  }
}

/////////////////////////////////
//open file
////////////////////////////////

void oPenFile() {
  selectInput("Select a image :", "fileSelected");
}
//read file
void fileSelected(File selection) {

  try // try to open up an image file
  {
    String filePath =selection.getAbsolutePath();

    if (control.expandedName(filePath)) //check if it is image file
    {
      paintImg=loadImage(filePath); // load the image
      if (paintImg!=null) // if the image was loaded
      {
        inputBg=true;
        msg.show("import image");//display saving status
      }
      else // if the image did not load
      {
        msg.show("failed!");
      }
    }
  }
  catch( Exception e ) // if the window is closed or anything goes wrong, catch it here
  {
    msg.show("cancel"); //display saving status
  }
}

//////////////////////////
//save file
/////////////////////////////

void saveImage() {
  selectOutput(":", "fileSaveSelected"); // open up the save window then save it once a location and name are specified
}
//select where to save
void fileSaveSelected(File selection) {
  if (selection == null) { // if the window was closed before saving
    println("Window was closed or the user hit cancel.");
    msg.show("ceacel!"); // displayed closed in the message box
  } 
  else { // save image to a file
    pg.endDraw(); // draw out the image to a file
    pg.save(selection.getAbsolutePath()+control.imageFormat); // save it in the specified location
    msg.show("Sucsess Save Image!"); // displayed success in the message box
    ImageUrl+=selection.getAbsolutePath()+control.imageFormat; // set the title of the window to the name of the image 
    msg.setTytle(ImageUrl);
  }
}


//////////////////////////////////////////////////
//Color palete detector and setter
///////////////////////////////////////////////////

void colourPicker() {
  // detecting if the mouse clicks a circle and determines which one was clicked. 
  if (mousePressed && (mouseButton == LEFT) && (dist(position[0][0], position[0][1], mouseX, mouseY)<radii)) {
    a=colours[0][0];
    b=colours[0][1];
    c=colours[0][2];
  }
  if (mousePressed && (mouseButton == LEFT) && (dist(position[1][0], position[1][1], mouseX, mouseY)<radii)) {
    a=colours[1][0];
    b=colours[1][1];
    c=colours[1][2];
  }
  if (mousePressed && (mouseButton == LEFT) && (dist(position[2][0], position[2][1], mouseX, mouseY)<radii)) {
    a=colours[2][0];
    b=colours[2][1];
    c=colours[2][2];
  }
  if (mousePressed && (mouseButton == LEFT) && (dist(position[3][0], position[3][1], mouseX, mouseY)<radii)) {
    a=colours[3][0];
    b=colours[3][1];
    c=colours[3][2];
  }
  if (mousePressed && (mouseButton == LEFT) && (dist(position[4][0], position[4][1], mouseX, mouseY)<radii)) {
    a=colours[4][0];
    b=colours[4][1];
    c=colours[4][2];
  }
  if (mousePressed && (mouseButton == LEFT) && (dist(position[5][0], position[5][1], mouseX, mouseY)<radii)) {
    a=colours[5][0];
    b=colours[5][1];
    c=colours[5][2];
  }
  if (mousePressed && (mouseButton == LEFT) && (dist(position[6][0], position[6][1], mouseX, mouseY)<radii)) {
    a=colours[6][0];
    b=colours[6][1];
    c=colours[6][2];
  }
  if (mousePressed && (mouseButton == LEFT) && (dist(position[7][0], position[7][1], mouseX, mouseY)<radii)) {
    a=colours[7][0];
    b=colours[7][1];
    c=colours[7][2];
  }
  if (mousePressed && (mouseButton == LEFT) && (dist(position[8][0], position[8][1], mouseX, mouseY)<radii)) {
    a=colours[8][0];
    b=colours[8][1];
    c=colours[8][2];
  }
  if (mousePressed && (mouseButton == LEFT) && (dist(position[9][0], position[9][1], mouseX, mouseY)<radii)) {
    a=colours[9][0];
    b=colours[9][1];
    c=colours[9][2];
  }
  
  //rectangle on right tool box that show which color is collected
  fill(a, b, c);
  rect(width-160, 10, 142, 32);
}

public class Control {
  String imageFormat=".png";//format of saving file 
  // English- Uyghur keyboard unicode
  Map<Integer, Integer> keys = new HashMap<Integer, Integer>();
  Control() {

    //Uyghur languge keyboard unicode 
    keys.put(47, 1574);
    keys.put(63, 1567);
    keys.put(44, 1548);
    keys.put(109, 1605);
    keys.put(77, 1605);
    keys.put(110, 1606);
    keys.put(78, 1606);
    keys.put(98, 1576);
    keys.put(66, 1576);
    keys.put(118, 1736);
    keys.put(86, 1736);
    keys.put(99, 1594);
    keys.put(67, 1594);
    keys.put(120, 1588);
    keys.put(88, 1588);
    keys.put(122, 1586);
    keys.put(90, 1586);
    keys.put(97, 1726);
    keys.put(65, 65010);
    keys.put(115, 1587);
    keys.put(83, 1587);
    keys.put(100, 1583);
    keys.put(68, 1688);
    keys.put(102, 1575);
    keys.put(70, 1601);
    keys.put(103, 1749);
    keys.put(71, 1711);
    keys.put(104, 1609);
    keys.put(72, 1582);
    keys.put(106, 1602);
    keys.put(74, 1580);
    keys.put(107, 1603);
    keys.put(75, 1734);
    keys.put(108, 1604);
    keys.put(76, 1604);
    keys.put(59, 1563);
    keys.put(113, 1670);
    keys.put(81, 1670);
    keys.put(119, 1739);
    keys.put(87, 1739);
    keys.put(101, 1744);
    keys.put(69, 1744);
    keys.put(114, 1585);
    keys.put(82, 1585);
    keys.put(116, 1578);
    keys.put(84, 1600);
    keys.put(121, 1610);
    keys.put(89, 1610);
    keys.put(117, 1735);
    keys.put(85, 1735);
    keys.put(105, 1709);
    keys.put(73, 1709);
    keys.put(111, 1608);
    keys.put(79, 1608);
    keys.put(112, 1662);
    keys.put(32, 32);
    for (int i=49;i<58;i++)
      keys.put(i, i);
  }

  //check the format of opening file  (Now only can open png,jpg,bmp,tif)
  boolean expandedName(String str) {
    if (str.endsWith(".png"))
      return true;
    if (str.endsWith(".jpg"))
      return true;
    if (str.endsWith(".tif"))
      return true;
    if (str.endsWith(".bmp"))
      return true;
    if (str.endsWith(".BMP"))
      return true;
    if (str.endsWith(".PNG"))
      return true;
    if (str.endsWith(".JPG"))
      return true;
    if (str.endsWith(".TIF"))
      return true;
    return false;
  }
}


//Message
public class Message {
  float textX, textY;//display data coordinate
  Message(float x, float y) {
    textX=x;
    textY=y;
  }
  // change information of status bar
  void show(String str) {
    noStroke();
    fill(127);
    rect(textX-5, textY-15, 850, 20);
    fill(255);
    text(str, textX, textY);
  }
  //change information on head 
  void setTytle(String str) {
    // frame.setResizable(true);
    // frame.setIconImage(icon.image);
    frame.setTitle(str);
  }
}


public class MouseImage {
  PImage penImg, mouseImg; //mouse icons
  MouseImage() {
    //initialize mouse icons
    penImg=loadImage("image/pen.png");//image of pen
    mouseImg=loadImage("image/mouse.png");//image of arrow
  }
  void drawMouseIcon() {
    //change icon
    if (mouseX<163 || mouseX>850) {  
      if (mouseImg!=null)
        cursor(mouseImg);
    }
    else {
      if (isInput) {
        cursor(TEXT);
      } 
      else {
        if (penImg!=null) 
          cursor(penImg);
      }
    }
  }
}


public class Tools {
  int w=60; 
  int h=40; 
  int msize=10;
  PImage img1, img2, img3, img4;

  //Example images of Uyghur Calligraphy
  Tools() {
    int rang=127; 
    img1=loadImage("image/11.jpg");
    img2=loadImage("image/12.jpg");
    img3=loadImage("image/13.jpg");
    img4=loadImage("image/14.jpg");
  }
  void  dorwUpTools() {   

    fill(100);
    rect(10, 60, w, h);//w=60,h=40
    rect(90, 60, w, h); 
    fill(220);
    text("Text", 25, 90);
    text("Line", 105, 90);
  } 
 
  void  dorwShape() {
    //different shape in tool box
    int c=127;  
    shapePen tecktut1 = new shapePen(msize, 10, 120, "tecktut");
    shapePen tecktut2 = new shapePen(msize+10, 60, 120, "tecktut");
    shapePen tecktut3 = new shapePen(msize+20, 110, 120, "tecktut");
    fill(c);
    shapePen Uchbulung1 = new shapePen(msize+10, 30, 180, "uchbulung");
    shapePen Uchbulung2 = new shapePen(msize+5, 80, 180, "uchbulung");
    shapePen Uchbulung3 = new shapePen(msize, 130, 180, "uchbulung");
    fill(c);
    shapePen Chambar1 = new shapePen(msize+5, 20, 230, "chambar");
    shapePen Chambar2 = new shapePen(msize+15, 70, 230, "chambar");
    shapePen Chambar3 = new shapePen(msize+25, 120, 230, "chambar");
    fill(c);
    shapePen Parallel1 = new shapePen(msize+10, 30, 260, "parallel");
    shapePen Parallel2 = new shapePen(msize+15, 40, 300, "parallel");
    //pens
    // line(0, 350, 160, 350); 
    fill(c);
    calligraphyPen yantu = new calligraphyPen( 25, 365, "yantu");
    calligraphyPen chikit = new calligraphyPen( 55, 370, "chikit");
    calligraphyPen tik = new calligraphyPen( 85, 365, "tik");
    calligraphyPen taturyantu = new calligraphyPen( 115, 365, "taturyantu");

    // examples
    image(img1, width-165, 340, 160, 50);
    image(img2, width-165, 395, 160, 50);
    image(img3, width-165, 450, 160, 50);
    image(img4, width-165, 505, 160, 50);
  }
}


public class calligraphyPen extends pencilObject // inherited class from pencilobject class 
{

  calligraphyPen(PGraphics content, int r, int g, int b, int mX, int mY, String pencilType ) // overload calligraphPen include color
  {
    super( content, r, g, b, mX, mY);

    setupColour(pencilType);

    if ( pencilType == "yantu")//  / style calligraphy pen
    {
      graphics.quad(xPos-163, yPos, xPos-173, yPos+10, xPos-171, yPos+10, xPos-161, yPos);
    }
    if ( pencilType == "taturyantu")// \ style calligraphy pen
    {
      graphics.quad(xPos-163, yPos, xPos+10-163, yPos+10, xPos+12-163, yPos+10, xPos+2-163, yPos);
    }
    if ( pencilType == "chikit")// . point style calligraphy pen
    {
      graphics.point(xPos-163, yPos);
    }
    if ( pencilType == "tik") // | style calligraphy pen
    {
      graphics.rect(xPos-163, yPos, 2, 10);
    }
  }

  calligraphyPen( int mX, int mY, String pencilType) //overload calligrahyPen
  {
    super( mX, mY );

    if ( pencilType == "yantu")//  / style calligraphy pen
    {
      quad(xPos, yPos, xPos-10, yPos+10, xPos-8, yPos+10, xPos+2, yPos);
    }
    if ( pencilType == "taturyantu")//  \ style calligraphy pen
    {
      quad(xPos, yPos, xPos+10, yPos+10, xPos+12, yPos+10, xPos+2, yPos);
    }
    if ( pencilType == "chikit")// . point style calligraphy pen
    {
      strokeWeight(10);
      point(xPos, yPos);
    }
    if ( pencilType == "tik") // | style calligraphy pen
    {
      strokeWeight(2);
      rect(xPos, yPos, 2, 10);
    }
  }

  void setupColour(String pencilType) // overides function in pencilObject
  {     

    if ( pencilType == "chikit") // . point style calligraphy pen
    {
      graphics.strokeWeight(10);
    }
    else if ( pencilType == "tik") //  | style calligraphy pen
    {
      graphics.strokeWeight(2);
    }
    else
    {
      graphics.strokeWeight(1);
    }

    graphics.fill(rCol, gCol, bCol);
    graphics.stroke(rCol, gCol, bCol);
  }
}


public abstract class pencilObject // base abstract class which is extended by calligraphyPen and shapePen
{
  PGraphics graphics;
  int rCol;
  int gCol;
  int bCol;
  int xPos;
  int yPos;

  ///////////////////////
  // constructor 1
  //////////////////////
  pencilObject(PGraphics content, int r, int g, int b, int mX, int mY) // overload pencilObject and include colors
  {
    graphics = content;

    rCol = r;
    gCol = g;
    bCol = b;

    xPos = mX;
    yPos = mY;

  // setup the colour 
    setupColour();
  }

  pencilObject(int mX, int mY) //overload pencilObject with xposition and yposition
  {
    xPos = mX;
    yPos = mY;
  }
  
  // Overriding
  void setupColour() // base class which is overriden in calligraphyPen
  {
    graphics.strokeWeight(1);
    graphics.fill(rCol, gCol, bCol);
    graphics.stroke(rCol, gCol, bCol);
  }
}


public class shapePen extends pencilObject // inherited class used just for objects
{

  // overload shapePen, able to output shapes as well as able to change color
  shapePen( PGraphics content, int msize, int r, int g, int b, int mX, int mY, String pencilStyle )
  {
    super( content, r, g, b, mX, mY);

    if ( pencilStyle == "uchbulung" ) //triangle
    {
      graphics.triangle(xPos-163, yPos-msize, xPos+msize-163, yPos+msize, xPos-msize-163, yPos+msize);
    }
    if ( pencilStyle == "chambar" ) //circle
    {
      graphics.ellipse(xPos-163, yPos, msize, msize);
    }
    if ( pencilStyle == "tecktut" ) //rectangle
    {
      graphics.rect(xPos-163, mY, msize, msize);
    }
    if ( pencilStyle == "parallel" ) // parallelogram
    {
      graphics.quad(xPos-163, yPos, xPos-msize-163, yPos+msize, (xPos+2*msize)-163, yPos+msize, xPos+3*msize-163, yPos);
    }
  }

  shapePen(int msize, int mX, int mY, String pencilStyle ) //overload shapePen and able to output the shapes
  {
    super( mX, mY );

    if ( pencilStyle == "uchbulung" ) //triangle
    {
      triangle(xPos, yPos-msize, xPos+msize, yPos+msize, xPos-msize, yPos+msize);
    }
    if ( pencilStyle == "chambar" ) //circle
    {
      ellipse(xPos, yPos, msize, msize);
    }
    if ( pencilStyle == "tecktut" ) //rectangle
    {
      rect(xPos, yPos, msize, msize);
    }
    if ( pencilStyle == "parallel" ) // parallelogram
    {
      quad(xPos, mY, xPos-msize, yPos+msize, xPos+2*msize, yPos+msize, xPos+3*msize, yPos);
    }
  }
}



