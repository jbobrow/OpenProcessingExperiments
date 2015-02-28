
void setup(){
size(800,600);
smooth();
noFill();
strokeWeight(.1);
background(255);
}

void draw(){
    stroke(random(100,255),0,random(100,255),random(50,100));


line (mouseX,mouseY,0,random(600));
line (mouseX,mouseY,random(800),0);
line (mouseX,mouseY,800,random (600));
line (mouseX,mouseY,random(800),600);
    
    stroke(random(100,255),random(100,255),0,random(50,100));

line (mouseX,mouseY,0,random(600));
line (mouseX,mouseY,random(800),0);
line (mouseX,mouseY,800,random (600));
line (mouseX,mouseY,random(800),600);
stroke(random(100,255),0,random(100,255),random(50,100));

line (mouseX,mouseY,0,random(600));
line (mouseX,mouseY,random(800),0);
line (mouseX,mouseY,800,random (600));
line (mouseX,mouseY,random(800),600);




}

