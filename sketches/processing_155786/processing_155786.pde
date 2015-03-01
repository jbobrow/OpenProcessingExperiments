
void setup(){
size(800,800);

}

void draw(){
  fill(91,254,216);
rect(0,0,800,200);
fill(24,67,155);
rect(0,200,800,400);
fill(11,91,47);
triangle(0,200,20,130,50,200);
triangle(50,200,100,100,300,200);

  if (mousePressed){
    fill(random(255),random(255),random(255));
    triangle(mouseX,mouseY-100,mouseX+50,mouseY,mouseX,mouseY+50);
    fill(0,0,0);
    quad(mouseX-75,mouseY+50,mouseX+75,mouseY+50,mouseX+50,mouseY+75,mouseX-50,mouseY+75);
  }else{
    fill(255,255,255);
    triangle(mouseX,mouseY-100,mouseX+50,mouseY,mouseX,mouseY+50);
    fill(255,255,255);
    quad(mouseX-75,mouseY+50,mouseX+75,mouseY+50,mouseX+50,mouseY+75,mouseX-50,mouseY+75);
  }
  fill(229,189,74);
rect(0,600,800,200);    
}
