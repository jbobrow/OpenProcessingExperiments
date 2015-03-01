
void setup(){
  size(600,600);
  background(0);
  smooth();
}
void draw(){
stroke(160,100,120);
line(120,120, mouseX,mouseY);
stroke(200,300,400);
line(mouseX, mouseY,200,200);
stroke(230,120,100);
line(300,420, mouseX,mouseY);
stroke(104,238,73);
line(mouseX, mouseY,150,340);
stroke(232,73,200);
line(mouseX,mouseY,370,430);


frameRate(10);


 
}


  



