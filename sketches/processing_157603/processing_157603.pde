
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/34748*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
///Polar graph tool///2010//Ale González//http://60rpm.tv/////////////////
//////////////////////////////////////////////////////////////////////////
//An interactive application for the visualization of connection graphs///
//////////////////////////////////////////////////////////////////////////
/*
This is a generic tool for the generation of connection polar graphs.
Graphs show the relationship between elements throught the drawing
of connection lines linking them, in this particular case, in a polar/circular display.
Each line is scaled according to a value that reflects the strength
of the connection, and the amplitude of each element is scaled according to the total strenghth
of all its relationships. There's also the chance to group elements, what´ll be reflected in the hue of 
them automathically.
This graph takes its data from a .csv file. I didn't find any information on how to store the data 
of a connection graph, so I invented my own way of doing it (better ideas welcome!!).
In order to do that you can find a LibreOffice template in the folder: 
use it, export it as .csv and voilá. It's pretty straightforward and I really like it cause the data 
is coherent by nature stored this way.
This sketch is intended to be a generic html5/canvas tool, and it works perfectly this way, but it's not
possible as far as I know to upload external files to openp5 processinjs plugin so I uploaded as an
applet. In order to use it in processingjs you have to be specially careful with method overloading (look at
Tabla class) cause it may crush the display with what I call blank-window-crisis, that anxiety crisis that 
overcomes when you have to debug a quite big code in order to find what the f* isn't going on with the f* canvas. 
^-^
*/

//colores
//fillColor=color(208,0,0);//rojo

PolarGraph graph;  //Main object
int w=18,           //Width of the elements           
R=300, //250            //radius of the graph
orX,               //x del centro ""
orY,               //y del centro ""
curv_fact=2,       //curve tightness of the connections
cR=255;            //colormode range
float sep=25e-4,   //sector separation
cR25=cR*.05,       //generic value one for alpha
cR75=cR*1,       //generic value two for alpha
fSw=2.5f;          //connections strokeWeight scaling factor 

int buttonW = 100;
int buttonH = 40;

color bg=#ffffff;  //background color
boolean needsToDraw = true;
String file;

//fonts
  PFont h1Font = createFont("Segoe UI Bold", 42);
  PFont h3Font = createFont("Segoe UI Semibold", 13);
  PFont pFont = createFont("Segoe UI Semilight", 12);
  
//Images for match facts
PImage matchFactsuruImg;
String factsImg;

PImage titleImg;

void commonSettings (PGraphics pg){  //basic settings
  //pg.colorMode(HSB,cR);
  pg.ellipseMode(RADIUS);
  pg.strokeCap(SQUARE);
  //pg.imageMode(CENTER);
  pg.noFill();
  pg.smooth();
}

void setup(){
  size(1200,800);
  commonSettings(g);
  //orX=width/2-265;
 orX=width/2+265;  
  orY=(height/2)+25;  //Center of the graph
  file = "uru.csv";//"tabla.csv";
  //graph=new PolarGraph(file,orX,orY,R,w,curv_fact,sep);
  factsImg = "uru.jpg";
  matchFactsuruImg = loadImage(factsImg);
  titleImg = loadImage("bigFlag.png");
}

void draw(){
  if(needsToDraw){
    graph=new PolarGraph(file,orX,orY,R,w,curv_fact,sep);
    graph.all(true);    //right-click shows everything
    needsToDraw = false;
  }
  background(bg);  
  graph.creaConnect();                              //check selected connections and show them  
  
  
  if (graph.hover(dist(mouseX,mouseY,orX,orY)) || isOverButton()){    //show hovered connections
    cursor(HAND);
    if(graph.hover(dist(mouseX,mouseY,orX,orY)))
      graph.creaConnect(atan2((mouseY-orY),(mouseX-orX)));
  }else{
    cursor(CROSS);
  }
  
  drawTitle();
  drawGameButtons();
  
  //draw right pane image
  //image(matchFactsuruImg, 660,100);
  
  image(matchFactsuruImg, 10,100);
  
  //println(mouseX);

}

void drawTitle(){
  String title = "Costa Rica's Secret Combinations";
  
  //titleImg.width = 20;
  //image(titleImg, 15, 30);
  
    
  fill(0);
  
  textFont(h1Font);
  text(title, 15, 60);  
  
  String subTitle = "Understanding the world cup's revelation through their passing distribution";
  textFont(pFont);
  textSize(20);
  text(subTitle, 15, 80);  
  
}

void drawGameButtons(){
  String butAll = "All Games";
  String butUru = "vs URU";
  String butIta = "vs ITA";
  String butEng = "vs ENG";
  String butGre = "vs GRE";
  String butNed = "vs NED";
  
  textFont(h3Font);
  textSize(16);
  
  int xButOr = (width/2) + 100;
  int yButOr = 30;
  int gameLabelWidth = 0;
  
  //draw all button
  /*fill(0, 0, 70, 255);//46
  rect(xButOr, yButOr, buttonW, buttonH);  
  fill(255);//46
  text(butAll, (xButOr + (buttonW/2)) -  (textWidth(butAll)/2), yButOr + (buttonH*0.66));*/
  
  //draw uru button
  xButOr = 810;
  gameLabelWidth = (int)textWidth(butUru);
  fill(0, 0, 70, 255);//46
  rect(xButOr, yButOr, 62, buttonH);
  //println(xButOr + gameLabelWidth+10);  
  fill(255);//46
  text(butUru, (xButOr + (62/2)) -  (gameLabelWidth/2), yButOr + (buttonH*0.66));
  
  //draw ita button
  xButOr = 882;
  gameLabelWidth = (int)textWidth(butIta);
  fill(0, 0, 70, 255);//46
  rect(xButOr, yButOr, 62, buttonH);  
  fill(255);//46
  text(butIta, (xButOr + (62/2)) -  (gameLabelWidth/2), yButOr + (buttonH*0.66));
  
  //draw eng button
  xButOr = 954;
  gameLabelWidth = (int)textWidth(butEng);
  fill(0, 0, 70, 255);//46
  rect(xButOr, yButOr, 62, buttonH);  
  fill(255);//46
  text(butEng, (xButOr + (62/2)) -  (gameLabelWidth/2), yButOr + (buttonH*0.66));
  
  //draw gre button
  xButOr = 1026;
  gameLabelWidth = (int)textWidth(butGre);
  fill(0, 0, 70, 255);//46
  rect(xButOr, yButOr, 62, buttonH);  
  fill(255);//46
  text(butGre, (xButOr + (62/2)) -  (gameLabelWidth/2), yButOr + (buttonH*0.66));
  
  //draw ned button
  xButOr = 1098;
  gameLabelWidth = (int)textWidth(butNed);
  fill(0, 0, 70, 255);//46
  rect(xButOr, yButOr, 62, buttonH);  
  fill(255);//46
  text(butNed, (xButOr + (62/2)) -  (gameLabelWidth/2), yButOr + (buttonH*0.66));
  
  
}

boolean isOverButton(){  //Is the mouse inside an element (anyone)?
    //boolean result = false;
    //all
    if(mouseY>20 && mouseY<60){//y
      //all
      //if(mouseX>700 && mouseX<800 )//all
        //return true;
      //all
      if(mouseX>810 && mouseX<872 )//uru
        return true;
      //all
      if(mouseX>882 && mouseX<944 )//ita
        return true;
      //all
      if(mouseX>954 && mouseX<1016 )//eng
        return true;
      //all
      if(mouseX>1026 && mouseX<1088 )//gre
        return true;
      //all
      if(mouseX>1098 && mouseX<1160 )//ned
        return true;
    }    
    
    return false;
  }


void mousePressed(){
  if (mouseButton==LEFT){   
      if(isOverUru()){
        file = "uru.csv";
        factsImg = "uru.jpg";
        matchFactsuruImg = loadImage(factsImg);
        needsToDraw = true;
      }
      if(isOverIta()){
        file = "ita.csv";
        factsImg = "ita.jpg";
        matchFactsuruImg = loadImage(factsImg);
        needsToDraw = true;
      }
      if(isOverEng()){
        file = "eng.csv";
        factsImg = "eng.jpg";
        matchFactsuruImg = loadImage(factsImg);
        needsToDraw = true;
      }
      
      if(isOverGre()){
        file = "gre.csv";
        factsImg = "gre.jpg";
        matchFactsuruImg = loadImage(factsImg);
        needsToDraw = true;
      }
      if(isOverNed()){
        file = "ned.csv";
        factsImg = "ned.jpg";
        matchFactsuruImg = loadImage(factsImg);
        needsToDraw = true;
      }
  }
  else
  {
    graph.all(true);    //right-click shows everything
  }
}

boolean isOverAll(){
  if(mouseY>20 && mouseY<60){
      //all
      if(mouseX>700 && mouseX<800 )
        return true;
  }
  return false;
}

boolean isOverUru(){
  if(mouseY>20 && mouseY<60){
      //all
      if(mouseX>810 && mouseX<872)
        return true;
  }
  return false;
}

boolean isOverIta(){
  if(mouseY>20 && mouseY<60){
      //all
      if(mouseX>882 && mouseX<944)
        return true;
  }
  return false;
}

boolean isOverEng(){
  if(mouseY>20 && mouseY<60){
      //all
      if(mouseX>954 && mouseX<1016)
        return true;
  }
  return false;
}



boolean isOverGre(){
  if(mouseY>20 && mouseY<60){
      //all
      if(mouseX>1026 && mouseX<1088)
        return true;
  }
  return false;
}

boolean isOverNed(){
  if(mouseY>20 && mouseY<60){
      //all
      if(mouseX>1098 && mouseX<1160)
        return true;
  }
  return false;
}

//POLARGRAPH class/////Main class here///////////////////////////////////////////////////////////////////////////////////////////


class PolarGraph {
  Tabla t;                    //This is the object for storing the external data
  PolarElement[] P;           //Array of elements to be connected
  PGraphics b;                //PGraphics for storing these last. This way we calculate once, and we save resources
  int num,R,R1,w,pesoT_T=0,posX,posY,f,rh1,rh2,nG;  //see below 
  float offs;                 //idem
  int[] groupN,groupC;        //idem
  int individualCircleR = 30;
  
  //fonts
  //Segoe UI bold
  //PFont hover = loadFont("segoeuib.ttf");
  PFont hover = createFont("Segoe UI Bold", 14);
  PFont noHover = createFont("Segoe UI", 14);
  
  color rojo= color(208,0,0);//rojo
  color azul= color(0, 0, 46, 255); 
  
  //CONSTRUCTOR
  PolarGraph(String data,int posX,int posY,int R,int w,int f,float offs){
    t=new Tabla(data);                 //url of the location of the data
    
    this.posX=posX;this.posY=posY;     //center of the graph     
    this.R=R;                          //radius
    this.w=w;                          //width of the elements
    this.f=f;                          //bezier tightness
    this.offs=offs;                    //separation between elements
    
    num=t.getNumFilas()-1;             //number of elements (considering first row is the legend of the table)
    pesoT_T=t.getTodo(1,num,1,num);    //total number of connections (with this number we'll scale the lenght of the elements)
    R1=R+w;//(w*2);                        //text radius
    //rh1=R-(w/2); rh2=R+(w/2);          //min and max to check the hover
    rh1=R-w; rh2=R+w;          //min and max to check the hover
    nG=t.getMaxCol(num+1);             //higher value of group (thus, number of groups-1)
    groupN=new int[nG+1];              //number of elements in each group         
    
    for(int i=0;i<groupN.length;i++){  
      groupN[i]=0; 
    }
    for(int i=1;i<num+1;i++){          //iterate over the group column, each time you find a value add one to its counter 
      groupN[t.getInt(i,num+1)]++;
    } 
    groupC=new int[nG+1];              
    arrayCopy(groupN,groupC);          //lets keep intact that info and create a mirror to use it as a counter afterwards (see createBase method)
    P=new PolarElement[num];           //instantiate group of elements
    for (int j=0;j<P.length;j++){      //calculate the start angle of the element
      P[j]=new PolarElement(j,num);    
    }
    
    for (int i=0;i<P.length;i++){  
      if (i>0){
        int a=0;
        
        while (a<i){
        //while (a<num){ 
          //println("a " + a + " i " + i + " num " + num);         
          P[i].addAng(P[a++].getAmp());  //iterate over the elements adding the amplitude of the arcs till we reach current element
        
        }
      }
      
      P[i].setCoordinates();  //calculate coordinates of the center of the element and the correspondent control point for the bezier
    } //
    
  }  
 
  
  
  int getElement(float mouseAngle){  //This method is the responsible of detecting the element hovered
    float teta=(mouseAngle>0)?mouseAngle:map(mouseAngle,-PI,0,PI,2*PI);  //Atan2 can be hateful, I do this trick to handle the angles in a more intuitive way
    int element=0; 
    while (element<P.length){    
      if (P[element].getAng()>teta){
        break;
      } 
      element++;
    } 
    return element-1;  
  }
  
  void creaConnect(float beta){//display hovered connections  
    int i=getElement(beta); 
    text(P[i].getElemName(),50,65);                        //take name
    text(P[i].getElemInfo(),50,80);                         //take info 
         
    color hoverConnColor = rojo;//color(0, 0, 46, 255);    
    doConnections(i,hoverConnColor);                 //draw connections  
    
    for (int j=0; j<P.length; j++){
      if (P[j].getOn()){                //if element is selected
        drawCircle(j,rojo);
        noFill();
        if(j!=i){
          drawCircle(j,azul);
          noFill();
          drawName(j);
          noFill();
        }        
      }
    } 
   
    textSize(14);
    fill(0);
    String apellidoElemento = P[i].getElemApellido();
    textFont(hover);
    text(apellidoElemento,P[i].getXc() - (textWidth(apellidoElemento)/2), P[i].getYc() + 7);      
    
  }
  
  
  
  void creaConnect () {                 //display selected connections
    for (int i=0; i<P.length; i++){
      if (P[i].getOn()){                //if element is selected
        //doConnections(i,#cdc6b3);       //do the job
        doConnections(i,#dfdfdf);       //gray        
      }
    }
    for (int j=0; j<P.length; j++){
      if (P[j].getOn()){                //if element is selected
        drawCircle(j, azul);
        noFill();        
      }
    }
    for (int h=0; h<P.length; h++){
      if (P[h].getOn()){                //if element is selected
        drawName(h);
        noFill();
      }
    }
  }
   
  void doConnections(int e,color connection_color){    //element to connect and colour of connections   
    noFill();
    stroke(connection_color);
    for (int j=0; j<num; j++){
      
      if(P[e].getRel(j)>0){ 
        strokeWeight(P[e].getRel(j)/fSw);                //do thicker lines as connection goes stronger
              
        bezier(P[e].getXc(),P[e].getYc(),P[e].getCx1(),P[e].getCy1(),P[j].getCx1(),P[j].getCy1(),P[j].getXc(),P[j].getYc());  //make connections
        
      }   
    }  
  }
 
 void drawName(int e){
    textSize(14);
    colorMode(RGB,255);
    fill(255,255,255);
    String apellidoElemento = P[e].getElemApellido();
    //println(apellidoElemento);
    textFont(hover);
    text(apellidoElemento,P[e].getXc() - (textWidth(apellidoElemento)/2), P[e].getYc() + 7); 
  
 } 
  
  
  void drawCircle(int e, color fillColor){  //draws the circle of each element
    stroke(bg);
    strokeWeight(1);
    
    //color fillColor;
    colorMode(RGB,255);
    //fillColor=color(208,0,0);//rojo
    fill(fillColor);
    
    ellipse(P[e].getXc(),P[e].getYc(),individualCircleR,individualCircleR);            //this little ellipse clarifies elements selected 
    
  }
   
  void click(float beta){   //Select elements clicked
    P[getElement(beta)].toggleOn();
  }
  
  void all (boolean onOff){            //Clean all selected connections
    for (int i=0;i<P.length;i++){
      P[i].setOn(onOff);
    }
  }
  
  boolean hover (float d){  //Is the mouse inside an element (anyone)?
    return (d>=rh1 && d<=rh2)?true:false;
  }
  
 PolarElement getElement(int n_ord){  //a method for getting the elements inside the graph
    return P[n_ord];
  }
   
  //PolarElement class//(!)Internal to PolarGraph////////////////////////////////////////////////////////////////////////////
  
  class PolarElement{
    int[] rels;          //relationship values array
    
    int ord,nElem,group; //position, number of elements linked to this and group of the element
    
    float amp,ang,       //element amplitude, beginning angle             
    
    xc,yc,cx1,cy1;       //extreme point and control point of a bezier going to this element
    
    String name,info,apellido;     //information about the element
    boolean on=false;    //boolean to check whether an element is selected or not
    
    //CONSTRUCTOR
    PolarElement(int ord,int nElem){
      this.ord=ord; 
      this.nElem=nElem;               
      rels= new int[nElem];                  
      int pesoT=0;//total strength of relationships
      
      
      //obtener relaciones con los demás
      
      for (int i=0;i<nElem;i++){
        rels[i]=t.getInt(ord+1,i+1);
        pesoT+=(rels[i]);
        //if(ord ==0)
          //  println("elemento3 " + ord + " con " + i + " cantidad " + rels[i] + " peso total " + pesoT);
      }
      
      amp = (2*PI)/nElem;
      
      group = t.getInt(ord+1,nElem+1);//get rest of info from the table directly
      name = t.getString(ord+1,nElem+2);
      info = t.getString(ord+1,nElem+3);
      apellido = t.getString(ord+1,nElem+3);
      
    }
    
    //Rest of methods, quite straightforward
    
    //GET methods
    float   getAmp(){return amp;}  
    float   getAng(){return ang;}     
    int   getGroup(){return group;}
    String  getElemName(){return name;}
    String  getElemInfo(){return info;} 
      String  getElemApellido(){return apellido;}
    float    getXc(){return xc;}
    float    getYc(){return yc;}
    float   getCx1(){return cx1;}
    float   getCy1(){return cy1;}
    boolean  getOn(){return on;}
    int     getRel(int position){return rels[position];}    
    
    //SET methods
    void addAng(float numberToAdd){
      //println("ang" + ang + "numToAdd" + numberToAdd);
      ang+=numberToAdd; 
    }
    
    void setCoordinates(){
      xc = posX + (R-w/2) * cos (ang+(amp/2));
      yc = posY + (R-w/2) * sin (ang+(amp/2));
      cx1= posX + (R/f)   * cos (ang+(amp/2));
      cy1= posY + (R/f)   * sin (ang+(amp/2));
    }
    
    
    void toggleOn(){
      on=!on;
    }
    
    void setOn(boolean toSet){
      on=toSet; 
    } 
  }//Fin clase PolarElement  
    
//TABLA class//(!) Internal to PolarGraph//Based on Ben Fry's "Visualizing Data"
  
  class Tabla {
    String[][] data;           //data of the table
    int numFilas,numColumnas;  //number of rows and columns

    //CONSTRUCTOR
    Tabla(String source) {   
      String[] filas = loadStrings(source); 
      numFilas=filas.length;
      data = new String[numFilas][];
      for (int i = 0; i < filas.length; i++) {
        //jump over empty rows
        if (trim(filas[i]).length() == 0) {
          continue;
        }   
        //jump over commentaries, startsWith doesn't works on processingjs, you could fix this with substring... I was lazy again here :-)
        //if (filas[i].startsWith("#")) {
          //continue;
        //}   
        data[i] = split(filas[i],",");
      }       
      numColumnas=data[0].length;
    }

    //METHODS
    //Get number of rows
    int getNumFilas() {
      return numFilas;
    }

    //Get number of columns
    int getNumColumnas() {
      return numColumnas;
    }

    //Get name of a row specified by its order
    String getNombreFila(int filas) {
      return getString(filas,0);
    }

    //Get value as a string //  Be careful with method overloading in processingjs // avoid blank window panic crisis!!
    String getString(int indiceFilas, int columna) {
      return data[indiceFilas][columna];
    }
    String getString(String nombreFila, int columna)  {      
      return getString(getIndiceFila(nombreFila),columna);
    }

    //Get value as an int   // Be careful with method overloading in processingjs
    int getInt(String nombreFila, int columna) {
      return parseInt(getString(nombreFila,columna));
    }   
    int getInt(int indiceFilas, int columna) {
      return parseInt(getString(indiceFilas,columna));
    }

    //Get value as a float // ""
    float getFloat(String nombreFila, int columna) {
      return parseFloat(getString(nombreFila, columna));
    }
    float getFloat(int indiceFilas, int columna) {
      return parseFloat(getString(indiceFilas, columna));
    }

    //finds file by its name and returns -1 if doesn't get it
    int getIndiceFila(String name) {
      for (int i = 0; i < numFilas; i++) {
        if (data[i][0].equals(name)) {
          return i;
        }
      }
      println("No se encontro la fila llamada '"+ name+"'");
      return -1;
    }
    
    //returns total value in a row
    int totalFila (int indiceFilas) {
      int total=0;
      for (int i=1;i<numColumnas;i++) {
        total+=getInt(indiceFilas,i);
      }
      return total;
    }
    
    //returns total value of an area
    int getTodo(int f0,int f1,int c0,int c1){
      int todo=0;
      for (int i=1;i<=f1;i++){
        for (int j=1;j<=c1;j++){
           todo+=getInt(i,j);
        }
      }
      return todo; 
    }
    
    //returns maximum value in a column
    int getMaxCol(int c0){
      int vmax=0;
      for(int i=1;i<getNumFilas();i++){
        int cval=getInt(i,c0);
        vmax=vmax<cval?cval:vmax;
      } 
      return vmax;
    }
    
    //returns maximum value of row sums
    int maximoTotalesFilas() { 
      int total=0;  
      for (int i=1; i<getNumFilas(); i++) {
        if (totalFila(i)>=total) {
          total=totalFila(i);
        }
      }
      return total;
    }
    
    //returns the sum of every value
    int sumaTotal() {
      int suma=0;  
      for (int i=1; i<getNumFilas(); i++) {
        suma+=totalFila(i);
      } 
      return suma;
    }
    
  } //end | tabla class
}//end | PolarGraph class


