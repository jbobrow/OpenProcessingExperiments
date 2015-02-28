
// Adila Faruk, April 17th 2013.
String hammerText="";
String[] hammerTokens;
int FRAMERATE = 3;

int yStart = 480, // where we start the text 
    yTop = 35, // max text positiong
    wTextBox = 270, // text box width
    hLeading = 20;
float hText = yStart - yTop;
Tex hammertex;
// some plot stuff
PFont normalFont = createFont("Helvetica-Light",14,true);
int steelBlue = 0xff1f77b4;

Scrollbar scrollbar;
public void setup(){
  strokeCap(SQUARE);
  hammerTokens = loadStrings("Hammertime.txt");
  int i=-1, ln = hammerTokens.length;
  while(++i<ln){
    hammerText +="\n"+hammerTokens[i]; 
  }
  hammertex = new Tex(hammerText,wTextBox,hLeading);
  
  size(300,500); frameRate(FRAMERATE);
  
  float h = height-yTop, hBar = (hText-hLeading)*(h)/hammertex.totalHeight;
  scrollbar = new Scrollbar(width-10,yTop,h,(h-hBar)/h,hBar );

}

      
/* -------------------------- */      
public void draw(){
  background(0);
  
   // title: -----------------------------------------------------
  noStroke();
  fill(steelBlue); rect(0,0,width,yTop); 
  fill(0); textFont(normalFont,18); textAlign(CENTER,BOTTOM);
  text("MC Hammer's U Can't Touch This", width/2,30);
  
  // write the text
  float yPos = yStart;
  int ln = hammerTokens.length-1;
  //font stuff
  textLeading(hLeading); textFont(normalFont); textAlign(LEFT,TOP); fill(245);
  strokeWeight(1); stroke(100);
  int i=frameCount; 
  float count = 0; // float since we'll need to divide by 'ln' later
  
  if(frameCount<=ln){
    while(--i>=0 && yPos>=yTop+5){
      String s = hammerTokens[i];
      Tex tex = new Tex(s,wTextBox,hLeading);
      float h = tex.totalHeight;
      
     // we're still within the bounding box so we can print the entire string at once
      if(yPos-h>=yTop+5){
        yPos-=h; 
        text(s,5,yPos,wTextBox,h);
        // example usage of tex.finalW:
        line(tex.finalW+5,yPos+h-15,wTextBox,yPos+h-15); 
      }
      else{ // go through tex.lines individually
        ArrayList<String> lines = tex.lines;
        int k=lines.size(); 
        while(yPos-hLeading>=yTop+5 && --k>=0){
          yPos-=hLeading;
          text(lines.get(k), 5, yPos, wTextBox, hLeading );
        }
      }   
    }
  }
  else{
   
    frameRate(60); noLoop(); // stop the looping but up the frameRate or it'll be soooooooper sluggish
    scrollbar.display();
    yPos = yTop+5;
    int numLines = floor(hText/hLeading)-1; // number of lines that will fit on the page
    float startHeight = (scrollbar.yCurrent-scrollbar.y ) / scrollbar.hTotal * hammertex.totalHeight;
  
    int iStart = floor(startHeight/hLeading);
    int iEnd = iStart + numLines;
    textAlign(LEFT,TOP); textFont(normalFont); textLeading(hLeading);
    fill(245);
    int k=iStart-1; while(++k<iEnd){ //print(yPos+"\t");
      text((String)hammertex.lines.get(k), 5, yPos+=hLeading, wTextBox, hLeading);
    }
  }
  
}

public void keyPressed(){
  if(keyPressed){
   if(keyCode==38) frameRate(FRAMERATE++); // arrow up
   else if(keyCode==40) frameRate(FRAMERATE = max(1,FRAMERATE-1)); // arrow down
   else if(keyCode==10) frameCount = hammerTokens.length; // ENTER
  }
}
public void mousePressed(){ redraw(); }
public void mouseDragged(){ redraw(); }
public void mouseReleased(){ redraw(); }
public class Scrollbar{
 public float x, y, hTotal, yCurrent; // hTotal = total scrollbar height, yCurrent = current position of the bar
 public float w = 10, // width of the bar
              h = 0; // height of the bar 
 /**
 x = xLeft, y = yTop, 
 current = initial bar position (expressed as a fraction of hTotal
 */
 public Scrollbar(float xLeft, float yTop, float hOverall, float startFraction, float barHeight){
  x = xLeft; y = yTop;
  hTotal = hOverall;
  h = barHeight;
  yCurrent = startFraction*(hOverall) + y;
 } 

 public void over(){ // provide some x-leeway
  if(mousePressed && mouseX>=x-15 && mouseX<=x+w  && mouseY>=y && mouseY<=y+hTotal){
   if(mouseY - yCurrent < h){ // if it's over the bar
      float dy = mouseY - pmouseY; 
      if(abs(dy)<15){ // need this or it's gonna jump all over the place
        yCurrent = max(y, min(y+hTotal-h,yCurrent+dy) ); 
      }
   }
  } 
 }
 public void display(){
  over();
  int bg = color(200), fg = color(steelBlue); noStroke();
  fill(bg); rect(x,y,w,hTotal+h); 
  fill(fg); rect(x,yCurrent,w,h);
 }
}
/** Class for getting text Height ----------------------------------- */
public class Tex{
  String theString;
  String[] tokens;
  ArrayList<String> lines = new ArrayList<String>(); // stores the input string that's been nicely split to fit the textbox
  int numTextLines=0, totalLines = 0;
  int totalHeight=0; // total computed height of the input string
  int hLeading; // textLeading
  int  wTextBox; // the textbox width;
  float finalW; // the x-position (+ spacebar) of the final character in the input string 
  
  /*-------------- */
  public Tex(String s, int w, int h){
    theString = s;
    hLeading = h;
    wTextBox = w; 
    getHeight();
  }
  /* compute the height but also store any other relevant variables such as the finalW */
  public void getHeight(){
    tokens = split(theString, "\n");
    int numberEmptyLines = 0, ln = tokens.length;
    numTextLines = 0; // reset

    String tempString = ""; 
    finalW = 0; // put these outside since we'll be referencing it later
    float space = textWidth(" ");
    int count = 0;
    for (int i=0; i < ln; i++) {
      // ignore stuff with length 0
      String s = tokens[i];
      if(s.length() == 0) {
        numberEmptyLines++; finalW = 0;
        lines.add(" ");
      } else {      
        numTextLines++;
        // word wrap
        String[] wordsArray = split(s, " ");
        tempString = "";
        int wLn = wordsArray.length;
        finalW = 0;
        for (int k=0; k < wLn; k++) {
          s = wordsArray[k];
          float newW = textWidth(s); // do computation outside
          if (finalW + newW <= wTextBox) {
            tempString += s+" ";
            finalW += newW+space;
            if(k==wLn-1) lines.add(tempString);
          }
          else {
            lines.add(tempString); // add the previous line
            count++;
            tempString = s+" ";
            finalW = newW + space;
            numTextLines++;
            if(k==wLn-1) lines.add(tempString);
          }
        }
      }
     
    }
    totalLines = numTextLines + numberEmptyLines;
    totalHeight = round(totalLines * hLeading);
    
    //if(lines.size()<totalLines) lines.add(tempString); // just in case we missed the last one
  }
}


