
// This is what makes it possible for the colours to constantly change
float eyeR;
float eyeG; 
float eyeB;  

// The size of my window
void setup() {
size(400,400); 
smooth();
background(255);
}

void draw() { 
//Draw sketchs head 
//By using the mouseX and mouseY functions the character is controlled by the mouse 
fill(255);
ellipse(mouseX,mouseY,80,80); 

//Draw sketchs body
fill(144,143,140);
rect(mouseX-10,mouseY+39,20,60); 
stroke(0);  

//Draw sketchs sunglasses 
//The colours in the fill will constantly change at random
eyeR = random(255); 
eyeG = random(255); 
eyeB = random(255);
fill(eyeR,0,eyeB);
rect(mouseX-30,mouseY-5,25,10);  
rect(mouseX+5,mouseY-5,25,10);  

//Draw sketchs legs
stroke(0);   
line(mouseX+10,mouseY+100,mouseX+20,mouseY+150); 
line(mouseX-25,mouseY+148,mouseX-10,mouseY+100);

//Draw sketchs arms
line(mouseX-10,mouseY+60,mouseX-60,mouseY+30); 
line(mouseX+40,mouseY+80,mouseX+10,mouseY+60); 

//Draw sketchs feet 
//The colours in the fill will constantly change at random
fill(eyeR,eyeG,eyeB); 
ellipse(mouseX-45,mouseY+145,40,30);  
ellipse(mouseX+40,mouseY+145,40,30); 

//Draw sketchs mouth
fill(0); 
ellipse(mouseX,mouseY+20,40,10); 

//Draw sketchs tongue 
//The colours in the fill will constantly change at random
fill(eyeR,eyeG,eyeB); 
rect(mouseX,mouseY+25,10,10);
}

//By clicking the mouse there will only be one sketch character 
//and the background will change to white
void mousePressed() { 
  background(255); 
} 

//By pressing any key there will be only one sketch character 
//and the background will change to random colours every time it is pressed
void keyPressed() { 
  background(eyeR,eyeG,eyeB);  
} 





