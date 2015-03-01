
int counter;

void setup() {  //setup function called initially, only once
size(500,500);


}

void draw() {  
if(mousePressed == true) { 
    ellipse(mouseX, mouseY, 20, 20);
    }
background(0);
fill(0,0,250,220);
ellipse(mouseX,mouseY,520,520);
noFill();
ellipse(mouseX,mouseY,40,40);
ellipse(mouseX,mouseY,200,200);
fill(0);
ellipse(mouseX,mouseY,8,8);
rect(mouseX-300000,mouseY,30000000000000,3);
rect(mouseX,mouseY-3000,3,30000000000);

if(mousePressed == true) { 
fill(0,0,250,220);
ellipse(mouseX,mouseY,580,580);
noFill();
ellipse(mouseX,mouseY,90,90);
ellipse(mouseX,mouseY,240,240);
fill(0);
ellipse(mouseX,mouseY,14,14);
rect(mouseX-300000,mouseY,30000000000000,3);
rect(mouseX,mouseY-3000,3,30000000000);
fill(255,171,3);
    ellipse(mouseX, mouseY, 20, 20);
    }


}
