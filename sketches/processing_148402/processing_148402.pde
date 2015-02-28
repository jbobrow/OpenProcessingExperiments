


import processing.opengl.*;
import processing.video.*;



String[] titles;
ArrayList<String[]> allText = new ArrayList<String[]>(100);
/*String QUERY = "index.xml";
String [] allQuery ={"index.xml"};*/
String QUERY = "http://washingtondc.craigslist.org/search/mis?catAbb=mis&query=%20&s=0&format=rss";
String [] allQuery ={"http://washingtondc.craigslist.org/search/mis?catAbb=mis&query=%20&s=0&format=rss","http://washingtondc.craigslist.org/search/mis?catAbb=mis&query=%20&s=100&format=rss","http://washingtondc.craigslist.org/search/mis?catAbb=mis&query=%20&s=200&format=rss"};

float globalFont = 33;
int swidth = 1280;
int sheight = 720;
float speedVar = .1; //.5 is default
int displayNum = 16;
int[] allOpacity = new int[displayNum];
float[] allOpacityValue = new float[displayNum];
int opacityCounter = 0;
String addString = null;
String dateString = null;
String[] matchStringArr = new String[100];
String[] dateStringArr = new String[100];
String[] parsedString = new String[100];
String[] passString = new String[displayNum];
String[] results = null;
int sideTextColor = 150;
int counter = 0;
int grabCounter = 0;
int iterNum = 0;
int trackOpacity = 0;
  float opacitySpeed = .8;
int endHit = 0;
int transY = -1024;
int textWrapSize = 250;
int prevNum = 0;
int permY = 0;
int permY2 = 0;
float rotateVarX = 0;
float rotateVarY = 0;
float rotateVarZ = 0;
float hangTime = 100;
color fClr = color(255,255,255);
// Insert your actual fontnames here...  these were the two I bothered to install for testing...
String[] fontNames = {
  "Helvetica"
};


//------------------------------------------------------------------
//------------------------------------------------------------------
//------------------------------------------------------------------
//------------------------------------------------------------------
class Word2 {
  String[] wordText;
  String[] wordText2;
  float x;
  float y;
  float yB;
  float opacity;
  int opacityDir;
  int fontSize;
  PFont font;
  float wordSize2;
  int receiveNum;
  String orientationVar;
  String orientationVar2;
  String dateVar;
  String dateVar2;
  int receiveY;
  int receiveY2;
  
  Word2(String[] wordText, String[] wordText2, PFont font, int receiveNum, float wordSize2, String orientationVar, String orientationVar2, String dateVar2,String dateVar, int receiveY, int receiveY2, int fontSize) {
    
    this.orientationVar = orientationVar;
    this.orientationVar2 = orientationVar2;
    this.wordText = wordText;
    this.wordText2 = wordText2;
    this.font = font;
    this.fontSize = fontSize;
    this.dateVar = dateVar;
    this.dateVar2 = dateVar2;
    textAlign(CENTER);
    this.wordSize2 = wordSize2;
    float sizeVar = wordSize2;
    
     x = random(int(swidth*.3),int(swidth*.7));
     if (fontSize > 50){
     x = random(int(swidth*.3),int(swidth*.7));
     }
     y = random(int(sheight*.2) + wordSize2, int(sheight*.8) + wordSize2);
  
    opacity = 0;
    opacityDir = 1;
    prevNum = receiveNum;
    //rotate(spinVar);
     //println("Added word: " + wordText + " " + x + "," + y + "," + opacity + "," + opacityDir);
  }

  void display(int nowNum) {
  
  if(nowNum == trackOpacity){
  opacity += opacityDir * opacitySpeed;
  //fClr = color(255,255,255);   // 2 is the speed of the fading effect
  }
  else if (nowNum < trackOpacity){
  opacity += -1 *(hangTime*2);
  //fClr = color(opacity,opacity,opacity);
  }
  else if (nowNum > trackOpacity && endHit == 1 && allOpacityValue[nowNum] > 0){
  opacity += -1 *(hangTime*2);
  //fClr = color(opacity,opacity,opacity);
  }

    // Change opacity up or down
    opacity = constrain(opacity,0,255);
    allOpacityValue[nowNum] = opacity;
   // println(allOpacityValue[trackOpacity]);
   // println(opacityDir)i;
    if (allOpacityValue[trackOpacity] >= 255 && opacityDir == 1){
         opacityDir=-1;
         trackOpacity++;
        
         if (trackOpacity == displayNum){
         trackOpacity = 0;
         endHit = 1;    
         
        }
       // println("bangbang + " + trackOpacity);
        wc2.pickStrings(trackOpacity);
    }
    

      // Display the word with correct font/color
     // if(nowNum==0){println("opacity = "+opacity + " N: " + trackOpacity);}
    
    fill(fClr, opacity);
    //if(nowNum==0){println("2 = "+opacity + " N: " + trackOpacity);}
    textAlign(CENTER);
    //fontSize = int(wordSize2);
   // println(wordSize2);
    textFont(font, fontSize);
    //println("" + wordText);
   //   text(dateVar,(swidth/2)-((textWidth(wordText[0])+globalFont)), y);
      x= x-.8;
      y= y- random(.5)*random(-1,1);
    //println("" + wordText);
    for (int z = 0; z<wordText.length;z++){
    text(wordText[z], x, y+z*wordSize2*2);
    }
    fill(fClr, opacity);
    //if(nowNum==0){println("2 = "+opacity + " N: " + trackOpacity);}
    //println("" + wordText);
   //  text(orientationVar, (swidth/2)+((textWidth(wordText[0])+globalFont)), y);
     //filter(BLUR, 6);
 ///////////////////

//checkBoundaryCollision ------------------------------------------------------------
  

        //println(this.wordText);
   }
   // Insert new function here
 }


class WordCollage2 /* extends InteractiveBoxes */ {
  int numberOfGraffiti;
  Word2[] words2;
  WordCollage2 (int boxPosX, int boxPosY, int boxPosW, int boxPosH) {
    // super (boxPosX, boxPosY, boxPosW, boxPosH);
    numberOfGraffiti=displayNum;
   // String[] retrieve = loadStrings ("http://washingtondc.craigslist.org/mis/"); 
    PFont[] fonts = new PFont[1];
    for (int i = 0; i < fontNames.length; ++i) {
      fonts[i] = createFont("Helvetica", 33);
    }
    words2 = new Word2[numberOfGraffiti];
    
    
    for (int i = 0; i < numberOfGraffiti; ++i) {
      int randomNum = (int) random(matchStringArr.length-1);
      int randomNum2 = (int) random(matchStringArr.length-1);
      String temp[] = allText.get(randomNum);
      String temp2[] = allText.get(randomNum2);
      //Fprintln(i);
        if(temp.length>1){
        permY = int((globalFont)*temp.length)/2 - int(globalFont)/2;
        }
        else if(temp.length==1){
        permY = int(globalFont)*temp.length - int(globalFont)/2;
        }
        if(temp2.length>1){
        permY2 = int((globalFont)*temp.length)/2 + int(globalFont)/2;
        }
        else if(temp2.length==1){
        permY2 = int(globalFont)*temp.length + int(globalFont)/2;
        }
      words2[i] = new Word2(temp, temp2, fonts[0], i, globalFont, matchStringArr[randomNum], matchStringArr[randomNum2], dateStringArr[randomNum], dateStringArr[randomNum2], permY, permY2, int(random(20, 100)));
      //println(temp);
    }
  }  // end of the constructor



  void display () {
   // float radVar = radians(90);
    //rotate(radVar); 
    //translate(0, transY);
    for (int n = 0; n < words2.length; n ++ ) {
      words2[n].display(n);
    }
   
  }
  void pickStrings(int goHere)
  { 
    
  counter++;
  
    if (counter >110 && goHere >displayNum-2){
    grabStrings(allQuery[int(random(allQuery.length))]);
    println("zoombang____________________________________________");
    
    counter = 1;
    }
    
    PFont[] fonts = new PFont[1];
    for (int i = 0; i < fontNames.length; ++i) {
      fonts[i] = createFont("Helvetica", 33);
    }
   // println("parsedString" + parsedString[0]);

    for (int i = 0; i<1; i++){
        int randomLine = (int) random(matchStringArr.length-1);
        int randomLine2 = (int) random(matchStringArr.length-1);
        int checkPass = goHere;
        String temp[] = allText.get(randomLine);
        String temp2[] = allText.get(randomLine2);
        int stringLength1 = temp.length;
        int stringLength2 = temp2.length;
        //println("match " + (matchStringArr[randomLine]) + " " + randomLine);if (words2[prevNum].wordText.length >1){
          if (goHere == 0)
          {
          checkPass = 1;
          }
          permY= calculateY(permY,checkPass,stringLength1, 1, 0);
          permY2= calculateY(permY2,checkPass,stringLength2, 1, 1); 
         
        words2[goHere] = new Word2(temp, temp2, fonts[0], goHere, globalFont, matchStringArr[randomLine], matchStringArr[randomLine2], dateStringArr[randomLine], dateStringArr[randomLine2],permY,permY2, int(random(20, 100)));
    }
    //println(words2[5]);
   
  }
      int calculateY(int rY, int checkThis, int rLength, int directionVar, int wrapDir){
     
      int sendY = rY;
      int lengthVar = rLength;
      int wrapLength = 0;
       if (wrapDir==0){
       wrapLength = words2[checkThis-1].wordText.length;
       }
       else if (wrapDir==1){
       wrapLength = words2[checkThis-1].wordText2.length;
       }
      // println(sendY);
      if (sendY>sheight/2-globalFont)
              {
                sendY = 0;
                if(lengthVar>1){
                sendY = int((globalFont)*lengthVar)/2;
                }
                else if(lengthVar==1){
                sendY = int(globalFont)*lengthVar;
                }
              }
              else{
                if(wrapLength>1 && lengthVar==1){
                sendY = sendY + int(globalFont*lengthVar) + int(globalFont);
               // println("from 2 line to 1");  
                }
                else if(wrapLength>1 && lengthVar>1){
                sendY = sendY + int(globalFont*lengthVar) ;  
              //  println("from 2 line to 2");
                }
                else if(wrapLength==1 && lengthVar==1){
                sendY = sendY + int(globalFont*lengthVar) ;  
              //  println("from 1 line to 1");
                }
                else if(wrapLength==1 && lengthVar>1){
                sendY = sendY + int(globalFont*lengthVar)/2; 
              //  println("from 1 line to 2");
                } 
              }
              return(sendY);
    }

}

//------------------------------------------------------------------
WordCollage2 wc2;

void setup()
{
  frame.setLocation(0,2);
   for(int i = 0; i<100; i++){ 
   matchStringArr[i] = " ";
   dateStringArr[i] = " ";
 }
 println(QUERY);
  grabStrings(QUERY);
  grabCounter++;
  size(swidth, sheight, OPENGL);
  frameRate(30);
  wc2 = new WordCollage2(0, 0, swidth, sheight);
 
}

void draw()
{
  background(0);

  rotateX(rotateVarX);
  rotateY(rotateVarY);
  rotateZ(rotateVarZ);
  wc2.display();
   if(keyPressed) {
    if (key == 'q') {
    rotateVarX = rotateVarX + radians(1);
    }
    else if (key == 'w') {
    rotateVarX = rotateVarX - radians(1);
    }
    if (key == 'e') {
    rotateVarY = rotateVarY + radians(1);
    }
    else if (key == 'r') {
    rotateVarY = rotateVarY - radians(1);
    }
    if (key == 't') {
    rotateVarZ = rotateVarZ + radians(1);
    }
    else if (key == 'y') {
    rotateVarZ = rotateVarZ - radians(1);
    }
     if (key == 'u') {
    opacitySpeed = opacitySpeed+.2;
    hangTime = opacitySpeed/5;
    }
    else if (key == 'i') {
    opacitySpeed = opacitySpeed-.2;
    hangTime = opacitySpeed/5;
    }
      if (key == '=') {
      sketchFullScreen();
    }
  }
}


void grabStrings(String grabMe)
{ println("+++++++++++++++++++WOAOOOAOOAOAHAHAHHAH++++++++++++++++++");
  allText.clear();
  String[] empty = new String[1];
  empty[0] = "...";
  for (int i = 0;i<100; i++){
  allText.add(i,empty);
  }  
//------------------------------------------------------------------
  try
  {
    // Load RSS feed
  XML rss = loadXML(grabMe);
  println(grabMe);
  XML[] titleXMLElements = rss.getChildren("item/description");
  titles = new String[titleXMLElements.length];
  for (int i = 0; i < titleXMLElements.length; i++) {
    String title = titleXMLElements[i].getContent();
    // Store title in array for later use
    titles[i] = title;
 
          addString = titles[i];
  
          String[] tokens = new String[]{};
          String[] tokens2 = new String[]{};
          String[] delims = new String[]{"[.]"};
          String matchString[] = new String[]{};
          String matchString2 = new String();
          int maxChar = addString.length();
          
            //println(i-202 + "    " + matchStringArr[i-117]);
        
              tokens2 = split(addString, '[');
          
              tokens = splitTokens(tokens2[0], "!\\.\\?\\,");
           
             // println(tokens);
              // tokens2 = join(tokens,".");
               //println(tokens2);
               for (int x = 0; x<tokens.length; x++){
                tokens[x].trim();
                 println(tokens[x]);
               allText.add(i, wordWrap(tokens[x], textWrapSize));
               }
               println("break--------------");
           }  
             
             //tokens2 = tokens2 +",";
            
            
            // parsedString[i-117] = allText.get(i-117();         
        
      

 
  }
  catch (Exception e) // MalformedURL, IO
  {
    e.printStackTrace();
  }
  if (results != null)
  {
  //println(parsedString);
  }
//------------------------------------------------------------------
  
  
 
}

String[] wordWrap(String s, int maxWidth) {
  // Make an empty ArrayList

  int maxChar = s.length();
  int lineCount = 0;
  double splitLinesDouble = Math.ceil(textWidth(s)/maxWidth);
  //println(textWidth(s));
  //println(maxWidth);
  //println(splitLinesDouble);
  int splitLines = (int)splitLinesDouble;
  //println(splitLines);
  ArrayList<String> a = new ArrayList<String>();
  int currentChar = 0; 
  float w = 0;    // Accumulate width of chars
  int rememberSpace = 0; // Remember where the last space was
  // As long as we are not at the end of the String
  for (int i = 0; currentChar < maxChar; i++){
    char c = s.charAt(i);  // Current char
    w += textWidth(c); // accumulate width
    currentChar++;
    if (c == ' ') {rememberSpace = i;} // Are we a blank space?
    //|| (w > maxWidth+(w/currentChar))Helvetica
    if (w > maxWidth) {  // Have we reached the end of a line?
     if ((c == ' ') ){
     rememberSpace = i;
     String subNow = s.substring(0,i); // Make a substring
      // Chop off space at beginning
      if (subNow.length() > 0 && subNow.charAt(0) == ' '){ 
      subNow = subNow.substring(1,subNow.length());
      }
      // Add substring to the list
      a.add(subNow);
      // Reset everything
      s = s.substring(rememberSpace,s.length());
      if(lineCount == splitLines-1){
      }
      else{
      lineCount++;
      }
      w = 0;
      i = 0;
     }
    }
    else
    {
    } 
  }
  // Take care of the last remaining line
  if (s.length() > 0 && s.charAt(0) == ' ') s = s.substring(1,s.length());
  a.add(s);
  int aSize = a.size();
  String[] returnString = new String[aSize];
  for(int i = 0; i<aSize; i++)
  {
  String tempString = a.get(i);
  returnString[i] = tempString;
  }
  /*for (int i = 0; i< a.size(); i++){
    println("yo right here = " + a.get(i));
  }*/
  return returnString;
}

