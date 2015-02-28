
/*
Konkuk University
 SOS iDesign
Name: KIM Sunhuyn
 ID: 201420067
*/

void setup(){
size (600, 600);
 
 setupAudio();
 size(600, 600);
  smooth();
 }

void draw(){
colorMode (RGB, 600);
background(#FFFFFF);

println(mouseX + " : " + mouseY);

getVolume();
 float Y = map(volume, 0, 200, 2, 100); 
 float X = map(volume, 0, 200, 2, 200); 

strokeWeight (1);      
 fill(#FF81AD);
 translate(width/20, height/20);
 rectMode(CENTER);
 ellipse(110, 350, X, Y);
 ellipse(400, 350, X, Y);

fill(255);
strokeWeight (5);
line(178,91,271,98);
line(271,98,379,127);
line(379,127,433,301);
line(433,301,444,289);
line(444,289,456,276);
line(456,276,469,277);
line(469,277,432,185);
line(432,185,395,127);

fill(0,0,0);
bezier(169,92,232,66,330,45,395,127);

fill(#FFFFFF); 
bezier(165,94,126,150,134,128,98,226);
bezier(98,226,35,269,24,332,22,388);
bezier(22,388,34,469,75,520,151,542);
bezier(151,542,213,541,262,532,307,520);
bezier(307,520,355,501,388,485,422,456);
bezier(422,456,459,468,490,465,510,435);
bezier(510,435,519,407,520,383,522,365);
bezier(522,365,515,331,493,283,470,279);

fill(255,0,50);
ellipse(156,500,80,100);

constrain(500,500,500);

fill(0,0,0);
ellipse(186,288,90,100);
ellipse(343,288,90,100);

println(mouseX + ":"+mouseY);

float mx1 = constrain (mouseX, 170, 200); 
float mx2 = constrain (mouseX, 330, 360); 
float my = constrain (mouseY, 255,300); 

fill(#FFFFFF); 
ellipse(mx1, my, 50, 50); 
ellipse(mx2, my, 50, 50); 

strokeWeight (32);
line(142,151,169,109);
line(169,109,191,114);
line(191,114,225,145);
line(281,143,321,114);
line(321,114,362,153);

strokeWeight (2);
bezier(113,243,128,214,134,201,163,190);
bezier(163,190,192,186,212,199,228,238);
bezier(265,236,275,207,288,193,318,185);
bezier(318,185,345,185,369,207,387,246);

strokeWeight (20);
line(165,105,225,92);
line(207,98,265,94);

fill(0,0,0);
quad(376,125,412,202,431,205,382,127);
quad(412,202,436,293,466,278,433,205);

if(mousePressed){ 
fill(mouseX,100,mouseY,100);   
float a=random(100); 
float b=random(25); 
float c=random(255); 

strokeWeight(3); 
   
 ellipse(pmouseX,pmouseY,100,100);
 ellipse(pmouseX,pmouseY,200,20);  
 ellipse(pmouseX,pmouseY,20,200); 
 ellipse(pmouseX,pmouseY,100,100);
  } 
  }

void keyPressed(){

 
import ddf.minim.*;

 Minim minim;
 AudioInput in;
 float volume = 0;
 float volumeF = 0;

 //-------------------------------------
 void setupAudio(){
 minim = new Minim(this);
 in = minim.getLineIn(Minim.MONO, 512);
 }

 //-------------------------------------
 void getVolume(){
 volumeF = in.right.level()*1000;
 volume = 0.8*volume + 0.8*volumeF; 
 }

 //-------------------------------------
 void stop(){
 in.close();
 minim.stop();
 super.stop();

 } 

