
int x = 200;  
int y = 400; 
PFont f; 
float r = 255; 
float g = 225;
float b = 204;
int i = 0;


void setup(){
size(600,600); // set canvas size to 600 x 600
f = createFont("Arial",60,true); // text font, size, condition
noFill(); // no color filled in text

}

void draw(){
  strokeWeight(0); // thickness for stroke

  
background(r,g,b); // set background color to red, green, blue
textFont(f);       
  fill(0);
 textAlign(CENTER);
  text("Searching",width/2,60); 
drawShapes();
loopone();



 if (mouseX < width/3){  // If right
    r = r - 1;   }        //  more red
  else if (mouseX > width/3*2){       // Else left
    r = r + 1;    }       //  less red
    else {
        fill(225);
        constrain(r, 0, 255);
        }
    
}


void drawShapes() {
stroke(0);

  strokeWeight(20);
  fill(255);
  // draws 3 arcs
  if ((mouseY >=400&&mouseX<200 )  ){
  arc(width/4.5, height/1.1, 300, 300, -PI+.7, -.7); }
   if ((mouseY >=450&&mouseX<200 )  ){
  arc(width/4.5, height/1.1, 200, 200, -PI+.6, -.6); }
   if ((mouseY >=500&&mouseX<200 )  ){
  arc(width/4.5, height/1.1, 100, 100, -PI+.5, -.5);
  }
// draws 4 bars 
// if mouseX is greater than a certain x-value and greater than 200, the rectangle will show up
  if ((mouseX >=300&&mouseX>200) ) { 
 rect(300,500,40,99); }  // rect(x,y,w,h);
if ((mouseX >=350&&mouseX>200) ) {
rect(380,400,40,199); } // this rectangle is 80 pixels apart from the first rectangle
if ((mouseX >=400&&mouseX>200) ){
rect(460,300,40,299);} // this rectangle is 80 pixels apart from the second rectangle
if((mouseX >=450&&mouseX>200) ){
rect(540,200,40,399);} // this rectangle is 80 pixels apart from the third rectangle
if ((mouseY >=550&&mouseX<200)  ){
// draw circle below the three arcs
fill(0);
 ellipse(width/4.5, height/1.09, 12,12);}
 }

  void loopone(){
  int x=0; 
   strokeWeight(0); // thickness for stroke
for(int c=220; c>0; c-=15){ 
 fill(c);
  ellipse(x,100,10,10);
  x = x + 43;
  }
  }
