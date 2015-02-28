
int value = 0;

void setup(){
  size(600,600);
}
void draw() {
background(206, 199, 180);
fill(140);
ellipse(390, 350, 200,200);
fill(114, 86,155);
ellipse(250,250,100,100);

fill(255);

stroke(255,0,0);


  arc(200, 152, 200,200, PI, 0);


  arc(200, 152, 200,200, -PI, 0);

arc(0, 152, 200,200, -PI/2, 0);
stroke(0);


  if (mousePressed == true) {
    fill(0);
  } else {
    fill(202,167,56);
  }
  triangle(307,238,409,152,440,300);

line(200,350,400,350);
line(150,0,450,340);
fill(135,22,44);

line(472,462,510,462);
line(472,480,510,480);
line(0,152,409,152);
noFill();
arc(0, 350, 200,200, -PI/2, 0);
arc(100, 450, 200,200, -PI, 0);
stroke(202,167,56);
arc(100, 450, 199,199, -PI, 0);
 if (mousePressed == true){
line(175,0,250,430);
} else{
line(150,250,350,250);
}
}

void mouseDragged() 
{
  rect(440,440,55,55);
  value = value + 5;
  if (value > 255) {
    value = 0;
  }}

  


