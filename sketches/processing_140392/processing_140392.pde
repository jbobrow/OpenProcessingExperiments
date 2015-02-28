
float alpha, beta, gamma;

Orb orb1=new Orb();
cloud [] cloud1=new cloud[4];
cloud cloud2, cloud3=new cloud();

void setup(){
 size(900,800);
   for (int i=0; i<cloud1.length; i++){
cloud1[i]=new cloud();
}
}


void draw(){
fill(#6C5189, 80);
rect(0,0,width, height);
frameRate(2);

if(key == 'a'){
for (int i=0; i<cloud1.length; i++){
cloud1[i].display(random(40, 80),random(95,100), 150, 70);

}}
if(key == 'b'){
for (int i=0; i<cloud1.length; i++){
cloud1[i].display(random(40,50),random(250,270), 20, 50);

}}

if(key == 'c'){
for (int k=0; k<cloud1.length; k++){
cloud1[k].display(40,random(30,50), 10, 20);

}}

noStroke();
//fill(#6C5189,90);
//fill (#6C5189);

fill(#7E47BF,30);
ellipse(width/2, height/2,220,220);
fill(#9B5EDE,30);
ellipse(width/2, height/2,180,180);
fill(#AA37A3,30);
ellipse(width/2, height/2,140,140);
fill(#D34F8F,30);
ellipse(width/2, height/2,100,100);
fill(#D3914F,30);
ellipse(width/2, height/2,60,60);// rotate branches 
fill(#D8AB51);
ellipse(width/2, height/2,20,20);// rotate branches 
fill(#6C5189,150);
rect(0,height/2, 900,400);
fill(#518389,80);
rect(0,height/2, 900,400);

  rotate(radians(-270));
   orb1.display(width/1.2,100);
      orb1.display(width/1.8,400);
    rotate(radians(-180));
   orb1.display(-650,950);


  
}




class Orb{
  float x,y;
  Orb(){
   }
  
void display(float _x, float _y){
  x=_x;
  y=_y;
  
  
  float a= random(-10,5);//limit the rotation so that the 'charge' can bunch in one place
  alpha=radians(a);//convert the value to radians 
  float b=random(5);// secondary charge to appear and move randomly until the mouse gets close to the globe 
  beta=radians(b);// value to radians 
  float c=10;
  gamma=radians(c);
  
  

 pushMatrix();
 strokeWeight(random(3)); // varys the weight
float o = map(mouseY, 0, height, 50, 0);/*tie the mouse distance from the top of the screen to the bottom of the screen to opacity values. This allows the secondary charge to fade and highlight the primary charge which bunches to look like all of the charge is gathering in one place.*/
stroke(255);

translate(x,y);// move the drawing to the bottom middle of the screen start drawing branches
    line(0,0,random(-200,100), -10);//creates a line that is 10 pixels from the bottom of the screen 
  translate(random(-200,100),-10); // starts all new lines at the end of the last line  
  stroke(#DECEEA,random(100));
 branch1(150); // (#) is the value that new branches base their y values on to create new lines. It is calculated in the below recursive fucntion.  
 stroke(#DECEEA,o);
  branch1(200);
  //stroke(#3F7889,o);//(#5F4ED1,random(255));
  //branch(10);


   popMatrix(); 
     
pushMatrix();
  translate(x,y);//primary charge branches
    line(0,0,random(-100,50), -20);// starts a set of branches just slightly higher than the first so that it appears slightly set back from the first
  translate(random(-100,50),-20);
  stroke(#DECEEA,o);//(#5F4ED1,random(255));
  branch(300);
  stroke(#D8AB51,o);//(#3B23CB,random(255));
  branch(150);
  stroke(#6C5189,o);//(#3B23CB,random(255));
  branch(250);

  popMatrix(); 



  


}


 void branch(float h){
h*=random(.9);// changes randomly how long the next branch is compared to the last  
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

class cloud{
  float x,y;
 float speed, circx, circy, accel;
  cloud(){
}

void display(float _x, float _y, float _circx, float _circy){
x=_x;
y=_y;
      
  circx=_circx;
  circy=_circy;

    noStroke();
    fill(#8467A2,15);
    
    ellipse (x+accel, y, circx, circy);
   ellipse((x+10+accel), y+5, circx+55, circy+10);
  ellipse((x+20+accel), y+15, circx+300, circy-10);
  
  println(x);
     x+=speed;
speed=1;
speed+=accel;
    accel+=1;
  }
  
    }

