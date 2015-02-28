
PImage cube1;
PImage cube2;
PImage cube3;
PImage cube4;
PImage cube5;

void setup(){
background(255);
size(640,480);
noStroke();
smooth();

cube1= loadImage("cube1.png");
cube2= loadImage("cube2.png");
cube3= loadImage("cube3.png");
cube4= loadImage("cube4.png");
cube5= loadImage("cube5.png");


}

void draw(){
background(229,227,199); 

if((mouseX>20)&&(mouseX<640)){
 image(cube1,0,0);
}
if((mouseX>128)&&(mouseX<640)){
 image(cube2,0,0);
}
if((mouseX>236)&&(mouseX<640)){
 image(cube3,0,0);
}
if((mouseX>384)&&(mouseX<640)){
 image(cube4,0,0);
}
if((mouseX>512)&&(mouseX<640)){
 image(cube5,0,0);
}
//if((mouseX>0)&&(mouseX<128)){
// image(cube1,0,0);
//}
//if((mouseX>128)&&(mouseX<236)){
// image(cube2,0,0);
//}
//if((mouseX>236)&&(mouseX<384)){
// image(cube3,0,0);
//}
//if((mouseX>384)&&(mouseX<512)){
// image(cube4,0,0);
//}
//if((mouseX>512)&&(mouseX<640)){
// image(cube5,0,0);
//}
}






void cube(int x, int y){

//fill(255,0,0,200);
pushMatrix();
//scale(s);
quad(x,y,x,y+30,x+26,y+48,x+26,y+17); 
quad(x+28,y+17,x+28,y+48,x+52,y+30,x+52,y); 
quad(x+27,y-18,x+1,y-2,x+27,y+15,x+51,y-2);

popMatrix();
}

void cuberight(int x, int y) {
//  fill(100,0,0,100);
//for (int i = 100; i < 700; i = i+26) {
//  for (int j = 100; j < 100; j = j+17) {
//  cube(x+cx,y+cy); //RIGHT
  //}
}





