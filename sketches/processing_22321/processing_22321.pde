
void setup() {
  size(500,500);

}

void draw() {
background (mouseX,mouseY,80);
  
  noStroke();
  fill(random(20),mouseY,0,100);
  triangle(10,10,400,130,30,130);
fill(random(100),20,0,100);
  triangle(114,80,30,230,20,140);
  fill(random(20),mouseY,31,100);
  triangle(random(500),random(500),400,130,20,10);
    fill(50,random(90),312,105);
  triangle(random(500),random(400),200,10,20,120);
    fill(random(20),mouseY,310,100);
  triangle(random(500),random(500),40,40,24,313);
    fill(random(20),mouseY,31,200);
  triangle(random(10),random(400),35,10,50,330);
    fill(240,mouseY,31,355);
  triangle(random(50),random(500),300,530,202,30);
}
                
