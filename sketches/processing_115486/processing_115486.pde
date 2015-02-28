
//[removed][removed]
//[removed]
/* @pjs 
crisp=true;
font=Foresee.ttf; 
*/
float textWidth;
PFont font;
 
void setup(){
  size(900, 50);
  smooth();
  textWidth=900;
  
}

void draw(){
    background(0);
    String wordText ="Nada  Cat";
    font =createFont("Foresee.ttf", 48);
    textFont(font);
    textSize(48);
    fill(200);
    text(wordText, textWidth, 40);
    textWidth=textWidth-.5;
    if (textWidth<-1800){
      textWidth=900;
      textWidth=textWidth-.5;
    }  
    wordText ="BLOG Instigated by CATALYST:MOMA ONLINE COURSE";
    fill(200);
    text(wordText, textWidth+300, 40);
    textWidth=textWidth-.5;
    if (textWidth<-1700){
      textWidth=900;
      textWidth=textWidth-.5;
    }  
}
//
//[removed]
//<canvas id="mycanvas"></canvas>



