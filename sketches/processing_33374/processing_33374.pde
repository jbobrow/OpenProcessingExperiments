
/*

Daniela Gill
08-08-11
lelagillny@mac.com
copyright 2011
Bootcamp/ Moving Parade Assignment  

*/

// Declaring a variable of type PImage
PImage img;	

int rect_x = 400; /* this number is the position of x of the rectangle */
int rect_speed = 2;

int rect2_x = 400;
int rect2_speed = 4;

int rect3_x = 200;
int rect3_speed = 6;

int rect4_x = 100;
int rect4_speed = 2;

int rect5_x = 400;
int rect5_speed = 3;

int rect6_x = 400;
int rect6_speed = 6;

int rect7_x = 400;
int rect7_speed = 4;

int rect8_x = 60;
int rect8_w = 10;
int rect8_speed = 3;

int rect9_x = 60;
int rect9_w = 10;
int rect9_speed = 6;

int rect10_x = 60;
int rect10_w = 10;
int rect10_speed =2;

int rect11_x = 430; 
int rect11_speed =4;

int rect12_x = 400; 
int rect12_speed = 5;

int rect13_x = 400;
int rect13_speed = 7;

int rect14_x = 400;
int rect14_speed = 5;

int rect15_x = 400;
int rect15_speed = 5;

int rect16_x = 400;
int rect16_speed = 6;

int rect17_x = 400;
int rect17_speed = 2;

int rect18_x = 400;
int rect18_speed = 6;

void setup() {
  size(550,550);
  img = loadImage("image1.jpg");
  frameRate(30);
}

void draw() {
  size(550,550);
  background(#CC0000);
  noStroke();
  // the image to the screen at coordinate (0,0)
  image(img,0,0);
  
  fill (#FFCC00);
  rect(rect15_x, 0, 200, 120);
   rect15_x = rect15_x + rect15_speed;
  
  fill (#CC0000);
  rect(rect_x, 21, 100, 100);
   rect_x = rect_x + rect_speed;
   
  
  fill (#FFCC00);
  rect(rect2_x, 50, 60, 60);
   rect2_x = rect2_x + rect2_speed;
   
  fill (#3399FF);
  rect(rect3_x, 134, 60, 60);
   rect3_x = rect3_x + rect3_speed;
   
  fill (255);
  rect(rect4_x, 135, 60, 60);
   rect4_x = rect4_x + rect4_speed;
   
  fill (255);
  rect(rect5_x, 175, 60, 60);
   rect5_x = rect5_x + rect5_speed;
   
  fill (#FFCC00);
  rect(rect6_x, 175, 20, 20);
   rect6_x = rect6_x + rect6_speed;
   
  fill (#3399FF);
  rect(rect7_x, 281, 70, 70);
   rect7_x = rect7_x + rect7_speed;
   
  fill (#CC0000);
  rect(rect8_x, 280, rect8_w, 78);
   rect8_x = rect8_x + rect8_speed;
 
  fill (255);
  rect(rect14_x, 479, 200, 80);
   rect14_x = rect14_x + rect14_speed;
   
  fill (#FFCC00);
  rect(rect9_x, 280, rect9_w, 78);
   rect9_x = rect9_x + rect9_speed;
   
  fill (0);
  rect(rect10_x, 281, rect10_w, 78);
   rect10_x = rect10_x + rect10_speed;
   
  fill (#CC0000);
  rect(rect12_x, 373, 90, 90);
   rect12_x = rect12_x + rect12_speed;
  
  fill (#FFCC00);
  rect(rect11_x, 410, 70, 70);
   rect11_x = rect11_x + rect11_speed;
   
  fill (#3399FF);
  rect(rect13_x, 480, 100, 22);
   rect13_x = rect13_x + rect13_speed;
   
  fill (#3399FF);
  rect(rect16_x, 140, 20, 20);
   rect16_x = rect16_x + rect16_speed;
   
  fill (#3399FF);
  rect(rect17_x, 400, 20, 20);
   rect17_x = rect17_x + rect17_speed;
   
  fill (#3399FF);
  rect(rect18_x, 216, 160, 52);
   rect18_x = rect18_x + rect18_speed;
   

    
  if( rect_x > 500) {
  rect_x = 0 ;    
  };
   
 
 
  
    if( rect2_x > 500) {
    rect2_speed = rect2_speed * -1; 
   };
   
   if( rect2_x < 0) { 
     rect2_speed = rect2_speed * -1; /* two negatives make a positive*/

   };
   
   if( rect3_x > 600) {
    rect3_speed = rect3_speed * -1; 
   };
   
   if( rect3_x < 0) { 
     rect3_speed = rect3_speed * -1; 

   };
   
    if( rect4_x > 300) {
    rect4_speed = rect4_speed * -1; 
   };
   
   if( rect4_x < 0) { 
     rect4_speed = rect4_speed * -1; 

   };
   
   if( rect5_x > 400) {
    rect5_speed = rect5_speed * -1; 
   };
   
   if( rect5_x < 0) { 
     rect5_speed = rect5_speed * -1; 

   };
   
   if( rect6_x > 400) {
    rect6_speed = rect6_speed * -1; 
   };
   
   if( rect6_x < 0) { 
     rect6_speed = rect6_speed * -1; 

   };
   
   if( rect7_x > 500) {
    rect7_speed = rect7_speed * -1; 
   };
   
   if( rect7_x < 0) { 
     rect7_speed = rect7_speed * -1; 

   };
 
   if(( rect8_x + rect8_w > width) || ( rect8_x < 0)) {
    rect8_speed = rect8_speed * -1; 
   };
 
   if(( rect9_x + rect9_w > width) || ( rect9_x < 0)) {
    rect9_speed = rect9_speed * -1; 
   };
  
   if(( rect10_x + rect10_w > width) || ( rect10_x < 0)) {
    rect10_speed = rect10_speed * -1; 
   };
   
   if( rect11_x > 500) {
    rect11_speed = rect11_speed * -1; 
   };
   
   if( rect11_x < 0) { 
     rect11_speed = rect11_speed * -1; 

   };
   
   if( rect12_x > 500) {
    rect12_speed = rect12_speed * -1; 
   };
   
   if( rect12_x < 0) { 
     rect12_speed = rect12_speed * -1; 

   };
   
   if( rect13_x > 500) {
    rect13_speed = rect13_speed * -1; 
   };
   
   if( rect13_x < 0) { 
     rect13_speed = rect13_speed * -1; 

   };
   
   if( rect14_x > 500) {
    rect14_speed = rect14_speed * -1; 
   };
   
   if( rect14_x < 0) { 
     rect14_speed = rect14_speed * -1; 

   };
  
  if( rect15_x > 500) {
    rect15_speed = rect15_speed * -1; 
   };
   
   if( rect15_x < 0) { 
     rect15_speed = rect15_speed * -1; 

   };
   
   if( rect16_x > 400) {
    rect16_speed = rect16_speed * -1; 
   };
   
   if( rect16_x < 0) { 
     rect16_speed = rect16_speed * -1; 

   };
   
    if( rect17_x > 400) {
    rect17_speed = rect17_speed * -1; 
   };
   
   if( rect17_x < 0) { 
     rect17_speed = rect17_speed * -1; 

   };
   
    if( rect18_x > 400) {
    rect18_speed = rect18_speed * -1; 
   };
   
   if( rect18_x < 0) { 
     rect18_speed = rect18_speed * -1; 

   };
}



  
  
  




 
   

