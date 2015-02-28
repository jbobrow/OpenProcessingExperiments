
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/35488*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//Coxcomb Visualizer//0.5//2011//Dominio Publico//Alejandro González//60rpm.tv////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
/*
This is an interactive application that read a group of tsv files and displays a 'coxcomb chart',
some kind of statistical representation invented by Florence Nightingale in XIX century. 
  >> http://es.wikipedia.org/wiki/Archivo:Nightingale-mortality.jpg
Althought the polar nature of the representation is quite beautiful and has some remarkable qualities for making
nice layouts it must be said it's tricky cause it distorts data slightly: values represented near the center
seems bigger than they really are. I think this is one of the main features that
pushed Florence Nightingale to conceive/use it. Despite of all, it's one of the loveliest ways of representing
quantitative data. ^-^
In order to use this applet you need some .tsv files in the data folder and you have to name them 'X'.tsv, where 'X' is the number
that represents the order of display. For example '0.tsv' would be the first table to be displayed, then '1.tsv','2.tsv',etc.
I've used for this example the migration data in Spain from 2000 to 2010. I used data from the INE (Spanish National Institute 
of Statistics) >> http://www.ine.es/
I've used here:
- Travelcons (icons)   --  http://www.dafont.com/search.php?psize=m&q=travelcons
//
This sketch is a very first version of a coxcomb visualizing tool. It has to be seriouslly improved. ^-^
*/

Polar polar;                 //this object groups the polar diagram
ControlRow controlRow;       //and this one the button interface above
TableGroup tG;               //this is the group of tables we are going to use
                    
color 
BACKGROUND_COLOR=#ffffff,     
TEXT_COLOR=#111111;
color[] 
colores={#5E72AA,#5A8DCE};  //these are the sector colors in the diagrams, from inside to outside
int 
n=10;                        //number of tables

void setup() {
  //general settings
  size(700,700); 
  background(BACKGROUND_COLOR);
  noStroke();
  smooth(); 
  cursor(CROSS); 
  ellipseMode(RADIUS);
  colorMode(HSB);
  //constructing objects
  tG=new TableGroup(n);
  polar= new Polar (tG,width/2,height/2,250,18,50000);
  controlRow= new ControlRow(n,110,30,15,tG.getMaxSum(),tG.getMales(),tG.getSums(),tG.getTitles());
}

void draw() {
  background (BACKGROUND_COLOR);
  setCursor();                    //set the cursor
  if (polar.isShifting()) {       //if we are shifting data shift the radiuses of the current element
    polar.getCurrentElement().shiftTo(polar.getCurrentIndex());
  } 
  polar.displayTodo();                //display the element
  controlRow.display();           //display the buttons above
}
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


void mouseClicked() {
  if (mouseButton==LEFT){                                
    if (controlRow.isHovered() && !polar.isShifting()){   //if we are on a row button and the coxcomb isn't shifting alrady...
      polar.setCurrentIndex(controlRow.setCurrent());     //set the element where we are going                  
      polar.getCurrentElement().setSectorsGoal();         //say to all sectors they are going to travel                           
      polar.shiftingIs(true);                             //and tell the driver to go there
    } 
  }else{                                                  //button right toggles the 'scaler' display
    polar.toggleScaler();
  }
}

void mouseMoved(){
   if (mouseY<controlRow.getBorder()) {                   //if we are above (to save unnecesary checks)
     controlRow.hover(mouseX,mouseY);                     //check the button row hovers
   }else{                                                 //but if we are below
     if(controlRow.isHovered()){                          //it's impossible to us to be above 
       controlRow.hoverIs(false);                         //quite stupid, maybe, but necessary cause you can 'jump' with the mous
     }
   polar.getCurrentElement().hover(mouseX,mouseY);        //and check the polarElement hover
   }
}

void mouseDragged() { 
  polar.rotateElement(mouseX,pmouseX,.03);               //rotate the element, with an atenuation factor of .03 
}

void setCursor(){                                        //set the appropiate cursor
  if(controlRow.isHovered()) { 
    cursor(HAND);
  }else{ 
    cursor(CROSS);
  }
}
//POLAR class/////////////////////////////////////////////////////////////////////////////////////////////
//It's pretty complex --maybe I can clarify this--, cause it's composed of an internal class,
//PolarElement, composed by other internal class, called Sector. Although I love internal 
//classes, maybe this composition is hard to get at first sight and 'baroque'...
//So, we have:
//· Polar element -- polar element is a diagram that visualizes the data contained in ONE table,
//what you see when yo run the sketch. 
//· Sector -- sector is the element that builds the polar element, there's one sector for each data bucket
//in the parent PolarElement table. They act as buttons that can trigger display of data, and they have
//hover functions.
//· Polar -- is the class that gathers all PolarElements (with its Sectors) and Tables (external objects
//passed by in the constructor as a TableGroup) in a common frame. 
//It has some methods: a graphic scale tool, that allows a viewer to measure quickly the amounts behind
//the visualization; a method for rotating the display, cause I realized this'd make easier to understand
//and interact with the data displayed; and the bottom row, to display data regarding current element.
////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Polar {
  
  TableGroup tables;       //group of tables
  PolarElement[] P;        //group of elements
  PolarElement current;    //current element
  ControlRow controlRow;   //upper strip of buttons
  PShape[] shapes;         //icons for the legend 
  PVector 
  c;                       //center of the diagram
  int 
  currentIndex=0,          //index of the current element
  NUM_TABLES,              //number of tables/elements
  ROWS,                    //number of rows
  COLS;                    //number of columns
  float  
  SCALE_FACTOR,            //the graphic scale of the diagram  
  ANGLE,                   //the angle of each sector
  HALF_ANGLE,              //suppose it...
  currentAngle=0;          //current angle for displaying the diagram, in order to rotate it  
  float [] 
  shapesF;                 //factor for display the shape with the accurate proportions
  color[] 
  sectorColors=colores,
  hoverColors;          
  color
  SCALER_COLOR=#dddddd, 
  HOVER_COLOR=#9B2A2C,
  BOTTOM_COLOR=0xccffffff;
  PGraphics
  scaler;
  boolean 
  sectorHovered=false,     //do we have the mouse on a sector?  
  scaling=false,            //do we have the graphic scale on?
  shifting=false;          //is the diagram making a transition to other values currently?

  
  //CONSTRUCTOR
  Polar (TableGroup tables,int centerX,int centerY,int maxRadius,int scalerSteps,int scalerStepValue) {
    c=new PVector(centerX,centerY);
    
    //Tables 
    this.tables=tables;
    NUM_TABLES=tables.getN();
    ROWS=tables.getRows();
    COLS=tables.getCols();
    //Constants -- ...
    ANGLE=TWO_PI/tables.getRows();
    HALF_ANGLE=ANGLE/2;
    SCALE_FACTOR=getScale(maxRadius,ANGLE);
    //Colors
    hoverColors=new color[sectorColors.length];
    for (int i=0;i<hoverColors.length;i++){
      hoverColors[i]=sectorColors[i]|0x333300; 
    }
    //Shapes
    shapes=new PShape[COLS];
    shapesF=new float[COLS];
    for (int i=0;i<shapes.length;i++){
      shapes[i]=loadShape(i+".svg"); 
      shapes[i].disableStyle();
      shapesF[i]=shapes[i].width/shapes[i].height;
    }
    
    //Polar Element is the class for only one diagram
    P=new PolarElement[NUM_TABLES];
    for (int i=0;i<P.length;i++) {
      P[i]=new PolarElement(tables.get(i),i);  //we assign the correspondent table to the element and we tell it its index in the whole
    }
    current=new PolarElement(tables.get(currentIndex),currentIndex);  //current diagram | cause of the transitions
    
    //Scaler //This tool is the graphic scale behind the diagram. It consists on a serie of ellipses that reflect certain values.
    //So we have scalerSteps (the number of steps), scalerStepValue (the value of each step) and scalerRadiuses (an array holding the diameter of all ellipses)
    //It doesn't change through execution, so we are going to store it on a PGraphics to save some resources
    float coef_calc=2*scalerStepValue/ANGLE;
    float[] scalerRadiuses=new float[scalerSteps];
    for (int i=0;i<scalerRadiuses.length;i++) {
      scalerRadiuses[i]=sqrt(coef_calc*i)*SCALE_FACTOR;
    }
    scaler=createGraphics(width,height,JAVA2D);
    scaler.beginDraw();
    scaler.background(BACKGROUND_COLOR);
    scaler.smooth();
    scaler.ellipseMode(RADIUS);
    scaler.stroke(SCALER_COLOR);
    scaler.noFill();
    for (int i=0;i<scalerRadiuses.length;i++) {
      scaler.strokeWeight(1.5-i%2);
      scaler.ellipse(c.x,c.y,scalerRadiuses[i],scalerRadiuses[i]);
    }
    scaler.endDraw();
  }

  //METHODS
  
  //This method returns the factor that scales the maximum radius found on the tables to a desired maximum radius (to have control of the layout) 
  float getScale (float desired_maxRadius,float sectorAngle){
    int value=0;
    for (int i=0;i<tables.getN();i++) {
      value = value < tables.get(i).maxRowSum() ? tables.get(i).maxRowSum() : value;   //iterate over the rows with maximum sum of values looking for the biggest value of all
    }
    float real_maxRadius = sqrt(2*value/sectorAngle);   //find the real radius related to that value
    return desired_maxRadius/real_maxRadius;           //returns the factor that transform the latter into desired
  }
  
  //Bunch of get-set methods
  PolarElement getElement (int index) {return P[index];}
  PolarElement getCurrentElement() {return current;}
  
  int  getCurrentIndex() {return currentIndex;}
  void setCurrentIndex (int newIndex) {currentIndex=newIndex;}

  boolean isShifting(){return shifting;}
  void shiftingIs(boolean what){shifting=what;}
  
  void toggleScaler(){scaling=!scaling;}

  //Method for rotating the diagram at will
  void rotateElement (int x,int px,float s) { 
    currentAngle+=(x-px)*s;
  } 
   
  //display methods 
  void displayLegend(int H,int xL){
    float shapeH=H*.75;
    float yL=(height-H)+(shapeH)*.1;
    float yT=yL+textAscent()+textDescent();
    fill(BOTTOM_COLOR);
    rect(0,height-H,width,height);
    fill(TEXT_COLOR);
    String toShow= "total "+tables.getTitle(currentIndex)+": "+nfc(tables.getSums(currentIndex));
    if(sectorHovered&&!shifting) { 
      toShow+="  "+current.getCountrySel()+": "+current.getCountryValueSel()+"  >>  "+current.getValueSel();
    }
    text(toShow,100,yT);
    for (int i=0;i<shapes.length;i++){
      fill(sectorColors[i]);
      shape(shapes[i],xL+=i*20,yL,shapesF[i]*shapeH,shapeH); 
    }
  }

  void displayTodo() {
    if (scaling) image(scaler,0,0);
    pushMatrix();
    translate(c.x,c.y);
    rotate(currentAngle);
    current.display();
    popMatrix();
    displayLegend(50,550);
  }
  
  //Calculates the radius of the sector, depending the value to represent and the scale factor we set up on Polar constructor
  //Area of a circular sector: ANGLE/2 * RADIUS² || i.e.: an ellipse has PI*R² area (angle:TWO_PI)  
  float calcR(int area,float angulo) {
      return sqrt(2*area/angulo)*SCALE_FACTOR;
  }

  //Polar Element | Internal to Polar ////////////////////////////////////////////////////////

  class PolarElement {
    Table      table;    //table related
    Sector[][] sectors;  //bunch of sectors
    int    
    index,               //the index of each element inside the array holder
    reachingCount,       //when we are shifting the element, this int shows us number of sectors that haven't arrived to 'shifting goal'
    valueSel,       //value of a selected sector
    countryValueSel,
    rH,                  //the row of a hovered sector
    cH;                  //the column of a hovered sector
    String
    countrySel="";   //...

    //CONSTRUCTOR
    PolarElement (Table table,int index) {
      this.table=table;
      sectors =new Sector[ROWS][COLS];
      this.index=index; 
      reachingCount=ROWS*COLS;
      //for making the sector we'll operate backwards: we start with the sector of maximum value (sum of all columns) and then 
      //we substract to it further values, cause we are going to overlap the sectors. Messy lines at first, but simple concept behind.
      for (int i=0; i<ROWS;i++) {
        int val=table.rowSum(i+1);
        sectors[i][COLS-1]=new Sector(calcR(val,ANGLE),sectorColors[COLS-1],hoverColors[COLS-1],table.getInt(i+1,COLS));
        for (int j=COLS-2;j>=0;j--) {
          sectors[i][j]=new Sector(calcR(val-=table.getInt(i+1,j+2),ANGLE),sectorColors[j],hoverColors[COLS-1],table.getInt(i+1,j+1));
        }
      }
    }  

    //METHODS
    //Displays the element. As said, we are going to do it backwards, from outside to inside, overlapping the sectors
    void display() {
      pushMatrix();
      //display sector
      for (int i=0;i<ROWS;i++) {                    //for each row of data
        for (int j=COLS-1;j>=0;j--) {               //start outside and go inside
          sectors[i][j].display(rH==i&&cH==j);      //display the sector, telling him if it's hovered
        }    
        //display text 
        rotate(HALF_ANGLE);
        fill(TEXT_COLOR);
        text(table.getString(i+1,0),sectors[i][COLS-1].getRadius()+25,textAscent()*.5);  //display legend
        rotate(HALF_ANGLE);
      }
      popMatrix();
    }

    //Hover method | I suppose there's a much clever way of handling the angle, too much exceptions here. Any good idea appreciated//
    void hover(int mX,int mY) {
      //First, we get the row. That'd be really easy, but atan2 returns a hard-to-handle angle
      float hoverAngle=atan2(mY-c.y,mX-c.x);            //atan2 returns angles from 0 to PI and from 0 to -PI
      if (hoverAngle<0) hoverAngle+=TWO_PI;             //now we have it from 0 to TWO_PI
      hoverAngle-=currentAngle;                         //we substract it the current rotation
      if(hoverAngle<currentAngle) hoverAngle+=TWO_PI;   //this for resolving sign exceptions
      //once we have the angle we want, we only have to divide it by the sector amplitude   
      rH= floor(hoverAngle/ANGLE%15);                   //as 15 triggers an exception, this way we can sort it out    
      float dist_Or= dist(mX,mY,c.x,c.y);
      for (int i=0;i<COLS;i++) {
        if (sectors[rH][i].getRadius()-dist_Or>0) {     //first positive difference reveals the hovered sector
          cH=i;
          sectorHovered= true;
          valueSel=sectors[rH][cH].getValue();
          countrySel=tables.get(0).getString(rH+1,0);
          countryValueSel=tables.get(currentIndex).rowSum(rH+1);
          break;
        }else {
          cH= -1;
          sectorHovered= false;
        }
      }
    }   
    
    String getValueSel(){return nfc(valueSel);}
    String getCountrySel(){return countrySel;}
    String getCountryValueSel(){return nfc(countryValueSel);}
    
    float getSectorRadius (int sR,int sC) {return sectors[sR][sC].getRadius();}
    int getSectorValue (int sR,int sC) {return sectors[sR][sC].getValue();}
    
    void setSectorsGoal(){
      for (int i=0;i<ROWS;i++) {
        for (int j=0;j<COLS;j++) {
           sectors[i][j].setNewGoal();
        }
      }
    }
    
    //This method tells sectors to shift and considers the process over when all they are done
    void shiftTo (int index) {
      for (int i=0;i<ROWS;i++) {
        for (int j=0;j<COLS;j++) {
          if(!sectors[i][j].hasReached()){
            sectors[i][j].shiftRadius(P[index].getSectorRadius(i,j),15f,P[index].getSectorValue(i,j));
          }
        }
      }
      if (reachingCount<=0) {              //if all they are done
        reachingCount=ROWS*COLS;           //so reset the shifting counter
        shifting=false;                    //process is over    
      }
    }

    //SECTOR CLASS///////////////////////////////////////////////////////////////////
    class Sector {
      boolean hovered, reached=true;
      float sectorRadius;
      int sectorValue;
      color sectorColor,hoverColor;

      //CONSTRUCTOR
      Sector (float sectorRadius,color sectorColor,color hoverColor,int sectorValue) {
        this.sectorRadius= sectorRadius; 
        this.sectorValue = sectorValue;
        this.sectorColor = sectorColor;
        this.hoverColor  = hoverColor;
        hovered=false;
      }

      //METODOS
      int getValue() {return sectorValue;}   
      void setValue(int newValue) {sectorValue=newValue;}  
      
      void setNewGoal(){reached=false; }
      boolean hasReached(){return reached;}
     
      float getRadius() {return sectorRadius;}
      void shiftRadius(float newRadius,float easingFactor,int newValue) {
        float distance=newRadius-sectorRadius;   //shift according to distance (easing)
        if (abs(distance)>0.1) {
          sectorRadius+=distance/easingFactor;
        }else{
          sectorValue=newValue;  //set the reached value
          reached=true;           
          reachingCount--;       //strike-through one of the list
        }
      }
      
      boolean isHovered() {return hovered;}
      void display(boolean hovered) {  
        fill(sectorColor);
        if (hovered) fill(hoverColor);
        arc(0,0,sectorRadius,sectorRadius,0,ANGLE);
      }
      
    }  //end of SECTOR CLASS
  }    //end of POLAR ELEMENT CLASS
}      //end of POLAR CLASS

//TableGroup////////////////////a class for gathering all tables together, really straightforward
/////////////////////////////////////////////////////////////////////////////////////////////////

class TableGroup {
  Table[] ts;
  int[] sums,maleCol;
  int N,R,C,tablesMaxSum;
  String[] titles;
  
  //CONSTRUCTOR
  TableGroup (int N){
    //instantiate the table array and the tables inside, set the number of tables
    ts=new Table[this.N=N];   
    for(int i=0;i<N;i++){
      ts[i]= new Table(i); 
    }
    //get number of columns and rows of data
    R= ts[0].getNumRows()-1;  
    C= ts[0].getNumCols()-1;  
    //data necessary for the displaying of the button row as visualization
    tablesMaxSum=0;                
    titles=new String[N];   
    maleCol=new int[N];  
    sums=new int[N];          
    for(int i=0;i<N;i++){
      sums[i]=ts[i].totalSum();
      maleCol[i]=ts[i].colSum(1);
      tablesMaxSum=sums[i]>tablesMaxSum?sums[i]:tablesMaxSum; 
      titles[i]=ts[i].getString(0,0);
    }
  }
  
  //METHODS
  int getSums(int index){return sums[index];}
  int getMaxSum(){return tablesMaxSum;}
  String getTitle(int index){return titles[index];}
  
  Table get(int index){return ts[index];}   
  
  int getRows(){return R;}
  int getCols(){return C;}
  int getN(){return N;}
  
  String[] getTitles(){return titles;}
  int[] getSums(){return sums;}
  int[] getMales(){return maleCol;}
  
}  //end of TableGroup class
    
//Table////////////////////////////////main class table, based on Ben Fry's one on Visualizing Data
///////////////////////////////////////////////////////////////////////////////////////////////////

class Table {
  String[][] data;
  int numRows, numCols;

  //CONSTRUCTOR
  Table(int indice) {   
    String[] filas = loadStrings(indice+".tsv"); 
    numRows = filas.length;
    data = new String[numRows][];
    for (int i = 0; i < filas.length; i++) {
      if (trim(filas[i]).length() == 0) {
        continue;
      }   
      if (filas[i].startsWith("#")) {       //this doesn't work on processingjs
        continue;
      }   
      data[i] = split(filas[i],"\t");       //dont use TAB on processingjs
    }       
    numCols=data[0].length;
  }

  //METHODS

  //Returns number of rows
  int getNumRows() { return numRows; }

  //Return number of cols
  int getNumCols() { return numCols; }

  //Returns name of a row, specified by index
  String getRowName(int rowIndex) { return getString(rowIndex,0); }

  //Returns value as String | be careful with method overloading using processingjs
  //String getString(String rowName, int col) { return getString(getRowIndex(rowName),col); }
  String getString(int rowIndex, int colIndex) { return data[rowIndex][colIndex]; }

  //Returns value as Int | be careful, bla, bla..
  //int getInt(String rowName, int col) { return parseInt(getString(rowName,col));}   
  int getInt(int rowIndex, int colIndex) { return parseInt(getString(rowIndex,colIndex)); }

  //Returns value as Float | be careful, bla, bla..
  //float getFloat(String rowName, int col) { return parseFloat(getString(rowName,col)); }
  float getFloat(int rowIndex, int colIndex) { return parseFloat(getString(rowIndex,colIndex)); }

  //Find file by its name and returns -1 in case of failure
  int getRowIndex(String name) {
    for (int i = 0; i < numRows; i++) {
      if (data[i][0].equals(name)) {
        return i;
      }
    }
    println("I didn't found any row called '"+ name+"!'");
    return -1;
  }

  //Returns the sum of all the values in a row, specified by index
  int rowSum (int index) {
    int sum=0;
    for (int i=1;i<numCols;i++) {
      sum+=getInt(index,i);
    }
    return sum;
  }
  
  //Returns the sum of all the values in a column, specified by index
  int colSum (int index) {
    int sum=0;
    for (int i=1;i<numRows;i++) {
      sum+=getInt(i,index);
    } 
    return sum;
  }
  
  //Returns the row with maximum value sum
  int maxRowSum() { 
    int maxSum=0;  
    for (int i=1; i<numRows; i++) {
      if (rowSum(i)>=maxSum) {
        maxSum=rowSum(i);
      }
    }
    return maxSum;
  }
  
  //Returns the total sum of all the values in the table
  int totalSum() {
    int sum=0;  
    for (int i=1; i<numRows; i++) {
      sum+=rowSum(i);
    } 
    return sum;
  }
  
} //End of Table class


