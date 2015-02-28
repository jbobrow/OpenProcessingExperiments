
//CONTROL ROW class//////////////////////////////////////////////////////////////////////////
//This class holds the button interface above. It's composed of a parent class controlRow,///
//that gives common features and makes possible to treat all as a whole, and an external/////
//class Button, with the standard features of an elliptical button and the function of///////
//making transitions between polar elements, adding a 'visualization behaviour', cause its/// 
//size it is determined by the total sum of the current polar element.///////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////

class ControlRow {
  Button[] buttons;
  int 
  maxButtonRadius,         //we are going to use the buttons as a visualization tool, this value limits the diameter of the biggest button
  current=0,               //current button (==current element)
  currentH=-1,             //current button hovered (if so)
  bottomBorder;            //the bottom border of the button row display area, I use it to limit hover checks
  PVector
  o;                       //the center of the first button in the row
  color 
  TOP_COLOR=0xccffffff;       //color for the background of the row  
  boolean
  buttonHovered=false;

  //CONSTRUCTOR
  ControlRow (int buttonsNumber,int oX,int oY,int maxButtonRadius,int maxValue,int [] males,int[] vals,String[] texts) {
    o=new PVector(oX,oY);
    this.maxButtonRadius=maxButtonRadius;
    buttons=new Button[buttonsNumber];
    int sepV=0;
    for (int i=0;i<buttons.length;i++) {
      float buttonSize1=map(males[i],0,maxValue,0,maxButtonRadius);  //size of inner ellipse -- males
      float buttonSize2=map(vals[i],0,maxValue,0,maxButtonRadius);   //size of outer ellipse -- total
      int sepH=(maxButtonRadius+10)*2;                               //separation between buttons
      sepV=int(textAscent()+textDescent()+maxButtonRadius+5);        //separation between buttons and text
      buttons[i]=new Button(o.x+(i*sepH),o.y,o.y+sepV,buttonSize1,buttonSize2,texts[i]);
    }
    bottomBorder=oY+sepV+20;                                         
  }
  
  //METHODS
  void display(){
    noStroke();
    fill(TOP_COLOR);
    rect(0,0,width,bottomBorder);
    for (int i=0;i<buttons.length;i++) {
      if (current==i) {
        buttons[i].display(true);
      }else{
        buttons[i].display(false);
      }
    }
  }
  
  void hover (int mX,int mY){
    for (int i=0;i<buttons.length;i++){
      if(buttons[i].hover(mX,mY)){
        currentH=i;
        buttonHovered=true;
        break;
      }
      buttonHovered=false;
    }
  }
  
  int getBorder(){
    return bottomBorder; 
  }
  boolean isHovered(){
    return buttonHovered; 
  }
  void hoverIs(boolean what){
    buttonHovered=what; 
  }
  int setCurrent(){    
    current=currentH; 
    return current;
  } 
}

//BUTTON class//very straightforward//////////////////////////////////////////////////////

class Button {
    PVector 
    c,                   //center of the button
    textPosition;        //origin of text
    float 
    bRad1,bRad2,bRad3;   //radiuses
    String 
    buttonText;          //legend
    
    //CONSTRUCTOR
    Button(float centerX,float centerY,float textY,float bRad1,float bRad2,String buttonText) {
      c= new PVector(centerX,centerY);
      this.bRad1=bRad1;
      this.bRad2=bRad2;
      bRad3=bRad2+3f;    //size of hover ellipse
      this.buttonText=buttonText;
      textPosition=new PVector(c.x-(textWidth(buttonText)/2),textY);
    }

    //METHODS
    void display(boolean currentB) {
      if (currentB){
        fill(#cccccc);
        ellipse(c.x,c.y,bRad3,bRad3);     //hover
      }
      fill(colores[1]);                   //first we draw the total value ellipse, that'll be covered partially by male ellipse-- thus this is female ellipse
      ellipse(c.x,c.y,bRad2,bRad2); 
      fill(colores[0]);                   
      ellipse(c.x,c.y,bRad1,bRad1);       //males
      fill(TEXT_COLOR);
      text(buttonText,textPosition.x,textPosition.y);
    }
    
    boolean hover(int mX,int mY){
      return  dist(mX,mY,c.x,c.y)<=bRad2?true:false;
    }
 }



