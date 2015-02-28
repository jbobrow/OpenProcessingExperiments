
float alpha, beta, gamma;

Orb orb1=new Orb();

Orb orb2=new Orb();
Orb orb3=new Orb();
void setup(){
 size(900,800);
   
}

void draw(){
fill(255, 30);
rect(0,0,width, height);
frameRate(10);
noStroke();
fill(255,90);
fill (255);




ellipse(width/2, height/2,20,20);// rotate branches 
   orb1.display(width/2, height/2);
 rotate (radians(-90));
 orb1.display(-width/2, -height/2);

 rotate(radians(-180));
 orb1.display(width/2.23, -height/1.76);
  rotate(radians(-270));
 orb1.display(-width/2, -height/2);
   rotate(radians(90));
 orb1.display(-400,460);

  
}

void mousePressed(){
background(255);
}
class Orb{
  float x,y;
  Orb(){
   }
  
void display(float _x, float _y){
  x=_x;
  y=_y;
  
  
  float a= random(-10,10);//limit the rotation so that the 'charge' can bunch in one place
  alpha=radians(a);//convert the value to radians 
  float b=random(5);// secondary charge to appear and move randomly until the mouse gets close to the globe 
  beta=radians(b);// value to radians 
  float c=10;
  gamma=radians(c);
  
  

 pushMatrix();
 strokeWeight(random(2)); // varys the weight
float o = map(mouseY, 0, height, 150, 0);/*tie the mouse distance from the top of the screen to the bottom of the screen to opacity values. This allows the secondary charge to fade and highlight the primary charge which bunches to look like all of the charge is gathering in one place.*/
stroke(255);

translate(x,y);// move the drawing to the bottom middle of the screen start drawing branches
    line(0,0,0, -10);//creates a line that is 10 pixels from the bottom of the screen 
  translate(0,-10); // starts all new lines at the end of the last line  
  stroke(255,random(100));
 branch1(80); // (#) is the value that new branches base their y values on to create new lines. It is calculated in the below recursive fucntion.  
 stroke(#5F4ED1,o);
  branch1(80);
  stroke(#59A2B7,o);//(#3B23CB,o);
  branch1(150);
  stroke (#59A2B7,o);//(#BE9FEA,o);
  branch1(400);
  stroke (#59A2B7,o);// (#3B23CB,o);
  branch1(500);
  println("x" + mouseX);
    println("y" + mouseY);

   popMatrix(); 
     
pushMatrix();
  translate(x,y);//primary charge branches
    line(0,0,0, -20);// starts a set of branches just slightly higher than the first so that it appears slightly set back from the first
  translate(0,-20);
  stroke(#59A2B7,o);//(#5F4ED1,random(255));
  branch(80);
  stroke(#59A2B7,o);//(#3B23CB,random(255));
  branch(150);
  stroke(#59A2B7,o);//(#3B23CB,random(255));
  branch(400);
  stroke(#59A2B7,o);//(#3B23CB,random(255));
  branch(500);
  stroke(#3B23CB,random(255));
  branch(2);
  popMatrix(); 



  


}


 void branch(float h){
h*=random(1.2);// changes randomly how long the next branch is compared to the last  
float value = mouseY-100;/*map mouseY to alpha so that the further the mouse is down the screen, the more the branch will rotate or "bend". Subtract value from y this ties when the lines start curving inward to match more closely the cursor position. they need to stay straight longer*/
float m = map(value, 0, height, 0, alpha-gamma); // limits the amount of rotation
float value2=mouseX-200;/*map mouseX to alpha and subract a value so that the direction the branch curls towards towards will switch back and forth once the mouse is past the middle of the sketch. The subtracted value draws the line movement closer to the mouse position */
float n=map(value2, 50, width/1.4, 0, alpha);
  if (h>2){ //  this allows there to be and end to the recursive function, otherwise it would curl in and create a new line infinitely small
    
      pushMatrix();
    rotate(n-m);//// the rotation is combined so that the value becomes negative or positive as the mouse moves, and dooes't have to be called in an if state - ex if mouse x <width/2 push matrix ... 
    line(0,0,0,-h); //h is defined by our values from above ex. 80, 150..
    translate(0,-h);// allows the next branch to start where the last branch left off. Based on a calculated variable, so that the value can change, but the new line will always start at the end of the last   
    branch(h);// call the function until the conditional statement is met (which is that the line must be at least 2 pixels long). 
    println("h"+ h);
    popMatrix();
 
  }}

void branch1(float i){
   i*= random(.6);
  
  if (i>2){
         pushMatrix();
    rotate(beta);// rotating positive beta branches the lines right
    line(0,0,0,-i);
    translate(0,-i);
    branch(i);
    popMatrix();
 
    
  pushMatrix();
    rotate(-beta);//rotating negative beta branches the lines left
    line(0,0,0,-i);
    translate(0,-i);
    branch(i);
    popMatrix();
    
pushMatrix(); //  
    rotate(beta);
    line(0,0,0,-i);
    translate(0,-i);
    branch(i);
    popMatrix();
    
 
}
}
}
