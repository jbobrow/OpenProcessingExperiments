

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.*;
import javax.swing.*;
import java.io.*;
import java.util.ArrayList;
import javax.swing.event.*;

SimpleThread thread1;
help hp = new help();
boolean helpCheck = false;
boolean terminate=false;
String saveString;
boolean saveCheck=false;
boolean saveCheck1=false;

HScrollbar hs1;
colorSelect cs1;
boolean scrollInit=false;
float scrollPos;
PFont font1,font2;
PShape[] states = new PShape[52];
PImage country,background,gui_key,icon1;
PShape USA;
Table data,table;
float dataMin = -7;
float dataMax = 11;
int i=0;
int j=0;
int count;
float r = 999;
float g = 999;
String[] stateNames = new String[53];
String stateString="";
ArrayList<Integer> shapeSelect = new ArrayList<Integer>();
int[] shapeSelectList;
int count2=0;
boolean shapeSelected=false;
boolean listcheck=true;
boolean clearCheck=false;
int year=0;
int yearCount=0;
int yearConstrain=0;
boolean bubbleCheck =false;
int bubbleIndx;
color c;
String[] colors;
String colSelect="pastel";
boolean colSel1=false;
boolean colSel2=false;

float[] r2;

boolean keyCheck=false;

int X,Y,Z;
int Xvar=17;
int Yvar=18;
int Zvar=16;
int keyPixel1;
int kPos;

boolean xButtonCheck = false;
boolean yButtonCheck = false;
boolean zButtonCheck = false;
boolean cButtonCheck = false;
boolean shapeSelButtonCheck=false;

int fade =0;
int fadeout =200;

boolean mouseCheck=false;
boolean releaseCheck=false;

Plot plot;
Bubble[] bubbles = new Bubble[51];
 
int leftMargin = 600;
int rightMargin = 20;
int topMargin = 200;
int bottomMargin = 50;
 
int minRadius = 10;
int maxRadius = 30;
//====table=======================
int t;
int[] t2;
float X1, Y1, X2, Y2;
int index=0;
float min, max;
String[] selection;
int count3=6;
int pass=0;
//==COLORS ====================

  color select1;
  color select2;
  color select3;
  color stateSelect;
  color bubbleSelect;
  color liminalSelect;
  
  color c1; //lower left
  color c2; //upper left
  color c3; //lower right
  color c4;  //upper right
  
//=============================

void setup() {
  size(980, 600);
  font1=loadFont("Constantia-20.vlw");
  font2=loadFont("Constantia-Bold-20.vlw");
  
  cs1 = new colorSelect("pastel");
 
 
//==SCROLLBAR===================================

  hs1 = new HScrollbar(20, 474, 455, 16, 1);

//==TABLE=========================================
                            
  table = loadTable("crime.csv","header");
  println(table.getColumnCount() + " total columns in table");
  
//===PLOT=========================================

  frameRate(30);
 
  // initialize plot
  plot = new Plot(leftMargin, topMargin, width-rightMargin, height-topMargin, color(235));
   
  // plot 5 bubbles
  generateValues();
//=================================================

  USA = loadShape("states.svg");
  background = loadImage("gui.png");
  country = loadImage("USA_65.png");
  USA.disableStyle();
  gui_key = loadImage("gui_key.png");
  
  for (i=0; i<USA.getChildCount();i++){
    states[count]=USA.getChild(i);
    states[count].scale(.50);
    stateNames[count]=(states[count].getName());
    //println(count+" "+states[count].getName());
    count++;
  }
  count=0;
  t2 = new int[41];

}

void draw() {
  
  frameRate(60);
    if (fade<=30){
    fade++;
  }
  if (fadeout>0){
    fadeout-=10;
  }
  
  frame.setTitle("Crime Statistics "+table.getString(yearConstrain,table.getColumnTitle(0)));

  noTint();
  strokeWeight(1);
  background(255);

  image(background,0,0);
  //image(country,0,0);
  noFill();

  for (int k=0;k<states.length;k++){
    stroke(100);
    strokeWeight(1);
    shape(USA.getChild(k),24,80);
  }
  if (helpCheck==false){
    cs1.update(colSelect);
  }
//==SCROLLBAR========

  hs1.update();
  hs1.display();
  
  int space = 5;
  for (int i=0;i<45;i+=5){
    textSize(10);
    fill(0);
    text((1960+i),20+space,474);
    space+=53;
  }
  
   
  //text(int(scrollPos),mouseX,mouseY);
 
 yearConstrain=constrain(year,0,2040);

//===GRID=================================
  
 for(int i=0; i<450; i+=50){
   stroke(210,225,235);
   strokeWeight(1);
     if(i==200){
       stroke(210);
       strokeWeight(2);
       }
     line(i+550,60,i+550,height/2+160); //vert
   }
   for(int w=0; w<450; w+=50){
     stroke(210,225,235);
     strokeWeight(1);
     if(w==200){
       stroke(210);
       strokeWeight(2);
       }
       line(550,w+60,width/2+460,w+60); //horiz
   }
   
   fill(c2,50);
   rect(550,60,200,200);
   
   fill(c4,50);
   rect(750,60,200,200);
   
   fill(c1,50);
   rect(550,260,200,200);
   
   fill(c3,50);
   rect(750,260,200,200);

//==States Select ========================
  stroke(70,85,95);
  for (int k=0;k<states.length;k++){
    if(colors[k]=="c1"){
      fill(c1);
      shape(states[k+1],24,80);
    }if(colors[k]=="c2"){
      fill(c2);
      shape(states[k+1],24,80);
    }if(colors[k]=="c3"){
      fill(c3);
      shape(states[k+1],24,80);
    }if(colors[k]=="c4"){
      fill(c4);
      shape(states[k+1],24,80);
    } else{
      noFill();
      shape(states[k],24,80);
    }
    //shape(states[k+1],24,80);
  }
  
  if (stateIndex()>=0 && stateIndex() <=150){
    stroke(0);
    fill(stateSelect);
    strokeWeight(4);
    shape(states[stateIndex()],24,80);
  }else  if (bubbleIndx!=-999 && bubbleCheck){
    stroke(0);
    fill(stateSelect);
    strokeWeight(4);
    shape(states[bubbleIndx+1],24,80);
    bubbleCheck=false;
  }else{
    noFill();
  }
   
  
  for (int j=0; j<shapeSelect.size();j++){
    if (shapeSelect.get(j)!=-999){
      //fill(255,255,255,50);
      noFill();
      strokeWeight(4);
      stroke(10,10,10);
      shape(states[shapeSelect.get(j)],24,80);
    }
  }
    
  fill(60);
  textSize(12);
  if(mouseX>550 && mouseX<950 && mouseY >60 && mouseY<460){
    String data2 = "x coord = "+mouseX+"    y coord = "+mouseY;
    text(data2, 680,55);
  }else{
    String data2 = "x coord = "+"    y coord = ";
    text(data2, 680,55);
  }
  
  int spaceCount=0;
  String data3 = table.getColumnTitle(Yvar);
  for (int i=0;i<data3.length();i++){
    text(data3.charAt(i)+" ",535,115+spaceCount);
    spaceCount+=17;
  }
  String data4 = table.getColumnTitle(Xvar);
  
  spaceCount=0;
  for (int i=0;i<data4.length();i++){
    text(data4.charAt(i)+" ",600+spaceCount,477);
    spaceCount+=17;
  }
  
  plot.display();
   

  // display bubbles
  try{
    for (int i = 0; i < bubbles.length; i++) {
      bubbles[i].display();}
  }catch(Exception e) {
      
    }
     
    // display labels
  try{
    for (int i = 0; i < bubbles.length; i++) {
      bubbles[i].displayLabel();}
    
   }catch(Exception e){
    
    }
 
//=BUTTONS & LABELS======================

  fill(60);
  stroke(255);
  
  int returnCount = 0;
  int returnCount2 = 0;
  int xPos = 10;
  int yPos = 500;
  
  try{
    keyPixel1=int(green(gui_key.pixels[mouseX+mouseY*gui_key.width])+4);
  }catch(Exception e){
  }
  
  for(int i = 4; i<table.getColumnCount();i++){
      returnCount++;
      stroke(100);
      textFont(font2,11.5);
      if(xButtonCheck && i==keyPixel1|| i==Xvar){
        fill(select1);
        text(table.getColumnTitle(i)+" (x)",xPos,yPos);
      }
      else if(yButtonCheck && i==keyPixel1|| i==Yvar){
        fill(select2);
        text(table.getColumnTitle(i)+" (y)",xPos,yPos);
      }else if(zButtonCheck && i==keyPixel1|| i==Zvar){
        fill(select3);
        text(table.getColumnTitle(i)+" (r)",xPos,yPos);
      }else if(i!=Xvar || i!=Zvar || i!=Yvar){
        if (xButtonCheck || yButtonCheck || zButtonCheck){
          fill(liminalSelect);
          }else{
            fill(50);
          } 
      }
     
      text(table.getColumnTitle(i),xPos,yPos);
      textFont(font1,11.5);
      if (stateIndex() != -999){
        text(table.getString(stateIndex()-1+yearConstrain,table.getColumnTitle(i)),xPos,yPos+17);
      }else  if (bubbleIndx!=-999 && bubbleCheck){
        text(table.getString(bubbleIndx+yearConstrain,table.getColumnTitle(i)),xPos,yPos+17);
    //shape(states[bubbleIndx+1],24,80);
    
      }else{
        text("",xPos,yPos+18);
      }
      yPos=yPos+36;
      //println(returnCount);
      if(returnCount == 3){
        xPos=xPos+140;
        yPos=500;
        returnCount=0;
      }
    }
    if(saveCheck1==false){
      addButtons("Select X Axis",550,5,"off",select1,"large");
      addButtons("Select Y Axis",660,5,"off",select2,"large");
      addButtons("Select Radius",770,5,"off",select3,"large");
      addButtons("Colors",880,5,"off",select1,"small");
      addButtons("Clear",475,40,"off",color(100,100),"small");
      addButtons("Save",939,5,"off",select1,"small");
      addButtons("Select States",365,40,"off",color(100,100),"large");
      addButtons("Help",5,40,"off",color(100,100),"small");
  //    addButtons("",880,5,"off",select1,"small");
  //    image(icon1,880,5);
    }
    if(xButtonCheck){
      addButtons("Select X Axis",550,5,"on",select1,"large");
    }
    else if(yButtonCheck){
      addButtons("Select Y Axis",660,5,"on",select2,"large");
    }
    else if(zButtonCheck){
      addButtons("Select Radius",770,5,"on",select3,"large");
    }else if (cButtonCheck){
      addButtons("Colors",880,5,"on",select1,"small");
      fill(255,200);
      strokeWeight(.1);
      stroke(55);
      rect(879,40,68,70);
      textSize(12);
      if(overRect(879,41,55,15)){
        fill(select1);
      }else{
        fill(0);
      }
      text("Pastel",881,55);
      if(overRect(879,70,55,15)){
        fill(select1);
      }else{
        fill(0);
      }
      text("Holliday",881,80);
      if(overRect(879,86,55,15)){
        fill(select1);
      }else{
        fill(0);
      }
      text("ColorSafe",881,105);
    }else if (clearCheck){
      shapeSelect=new ArrayList<Integer>();
      shapeSelected=false;
      generateValues();
      clearCheck=false;
    }if (overRect(475,40,50,30)){
      addButtons("Clear",475,40,"on",color(255,0,0),"small");
      textSize(12);
      fill(255,150);
      stroke(0);
      strokeWeight(.1);
      rect(472,72,80,35);
       fill(50,150);
      text("Clear selected\n states",475,85);
    }if(overRect(365,40,100,50)){
        addButtons("Select States",365,40,"on",color(100,100),"large");
    }if(overRect(5,40,25,25)){
        addButtons("Help",5,40,"on",color(100,100),"large");
    }


//===TITLE - YEAR======================================
  textSize(20);

  fill(69, 117, 180,fade*20);
  text("Year:  "+table.getString(yearConstrain,table.getColumnTitle(0)),width*.20,450);
  
  if(stateIndex()!=-999){
    textSize(15);
    fill(117, 117, 110,fade*20);
    stateString=table.getString(stateIndex()-1,table.getColumnTitle(3));
    text(stateString,width*.27,27);
    fadeout=100;
  }else {
    textSize(15);
    fill(117, 117, 110,fadeout);
    text(stateString,width*.27,27);
  }
  fill(69, 117, 180,fade*20);
  textSize(20);
    text("United States |",125,27);
    
  if (mouseCheck==false){
     generateValues();
  }
//=SAVE========================
if(saveCheck){
  try{
    thread1 = new SimpleThread(1000,"a");
    thread1.start("save");
    saveCheck=false;
    }catch(Exception e){   
      println("Save operation canceled");
      saveCheck=false;
    }
  }if(terminate){
      saveCheck1=true;
      saveFrame(saveString);
      thread1.quit();
      saveCheck1=false;
      terminate=false;
    }
  if(helpCheck){
    textSize(10);
    text("X = "+mouseX+" Y = "+mouseY,6,20);
     hp.update();
     generateValues();
  }
}
void mousePressed(){
  
  mouseCheck=true;
  int count6=0;
//=====STATE SELECTOR===============
  listcheck=true;
  if(shapeSelect.size()==1){
    shapeSelected=false;
    generateValues();
  }
  for(int i=0; i<shapeSelect.size(); i++){
    if (stateIndex()==shapeSelect.get(i)&& stateIndex()!=-999){
           
      shapeSelect.remove(i);
      generateValues();
      listcheck=false;
      count6++;
    }
  }
if (listcheck && stateIndex() != -999){
  shapeSelect.add(stateIndex());
  shapeSelected=true;
  generateValues();
  //println(stateIndex());
}

  count2++;
  
//=============================================

if(overRect(550,5,650,35)){
  xButtonCheck=true;
  yButtonCheck=false;
  zButtonCheck=false;
  cButtonCheck=false;
}
if(overRect(660,5,760,35)){
  yButtonCheck=true;
  xButtonCheck=false;
  zButtonCheck=false;
  cButtonCheck=true;
}
if(overRect(770,5,860,35)){
  zButtonCheck=true;
  xButtonCheck=false;
  yButtonCheck=false;
  cButtonCheck=true;
}
if(overRect(880,5,840,35)){
  cButtonCheck=true;
  xButtonCheck=false;
  yButtonCheck=false;
  zButtonCheck=false;
}else{
  cButtonCheck=false;
}
if(overRect(879,40,55,15)){
  colSel1=true;
  colSelect="pastel";
  cs1.update(colSelect);
  generateValues();
  cButtonCheck=false;
}if(overRect(879,70,55,15)){
  colSel2=true;
  //fade=0;
  colSelect="Holliday";
  cs1.update(colSelect);
  generateValues();
  cButtonCheck=false;
}if(overRect(879,86,55,15)){
  colSel2=true;
  //fade=0;
  colSelect="ColorSafe";
  cs1.update(colSelect);
  generateValues();
  cButtonCheck=false;
}if(overRect(475,40,50,50)){
  clearCheck=true;
  fill(255,0,0,50);
  rect(475,40,50,30);
}if(overRect(940,5,50,35)){
    addButtons("Save",939,5,"on",select1,"small");
   cButtonCheck=false;
   saveCheck=true;
   //saveCtrl.setVisible(true);
}if(overRect(365,40,100,50)){
  //addButtons("Select States",365,40,"on",color(100,100),"large");
  shapeSelButtonCheck=true;
  thread1 = new SimpleThread(1000,"a");
  thread1.start("listControl");
}if(overRect(5,40,35,35)){
   helpCheck=true;
   addButtons("Help",5,40,"on",color(100,100),"large");;
 }else{
   helpCheck=false;
 }

//==SELECT X AXIS=============================

if(xButtonCheck){
  yButtonCheck=false;
  zButtonCheck=false;
  X =keyPixel1;
  if (X<26 && X>0){
    Xvar=X;
    xButtonCheck=false;
  }else{
    Xvar=0;
  }
  generateValues();
  }
else if(yButtonCheck){
  xButtonCheck=false;
  zButtonCheck=false;
  Y =keyPixel1;
  if (Y<26 && Y>0){
    Yvar=Y;
    yButtonCheck=false;
  }else{
    Yvar=0;
  }
  generateValues();
  }
else if(zButtonCheck){
  xButtonCheck=false;
  yButtonCheck=false;
  Z =keyPixel1;
  if (Z<26 && Z>0){
    Zvar=Z;
    zButtonCheck=false;
  }else{
    Zvar=0;
  }
  generateValues();
  }else{
    xButtonCheck=false;
    yButtonCheck=false;
    zButtonCheck=false;
  }
}


void mouseReleased(){
  scrollPos = map(int(hs1.getPos()),20,int(20+hs1.swidth),0,42);

  if (scrollInit){
    if(scrollPos<=1){
      year=0;
    }
    if (scrollPos!=1){
      year=51*int(scrollPos);
      generateValues();
    }
  }
      mouseCheck=false;
}


void keyPressed() {
  generateValues();
  int barPos;
  if (key == CODED) {
    if (keyCode == RIGHT && year<=2040) {
      barPos=int(hs1.newspos+=11);
      //hs1.newspos=map(year,0,42,hs1.sposMin,hs1.sposMax);
      hs1.newspos=constrain(barPos,hs1.sposMin,hs1.sposMax);
      year=year+51;
      //println(yearConstrain);
  }else if (keyCode == LEFT && year>=0){
      barPos=int(hs1.newspos-=11);
      hs1.newspos=constrain(barPos,hs1.sposMin,hs1.sposMax);
      //hs1.newspos=map(year,0,42,hs1.sposMin,hs1.sposMax);
      year=year-51;
    }
  }else{
    keyCheck=false;
  }
}
 
void generateValues() {
  if(helpCheck==false){
    cs1.update(colSelect);
  }
  int count5=0;
  int[] var1 = new int[51];
  int[] var2 = new int[51];
  int[] var3 = new int[51];
  
  colors= new String[52];
  

//SHAPE SELECT===============================

  if(shapeSelected){
    try{
      bubbles=new Bubble[51];
      int s = 0;
      for (int i = 0; i < shapeSelect.size(); i++) {
          s=shapeSelect.get(i);
          var1[count5] = table.getInt(s-1+yearConstrain,table.getColumnTitle(Xvar));
          var2[count5] = table.getInt(s-1+yearConstrain,table.getColumnTitle(Yvar));
          var3[count5] = table.getInt(s-1+yearConstrain,table.getColumnTitle(Zvar));
          count5++;
        }
    }catch(Exception e){
    }
    
      int b=0;
      for (int a = 0; a<shapeSelect.size();a++){
        b=shapeSelect.get(a);
        
        float x = map(var1[a],min(var1),max(var1),600,900);
        float y = map(var2[a],min(var2),max(var2),410,110);
        
        if(x>=550 && x<750 && y>260 && y<=460){
          c = c1;
          colors[b-1]="c1";
        }else if(x>550 && x<750 && y>60 && y<=260){
          c = c2;
          colors[b-1]="c2";
        }else if(x>=750 && x<950 && y>260 && y<460){
          c = c3;
          colors[b-1]="c3";
        }else if (y<=260 && x >=750){
           c = c4;
          colors[b-1]="c4";
        }else{
        //(x>750 && x<950 && y>60 && y<260){
          c = color(255,255,255);
          //colors[a]="c4";
        }
        
        //color c = color(a*5,100,100,200);
        r = map(var3[a],min(var3),max(var3),5,18);
        //bubbles[a] = new Bubble(x + plot.topLeft.x, y + plot.topLeft.y, r, c);
        bubbles[a] = new Bubble(x, y, r, c,b-1,var1[a],var2[a],var3[a]);
      }
    }else if (shapeSelected==false){
      count5=0;
      var1 = new int[51];
      var2 = new int[51];
      var3 = new int[51];
  
      colors= new String[52];
    for (int i = yearConstrain; i < 51+yearConstrain; i++) {
      var1[count5] = table.getInt(i,table.getColumnTitle(Xvar));
      var2[count5] = table.getInt(i,table.getColumnTitle(Yvar));
      var3[count5] = table.getInt(i,table.getColumnTitle(Zvar));
      count5++;
    }
      // randomize x y coord
    for (int a = 0; a<51;a++){
      float x = map(var1[a],min(var1),max(var1),600,900);
      float y = map(var2[a],min(var2),max(var2),410,110);
      if(x>=550 && x<750 && y>260 && y<=460){
        c = c1;
        colors[a]="c1";
      }else if(x>550 && x<750 && y>60 && y<=260){
        c = c2;
        colors[a]="c2";
      }else if(x>=750 && x<950 && y>260 && y<460){
        c = c3;
        colors[a]="c3";
      }else if (y<=260 && x >=750){
         c = c4;
        colors[a]="c4";
      }else{
      //(x>750 && x<950 && y>60 && y<260){
        c = color(255,255,255);
        //colors[a]="c4";
      }
      
      //color c = color(a*5,100,100,200);
      r = map(var3[a],min(var3),max(var3),5,18);
       
      //bubbles[a] = new Bubble(x + plot.topLeft.x, y + plot.topLeft.y, r, c);
      bubbles[a] = new Bubble(x, y, r, c,a,var1[a],var2[a],var3[a]);
    }
  }
}

void addButtons(String name,int recX, int recY, String onoff,color col,String smallLarge){
    textSize(25);
  
  if(smallLarge=="large"){
    if(onoff=="on"){
      fill(69, 117, 180);
      textSize(10);
      if(xButtonCheck || yButtonCheck || zButtonCheck){
      text("Click a variable below",mouseX+10,mouseY);
      }
      fill(116, 173, 209);
    }else{
      if(name=="Select States"){
        stroke(145, 191, 219);
        fill(224, 243, 248,200);
      }else{
        stroke(145, 191, 219);
        strokeWeight(1);
        fill(224, 243, 248,150);
        rectMode(CORNER);
        rect(recX,recY,100,30);
      }
 
    }

    fill(col);
    textSize(15);
    fill(20,150);
    text(name,recX+5,recY+20);
   }
   if(smallLarge=="small"){
      if(onoff=="on"){
        fill(69, 117, 180);
        textSize(10);
        //text("Click a variable below",mouseX+10,mouseY);
        fill(116, 173, 209);
    }else{
      if(name=="Clear"||name=="Help"){
         stroke(145, 191, 219,150);
        fill(224, 243, 248,200);
      }else{
        stroke(145, 191, 219);
        strokeWeight(1);
        fill(224, 243, 248,150);
        rectMode(CORNER);
        rect(recX,recY,50,30);
      }
    }

    //noFill();
    fill(col);
    textSize(15);
    fill(20,150);
    text(name,recX+5,recY+20);
   }
}
class Bubble extends Thread{

  float x, y, r,r2,g2;
  int indx,V1,V2,V3;
  color c;
  int count;

  float origX,origY;
  boolean check1;
  
  Bubble(float x_, float y_, float r_, color c_, int indx_,int V1_,int V2_,int V3_) {
    x = x_;
    y = y_;
    r = r_;
    c = c_;
    origX = x_;
    origY = y_;
    indx = indx_;
    V1 = V1_;
    V2 = V2_;
    V3 = V3_;
  }
   
  void display() {
    count =0;
    try{
     r2 = red (country.pixels[mouseX+mouseY*country.width]);
     g2 = green (country.pixels[mouseX+mouseY*country.width]);
    }catch(Exception e){
     println("Out of bounds error - Bubble.display()");
    }
    // check if mouseover
    if (dist(mouseX, mouseY, x, y) <= r) {
      bubbleCheck=true;
      bubbleIndx=indx;   
      stroke(bubbleSelect);
      strokeWeight(3);   
      fill(c,150);
      
    }else if (r2/5 < 52 && g2 != 255.0) {
      try{
        if (table.getString(stateIndex()-1,table.getColumnTitle(3)).equals(table.getString(indx,table.getColumnTitle(3)))==true){
          //println(table.getString(stateIndex()-1,table.getColumnTitle(3)) + " = " + table.getString(indx,table.getColumnTitle(3)));
          stroke(bubbleSelect);
          strokeWeight(3);
          fill(c,150);
      }else{
        stroke(bubbleSelect);
        strokeWeight(3);   
        fill(c,150);
        //noStroke();
        stroke(50);
        strokeWeight(.1);
        bubbleIndx=-999; 
        fill(c);
      }
      }catch(Exception e){
          println("Out of bounds error - Bubble.display()");
        }
  }else {
      stroke(50);
      strokeWeight(.1);
      fill(c);
   }


    ellipse(x, y, r*2, r*2);
    count++;
  }
   
  void displayLabel() {
    if (dist(mouseX, mouseY, x, y) <= r) {
      check1=true;
    }
    if (check1){
        if (mouseCheck && mouseX >550 && mouseX<950 && mouseY >60 && mouseY<450){
           check1=true;
           x = origX+((mouseX-origX)*.4);
           y = origY+((mouseY-origY)*.4);
        }else {
          x = origX;
          y = origY;
          check1=false; 
        }
      String txt = table.getString(indx,table.getColumnTitle(3)) + ", x: " + int(V1) + ", y: " + int(V2)+", r: "+int(V3);
      Label label = new Label(txt, mouseX, mouseY);
      
      }
    }
  }


class HScrollbar extends Thread{
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    
    ypos = yp-sheight/2;
    spos = xpos; 
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
      scrollInit = true;

    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
        newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
      }  
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(255, 255, 179);
    } else {
      fill(255, 155, 79);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}

class help{
  void update(){
    select1 = color(252, 141, 89);
    select2 = color(252, 141, 89);
    select3 = color(252, 141, 89);
    stateSelect = color(255,50);
    bubbleSelect = color(0);
    liminalSelect = color(69, 117, 180);
    
    c1 = color(255); //lower left
    c2 = color(255); //upper left
    c3 = color(255); //lower right
    c4 = color(255);  //upper right
    
  
    Label label = new Label("Press this button to open up\n the state"
                            +" selection dialog\n & press clear to reset", 355, 92);
    Label label2 = new Label("To change years, click to move time slider"
                             +"\n or press the RIGHT or LEFT Key", 285, 455);
    fill(200,200,200);
    stroke(0);
    strokeWeight(2);
    shape(states[44],24,80);
    fill(253,240);
    noStroke();
    rect(285,265,150,75);
    fill(253,200);
    rect(560,44,400,75);
    Label label3 = new Label("Hover the mouse cursor\n over any state to highlight\nit"+
                              " or click a state to \nselect it", 280, 300);

   
    Label label4 = new Label("Select the 'X', 'Y', or 'R' buttons to change value \nof the Axis/Radius Select by clicking a \nPopulation Attribute)", 820, 90);
    stroke(255,0,0);
    line(905,44,905,60);
    line(805,44,705,60);
    line(705,44,705,60);
    line(605,44,705,60);
    Label label5 = new Label("Use this button\nto change the color\nof the layout", 950, 90);
  }
}

class SimpleThread extends Thread {
 
  boolean running;           // Is the thread running?  Yes or no?
  int wait;                  // How many milliseconds should we wait in between executions?
  String id;                 // Thread name
  int count;                 // counter
  String proc;
  // Constructor, create the thread
  // It is not running by default
  SimpleThread (int w, String s) {
    wait = w;
    running = false;
    id = s;
    count = 0;
  }
 
  int getCount() {
    return count;
  }
 
  // Overriding "start()"
  void start (String process) {
    // Set running equal to true
    proc=process;
    running = true;
    // Print messages
    println("Starting thread..."); 
    // Do whatever start does in Thread, don't forget this!
    super.start();
  }
 
 
  // We must implement run, this gets triggered by start()
  void run () {
    while (running && count < 10) {
      println(id + ": " + count);
      count++;
      // Ok, let's wait for however long we should wait
      try {
        if(proc=="save"){
          saveControl saveCtrl = new saveControl();
        }else if(proc=="listControl"){
          listStateCtrl lsc = new listStateCtrl();
        }
        
      } catch (Exception e) {
      }
    }
    System.out.println(id + " thread is done!");  // The thread is done when we get to the end of run()
  }
 
 
  // Our method that quits the thread
  void quit() {
    System.out.println("Quitting."); 
    running = false;  // Setting running to false ends the loop in run()
    // IUn case the thread is waiting. . .
    interrupt();
  }
}

public class saveControl extends JFrame{
  private JTextField filename = new JTextField(), dir = new JTextField();
  public saveControl() {
      JFileChooser c = new JFileChooser();
      // Demonstrate "Save" dialog:
      int rVal = c.showSaveDialog(saveControl.this);
      if (rVal == JFileChooser.APPROVE_OPTION) {
         saveCheck1=true;
         saveString = c.getCurrentDirectory().toString()+"\\"+c.getSelectedFile().getName()+".png";
         terminate=true;
      }
      if (rVal == JFileChooser.CANCEL_OPTION) {
        filename.setText("You pressed cancel");
        dir.setText("");
        thread1.quit();
      }
    }
  }
  
public class listStateCtrl extends JPanel{
  File f = new File("MultiSelectList.java");
  final ArrayList<String> lines = new ArrayList<String>();
  int[] select = new int[52];
  String[] list0 = new String[53];
   // String selected = "";
  boolean mouseE=false;
  //String[] selectedItems = "";
  //String[] selectedItems2;
  int[] selectedItems2;
  
  public listStateCtrl() {
    for (i=0;i<stateNames.length;i++){
      if(i==0){
        list0[i]=" ";
      }else{
        list0[i]=stateNames[i];
      }
    }
    final JList list = new JList(list0);
    
    list.setSelectionMode(
      ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
      for(i=0;i<shapeSelect.size();i++){
        select[i]=shapeSelect.get(i);
      }
      list.setSelectedIndices(select);
    
      list.addListSelectionListener(new ListSelectionListener() {

        @Override
        public void valueChanged(ListSelectionEvent arg0) {
          if (!arg0.getValueIsAdjusting()) {
            int[] selected2 = list.getSelectedIndices();
            int[] selectedItems = new int[selected2.length];
            for(int i=0; i<selected2.length;i++){
              selectedItems[i] = selected2[i];
            }
            selectedItems2=selectedItems;
          }
        }
      });
    Object[] options = { "OK", "CANCEL" };
    int Result = JOptionPane.showOptionDialog(null,  new JScrollPane(list), "Select States",JOptionPane.OK_CANCEL_OPTION, JOptionPane.INFORMATION_MESSAGE,null, options, options[0]);
    if (Result==JOptionPane.OK_OPTION){
          //shapeSelect=new Processing.Array<Integer>();
      try{
        for(int i=0; i<selectedItems2.length;i++){
          if(list0[selectedItems2[i]]!=" "){
            //println(selectedItems2[i]);
            shapeSelect.add(selectedItems2[i]);
          }
        }  shapeSelected=true;
           generateValues();
           mouseCheck=false;
           thread1.quit();
      }catch(Exception e){
        println("null input");
      }
    }else{
      thread1.quit();
    }
  }
}

 
class Label{
   
  Label(String txt, float x, float y) {
     
    // get text width
    float labelW = textWidth(txt);
     
    // check if label would go beyond screen dims
    if (x + labelW + 20 > width*.65) {
      x -= labelW + 20;
    }
     
    
     
   if(helpCheck){
      fill(255,0,0,200);
      textSize(12);
      text(txt, x+15, y-15);
    }else{
      fill(252,255,254);
      noStroke();
      rectMode(CORNER); // note: this is the default mode. confusing b/c similar to CORNERS (plural)
      rect(x+10, y-30, labelW+10, 22);
      fill(0);
      text(txt, x+15, y-15);
    }
  }
}

class Plot{
  Point2D topLeft, bottomRight;
  color c;
  
  Plot(int x1_, int y1_, int x2_, int y2_, color c_) {
    topLeft = new Point2D(x1_, y1_);
    bottomRight = new Point2D(x2_, y2_);
    c = c_;
  }
   
  void display() {
    fill(c);
    noStroke();
    rectMode(CORNERS);
    //rect(topLeft.x-100, topLeft.y-100, bottomRight.x-430, bottomRight.y-75);
  }
   
  Point2D topLeft() {
    return topLeft;
  }
   
  Point2D bottomRight() {
    return bottomRight;
  }
   
  float w() {
    return bottomRight.x - topLeft.x;
  }
   
  float h() {
    return bottomRight.y-50 - topLeft.y-50;
  }
}

class Point2D{
  float x, y;
   
  Point2D(float x_, float y_) {
    x = x_;
    y = y_;
  }
   
  float x() {
    return x;
  }
   
  float y() {
    return y;
  }
}

  
class colorSelect{
  String colorSelector;
  colorSelect(String col){
  }
  void update(String col){
    colorSelector=col;
    if(colorSelector=="pastel"){
      select1 = color(252, 141, 89);
      select2 = color(252, 141, 89);
      select3 = color(252, 141, 89);
      stateSelect = color(255,50);
      bubbleSelect = color(0);
      liminalSelect = color(69, 117, 180);
      c1 = color(69, 117, 180,fade*5); //lower left
      c2 = color(254, 224, 144,fade*5); //upper left
      c3 = color(168, 221, 181,fade*5); //lower right
      c4 = color(252, 141, 89,fade*5);  //upper right
      
    }else if (colorSelector=="Holliday"){
      select1 = color(252, 141, 89);
      select2 = color(252, 141, 89);
      select3 = color(252, 141, 89);
      stateSelect = color(255,50);
      bubbleSelect = color(0);
      liminalSelect = color(69, 117, 180);
      
      c1 = color(244, 109, 67,fade*5); //lower left
      c2 = color(254, 224, 139,fade*5); //upper left
      c3 = color(166, 217, 106,fade*5); //lower right
      c4 = color(26, 152, 80,fade*5);  //upper right
   }else if (colorSelector=="ColorSafe"){
      select1 = color(118, 42, 131);
      select2 = color(118, 42, 131);
      select3 = color(118, 42, 131);
      stateSelect = color(255, 255, 255,50);
      bubbleSelect = color(0);
      liminalSelect = color(69, 117, 180);
      
      c1 = color(153, 112, 171,fade*5); //lower left
      c2 = color(231, 212, 232,fade*5); //upper left
      c3 = color(217, 240, 211,fade*5); //lower right
      c4 = color(27, 120, 55,fade*5);  //upper right
    }
  }
}


int stateIndex(){ //Check Pixel Color to Obtain Value
  if (mouseX >= 0 && mouseX <= 650
      && mouseY >=0 && mouseY <=440){
    //println(str(r)+" "+str(g)+" "+str(b)); //RGB Check
     r = red (country.pixels[mouseX+mouseY*country.width]);
     g = green (country.pixels[mouseX+mouseY*country.width]);
     if (g==255.0){
       return -999;
     }
     else if ((r/5) < 52 || g!=255.0){
       return int((int(r)/5));
     }else {
     return -999;
     }
   }else {
     return -999;
  }
}

boolean overRect(int recX, int recY, int width, int height) {
  if (mouseX >= recX && mouseX <= recX+width && 
      mouseY >= recY && mouseY <= recY+height) {
    return true;
  } else {
    return false;
  }
}


