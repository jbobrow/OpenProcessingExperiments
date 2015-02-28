
 /*****************************************
 * Assignment 2
 * Name:         Bingxi Lin
 * E-mail:       blin@brynmawr.edu
 * Course:       CS 110 - Section 2
 * Submitted:    2/6/2012
 * 
 * A short paragraph describing your sketch.
 * See description below.
 *********************************************/ 
 

 int horizon = 250;     //define horizon y-coordinate
 
 void setup(){
   size(800,600);
   background(164,101,8);
   smooth();
   noStroke();
   fill(143,209,229);         //draw the sky
   rect(0,0,width,horizon);   
   fill(255,51,0);            //draw the sun
   ellipse(width-100,60,50,50);  
   fill(255);                 //draw the clouds
   ellipse(50,50,40,20);      //cloud NO.1
   ellipse(80,50,40,20);
   ellipse(55,50,25,35);
   ellipse(75,50,25,35);
   ellipse(250,50,40,20);      //cloud NO.2
   ellipse(280,50,40,20);
   ellipse(255,50,25,35);
   ellipse(275,50,25,35);
   ellipse(550,50,40,20);      //cloud NO.3
   ellipse(580,50,40,20);
   ellipse(555,50,25,35);
   ellipse(575,50,25,35);
   fill(0,200,0);              //The bush
   ellipse(0,height,width/5,width/5);
   ellipse(width/8,height,width/8,width/8);
 }
 
 void draw(){
 }
 
 void mousePressed(){
   if(mouseY < horizon){
     //draw birds
     fill(0,0);
     strokeWeight((horizon-mouseY)/80+1);
     stroke(0);
     arc(mouseX,mouseY,(horizon-mouseY)/6+5,(horizon-mouseY)/12+5,2*PI-PI/2,2*PI);
     arc(mouseX+(horizon-mouseY)/6+5,mouseY,(horizon-mouseY)/6+5,(horizon-mouseY)/12+5,PI,PI+PI/2);
   }
   else{
     //call the flower function
     flower(mouseX,mouseY, int(random(7,15)) );
   } 
   
 }
 
 
 //draw a flower centered at centerX and centerY with n petals
 void flower(float centerX, float centerY, int n){
   int size = (mouseY - horizon)/25+5;   //size of petals
   float angle = 2*PI/n;
   for(int i=0;i<n;i++){
     noStroke();
     fill(random(150,255),0,0);
     ellipse(centerX+size*cos(angle*i),centerY+size*sin(angle*i),size*2/3,size*2/3);  //draw the flower
     strokeWeight(size/5+1);
     stroke(0,255,0);
     line(mouseX,mouseY,mouseX-size/2,mouseY+2*size);  //draw the leaves
     line(mouseX-size/2,mouseY+2*size,mouseX-size,mouseY+size);
   }
 }
 
 
 
 
 
 
 
 

