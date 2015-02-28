
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;


PeasyCam cam;
int imageWidth = 2700;
int red;
boolean isMouseClicked=false;
int blue=0;
int imageHeight=1350;
int variation=10;
int pointWeight =2;
float thetaX = 0.0;
float thetaY = 0.0;
float tempX = 0.0;
float tempY = 0.0;
float imageWidthf = 2700.0;
float imageHeightf = 1350.0;
int index=0;
int pixelPointer_X=0;
int pixelPointer_Y=0;
String subindex;
PFont 
h0,h1,h2,h3;
float zoom = 1.2;
Table t;
DataHolder[] data;

int radiuss=100;

float[] cosValue = new float[imageHeight];
float[] sinValue = new float[imageHeight];

float radius;

float r=0;
int X,Y;
PImage images ;
color c;
boolean doRotate=true;
float x,y,z;
  float ROTATION_FACTOR=.01*DEG_TO_RAD;
  
  PVector 
  rotSpeed,
  rotation;
  
  PGraphics 
  hover;
boolean m1 = false;
boolean mm1 = false;
boolean m2 = false;
boolean mm2 = false;
boolean m3 = false;
boolean mm3 = false;
boolean upDown=false;
float doRotateY=0.0;

float ratio=200;
float ratio2=100;
int count=0;
int count2=0;
boolean first=true;
void setup(){
 size(1200, 700, P3D);
 //strokeCap(SQUARE);
  initCenterPos();
 images = loadImage("a.png");
 hover=  createGraphics(width,height,P3D);
 rotation= new PVector(0,HALF_PI);
 rotSpeed= new PVector(0,0);
 /*
  cam = new PeasyCam(this, 0, -400, 0,1000);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(9000);
 */
 t= new Table("rank1.csv");
  data= new DataHolder[t.getNumRows()-1];
  for(int i=0;i<data.length;i++) {
  data[i]= new DataHolder(i);
     
  }
 
 
 X=  width/2;
 Y= height/2;
 drawPoint();

 radius=sqrt(x*x+y*y);
  
}

void draw(){
  background(0);


  translate(width/2, height/2);

 

  control();
  detectHover();
    scale(zoom);
    
if(!doRotate){    
  
 if(thetaX<=tempX){
    thetaX+= ((tempX-thetaX)/20);
  }
  else{
    thetaX-= ((thetaX-tempX)/20);
  }  
  
  
  if(thetaY<=tempY){
   thetaY+= ((tempY-thetaY)/20);
  }
  else{
  thetaY -= ((thetaY-tempY)/20);
  }

  rotateY(thetaY);
  rotateX(thetaX);
 
  count++;

  if(count==200){
    
    
    doRotate=true;
    first = true;
    count=0;
  }
}
else{  

          
          if(first){
            
                    if(thetaX>=0){
                      thetaX-=0.01;
                     
                    }
                    else{
                     thetaX+=0.01; 
                  
                    }
                  
                 
                   
                  
                    if(thetaX>-0.01 && thetaX<0.01){
                     first=false; 
                    }
          
            }
        else{
            
                    thetaY +=0.01;
        }
        rotateY(thetaY);
           rotateX(thetaX);
         
  

}



  noStroke();
  
  
  if(isMouseClicked){
    
    
  
      
        click-=(1.0/10.0);
        if(click<=0){
         click = 0;          
        }
        click2+=0.4000000;
        if(click2>=5.0){
         click2=5.0;
        }
        
     
 
  }
  
  else{
    click+=(1.0/10.0);
        if(click>=1){
         click = 1;          
        }
        click2-=0.4000000;
        if(click2<=1.0){
         click2=1.0;
        }
        
    
  }
  
  
  
  
  if(thetaY>(2*PI)){
    thetaY-=(2*PI);
  }
 // sphere(87);
 // translate(width/2, height/2);
  drawPoint();
  
  

  update();
 


}

void mouseDragged(){

  if (mouseButton==LEFT) addRotation(mouseX,mouseY,pmouseX,pmouseY);

}

void addRotation(int mX,int mY,int pmX,int pmY){

    thetaX+= (pmY-mY)* ROTATION_FACTOR;
   thetaY -= (pmX-mX)* ROTATION_FACTOR;   
   

   
 }
 
 void update(){
   rotation.add  (rotSpeed);
   rotSpeed.mult (.95);  
 }


void keyPressed() {
  if (key == 'a') {
    if(index < 12){
      index ++;
    }else if(index == 12){
      index = 0;
    }
  }
   
 if(keyCode==UP){

click2+=1;

 } 
}
void mouseClicked(){
  if(blue==0){
  isMouseClicked=!isMouseClicked;
  
  }
  else{
       doRotate = false;

    //tempX = centerPos[red/3-1][0];
      //   tempY = centerPos[red/3-1][1];
    
    for(int row = 0;row<81;row++){
      if(tCountry.equals(countryName[row])){
         tempX = centerPos[row][0];
         tempY = centerPos[row][1];
        
      }
    }
    
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  if(e>0){
     zoom = lerp(zoom,0.5,0.02);
   
  }
  else if(e<0){
    zoom = lerp(zoom,2.5,0.02);
   
  }
  
  
 
}


  












class DataHolder {  
  String COUNTRY; 

  int[][] index = new int[t.getNumRows()-1][t.getNumCols()-1];
  boolean hovered = false;
  

DataHolder (int i){
    
    
    COUNTRY   = t.getString (i+1,0);
    
    
    for(int j=0; j<t.getNumCols()-1; j++){
    index[i][j] = t.getInt    (i+1,j+1);
    

    }
    
  }
  
   void setHoveredTo (boolean booleanToSet){
    hovered= booleanToSet;
  }
  
  
  
}
 float[][] centerPos= { 
    {0.61784667,3.6363919},
{0.68399477,3.6196349},
{0.52935874,3.82593},
{-0.364948,6.468179},
{-0.76201034,8.6341305},
{0.5450663,-2.5780256},
{0.6339033,-9.01934},
{0.7761476,-8.595404},
{0.44889838,-8.766948},
{0.28187054,-9.848893},
{-0.42341685,-9.904047},
{0.5059708,-8.808679},
{0.3061307,-9.955879},
{0.43633217,-8.879366},
{-0.56845385,-6.168172},
{0.47909242,-8.850574},
{0.43511003,-8.830154},
{0.5586791,-9.006078},
{0.5585044,-8.667314},
{0.5026539,-8.788264},
{0.48520046,-8.934863},
{0.37123054,-8.866451},
{0.36878714,-8.64532},
{0.4586716,-8.896645},
{0.2153727,-9.056859},
{0.3136346,-15.23724},
{0.49392712,-12.738463},
{0.37681547,-14.970555},
{0.47403026,-12.901121},
{-0.13875474,-12.40126},
{-0.11,2.919998},
{0.06405254,-12.732714},
{0.20350437,-12.963966},
{-0.0020953973,-12.598849},
{-0.4674,-15.268153},
{0.45465758,-19.077166},
{-0.04066669,-15.963323},
{-0.010123424,-16.1012},
{0.1979203,-0.13089925},
{0.13999999,3.4599972},
{0.5824162,-3.3264225},
{0.42359132,-2.6506312},
{0.12915438,-0.09354979},
{0.2700023,-2.5364861},
{0.13980079,-2.948558},
{0.029496003,-3.3388135},
{-0.08999999,-0.10999997},
{-0.17279251,-3.47628},
{0.4072074,-3.0662804},
{0.30999997,3.4999971},
{0.149999998,3.3699973},
{0.03720749,-0.24628289},
{-0.13279249,3.483714},
{0.22720753,3.9537137},
{-0.042792507,3.8737137},
{0.117207475,3.1337144},
{0.24720754,2.9437146},
{0.3072075,3.503714},
{-0.21279252,3.513714},
{-0.4027924,3.653714},
{0.047207505,4.0337143},
{0.20720753,3.493714},
{0.16720751,3.553714},
{0.1372075,3.0337145},
{-0.122792475,3.533714},
{-0.3027925,3.573714},
{-0.032792494,3.7737138},
{-0.40488678,3.5906239},
{0.12511308,3.430624},
{-0.034886897,3.8306236},
{0.17511311,3.0906243},
{0.055113092,2.8906245},
{1.75E-04,3.8806949},
{-0.2598255,3.5206952},
{-0.15982544,3.5506952},
{-0.07982544,3.730695},
{0.20017457,3.2106955},
{-0.3598254,3.5506952},
{0.07017453,3.9006948},
{-0.029825283,3.4706953},
{0.050174534,3.4006953}
 }; 

String[] countryName = {
 "Sweden",
"Norway",
"United Kingdom",
"United States",
"New Zealand",
"Denmark",
"Finland",
"Iceland",
"France",
"Korea (Rep. of)",
"Australia",
"Netherlands",
"Japan",
"Austria",
"Canada",
"Germany",
"Switzerland",
"Estonia",
"Ireland",
"Belgium",
"Poland",
"Italy",
"Portugal",
"Czech Republic",
"Israel",
"Greece",
"Chile",
"Spain",
"Uruguay",
"Mexico",
"Singapore",
"Colombia",
"Brazil",
"Costa Rica",
"South Africa",
"Argentina",
"Malaysia",
"Philippines",
"Peru",
"Mauritius",
"Russia",
"Hungary",
"Ecuador",
"Tunisia",
"United Arab Emirates",
"Thailand",
"Jamaica",
"Indonesia",
"Kazakhstan",
"Bahrain",
"Qatar",
"Venezuela",
"Kenya",
"Morocco",
"Ghana",
"India",
"China",
"Turkey",
"Tanzania",
"Namibia",
"Senegal",
"Jordan",
"Egypt",
"Bangladesh",
"Uganda",
"Zambia",
"Nigeria",
"Botswana",
"Saudi Arabia",
"Benin",
"Nepal",
"Viet Nam",
"Burkina Faso",
"Malawi",
"Rwanda",
"Cameroon",
"Pakistan",
"Zimbabwe",
"Mali",
"Ethiopia",
"Yemen"
 
  
};
 
 void initCenterPos(){
  
  for(int row=0;row<81;row++){
    /*
   centerPos[row][0]+=(8*PI);
   while(centerPos[row][0]>(2*PI)){
       centerPos[row][0]-=(2*PI);
      
     }
     */
   centerPos[row][1]+=(8*PI);
   while(centerPos[row][1]>(2*PI)){
       centerPos[row][1]-=(2*PI);
   }
 
   

  }
  
  
   
 }


//Table///////////////////////////////almost classic class, extracted from Ben Fry's "Visualizing Data"
//////////////////////////////////////////////////////////////////////////////////////////////////////

class Table {
  String[][] data;
  int numRows, numCols;

  //CONSTRUCTOR
  Table(String nombre) {   
    String[] filas = loadStrings(nombre); 
    numRows = filas.length;
    data = new String[numRows][];
    for (int i = 0; i < filas.length; i++) {
      if (trim(filas[i]).length() == 0) {
        continue;
      }   
      if (filas[i].startsWith("#")) {      //startsWith() doesn't work on processingjs
        continue;
      }   
      data[i] = split(filas[i],",");       //dont use TAB on processingjs
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
} 
void control(){
   
    int x = -550;
    int y = -270;
    
    String[] subindex = new String[] {"Web Index","Universal Access","Education and Awareness","Access and Affordability",
    "Communications Infrastructure","Relevant Content","Web use",
  "Content creation","Freedom and Openess","Empowerment","Political impact","Social and environmental","Economic impact"};

    textSize(22);
    noStroke();
    text("The Impact of the World Wide Web", x,y);
    textSize(22);
    text("# " + subindex[index], x,y+40);
    textSize(16);
    fill(225);
    int yy = -190;
    text(subindex[0], x+10,yy);
    text(subindex[1], x+10,yy+25);
    text(subindex[5], x+10,yy+50);
    text(subindex[8], x+10,yy+75);
    text(subindex[9], x+10,yy+100);
    
    
    if(m1){
    textSize(15);
    fill(200);
    text(subindex[2], x+200,yy+25);
    text(subindex[3], x+200,yy+50);
    text(subindex[4], x+200,yy+75);
    }
    
    
    if(m2){
    textSize(15);
    fill(200);
    text(subindex[6], x+200,yy+50);
    text(subindex[7], x+200,yy+75);
    }
    
    if(m3){
    textSize(15);
    fill(200);
    text(subindex[10], x+200,yy+100);
    text(subindex[11], x+200,yy+125);
    text(subindex[12], x+200,yy+150);
    }
    
    
    
    
   // text("# "+ subindex[index], -550,-220);
    noStroke();
   for(int i=1; i<82; i++){
    
    fill(3*i, 255-60+i*2, 255-i*3);
    rect(x+55, y+240+4*i, 20, 3);
    fill(255);
    }
    
}



String tCountry;
void detectHover(){

    if (overRect(60,170,190,15)) {
    m1 = true;
    mm1 = true;
      }else if(mm1==false){
      m1=false;
      }else{
      mm1 = false;
      }
       if (overRect(245,170,225,75)){
    mm1 = true;
      }

      
      
      
    //////////////////////////////////////////////////
    if (overRect(60,200,190,15)) {
    m2 = true;
    mm2 = true;
    } else if(mm2==false){
    m2 = false;
    }else{
    mm2 = false;
    }if(overRect(245,200,225,40)){
    mm2 = true;
    }
    ///////////////////////////////////////////////////
    if (overRect(60,250,190,15)) {
    m3 = true;
    mm3 = true;
    } else if(mm3 == false){
    m3 = false;
    }else{
    mm3 = false;
    }if(overRect(245,250,225,310)){
    mm3 = true;
    }
    //////////////////////////////////////////////////
    
    
   

    
    if(mouseY>310){
    color cc = get(mouseX, mouseY);
    red = (int)red(cc);
blue = (int)blue(cc);
    for(int i=1; i<82; i++){
      if( i == red/3 ){  
        for(int j=1; j<82; j++){
          if(data[j-1].index[j-1][index] == i){
          data[j-1].setHoveredTo(true);
        fill(255);
        textSize(20);
        text(data[j-1].index[j-1][index],-530,-250+230+4*i);
        textSize(20);
        text(data[j-1].COUNTRY,  -460,-250+230+4*i);
           tCountry=data[j-1].COUNTRY;
        noFill();
        }}
      }
      else{
        data[i-1].setHoveredTo(false);
      }
    }}
}
float click=1;
float click2=1;
float p = 0.8;
void drawPoint(){
  
   for(int i=-imageHeight/2;i<=imageHeight/2;i+=variation){ //Y-Axis
     for(int j=-imageHeight/2;j<=imageHeight/2;j+=variation){//X-Axis
       
       strokeWeight(pointWeight);
       x=j*sqrt(imageHeightf/2-(i*i)/imageHeightf);
       y=i*sqrt(imageHeightf/2-(j*j)/imageHeightf);
       z = sqrt((radius*radius)-(x*x)-(y*y));
       
       
       c = images.get(j+imageHeight/2,i+imageHeight/2);
       
      if(red(c)!=255){
          stroke(255);
    //      point(x/ratio,y/ratio,z/ratio);
          stroke(0);
        
       }
     
      
      for(int k = 1; k<82; k++){
         
        
         if( red(c) == k){
       
         int r = data[k-1].index[k-1][index] ;
         
         
         
        if(red/3==r){
         strokeWeight(10); 
        }
        else{
         strokeWeight(pointWeight); 
        }
        stroke(3*r, 255-60+r*2, 255-r*3, 200);
         point(x/(40+2*r*click)/click2,y/(40+2*r*click)/click2,z/(40+2*r*click)/click2);
         stroke(3*r, 255-60+r*2, 255-r*3, 100);
         strokeWeight(5);
         point(x/(40+2*r*click)/click2,y/(40+2*r*click)/click2,z/(40+2*r*click)/click2);
/*
         for(float p=0.1; p<0.5; p = p+0.1){
         strokeWeight(6);
         stroke(3*r, 255-60+r*2, 255-r*3, 100-p*30);
         point(x/(40+2*r*click+p)/click2,y/(40+2*r*click+p)/click2,z/(40+2*r*click+p)/click2);
         
         }
  */     
         }
       }
     
     
     
     }
   }
   pixelPointer_X = imageWidth;
   pixelPointer_Y = 0;
  
  p = 0.8;
for(int i=-imageHeight/2;i<=imageHeight/2;i+=variation){ //Y-Axis
     for(int j=-imageHeight/2;j<=imageHeight/2;j+=variation){//X-Axis
       strokeWeight(pointWeight);
       x=j*sqrt(imageHeightf/2-(i*i)/imageHeightf);
       y=i*sqrt(imageHeightf/2-(j*j)/imageHeightf);
       z = -sqrt((radius*radius)-(x*x)-(y*y));
       c = images.get(pixelPointer_X,pixelPointer_Y);
          if(red(c)!=255){
          stroke(255);
     //     point(x/ratio,y/ratio,z/ratio);
          stroke(0);
          
       }
     

     for(int k = 1; k<82; k++){
         
         red(c);
         
         if( red(c) == k){
       
         int r = data[k-1].index[k-1][index] ;
         if(red/3==r){
         strokeWeight(10); 
        }
        else{
         strokeWeight(pointWeight); 
        }
         stroke(3*r, 255-60+r*2, 255-r*3, 200);
         point(x/(40+2*r*click)/click2,y/(40+2*r*click)/click2,z/(40+2*r*click)/click2);
           stroke(3*r, 255-60+r*2, 255-r*3, 100);
         strokeWeight(5);
         point(x/(40+2*r*click)/click2,y/(40+2*r*click)/click2,z/(40+2*r*click)/click2);
         /*
         for(float p=0.1; p<0.5; p = p+0.1){
         strokeWeight(6);
         stroke(3*r, 255-60+r*2, 255-r*3, 100-p*30);
         point(x/(40+2*r*click+p)/click2,y/(40+2*r*click+p)/click2,z/(40+2*r*click+p)/click2);
         
         }
         */
         }
       }
        pixelPointer_X =pixelPointer_X-variation;
        
     }
     pixelPointer_Y+=variation;
     pixelPointer_X = imageWidth;
   }
 
 }
void mousePressed() {
  if (overRect(60,145,130,15)) {
    index = 0;
  }
  if (overRect(60,170,130,15)) {
    index = 1;
    m1=false;
    mm1=false;
   
  }
  if (overRect(60,195,130,15)) {
    index = 5;
  }
  if (overRect(60,220,130,15)) {
    index = 8;
  }
  if (overRect(60,250,130,15)) {
    index = 9;
  }
  if (overRect(245,170,225,15)&&mm1&&m1 == true){
    index = 2;
    m1 = false;
    mm1 = false;
  }
  if (overRect(245,195,225,15)&&mm1&&m1 == true){
    index = 3;
    m1 = false;
    mm1 = false;
  }
  if (overRect(245,220,225,15)&&mm1&&m1 == true){
    index = 4;
    m1 = false;
    mm1 = false;
  }
  //------------------------------------------------------------
  if (overRect(245,195,225,15)&&mm2 &&m2 == true){
    index = 6;
    m2 = false;
    mm2 = false;
  }
  if (overRect(245,220,225,15)&&mm2 &&m2 == true){
    index = 7;
    m2 = false;
    mm2 = false;
  }
  //------------------------------------------------------------
  if (overRect(245,250,225,15)&&mm3 &&m3 == true){
    index = 10;
    m3 = false;
    mm3 = false;
  }
  if (overRect(245,270,225,15)&&mm3 &&m3 == true){
    index = 11;
    m3 = false;
    mm3 = false;
  }if (overRect(245,300,225,15)&&mm3 &&m3 == true){
    index = 12;
    m3 = false;
    mm3 = false;
  }
 


 
}



boolean overRect(int a, int b, int w, int h)  {

  if (mouseX >= a && mouseX <= a+w && mouseY >= b && mouseY <= b+h) {
    return true;
  } else {
    return false;
  }
}



