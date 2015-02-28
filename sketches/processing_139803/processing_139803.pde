
/*Jacqueline Miller, int art, project, natural patterns*/

float theta, delta; 
int j=50;
void setup(){
background(0);
size(900,800);
smooth();
}

void draw(){
strokeWeight(2);// shape to black out the background, but allow the globe section to fade
stroke(150,random(15));
fill(0);
beginShape();
curveVertex(0,0);
curveVertex(0,800);
curveVertex(48,800);
curveVertex(55,763);
curveVertex(65,699);
curveVertex(100,612);
curveVertex(137,554);
curveVertex(200,491);
curveVertex(252,454);
curveVertex(320,425);
curveVertex(384,409);
curveVertex(465,400);
curveVertex(596,430);
curveVertex(700,492);
curveVertex(800,600);
curveVertex(836,696);
curveVertex(848,800);
curveVertex(860,800);
curveVertex(900,800);
curveVertex(900,0);
curveVertex(0,0);
curveVertex(25,0);
endShape();

noStroke();
  
fill(255,j-1);// globe
fill (10,20);
ellipse(width/2, height, 815,815);
  
frameRate(15);


  
  float a= random(75,90);//limit the rotation so that the 'charge' can bunch in one place
  theta=radians(a);
  float b=random(90);
  delta=radians(b);// secondary charge to appear and move randomly until the mouse gets close to the globe
  

 pushMatrix();
 strokeWeight(random(2));
float o = map(mouseY, 0, height, 150, 0);/*tie the mouse distance from the top of the screen to the bottom of the screen to opacity values. This allows the secondary charge to fade and highlight the primary charge which bunches to look like all of the charge is gathering in one place.*/

println(o);
 translate(width/2, height);// secondary charge branches
    line(0,0,0, -10);
  translate(0,-10);
  stroke(255,random(100));
  branch1(80);
 stroke(#5F4ED1,o);
  branch1(80);
  stroke(#3B23CB,o);
  branch1(150);
  stroke(#BE9FEA,o);
  branch1(400);
  stroke(#3B23CB,o);
  branch1(500);

   popMatrix();
  
     
  pushMatrix();
  translate(width/2, height);//primary charge branches
    line(0,0,0, -20);
  translate(0,-20);
  stroke(#5F4ED1,random(255));
  branch(80);
  stroke(#3B23CB,random(255));
  branch(150);
  stroke(#BE9FEA,random(255));
  branch(400);
  stroke(#3B23CB,random(255));
  branch(500);
  stroke(#3B23CB,random(255));
  branch(2);
  popMatrix(); 


}

void branch(float h){
  h*=random(1.2);// length of branch
  //h*= random(.4,.8);
             float value = mouseY-100;/*map mouseY to theta so that the further the mouse is down the screen, the more the charge will rotate or "bend". Subtract a value to draw the branches further down the screen*/
float m = map(value, 0, height, 0, theta-.8);/*map mouseX to theta - a value so that the direction that the charge points switches back and forth once the mouse is past the middle of the sketch. Subtract a value to draw the braches inward and follow the mouse more realistically*/
float value2=mouseX-200;
float n=map(value2, 50, width/1.4, 0, theta);
  if (h>2){
    
      pushMatrix();
    rotate(n-m);//
    line(0,0,0,-h);
    translate(0,-h);// allows the next branch to start where the last branch left off.  
    branch(h);// call the function until the conditional statement is met. 
    popMatrix();
 
  }}

void branch1(float i){
  i*= random(.6);
  
  if (i>2){
         pushMatrix();
    rotate(delta);
    line(0,0,0,-i);
    translate(0,-i);
    branch(i);
    popMatrix();
 
    
  pushMatrix();
    rotate(-delta);
    line(0,0,0,-i);
    translate(0,-i);
    branch(i);
    popMatrix();
    
 pushMatrix();
    rotate(delta);
    line(0,0,0,-i);
    translate(0,-i);
    branch(i);
    popMatrix();

}
}

