
//Homework "Star" by Veronica Black for CCLab F'12
//Using a class with function and Pop/Push Matrix

//POP+PUSH Matrix
float size = 100;
int r, g, b, o, y, w, p, t, s;
/*red*//*green*//*blue*//*orange*//*yellow*//*white*//*pink*//*teal*//*silly*/


//Object of my class
star myStar;
star myStar2;
star myStar3;
star myStar4;

void setup(){
 size(600, 600);
 
 noStroke();
 myStar = new star();
 myStar2 = new star();
 myStar3 = new star();
 myStar4 = new star(); 
 
  r = 255;
  g = 0;
  b = 100;
  o = 255;
  y = 0;
  w = 100;
  p = 255;
  t = 0;
  s = 100;

   
}

void draw(){
 //pop+push 
  if(frameCount %  10 == 0) {
  
  fill(r, g, b, 10); 
  pushMatrix();
  translate(width/2, height/2); // can be any size
  rotate(radians(frameCount * 2 % 360));
  rect(0, size, size/2, 0, size, size/2);
  popMatrix();
  size += 0.15;
  r --; //r ++; //why -- or ++
  g ++;
  b ++;
 
 }
 
  if(frameCount %  10 == 0) {
  
  fill(o, y, w, 25); 
  pushMatrix();
  translate(width/4, height/4); // can be any size
  rotate(radians(frameCount * 2 % 360));
  rect(0, size, size/2, 0, size, size/2);
  popMatrix();
  size += 0.25;
  o ++; //r ++; //why -- or ++
  y ++;
  w ++;
  
 }
 
  if(frameCount %  10 == 0) {
  
  fill(p, t, s, 50); 
  pushMatrix();
  translate(height, width/2); // can be any size
  rotate(radians(frameCount * 2 % 360));
  rect(0, size, size/2, 0, size, size/2);
  popMatrix();
  size += 0.25;
  p ++; //r ++; //why -- or ++
  t ++;
  s ++;
  
 }
 
 //class
  myStar.move();
  myStar.display(); 
  
  myStar2.move();
  myStar2.display();
  
  myStar3.move();
  myStar3.display(); 
  
  myStar4.move();
  myStar4.display();
  
}

