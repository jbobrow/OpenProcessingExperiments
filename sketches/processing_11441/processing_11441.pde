
void setup(){
size(800,250);
smooth();
background(255);
frameRate(10);
}
void draw(){
stroke(pmouseX,200, pmouseY,50); //puedo hacer esto mejor?
float distance = dist(pmouseX, pmouseY, mouseX,mouseY);
float maxStroke = 55;
fill(255);
strokeWeight(maxStroke - constrain(distance, 0, maxStroke));
rect(pmouseX,pmouseY,mouseX,mouseY,10,10,10,10);
}
void mouseClicked(){  
ellipse(pmouseX, pmouseY, mouseX, mouseY); 
fill(mouseY, 55, mouseX, 80);  
noStroke();  
rect(mouseX, mouseY, 10, 50);  

}  
void keyPressed(){  
background(255); 
}


