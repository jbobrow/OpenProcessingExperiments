
float a=0.90;
float speed = 10;
float grav=0.5;
void setup() {
  size(900, 600); 

  background(59,99,233); 


}

 
void draw() {
  smooth();
  fill(random(255),random(110),10,5);
ellipse(150,150,a,a);
translate(+500,250);
rotate(a+500);
line(500,300,a,a);
triangle(300,300,200,200,300,300);  
  if (mousePressed){
    
    fill(random(255),random(110),10,5);
ellipse(250,350,a,a);
    fill(random(255),random(110),10,5);
ellipse(-150,-150,a-a,a);

  rebote();
  movimiento();

//saveFrame("frames/####.png");
}
}
void movimiento (){
  a = a + speed;
  speed = speed + grav;
}
void rebote (){
if (a>=800|| a<0){
  speed = speed*-0.99;
}
}
