
// wichtig! vor abspielen des skecthes den arbeitsspeicher für processing auf ca 1500mb erhöhen! procesing > einstellungen > häkchen setzen u wert eintragen!

//  pause = key p
// play = key o





import ddf.minim.*;

AudioPlayer player;
Minim minim;

PFont txtFont;
PFont txtFont2;

String[] soundString={"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32","33"}; //mastertablas werden definiert
int[] soundPos = {1730, 11100, 18269, 27611, 35702, 43575, 50976, 58396, 67085, 74015, 81453, 91775, 98505, 102659, 106722, 114505, 117861, 121979, 128128, 133970, 135000, 145017, 153362, 154341, 161852, 163085, 169289, 176727, 184890, 190623, 193271, 202650}; //sekunden im song werden für die grafik definiert

String lastPlayCount;

PolarGraph graph;  //Main object
int w=8, //Width of the elements           
R=250, //radius of the graph
orX, 
orY, 
curv_fact=50, //dichte der kurven
cR= 360;            //colormode range 

float sep=50e-4, //sector separation   >  lücken zwischen den songs in der grafik (kreis)
cR25=cR*.25, //generic value one for alpha
cR75=cR*.75, //generic value two for alpha > umstellen führt zu grauwerten im kreis oder sättigung
cR100=cR*.100, //generic value two for alpha >  umstellen führt zu grauwerten im kreis oder sättigung
cR1=cR*.1, //generic value two for alpha >  umstellen führt zu grauwerten im kreis oder sättigung

fSw=650;          //connections strokeWeight scaling factor 

color bg=#ffffff;  //background color


void commonSettings (PGraphics pg) {  //basic settings
  pg.colorMode(RGB,cR);  //  oder HSB
  pg.ellipseMode(RADIUS);
  pg.strokeCap(SQUARE);
  pg.imageMode(CENTER);
  pg.noFill();
  pg.smooth();
}


void setup() {
  size(850, 850);
  
  txtFont= loadFont("NexusMix-Regular-48.vlw"); 
  txtFont2= loadFont("NexusMix-Bold-48.vlw");

  commonSettings(g);
  orX=width/2; 
  orY=height/2;  
  graph=new PolarGraph("mastertabla01.csv", orX, orY, R, w, curv_fact, sep);
  
  minim = new Minim(this);

  player = minim.loadFile("song.mp3", 800); // Zahl in der Methode ist die Startzeit
  player.play(800);
  
  textFont(txtFont2); //  texvariable
  fill(#FF9852); //  textfarbe vom text links oben (erscheint bei mouse over kreis)
  textSize(14); // textgröße
  
    
}

void draw() {
  if(player.position() < soundPos[0]){
  background(bg);
  println("ohne grafik");
    
  rectMode (CENTER); // rechteckt oben links
  noStroke();
  fill(#FF9852,50); 
  noStroke();
  rect(65,65,50,50);
    
    
  textFont(txtFont2); //  texvariable
  fill(#ED8945); // textfarbe vom text links oben (erscheint bei mouse over kreis)
  textSize(14); // textgröße
  
  
  // text bevor song losgeht
  text("medley generator", 50, 65); 
  text("Axis of Awesome - 4 chords", 50, 82);  
    
    
  }else{
  
  for(int i = 0; i < soundPos.length; i++){
    if(player.position() > soundPos[i] && player.position() < soundPos[i+1] && lastPlayCount != soundString[i]){
    graph = new PolarGraph("mastertabla" + soundString[i] + ".csv", orX, orY, R, w, curv_fact, sep);
    lastPlayCount = soundString[i];
    }
  }
  background(bg);         
  graph.displayBase();                              //shows the polar display of elements
  graph.creaConnect();                              //check selected connections and show them
  if (graph.hover(dist(mouseX, mouseY, orX, orY))) {    //show hovered connections
  cursor(HAND);
  graph.creaConnect(atan2((mouseY-orY), (mouseX-orX)));
  
}else {
  cursor(CROSS);
  }
}
}

void mousePressed() {
  if (mouseButton==LEFT) {
  if (graph.hover(dist(mouseX, mouseY, orX, orY))) {   //check if mouse is inside an element
  graph.click(atan2((mouseY-orY), (mouseX-orX)));  //if so, toggle its display
   }
   
}else{
  graph.all(true);    //right-click shows everything
  }
}



//Main class here///////////////////////////////////////////////////////////////////////////////////////////
void keyPressed()
{
  if ( key == 'p' ) player.pause();
  if ( key == 'o' ) player.play();
}

class PolarGraph {
  Tabla t;                    //This is the object for storing the external data
  PolarElement[] P;           //Array of elements to be connected
  PGraphics b;                
  int num, R, R1, w, pesoT_T=0, posX, posY, f, rh1, rh2, nG;   
  float offs;                 
  int[] groupN, groupC;       
  

  //CONSTRUCTOR
  PolarGraph(String data, int posX, int posY, int R, int w, int f, float offs) {
    t=new Tabla(data);                 //url of the location of the data
    this.posX=posX;
    this.posY=posY;                    //center of the graph     
    this.R=R;                          //radius
    this.w=w;                          //width of the elements
    this.f=f;                          //bezier tightness
    this.offs=offs;                    //separation between elements
    
    
    num=t.getNumFilas()-1;             //number of elements (considering first row is the legend of the table) 
    println(num);
    
    pesoT_T=t.getTodo(1, num, 1, num);    //total number of connections (with this number we'll scale the lenght of the elements)
    R1=R+(w*2);                        //text radius
    rh1=R-(w/2); 
    rh2=R+(w/2);          //min and max to check the hover
    nG=t.getMaxCol(num+1);             //higher value of group (thus, number of groups-1)
    groupN=new int[nG+1];              //number of elements in each group         
    for (int i=0;i<groupN.length;i++) {  
    groupN[i]=0;
    }
    for (int i=1;i<num+1;i++) {          //iterate over the group column, each time you find a value add one to its counter 
    groupN[t.getInt(i, num+1)]++;
    } 
    groupC=new int[nG+1];              
    arrayCopy(groupN, groupC);          //lets keep intact that info and create a mirror to use it as a counter afterwards (see createBase method)
    P=new PolarElement[num];           //instantiate group of elements
    for (int i=0;i<P.length;i++) {      //calculate the start angle of the element
    P[i]=new PolarElement(i, num);
    if (i>0) {
    int a=0;
    while (a<i) {                      
    P[i].addAng(P[a++].getAmp());  //iterate over the elements adding the amplitude of the arcs till we reach current element
        }
      }
    P[i].setCoordinates();  //calculate coordinates of the center of the element and the correspondent control point for the bezier
    } 
    
    
    createBase(); //just draw the base
  }  

  void createBase() {
    b=createGraphics(width, height, JAVA2D);
    b.beginDraw();
    commonSettings(b);
    b.strokeWeight(w);
    for (int i=0;i<P.length;i++) {                  //Now we'll assignate hue depending on group 
    int eRGB=getElement(i).getGroup();           //this the group value
    --groupC[eRGB];                              //substract one to its counter
      
      
      
     
   color strokeColor=color(cR/(nG+100)*eRGB, cR75, (cR75/groupN[eRGB]*groupC[eRGB])+cR25);  
      b.stroke(strokeColor,cR25); // sättigung des kreisfarben
      float n=i<P.length-1?getElement(i+1).getAng():2*PI;  //jumping over an exception
      b.arc(b.width/2, b.height/2, R, R, getElement(i).getAng()+offs, n-offs);  //drawing arcs
    }
    
    b.translate(b.width/2, b.height/2);
    b.textFont(txtFont); //  texvariable für die texte die dauerhaft zu sehehn sind und mit dem "tortendiagram" mitwandern
    b.textSize(12); // textgröße
    b.fill(255); // textfarbe
    //  b.fill(cR25); war es davor, was bedeuted dieses cR genau und warum wird es hier ständig benutzt?? : definition für die sättigung bzw die farbwahl im radius von HSB bzw RGB! kein plan ey :)
    for (int i=0;i<P.length;i++) {   //draw the names
      b.rotate(P[i].getAmp()*.5);
      b.text(P[i].getElemName(), R1, 0);
      b.rotate(P[i].getAmp()*.5);
    }  
    b.endDraw();
  }

  int getElement(float mouseAngle) {  //This method is the responsible of detecting the element hovered
  float teta=(mouseAngle>0)?mouseAngle:map(mouseAngle, -PI, 0, PI, 2*PI);  //Atan2 can be hateful, I do this trick to handle the angles in a more intuitive way
  int element=0; 
  while (element<P.length) {    
  if (P[element].getAng()>teta) {
  break;
      } 
      
  element++;
    } 
    
  return element-1;
  }

void creaConnect(float beta) {                        //display hovered connections  
  int i=getElement(beta); 
    
   rectMode (CENTER);
   noStroke();
   fill(#FF9852,50); 
   strokeWeight(2);
   rect(65,65,50,50);  
    
    
 
    textFont(txtFont2); //  texvariable
    fill(#ED8945); //  textfarbe vom text links oben (erscheint bei mouse over kreis)
    textSize(14); // textgröße
  
    text(P[i].getElemName(), 50, 65);                        //take name
    text(P[i].getElemInfo(), 50, 82); 
    pushMatrix();
    translate (posX, posY); 
    rotate(atan2((P[i].getYc()-posY), (P[i].getXc()-posX)));
    
    textFont(txtFont); // texvariable von interpreten (die bei mouse over kreis auftauchen)  
    textSize(12); //  textgröße
    fill(#FF9852);   //farbe (und deckkraft?)                     //overwrite the text of the base, I dont like this much but I was lazy to change it
   
    text(P[i].getElemName(), R1, 0);
    popMatrix(); 
    doConnections(i, color(0,90));         //farbe der bezier-linien wird definiert
    
  }
  
  

void creaConnect () {                 //display selected connections
    for (int i=0; i<P.length; i++) {
    if (P[i].getOn()) {           //if element is selected
    doConnections(i, #FF9852);      //farbe des angeklickten songs im bezier wird definiert
        
      }
    }
  }

 void doConnections(int e,color connection_color){    //element to connect and colour of connections
 
//ellipse bei moueOver
   rectMode (CENTER);
   noStroke();
   fill(#FF9852,50); 
   strokeWeight(2);
   rect(P[e].getXc(),P[e].getYc(),50 ,50);  
    
    
   stroke (connection_color,80);//  farbe des beziers wird benutzt + sättiung verringert
   for (int j=0; j<num;j++){
   if(P[e].getRel(j)>0){ 
          
      
   for(int z = 0; z < P[e].getRel(j); z++){
   strokeWeight(P[e].getRel(j)/fSw);                //do thicker lines as connection goes stronger
   noFill();
   int zentrieren = -230;
          
   bezier(P[e].getXc(),P[e].getYc() + w*.5, 
   P[e].getCx1()  + random (1,400), P[e].getCy1() + w*.5 +zentrieren + random (1,400),
   P[j].getCx1() +zentrieren + random (1,200), P[j].getCy1() + w*.5  + random(1,200), 
   P[j].getXc(),P[j].getYc() + w*.5);
          
  frameRate(7); // beziers wechseln etwas langsamer, aber nicht wirklich geschmeidig
    }
   
               
      }
    }
  } 
  
void click(float beta) {   //Select elements clicked
  P[getElement(beta)].toggleOn();
  }

void all (boolean onOff) {            //Clean all selected connections
  for (int i=0;i<P.length;i++) {
  P[i].setOn(onOff);
    }
  }

  boolean hover (float d) {  //Is the mouse inside an element (anyone)?
  return (d>=rh1 && d<=rh2)?true:false;
  }

void displayBase() {  //show the base
  image(b, posX, posY);
  }

  PolarElement getElement(int n_ord) {  //a method for getting the elements inside the graph
  return P[n_ord];
  }

 

  class PolarElement {
    int[] rels;          //relationship values array
    int ord, nElem, group; //position, number of elements linked to this and group of the element
    float amp, ang, //element amplitude, beginning angle                     
    
  xc, yc, cx1, cy1;       //extreme point and control point of a bezier going to this element
    
    
    String name, info;     //information about the element
    boolean on=false;    //boolean to check whether an element is selected or not

    //CONSTRUCTOR
    PolarElement(int ord, int nElem) {
      this.ord=ord; 
      this.nElem=nElem;               
      rels= new int[nElem];                  
      int pesoT=0;                            //total strength of relationships
      for (int i=0;i<=ord;i++) {
        pesoT+=(rels[i]=t.getInt(i+1, ord+1));
      }
      for (int i=ord+1;i<nElem;i++) {
        pesoT+=(rels[i]=t.getInt(ord+1, i+1));
      }
      amp  =(PI*pesoT/pesoT_T);               //make amplitude proportional to total weight of relationships        
      group=t.getInt(ord+1, nElem+1);          //get rest of info from the table directly
      
      name = t.getString(ord+1, nElem+4);  // interpreten oder titel am kreis
      info = t.getString(ord+1, nElem+3); // interpreten oder titel am kreis

      println(name);
      // anführungszeichen löschen
      //info = info.substring( 1, info.length()-1 );
      //name = name.substring( 1, name.length()-1 );
    }

    //Rest of methods, quite straightforward

    //GET methods
    float   getAmp() {
      return amp;
    }  
    float   getAng() {
      return ang;
    }     
    int   getGroup() {
      return group;
    }
    String  getElemName() {
      return name;
    }
    String  getElemInfo() {
      return info;
    }    
    
   
    
    float    getXc() {
      return xc;
    }
    float    getYc() {
      return yc;
    }
    float   getCx1() {
      return cx1;
    }
    float   getCy1() {
      return cy1;
    }
    boolean  getOn() {
      return on;
    }
    int     getRel(int position) {
      return rels[position];
    }    

    //SET methods
    void addAng(float numberToAdd) {
      ang+=numberToAdd;
    }
    void setCoordinates() {
      xc = posX + (R-w/2) * cos (ang+(amp/2));
      yc = posY + (R-w/2) * sin (ang+(amp/2));
      cx1= posX + (R/f)   * cos (ang+(amp/2));
      cy1= posY + (R/f)   * sin (ang+(amp/2));
    }
    void toggleOn() {
      on=!on;
    }
    void setOn(boolean toSet) {
      on=toSet;
    }
  }//Fin clase PolarElement  

    //TABLA class//(!) Internal to PolarGraph//Based on Ben Fry's "Visualizing Data"

  class Tabla {
    String[][] data;           //data of the table
    int numFilas, numColumnas;  //number of rows and columns

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
        data[i] = split(filas[i], ";");
        
        println(data[i]);
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
      return getString(filas, 0);
    }

    //Get value as a string //  Be careful with method overloading in processingjs // avoid blank window panic crisis!!
    String getString(int indiceFilas, int columna) {
      return data[indiceFilas][columna];
    }
    String getString(String nombreFila, int columna) {      
      return getString(getIndiceFila(nombreFila), columna);
    }

    //Get value as an int   // Be careful with method overloading in processingjs
    int getInt(String nombreFila, int columna) {
      return parseInt(getString(nombreFila, columna));
    }   
    int getInt(int indiceFilas, int columna) {
      return parseInt(getString(indiceFilas, columna));
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
        total+=getInt(indiceFilas, i);
      }
      return total;
    }

    //returns total value of an area
    int getTodo(int f0, int f1, int c0, int c1) {
      int todo=0;
      for (int i=1;i<=f1;i++) {
        for (int j=1;j<=c1;j++) {
          todo+=getInt(i, j);
        }
      }
      return todo;
    }

    //returns maximum value in a column
    int getMaxCol(int c0) {
      int vmax=0;
      for (int i=1;i<getNumFilas();i++) {
        int cval=getInt(i, c0);
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


void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();
  
  super.stop();
}

