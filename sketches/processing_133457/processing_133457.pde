
void setup(){
  size(400,400);
  background(100,500,20);
  noLoop();
}
void draw(){
  strokeWeight(7);
  line(300,0,300,300);
  line(350,0,350,350);
  line(300,50,0,50);
  line(0,75,400,75);
  
  line(100,0,100,400);
  line(50,400,50,100);
  line(400,350,0,350);
  line(00,75,400,75);
  ellipse(100,100,100,100);
  ellipse(300,300,100,100);

  strokeWeight(4);
float a = 0;
  while (a < 400) {
    stroke(150,50);
    strokeWeight(6);
    translate(0,5); 
    line(a,0,a,50);
    line(a,100,a,150);
    line(a,200,a,250);
    line(a,300,a,350);
    line(a,400,a,450);
    a = a + 25;
  }
  fill(300,0,300);
  strokeWeight(6);
  while(mouseX >400);
  for (int i = 25; i < 400; i = i+50) {
for (int j = 25; j < 400; j = j+50) {
ellipse(i, j, 35, 25);


  

}
  }
}
