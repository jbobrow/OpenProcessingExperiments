

                void setup(){
 size(450,450);
 
background(225);
 
  smooth();
}
 
 
void draw(){
fill(0,10);
noStroke();
float speed = dist(pmouseX,pmouseY, mouseX,mouseY);
 
fill(random(40,55), random(0,25), random(0,55),10);
 
triangle (mouseX,mouseY, 200, 300,200,200);
 
  //println(speed);
}
                
                
