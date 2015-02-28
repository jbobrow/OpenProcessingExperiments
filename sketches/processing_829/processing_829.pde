

import processing.core.*; 
import processing.xml.*; 

import netscape.javascript.JSObject; 
import processing.xml.*; 
import java.io.*; 
import openvisuals.*; 

import java.applet.*; 
import java.awt.*; 
import java.awt.image.*; 
import java.awt.event.*; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class comparisonOECD2007 extends PApplet {



//This is how your Processing application would look like with OpenVisuals API
//Click to learn about their definitions

//THIS IS EXTENDED VERSION; which includes examples for all the API functions you can use


 
 

 //can be imported via menu Sketch-Import Library-openvisuals



OpenVisuals ov; //required: create an OpenVisuals object
PFont myFont;
String[] nation;
int x=70;
int y=70;
int k=130;
int j=20;
int i=0;



public void setup() {

    size(800,650);
    
    background(40);
    
   // ellipseMode(RADIUS); 
    smooth();
    
    float[] values;
    
    myFont = createFont("SynchroLET-12.vlw",12);
    textFont(myFont);
    text("[Comparison 2007 wages & working hours of OECD nations] ", 430,20);
    fill(255,255,255,140);
    ellipse(k+450,j+40,40,40);
    strokeWeight(1); 
    
    line(k+450,j+40,k+500,j+40);
    line(k+450,j+55,k+450,j+80);
    text("Black circle size : wages", k+495,j+40);
    text("Color circle size : working hours",k+450,j+80);
    fill(20);
    ellipse(k+450,j+40,20,20);
    //required: Defining of the structure of you visualization: This section is to get OpenVisuals to understand how your
    //visualization work. OpenVisuals needs to know what kind of dataset you would be working with in your visualization. You need to define what fields (and their types: String, float, etc..) you will use in your visualization.
    ov = new OpenVisuals(this); //required: initialize OpenVisuals Object
    String[] fields = { "nation", "working_hours","wages" }; //create an array holding the field names that will be used in your visualization
    int[] types = { OpenVisuals.STRING, OpenVisuals.FLOAT,OpenVisuals.FLOAT }; //define the types of the fields
    ov.setFields(fields,types); //introduce fields of you visualization to the openvisuals.
    ov.setMaxRows(50); //introduce the max numbers of rows of a dataset your visualization can handle.
    //end of required part

    //load the dataset.
    ov.loadDatasetXML("http://www.openvisuals.org/dataset/repository/dataset7bca98465f1d92ac81210b5506b88811.xml");

    //optional: OR you can create a random filled dataset instead.
    // This dataset can be used to test your visualization with a random dataset
    //ov.createRandomTable();
       text("Ready ", 10,20);
}

public void draw() {

   noStroke();
   smooth();
  
  //while(ov.nextRow()){ //repeat for each row in the table
 if(i<11){
ov.nextRow();
  float resize_value_hour=ov.getDataVar(0,"working_hours")/50;
  float resize_value_wages=ov.getDataVar(0,"wages")/2500;

  fill(random(100,255),random(100,255),random(100,255));
  ellipse(x,y,resize_value_hour,resize_value_hour);
  //strokeWeight(12);
     
   fill(20);
   ellipse(x,y,resize_value_wages,resize_value_wages);

   fill(255);
   text(ov.getDataVar("nations","nation"), x+50, y+3);

   //text("$", x-3, y+5);
 //  text((int)(ov.getDataVar(0,"working_hours"))+" hours", x+150, y);
 //  ov.nextRow();
  // ellipse(100,200,ov.getDataVar(0,"workhour_per_week"),ov.getDataVar(0,"workhour_per_week"));
  // text(ov.getDataVar("nations","nation"), 85, 250);
  // text("workhour per week : "+ov.getDataVar(0,"workhour_per_week")+" hours", 150, 250);
  // ellipse(300,300,ov.getDataVar(0,"workhour_per_week"),ov.getDataVar(0,"workhour_per_week"));
    i+=1;
   
    
  } y+=50;

  
 // }
}//end of draw

public void mousePressed(){
if(mouseX>50&&mouseX<120){
  // fill(255,255,255,100);
    // println(mouseX+"   " +mouseY);
     if(mouseY>60&&mouseY<90){
       fill(255,255,255,100);
       ellipse(40,70,5,5);
       text("working hours/1year : 1,474 hours",200,70);
       text("wages/1year: 41,837 $",200,85);
     }
     if(mouseY>105&&mouseY<140){
        fill(255,255,255,100);
       ellipse(40,120,5,5);
       text("working hours/1year : 1,733 hours",200,120);
       text("wages/1year: 39,742 $",200,135);
     }
     if(mouseY>155&mouseY<190){
        fill(255,255,255,100);
       ellipse(40,170,5,5);
       text("working hours/1year : 1,594 hours",200,170);
       text("wages/1year: 39,891 $",200,185);
     }
     if(mouseY>205&mouseY<240){
        fill(255,255,255,100);
       ellipse(40,220,5,5);
       text("working hours/1year : 1,457 hours",200,220);
       text("wages/1year: 39,868 $",200,235);
     }
     if(mouseY>255&mouseY<290){
        fill(255,255,255,100);
       ellipse(40,270,5,5);
       text("working hours/1year : 1,353 hours",200,270);
       text("wages/1year: 38,626 $",200,285);
     }
     if(mouseY>305&mouseY<340){
        fill(255,255,255,100);
              ellipse(40,320,5,5);
       text("working hours/1year : 1,543 hours",200,320);
       text("wages/1year: 55,985 $",200,335);
     }
     if(mouseY>355&mouseY<390){
        fill(255,255,255,100);
             ellipse(40,370,5,5);
       text("working hours/1year : 1,838 hours",200,370);
       text("wages/1year: 36,601 $",200,385);
     }
     if(mouseY>405&mouseY<440){
        fill(255);
       ellipse(40,420,5,5);
       text("working hours/1year : 2,261 hours",200,420);
       text("wages/1year: 25,379 $",200,435);
     }
     if(mouseY>455&mouseY<490){
        fill(255,255,255,100);
       ellipse(40,470,5,5);
       text("working hours/1year : 1,541 hours",200,470);
       text("wages/1year: 59,638 $",200,485);
     }
     if(mouseY>505&mouseY<540){
         fill(255,255,255,100);
       ellipse(40,520,5,5);
       text("working hours/1year : 1,655 hours",200,520);
       text("wages/1year: 47,248 $",200,535);
     }
     if(mouseY>555&mouseY<590){
         fill(255,255,255,100);
       ellipse(40,570,5,5);
       text("working hours/1year : 1,788 hours",200,570);
       text("wages/1year: 47,688 $",200,585);
     }

   }//end of if
}


  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#c0c0c0", "comparisonOECD2007" });
  }
}


