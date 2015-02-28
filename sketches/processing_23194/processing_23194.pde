
   float zoogX; 
   float zoogY; 
   float eyeR; 
   float eyeG; 
   float eyeB; 
   
void setup(){
  zoogX = width/2;          // Zoog always starts in the middle  
  zoogY = height + 100;     // Zoog starts below the screen
size(200,200);
background(255,200,150);
smooth();
frameRate(30);
}
 
void draw(){
background(255,200,150);

ellipseMode(CENTER);
rectMode(CENTER);

//Body
stroke(10,100,80);
fill(10,100,80);
rect(mouseX,mouseY,50,50);

//Head
stroke(200,100,10);
fill(200,100,10);
ellipse(mouseX,mouseY-50,90,70);

//Eyes
eyeR = random(255);  
eyeG = random(255);  
eyeB = random(255);  
fill(eyeR,eyeG,eyeB);  
ellipse(mouseX-18,mouseY-50,30,25);
ellipse(mouseX+18,mouseY-50,30,25);


//Legs
stroke(200,100,10);
line(mouseX-10,mouseY+25,pmouseX-10,pmouseY+80);
line(mouseX+10,mouseY+25,pmouseX+10,pmouseY+80);

}

void mousePressed(){ 
println("Hello!");

}

void keyPressed(){  
background(10,100,80);

}

