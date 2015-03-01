
int time;

void setup () {
  time=millis ();
  size (300, 300);
  smooth();
}
void draw (){
  if(millis() - time >= 50){
    float r1= random (255);
    float r2 = random (255);
    float r3=random (255);
  background (r1, r2, r3);
time=millis();//also update the stored time 
  }
fill (0);
ellipse ( 75, 115, 45, 45);
fill (0);
ellipse (190, 115, 45, 45);
fill (0);
triangle (140, 150, 155, 170, 130, 170);
triangle (20, 40, 40, 50, 20, 80);
triangle ( 250, 40, 230, 50, 250, 80);
fill (0);
line (100, 150, 30, 130);
line (100, 170, 30, 170);
line (100,190, 30, 210);
line ( 200, 150, 270, 130);
line (200, 170, 270, 170);
line (200, 190, 270, 210);
fill (255) ;
ellipse (75+((mouseX-150)/7), 120+((mouseY-120)/7), 20, 20);
ellipse (195+((mouseX-150)/7), 120+((mouseY-120)/7), 20, 20);


}
