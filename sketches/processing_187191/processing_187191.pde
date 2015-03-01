
void setup (){
size (500,400);
background(34,130,56); 
} 

void draw () {
fill(0,0,0); 
ellipse(250,175,100,100); 
fill(255,0,0);
ellipse(250,200,50,50);
stroke(30,64,85);
fill(0,0,0); 
rect(225,225,50,150);
rect(275,215,100,30);  
rect(125,215,100,30);



stroke(0,0,0);
fill(0,0,0);
ellipse(mouseX,mouseY,25,25);
fill(200,23,40);
ellipse(mouseX,mouseY+5, 12.5, 12.5); 
stroke(30,64,85);
fill(0,0,0); 
rect(mouseX-5,mouseY + 13,10,50);
rect(mouseX + 5,mouseY + 10,25,10);  
rect(mouseX - 30, mouseY + 10,25,10); 
} 







