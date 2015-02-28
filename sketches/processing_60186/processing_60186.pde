
//HW#12 - Array Visualization
//Joshua Chang jmc1 Copyright 2012
//Data from http://www.city-data.com/bridges/bridges-Pittsburgh-Pennsylvania.html#ixzz1tVpTYL00
//Code ideas borrowed from Tyler Porten                  

int [] bridges = { 7,21,11,60, 47, 20, 129,126,42,198,39,20 };
String [] words = {
"Before 1900", 
"1900-1909" ,
"1910-1919" ,
"1920-1929" ,
"1930-1939" ,
"1940-1949" ,
"1950-1959" ,
"1960-1969" ,
"1970-1979" , 
"1980-1989" ,
"1990-1999" , 
"2000-2010+"};
                  



PFont f;                
float leftEdge, rightEdge, topEdge, bottomEdge;
int minStat, maxStat;
 
void setup(){
 size(1000, 500);


 textSize(10);
 textAlign(CENTER, CENTER);
 smooth();
 rectMode(CORNERS);
  
  
 leftEdge = 100;
 rightEdge = width-25;
 topEdge = 20;
 bottomEdge = height - 40;
  
 minStat = 0;
 maxStat = 250 ;
 
}
 
void draw(){
  PImage b;
b = loadImage("pittsburgh1.jpg");
background(b);
 cover(); 
 plotbridges();
title();

 mouseMoved();

}
 
void plotbridges(){
 fill(255,215,0);
 
 fill(0,99);
rect(0,bottomEdge+5, width,bottomEdge+20);
fill(255,215,0);

  for (int i = 0; i < bridges.length; i++){
   float x = map (i, 0, bridges.length, leftEdge, rightEdge);
   float y = map (bridges[i], maxStat, minStat, topEdge, bottomEdge);
   
    rect(x+10, y, x-10, bottomEdge);
 println(i); 
  

fill(255); 

text(words[i], x, bottomEdge + 10);
  fill(255,215,0);
text(bridges[i], x, y - 10);
   noStroke();


}}
   
void title(){
  pushStyle();

  textSize(25);

 fill(0,99);
rect(0,topEdge+5, width,topEdge+40);
rect(0,topEdge+83, 275,topEdge+120);
fill(255,215,0);
 text("New Bridges Built in Pittsburgh", width/2, topEdge+20);
   
  popStyle();
   
}
 
void mouseMoved(){
  pushStyle();
    textSize(20);
   
  fill(255,215,0);
if (mouseX<145)
{
  int pos = 11;
   int sum =0;
  for(int i=0; i<bridges.length-pos;i++)
  {
    sum += bridges[i];
  }   text("Total Bridges: "+sum, width/6, topEdge+100);
}
  else if (mouseX<220)
{
  int pos = 10;
   int sum =0;
  for(int i=0; i<bridges.length-pos;i++)
  {
    sum += bridges[i];
  }   text("Total Bridges: "+sum, width/6, topEdge+100);
}
  else if (mouseX<292)
{
  int pos = 9;
   int sum =0;
  for(int i=0; i<bridges.length-pos;i++)
  {
    sum += bridges[i];
  }   text("Total Bridges: "+sum, width/6, topEdge+100);
}
  else if (mouseX<365)
{
  int pos = 8;
   int sum =0;
  for(int i=0; i<bridges.length-pos;i++)
  {
    sum += bridges[i];
  }   text("Total Bridges: "+sum, width/6, topEdge+100);
}
  else if (mouseX<440)
{
  int pos = 7;
   int sum =0;
  for(int i=0; i<bridges.length-pos;i++)
  {
    sum += bridges[i];
  }   text("Total Bridges: "+sum, width/6, topEdge+100);
}
 
  else if (mouseX<512)
{
  int pos = 6;
   int sum =0;
  for(int i=0; i<bridges.length-pos;i++)
  {
    sum += bridges[i];
  }   text("Total Bridges: "+sum, width/6, topEdge+100);
}

  else if (mouseX<585)
{
  int pos = 5;
   int sum =0;
  for(int i=0; i<bridges.length-pos;i++)
  {
    sum += bridges[i];
  }   text("Total Bridges: "+sum, width/6, topEdge+100);
}
  else if (mouseX<655)
{
  int pos = 4;
   int sum =0;
  for(int i=0; i<bridges.length-pos;i++)
  {
    sum += bridges[i];
  }
     text("Total Bridges: "+sum, width/6, topEdge+100);
}
  else if (mouseX<730)
{
  int pos = 3;
   int sum =0;
  for(int i=0; i<bridges.length-pos;i++)
  {
    sum += bridges[i];
  }
     text("Total  Bridges: "+sum, width/6, topEdge+100);
}
  else if (mouseX<800)
{
  int pos = 2;
   int sum =0;
  for(int i=0; i<bridges.length-pos;i++)
  {
    sum += bridges[i];
  }
     text("Total  Bridges: "+sum, width/6, topEdge+100);
}

  else if (mouseX<875)
{
  int pos = 1;
   int sum =0;
  for(int i=0; i<bridges.length-pos;i++)
  {
    sum += bridges[i];
  }
     text("Total  Bridges: "+sum, width/6, topEdge+100);
}
  else
 {
   int pos = 0;
   int sum =0;
  for(int i=0; i<bridges.length-pos;i++)
  {
    sum += bridges[i];
  }   text("Total Bridges: "+sum, width/6, topEdge+100);}


 popStyle();
}

void cover(){
 strokeWeight(6);
 stroke(0);
line(pmouseX,0,pmouseX,height);
fill(0,90);
noStroke();
rect(pmouseX,height,0, 0);
noFill();}
 

