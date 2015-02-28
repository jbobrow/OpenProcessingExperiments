
int m;
void setup() {  
  size(600, 600, P3D);   
  smooth();
m=minute();
colorMode(RGB % 300);
}  
  
void draw() {  
  background(random (10, 301)); 
 directionalLight(153, 153, 153, .5, 0, -1);
ambientLight(153, 102, 0);
ambient(51, 26, 0);

  int m= minute(); 
   noFill(); 
 float x= random (height^2);  
float y= random(width^2);  
 strokeWeight(8); 
stroke(x,y,56,150);  
  ellipse(x,y, second(), second());  
   
 stroke(#FFFFFF); 
  strokeWeight(1); 
  ellipse(x,y,100,100); 
  ellipse (x/5, y/3, 150, 150);
  ellipse (random (X, width), random (Y, height), 180, 180);

  ellipse(x,y,minute(),minute()); 
stroke(301, m++, m++);
translate(width/2, height/2, 0);
rotateX(second()*10);
rotateY(second()*10);
fill(0);
box(1);
  noStroke();  
translate (width/4, height/4, 0);
  rotateX(radians (millis()/10));  
  rotateY(radians (millis()/10));  
  noStroke();
  fill(#FA840D) ; {
 box (150);
  fill (minute(), minute(), 42, 112);
    sphere(90);
}
  
}




