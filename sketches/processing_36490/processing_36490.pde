
 //homework 3
// copyright Paul Bracchitta September 2011 Pittsburgh, PA

//'1'  increase red to RGB fill
//'2'  increase green to RGB fill
//'3'  increase blue to RGB fill
//'q'  decrease red to RGB fill
//'w'  decrease green to RGB fill
//'e'  decrease blue to RGB fill
//'+'  increase brush size
//'-'  decrease brush size
//'g'  square brush
//'p'  elliptical brush
//'space'  reset the fun
//get creative!


int color_1=0;
int color_2=0;
int color_3=0;
int sz = 10;

void setup( )
{
  size(500,500);
  smooth();
  frameRate( 360);
  background(255);
  noStroke();


}

void draw( ) {
 
  //if(mousePressed == true){
  //  ellipse( mouseX, mouseY,10,10);
  //}else{
  //} 
}
  

void mouseDragged( ) {
 
 fill(color_1,color_2,color_3);
 ellipse(mouseX,mouseY,sz,sz);
   if(key == 'g') {
     rect(mouseX-.5*sz,mouseY-.5*sz,sz,sz);
   }
   if(key == 'p') {
     ellipse(mouseX,mouseY,sz,3*sz);
   }

}

void keyPressed() {

  if (key == '1') {
    color_1= color_1 + 15;
   }
   
   if (key == '2') {
     color_2= color_2 + 15;
   }
   
   if (key == '3') {
     color_3= color_3 +15;
   }
   
   if (key == 'q') {
     color_1= color_1 - 15;
   }
   
   if (key == 'w') {
     color_2= color_2 - 15;
   }
   
   if (key == 'e') {
     color_3=color_3 - 15;
   }
   
   if (key == ' ') {
    background(255,255,255); 
   }
   
   if (key == '+') {
     sz = sz + 5;
   }
   
   if (key == '-') {
     sz = sz - 5;
   }
}
      
                
