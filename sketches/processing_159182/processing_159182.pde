

void setup() {
background(150,10,100,60);
size(300,700);
}

void draw(){ 
 strokeWeight(10);
 point(2,100);
 point(2,200);
 point(2,300);
 point(2,400);
 point(2,500);
 point(2,600);
strokeWeight(2);
stroke(45);
line(mouseX, mouseY,0,100);
stroke(100,0,0,40);
strokeWeight(4);
line(mouseX, mouseY,0,200);
stroke(59,0,49,50);
line(mouseX, mouseY,0,300);
stroke(0,50,100,40);
strokeWeight(8);
line(mouseX, mouseY,0,400);
stroke(0,100,0,50);
line(mouseX, mouseY,0,500);
stroke(255);
strokeWeight(5);
line(mouseX, mouseY,0,600);


}
