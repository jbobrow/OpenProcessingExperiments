
// Assignment 1
// By Wong Hiu Tung, Christine
// Student ID: 534015140


int snowX, snowY;

void setup(){
  size(600, 400);
  background(250);

}

void draw(){
   
//blue window  
 fill(#B0E0E6);
 noStroke();
 rect(100, 20, 395, 500, 7);
  
  
//little boy's face
  noStroke();
  smooth();
  fill(#FFFFF0);
  ellipse(300, 470, 400, 400);

//little boy's mouth 
  fill(#FA8072);
  smooth();
  arc(300, 360, 90, 50, 0, PI);

//movement of eyes  
  if (mouseX < 300) {
    
  fill(0);
  smooth();
  ellipse(380, 350, 20, 20);
  ellipse(220, 350, 20, 20);
  }
  
  else{
  fill(0);
  smooth();
  ellipse(385, 350, 20, 20); 
  ellipse(225, 350, 20, 20);
  } 

//face turned red
  if (mousePressed == true) {
     fill(#FFE4E1);
     smooth();
     ellipse(400, 395, 50, 50);
     ellipse(210, 395, 50, 50);
}

//litte boy's nose 
  smooth();
  fill(#FFE4E1);
  triangle(280, 350, 320, 350, 300, 330);

//falling snow
  snowX = floor(random(width));
  snowY = floor(random(height));
  
  fill(#F8F8FF);
  ellipse(snowX, snowY, 10, 10);

//message
  if (mousePressed == true) {
  fill(250);
  textAlign(CENTER);
  textSize(10);
  text("________________________", 300, 205);
  text("________________________", 300, 185);
  text("N i c e   T o   M e e t   Y o u  !", 300, 200);
  }
  
  else{  
  fill(250);
  textAlign(CENTER);
  textSize(10);
  text("_________________", 300, 205);
  text("_________________", 300, 185);
  text("C l i c k   O n   M e  !", 300, 200);
 
  }  

}
