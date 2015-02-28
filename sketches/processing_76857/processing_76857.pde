
/* 

OpenProcessing 
Interactive CookBook
Data visualization of the directors of a cookbook;

Laura Panno, Maria D'Uonno, Lena Meher
19/10/2012


Polar graph tool
*/


PFont font;
String txt = "Interactive Cookbook";

//Main object
PolarGraph graph;  
int w=8,           //Width of the elements           
R=250,             //radius of the graph
orX,               //x del centro ""
orY,               //y del centro ""
curv_fact=7,       //curve tightness of the connections
cR=360;            //colormode range 
float sep=25e-4,   //sector separation
cR25=cR*.25,       //generic value one for alpha
cR95=cR*.95,       //generic value two for alpha
fSw=2.5f;          //connections strokeWeight scaling factor 
color bg = (255);  //background color

int progState = 0;
int angle = 0;

PImage[] img = new PImage[8];


PImage img10;



void draw() {


  if (progState == 0) {
    
       fill(255);
    textSize(20);
    text("Interactive CookBook", width/2, height/2);
    
   fill(140, 0, 0, 45);
   translate(width/2 + 65, height/2 - 25);
   rotateZ(radians(angle));
   stroke(200);
   ellipse(-50, -60, 220, 220);
   angle = angle + 1;

  }
    
    if(mousePressed){
      progState = 1;
      
       textFont(font);
       textSize(14);
  }  

  if (progState == 1) {
    background(bg);
    graph.displayBase();                              
    graph.creaConnect();      
    if (graph.hover(dist(mouseX, mouseY, orX, orY))) {  
      cursor(HAND);
      graph.creaConnect(atan2((mouseY-orY), (mouseX-orX)));
    }
    else {
      cursor(MOVE);
    }

image(img10, 117,40);  
  } 
}

void mousePressed(){
  if (mouseButton==LEFT){
    
    if (graph.hover(dist(mouseX,mouseY,orX,orY))) {   //check if mouse is inside an element
      graph.click(atan2((mouseY-orY),(mouseX-orX)));  //if so, toggle its display
     
    }else{
      graph.all(false);  //if you click outside erase everything
    }
  }else{
    graph.all(true);  //right-click shows everything
  }
}

//GRAPHIC
class PolarGraph {
  Tabla t;            
  PolarElement[] P;           //Array of elements to be connected
  PGraphics b;                
  int num,R,R1,w,pesoT_T=0,posX,posY,f,rh1,rh2,nG;  
  float offs;                
  int[] groupN,groupC; 


  
//CONSTRUCTOR
PolarGraph(String data,int posX,int posY,int R,int w,int f,float offs){
    t=new Tabla(data);                 //file Exel: location of the data
    this.posX=posX;this.posY=posY;        
    this.R=R;                          //radius
    this.w=w;                          //width of the elements
    this.f=f;                          //bezier tightness
    this.offs=offs;                    //separation between elements
    num=t.getNumFilas()-1;             //number of elements (considering first row is the legend of the table)
    pesoT_T=t.getTodo(1,num,1,num);    //total number of connections (with this number we'll scale the lenght of the elements)
    R1=R+(w*2);                        //text radius
    rh1=R-(w/2); rh2=R+(w/2);          //min and max to check the hover
    nG=t.getMaxCol(num+1);             //higher value of group
    groupN=new int[nG+1];              //number of elements in each group         
    for(int i=0;i<groupN.length;i++){  
      groupN[i]=0; 
    }
    for(int i=1;i<num+1;i++){          //iterate over the group column
      groupN[t.getInt(i,num+1)]++;
    } 
    groupC=new int[nG+1];              
    arrayCopy(groupN,groupC);          //lets keep intact that info and create a mirror to use it as a counter afterwards (see createBase method)
    P=new PolarElement[num];           //instantiate group of elements
    for (int i=0;i<P.length;i++){      //calculate the start angle of the element
      P[i]=new PolarElement(i,num);    
      if (i>0){
        int a=0;
        while (a<i){                      
          P[i].addAng(P[a++].getAmp());  //iterate over the elements adding the amplitude of the arcs till we reach current element
        }
      }
      P[i].setCoordinates();  //calculate coordinates of the center of the element and the correspondent control point for the bezier
    } //
    createBase(); //just draw the base
  }  
 
//BODY of the graphic
void createBase(){
    b=createGraphics(width,height,JAVA2D);
    b.beginDraw();
    commonSettings(b);
    b.strokeWeight(w);
    for (int i=0;i<P.length;i++){                  //Now we'll assignate hue depending on group 
      int eHue=getElement(i).getGroup();           //this the group value
      --groupC[eHue];                              //substract one to its counter
     
      color strokeColor = color(0);
      
      if(eHue == 0){
        strokeColor=color(255 - i*15, 0, 0);  
      }
      
      if(eHue == 2){
        strokeColor=color(150, 255 - i*6, 0);  
      }
      
      if(eHue == 3){
        strokeColor=color(246, 211, 47);  
      }
       if(eHue == 4){
        strokeColor=color(246, 188, 47);  
      }
       if(eHue == 5){
        strokeColor=color(246, 166, 47);  
      }
      
      
      b.stroke(strokeColor);
   
      float n=i<P.length-1?getElement(i+1).getAng():2*PI;  
      b.arc(b.width/2, b.height/2, R, R, getElement(i).getAng()+offs, n-offs);  //drawing arcs 
    }
    b.translate(b.width/2,b.height/2);
    b.fill(cR25);
    for (int i=0;i<P.length;i++){   //draw the names
      b.rotate(P[i].getAmp()*.5);
      b.textFont(font);
      b.textSize(14);
      b.text(P[i].getElemName(),R1,0);
      b.rotate(P[i].getAmp()*.5);
    }  
    b.endDraw();
  }
  
//TAKE ELEMENTS from TABLA
int getElement(float mouseAngle){  
    float teta=(mouseAngle>0)?mouseAngle:map(mouseAngle,-PI,0,PI,2*PI); 
    int element=0; 
    textSize(14);
    
    while (element<P.length){    
      if (P[element].getAng()>teta){
        break;
      } 
      element++;
    } 
    return element-1;  
  }
  
//CONNECTION
void creaConnect(float beta){                      
    int i=getElement(beta); 
    
     if(i <= 7){     //load images
      image(img[i], 150,150);
    }
    fill(cR25);
    textSize(16);
    text(P[i].getElemName(),50,250); 
    textSize(12);    //take name
    text(P[i].getElemInfo(),50, 290, 180, 800);                         //take info 
    
    println(P[i].getElemInfo());
    
    pushMatrix();
    translate (posX,posY); 
    rotate(atan2((P[i].getYc()-posY),(P[i].getXc()-posX)));
    fill(#000000,cR95);          //code color: text if mousePressed
    text(P[i].getElemName(),R1,0);
    popMatrix(); 
    doConnections(i,color(cR25,cR95));                 //draw connections
  }
  
  void creaConnect () {                 //display selected connections
    for (int i=0; i<P.length; i++){
      if (P[i].getOn()){                //if element is selected
        doConnections(i,#cdc6b3);       //do the job
      }
    }
  }
   
  void doConnections(int e,color connection_color){    //element to connect and colour of connections
    noFill(); 
    stroke(bg);
    strokeWeight(1);
    ellipse(P[e].getXc(),P[e].getYc(),w*.5,w*.5);            //this little ellipse clarifies elements selected
    stroke(connection_color);
    for (int j=0; j<num;j++){
      if(P[e].getRel(j)>0){ 
      strokeWeight(P[e].getRel(j)/fSw);                //do thicker lines as connection goes stronger
      noFill();
      bezier(P[e].getXc(),P[e].getYc(),P[e].getCx1(),P[e].getCy1(),P[j].getCx1(),P[j].getCy1(),P[j].getXc(),P[j].getYc());  //make connections 
      }   
    }
  } 
   
   
  void click(float beta){   //Select elements clicked
    P[getElement(beta)].toggleOn();
  }
  
  void all (boolean onOff){      //Clean all selected connections
    for (int i=0;i<P.length;i++){
      P[i].setOn(onOff);
    }
  }
  
  boolean hover (float d){  
    return (d>=rh1 && d<=rh2)?true:false;
  }
  
  void displayBase(){  //show the base
    image(b,posX,posY); 
  }
   
  PolarElement getElement(int n_ord){  //a method for getting the elements inside the graph
    return P[n_ord];
  }
   
  //PolarElement class
  
  class PolarElement{
    int[] rels;          //relationship values array
    int ord,nElem,group; //position, number of elements linked to this and group of the element
    float amp,ang,       //element amplitude, beginning angle                     
    xc,yc,cx1,cy1;       //extreme point and control point of a bezier going to this element
    String name,info;     //information about the element
    boolean on=false;    //boolean to check whether an element is selected or not
    
    //CONSTRUCTOR
    PolarElement(int ord,int nElem){
      this.ord=ord; this.nElem=nElem;               
      rels= new int[nElem];                  
      int pesoT=0;                            //total strength of relationships
      for (int i=0;i<=ord;i++){
        pesoT+=(rels[i]=t.getInt(i+1,ord+1));
      }
      for (int i=ord+1;i<nElem;i++){
        pesoT+=(rels[i]=t.getInt(ord+1,i+1));
      }
      amp  =(PI*pesoT/pesoT_T);             //make amplitude proportional to total weight of relationships        
      group=t.getInt(ord+1,nElem+1);         
      name =t.getString(ord+1,nElem+2);
      info  =t.getString(ord+1,nElem+3);  
      
    }
    
    //GET methods
    float   getAmp(){return amp;}  
    float   getAng(){return ang;}     
    int   getGroup(){return group;}
    String  getElemName(){return name;}
    String  getElemInfo(){return info;}    
    float    getXc(){return xc;}
    float    getYc(){return yc;}
    float   getCx1(){return cx1;}
    float   getCy1(){return cy1;}
    boolean  getOn(){return on;}
    int     getRel(int position){return rels[position];}    
    
  //SET methods
  void addAng(float numberToAdd){
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
  }   
//TABLA class// Based on Ben Fry's "Visualizing Data"
  
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
         
        data[i] = split(filas[i],";");
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

    //Get value as a string 
    String getString(int indiceFilas, int columna) {
      return data[indiceFilas][columna];
    }
    String getString(String nombreFila, int columna)  {      
      return getString(getIndiceFila(nombreFila),columna);
    }

    //Get value as an int 
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
   
  }
}
void commonSettings (PGraphics pg){ 

  pg.ellipseMode(RADIUS);
  pg.strokeCap(SQUARE);
  pg.imageMode(CENTER);
  pg.noFill();
  pg.smooth();
}

void setup(){
  size(1024,768, P3D);
 ellipseMode(CENTER);
  fill(90, 0, 0);
  
  font = loadFont("FrutigerLT-Light-20.vlw");
  textFont(font);
  
  commonSettings(g);
  orX=width/2+110; orY=height/2 - 10; //centro del grafico
  graph=new PolarGraph("tabla.csv",orX,orY,R,w,curv_fact,sep);
  
  smooth(4);
  
  img[0] = loadImage("tiramisu.jpg");
  img[1] = loadImage("cassata-siciliana.jpg");
  img[2] = loadImage("delizia-al-limone.jpg");
  img[3] = loadImage("crostata.jpg");
  img[4] = loadImage("torta-della-nonna.jpg");
  img[5] = loadImage("migliaccio.jpg");
  img[6] = loadImage("sacher.jpg");
  img[7] = loadImage("pastiera-napoletana.jpg");
  
  img10 = loadImage("Senza titolo-1.jpg");
  
}



