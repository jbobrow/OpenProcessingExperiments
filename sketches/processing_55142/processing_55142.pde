
float xoff = 0.0;
float xincrement = 5; 

float maxX = 180; 
float changeX = 2.5; 
float initX = 180;   


void setup(){
size(450,450);
background(0);
frameRate(50);
smooth();
noStroke();
}

void draw(){
  
    fill(0, 10);
  rect(0,0,width,height);
  
float n = noise(xoff)*width;
xoff += xincrement;
fill(200);
 initX += changeX; 
  
  if (initX > maxX || initX < 160) { 
    changeX = -changeX; 
    initX += changeX; 
fill( random(255), random(255), random(255), random(255)); 
ellipse(n,height/2.6,55,55); 
fill( random(255), random(255), random(255), random(255)); 
ellipse(n,height/1.65,55,55); 
fill( random(255), random(255), random(255), random(255)); 
ellipse(n,height/2,60,60); 

}
}





