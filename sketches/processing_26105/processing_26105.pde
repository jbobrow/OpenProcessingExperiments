
//Louisa 2/3/2011

void setup(){
size(300, 300);
background (10, 30, 150); 
}


void draw(){
 fill(245, 7, 7);
 ellipse(mouseX, mouseY, 55, 55); 
strokeWeight(abs(mouseX - pmouseX));
}

