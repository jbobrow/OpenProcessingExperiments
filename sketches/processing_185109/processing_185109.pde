
void setup(){
noStroke();
  smooth();
  noCursor();
  size(500,500);}
 float a=random(500);
 float b=random(500);
  void draw(){
    if(mouseX<a && mouseY<b){
    
}
    else{
      tris2();
  spin2();
 println(mouseX,",",mouseY);}
  }
   
   
   
  void tris1(){
    strokeWeight(2);
    fill(160);
    triangle(0,0,width,0,250,250);
    fill(255);
    triangle(0,0,0,height,250,250);
    fill(0);
    triangle(0,height,width,height,250,250);
    fill(255);
    triangle(width,height,width,0,250,250);
  
}
void tris2(){
    strokeWeight(2);
    fill(255);
    triangle(0,0,width,0,250,250);
    fill(160);
    triangle(0,0,0,height,250,250);
    fill(255);
    triangle(0,height,width,height,250,250);
    fill(0);
    triangle(width,height,width,0,250,250);
  
}
  

 
void spin1(){
  pushMatrix();
  translate((mouseX+pmouseX)/2,pmouseY);
  rotate(radians(millis()/3));
  noStroke();
  fill(mouseY+second(),40+3*second(),140+second(),millis()%255+40);
  ellipse(0,120,mouseY%17,mouseY);
popMatrix();
}
 
void spin2(){
  pushMatrix();
  translate((mouseX+pmouseX)/2,pmouseY);
  rotate(radians(millis()/3));
  noStroke();
  fill(mouseY+second(),40+3*second(),140+second(),millis()%255+40);
  ellipse(50,50,50,50);
popMatrix();
}
