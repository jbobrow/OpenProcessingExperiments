
void setup(){
size(600,400);
}
void draw(){ 
background(0);
cursPosx = (mouseX);
cursPosy = (mouseY);
//bare skin 
fill(200,150,0); 
ellipse(mouseX,mouseY,100,100); 
ellipse(mouseX-65,mouseY+160,30,30); 
ellipse(mouseX+65,mouseY+160,30,30); 
//shirt 
fill(255,0,0); 
rect(mouseX-50,mouseY+50,100,125); 
rect(mouseX-80,mouseY+50,30,100); 
rect(mouseX+50,mouseY+50,30,100); 
//pants 
fill(0,0,255); 
rect(mouseX-50,mouseY+175,40,100); 
rect(mouseX+10,mouseY+175,40,100); 
rect(mouseX-10,mouseY+175,20,20); 
stroke(255);
line(mouseX-65,mouseY+160,mouseX-100,mouseY); 
stroke(0);
//balloon 
fill(0,255,0); 
ellipse(mouseX-100,mouseY,50,50); 
//face
fill(255,255,255);
ellipse(mouseX-20,mouseY-20,20,20);
ellipse(mouseX+20,mouseY-20,20,20);
fill(200,150,0);
curve(mouseX,mouseY-30,mouseX-30,mouseY+10,mouseX+30,mouseY+10,mouseX,mouseY-30);
}
