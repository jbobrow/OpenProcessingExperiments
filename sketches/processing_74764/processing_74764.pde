
boolean eraser= false; //set eraser to false
 boolean pen = true; //we want to start with a pen
 boolean ellipses= false; //set ellipses to false
 boolean penred = false;
 boolean penblack = true;
 boolean penblue = false;
 boolean pengreen = false;
 boolean rectangles=false;
 void setup() {  
 size(600, 600);  
 noStroke();  
 rectMode(CENTER); 
 background(255); 
 ellipseMode(CENTER);
 
 }
 
 void draw() { 
 colors();
 reset();
 eraser(); 
 pen();
 ellipses();
 sidebar();
 rightbar();
 rectangles();
 title();
 }
 
 void title(){
   fill(0);
   text("Group 19's Paint Program", 250,30);
 }
 
 void rightbar(){
   
   fill(190,190,190); //shows the colour menu
   rect(550,30,100,20);
   
   fill(255,0,0);
 text("Shape Colours",510,30);
   
   
   fill(0); //shows the colour button red
   rect(550,50,100,20);
   
   fill(255);
 text("Red Colour (1)",510,50);
 
 fill(0); //shows the colour button black
   rect(550,70,100,20);
   
   fill(255);
 text("Black Colour (2)",510,70);
 
 fill(0); //shows the colour button blue
   rect(550,90,100,20);
   
   fill(255);
 text("Blue Colour (3)",510,90);
 
 fill(0); //shows the colour button green
   rect(550,110,100,20);
   
   fill(255);
 text("Green Colour (4)",510,110);
 
 }
 void colors(){
   
 if (keyPressed) {  //colour changing system, working barely
   if (key == '1' || key == '1'){
      penred = true;
       penblack = false;
       penblue = false;
       pengreen=false;
   }
   if (key == '2' || key == '2'){
     penblack = true;
     penred = false;
     penblue= false;
     pengreen=false;
   }
   
   if (key == '3' || key == '3'){
     penblack = false;
     penred = false;
     penblue= true;
     pengreen=false;
 }
 
 if (key == '4' || key == '4'){
     penblack = false;
     penred = false;
     penblue= false;
     pengreen=true;
 }
 }
 }
 void reset() {
   
    if (keyPressed) {
      if (key == 'r' || key == 'r') {
      fill(255);
      rect(300,300,width,height);
    }
    }
 }
 
 void sidebar(){
   fill(190,190,190); //shows the shape menu
   rect(50,30,100,20);
   
   fill(255,0,0);
 text("Tools",30,30);
   
   
   stroke(255);
    fill(0);  //enables the pen indicator
 rect(50,50,100,20);
 
 fill(255);
 text("Pen (P)",25,50);
 
 fill(0); //enables the eraser indicator
   rect(50,70,100,20);
   
   fill(255);
 text("Eraser (E)",25,70);
 
 fill(0); //enables the reset indicator
   rect(50,90,100,20);
   
   fill(255);
 text("Reset (R)",25,90);
 
 fill(0); //enables the ellipses indicator
   rect(50,110,100,20);
   
   fill(255);
 text("Ellipses (C)",25,110);
 
 fill(0); //enables the rect indicator
   rect(50,130,100,20);
   
   fill(255);
 text("Rectangles (S)",20,130);
 }
 
 void keyPressed(){ //if e is pressed once, enables the eraser and disables pen
   if (key == 'e' || key == 'e') {     
   eraser=true;     
 pen=false;
 ellipses=false; 
rectangles=false; 
 }  
  if (key == 'p' || key == 'p'){ //if p is pressed once, it enables pen and disables eraser   
   eraser=false;   
   pen=true;
    ellipses=false;
    rectangles=false; 
  }
  if (key == 'c' || key == 'c'){ //if p is pressed once, it enables ellipses and disables eraser and pen  
   eraser=false;   
   pen=false;
    ellipses=true;
    rectangles=false; 
 }
 if (key == 's' || key == 's'){ //if p is pressed once, it enables ellipses and disables eraser and pen  
   eraser=false;   
   pen=false;
    ellipses=false;
    rectangles=true; 
 }
 
 }
 void eraser(){ //the eraser creates a white square when mouse is clicked
 if (eraser == true && pen == false && rectangles==false) {  
 stroke(255);
   fill(255); //tick box deleting the penmode tickbox
   rect(110,45,10,10);
   
   fill(255); //removing the ellipse tick box
   rect(110,110,10,10);
 
   
   fill(255,0,0); //tick box showing you are in eraser
   rect(110,70,10,10);
   
     fill(255); //tick box deleting the ellipse mode tickbox
   rect(110,135,10,10);
   
   fill(255); 
 if (mousePressed){ 
   rect(mouseX,mouseY,25,25); 
 }
 }
 }
 
public void pen(){ //the pen creates a black rectangle to act as a pen tool
   if (pen == true && eraser == false && rectangles==false) {   
 stroke(255);
   fill(255,0,0); //tick box showing you are in pen mode
   rect(110,45,10,10);
      
      
   fill(255); //removing the eraser tick box
   rect(110,70,10,10);   
 fill(0);
 
 fill(255); //removing the ellipse tick box
   rect(110,110,10,10);
   
     fill(255); //tick box deleting the ellipse mode tickbox
   rect(110,135,10,10);
 
 if(mousePressed){
 if (penblack == true && penred==false && penblue==false && pengreen==false){
 stroke(0);
 }
 
 if(penblack ==false && penred == true && penblue==false && pengreen==false){
 stroke(255,0,0);
 }
 
 if(penblack ==false && penred == false && penblue==true && pengreen==false){
 stroke(0,0,255);
 }
 if(penblack ==false && penred == false && penblue==false && pengreen==true){
 stroke(0,255,0);
 }
 frameRate(50);
  
 line(mouseX, mouseY, pmouseX, pmouseY);
 }
 }}

   
   
   void ellipses(){
     if (eraser == false && pen == false && ellipses==true && rectangles==false) {
       fill(255); //removing the eraser tick box
   rect(110,70,10,10);   
 fill(0);
   fill(255); //tick box deleting the penmode tickbox
   rect(110,45,10,10);
   
   fill(255,0,0); //tick box showing you are in ellipse mode
   rect(110,110,10,10);
   
     fill(255); //tick box deleting the ellipse mode tickbox
   rect(110,135,10,10);
   
   
   if(mousePressed) {  
     if (penblack == true && penred==false && penblue==false && pengreen==false){
       fill(0);
     }
     
     if(penblack ==false && penred == true && penblue==false && pengreen==false){
       fill(255,0,0);
     }
     
     if(penblack ==false && penred == false && penblue==true && pengreen==false){
       fill(0,0,255);
     }
      if(penblack ==false && penred == false && penblue==false && pengreen==true){
       fill(0,255,0);
     }
     
 frameRate(50);
 
 
 
 ellipse(mouseX, mouseY, 50, 50);
   }}}
   
   
    void rectangles(){
     if (eraser == false && pen == false && ellipses==false && rectangles==true) {
       fill(255); //removing the eraser tick box
   rect(110,70,10,10);   
 fill(0);
   fill(255); //tick box deleting the penmode tickbox
   rect(110,45,10,10);
   
   fill(255); //tick box deleting the ellipse mode tickbox
   rect(110,110,10,10);
   
    fill(255,0,0); //tick box creating the rect mode tickbox
   rect(110,135,10,10);
   
   
   
   if(mousePressed) {  
     if (penblack == true && penred==false && penblue==false && pengreen==false){
       fill(0);
     }
     
     if(penblack ==false && penred == true && penblue==false && pengreen==false){
       fill(255,0,0);
     }
     
     if(penblack ==false && penred == false && penblue==true && pengreen==false){
       fill(0,0,255);
     }
      if(penblack ==false && penred == false && penblue==false && pengreen==true){
       fill(0,255,0);
     }
     
 frameRate(50);
 
 
 
 rect(mouseX, mouseY, 50, 50);
   }}}
