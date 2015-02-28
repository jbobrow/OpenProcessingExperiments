
void setup(){
  size(800, 800);
  //sky with different color according to the four seasons
  background(211,238,253);
  noStroke();
  fill(209, 221, 227);  
  rect(0, 400, 400, 400);
  fill(192,203,210);
  rect(400,0,400,400);
  fill(124,209,241);
  rect(400,400,400,400);
}

//spring with flowers
void season1(){
 pushMatrix();
 translate(random(-10, 10), random(-10, 10));
 scale(random(5,10));
 fill(251, random(150,208), random(200, 231), random(50,100));
 rotate(radians(random(-270,270)));
 curve(0, 0, 30, -5, 0, -10, -20, -60); 
 fill(249, 252, 159, random(1,100));
 ellipse(0,0,5,5);
 popMatrix();
}

//fall with red leaves
void season2(){
  pushMatrix();
  translate(random(-50,50), random(-50, 50));
  scale(random(5,5));
  rotate(radians(random(-45,45)));
  fill(random(200,254), random(1,63), random(1,72), random(1,100));
  curve(0, 0, -25,0, 0, -20, 55, -2);
   fill(252,78,10,random(1,100));
   curve(0,0,-25,40,0,30,-25,3);
  popMatrix();
}

//rainy summer(I want to express hot weather but this image can be similar to season2-fall
void season3(){
  pushMatrix();
  translate(random(-15, 15), random(-15, 15));
  scale(random(0.5, 5));
  fill(random(4,143), random(121,178),random(186,230),random(1,100));
  curve(0, 0, -20, 10, 0, -20, 30, -20);
  scale(random(0.2, 1));
  fill(27,112,239,random(50,100));
  curve(0,0,-20,10,0,-20,30,-20);
  popMatrix();
}

//snowy winter
void season4(){
  pushMatrix();
  translate(random(-50,50), random(-50, 50));
  scale(random(0.3, 5));
  fill(248, 249,251, random(15, 100));
  ellipse(0, 0, 20, 20);
  popMatrix();
}
  



void draw(){ 
  
    if(mouseX<=400&& mouseY<=400){
      if(mousePressed){
    translate(mouseX, mouseY);
    season1();}
  }
  else if(mouseX>=400&& mouseY<=400)
 {
    if(mousePressed){        
        translate(mouseX,mouseY);
        season3();}}
        
    else if(mouseX>=400&& mouseY>=400){
      if(mousePressed){
        translate(mouseX,mouseY);
        season2();}}
        
    else if(mouseX<=400 && mouseY>=400){
      if(mousePressed){
        translate(mouseX, mouseY);
        season4();}}
}
