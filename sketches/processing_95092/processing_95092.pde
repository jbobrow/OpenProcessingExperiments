
int mis=60;   //Variables
int rob=10;   //Variables

void setup(){
  size(600, 600);  //size of the window
  background(0);  //background color
  frameRate(5);   //frame rate
  strokeWeight(2);
}

void draw(){
  size(600, 600);  
  background(0);
  frameRate(5);
  strokeWeight(2);
  
  
  
  
  
  
  rob=rob+1;    //calling variable 
  rob=max(0,rob);   // calling variables
  feet(100+rob, 120);  //calling the feet of the robot
  rob=rob+1;                 // calling variables
  rob=max(0,rob);           ///calling variables
  arm(100+rob, 120);       //calling the arms
  mis=(mis+10);           //calling variables  
  misile(100+mis, 120);   //llamandole al torpido
  
 }
  
 void feet(int x, int y){
   fill(255);                    //color of the object
   rect(100+x, 530, 80, 40);    //the body of the train
   rect(100+x, 390, 50, 140);   //the front window of the train
   rect(180+x, 530, 80, 40);   //the little window
   rect(180+x, 390, 50, 140);  // the other little window
   fill(255+x, 8, 8);          //defining the color of the object
   rect(100+x, 250, 130, 140);  //fron light yellow
   fill(255);
   rect(100+x, 190, 130, 60);
   fill(255, 8, 8);
   ellipse(200+x, 220, 30, 30);
   rect(100+x, 190, 50, 60);
   rob=(rob+1)%400;
 }
 
 void arm(int x, int y) {
 
   fill(255);
    rect(100+x, 260, 120, 50);
    rob=(rob+1)%400;
 }
 
 void misile(int x, int y){
    fill(8, 133, 255);
    rect(160+x, 275, 60, 20);
    triangle(160+x, 275, 160+x, 295, 275+x, 285);  
    
   mis=(mis+1)%400;
   
 }

