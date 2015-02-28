
//clarkli
//test2

void setup() {   
size(600, 300);  
background(1,1,1);
smooth(); 
}


void draw() {   
if (mousePressed) {     
noStroke();
fill(280,250,22,50);   
} else {     
fill(10,300,50,50);   
}   
ellipse(mouseX, mouseY, 50, 50);





} 



