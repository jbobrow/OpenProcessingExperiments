
//Definerer værdierne for huset
int basis_x,basis_y,kvadrat_xy,basis_x3,basis_x2,slut_y,lilla_1,lilla_2,lilla_3,hvid;

//Definerer værdierne for smiley
int smiley_center_x, smiley_center_y, smiley_r;

//Definerer værdierne for solen
float x,y,a,b,c,counter,moon;
//Setup
void setup(){
size(640,640);
frameRate(60);
}

//Hus
void draw(){
  background(210,234,255);
  fill(hvid,hvid,hvid);
  basis_x = 30;basis_y = 90;kvadrat_xy = 150;basis_x2 = 180;basis_x3 = 105;slut_y = 3;lilla_1 = 265; lilla_2 = 40; lilla_3 = 170; hvid=255; //Sætter værdi til variablene for huset
  rect (basis_x,basis_y+200,kvadrat_xy,kvadrat_xy+200);
  noFill();
  fill(lilla_1,lilla_2,lilla_3);
    triangle(basis_x,basis_y+200,basis_x3,slut_y+200,basis_x2,basis_y+200);
  noFill();

//Smiley
fill(hvid,hvid,hvid);
  smiley_center_x = 105; smiley_center_y = 165; smiley_r = 145; //Sætter værdi til variablene for smileyen
  ellipse (smiley_center_x,smiley_center_y+200,smiley_r,smiley_r);
  ellipse(60,140+200,20,20);
  ellipse(150,140+200,20,20);
  arc(80, 175+200, 150, 50, 0, HALF_PI);
noFill();
//Jord
fill(20,255,20);
  rect(0,440,640,480);
noFill();

//Sol

a= 0.0009765625;
b= -0.625;
c= 180;
y = a*x*x+b*x+c;
x = -50+counter;

fill(#F7E407);
  ellipse(x,y,100,100);
noFill();
  counter = counter+2;
if(counter==740){
  counter = 0;
}

}
