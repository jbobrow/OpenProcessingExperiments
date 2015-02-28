
void setup(){
size (300, 300);



noStroke();
smooth();
}


void draw(){

int x=mouseX;
int y=150;

//background 
  background (mouseX,mouseY,mouseX);
  
for (int d = 250; d>=10 ; d-=20) {
  stroke(255,255,255,15);
  strokeWeight(3);
  fill(236, 255, 31, 15);
  ellipse (30, 70, d, d);
} 

for (int d = 340; d>=10 ; d-=20) {
  noStroke();
  fill(20, 55,d,20);
  ellipse (170, 100, d, d);
} 

for (int d = 400; d>=10; d-=23) {
  stroke(255,255,255,20);
  strokeWeight(3);
  fill(d-40,143,31,20);
  ellipse (70,310,d,d);
}

for (int d = 300; d>=10; d-=25) {
  stroke (255,255,255,20);
  strokeWeight (3);
  fill(91,d-50,153,16);
  ellipse (320, 30,d,d);
}



//head and body
fill(255);
stroke(10);
strokeWeight(6);
ellipse (x,y,81,100);
rect (x-40,y+3,81,80);
arc (x+40, y+82, 161, 161, radians(45), radians(180));
fill (50);
ellipse (x+148, y+82, 220, 220);

fill(252,233,82);
stroke(255,255,255,30);
ellipse (x,y,81,100);
rect (x-40,y+3,81,80);
arc (x+40, y+82, 161, 161, radians(45), radians(180));
fill (50);
ellipse (x+148, y+82, 220, 220);

//eyes


if(mouseX<100){
  stroke(20);
strokeWeight(2);
fill(255);
ellipse (x-18, y-10, 30, 30);
ellipse (x+15, y-8, 20, 20);
strokeWeight(1);
  fill(255,0,0);
  ellipse(x-22, y-10,15,15);
  ellipse(x+13, y-8,12,12);
  fill(0,0,255);
  ellipse(x-22,y-10,8,8);
  ellipse(x+12,y-8,6,6);
  
 }else if (mouseX>200){
   stroke(20);
strokeWeight(2);
fill(255);
ellipse (x-18, y-10, 20, 20);
ellipse (x+15, y-8, 30, 30);
   strokeWeight(1);
   fill (0,255,0);
   ellipse(x-16, y-10, 12,12);
   ellipse(x+18,y-10, 15,15);
   fill(255, 0,0);
   ellipse (x-15,y-11,6,6);
   ellipse (x+19,y-12,8,8);
   
   
 }else {
   stroke(1);
   strokeWeight(3);
   line(x-30, y-8,x-10,y-8); 
   line(x-30, y-5,x-10,y-5);
   line(x+30, y-8,x+10,y-8);
   line(x+30, y-5,x+10,y-5);

   
 }

//mouth
if (mouseX<100){

stroke(0);
strokeWeight(7);
rect (x-23,y+16, 45, 35);

stroke(255,0,0);
strokeWeight(6);
fill(255);
rect (x-20, y+18, 40, 30);

stroke(129,0,0);
strokeWeight(6);
fill(255);
rect (x-15, y+30, 30, 5);

} else if (mouseX>200){
stroke(0);
strokeWeight(7);
rect (x-23,y+16, 45, 35);

stroke(255,0,0);
strokeWeight(6);
fill(255);
rect (x-20, y+18, 40, 30);

stroke(129,0,0);
strokeWeight(6);
fill(255);
rect (x-15, y+30, 30, 5);

} else{
  stroke(0);
strokeWeight(7);
rect (x-8,y+16, 13, 13);

  stroke(255,0,0);
strokeWeight(6);
fill(255);
rect (x-6, y+18, 10, 10);

}


//horn(left)
stroke(10);
strokeWeight(2);
fill(#BC742C);

beginShape();
vertex(x-37, y-15);
vertex(x-90,y-60);
vertex(x-68,y-110);
vertex(x-65,y-105);
vertex(x-82,y-61);
vertex(x-34,y-23);
endShape(CLOSE);

quad (x-70,y-51,x-58,y-70,x-53,y-67,x-64,y-47);
quad (x-82,y-77,x-100,y-90,x-95,y-95,x-80,y-84);
quad (x-47,y-25,x-100,y-50,x-95,y-54,x-50,y-29);
quad (x-60,y-31,x-79,y-13,x-82,y-22,x-65,y-34);


//horn(right)
beginShape();
vertex(x+37, y-15);
vertex(x+90,y-60);
vertex(x+68,y-110);
vertex(x+65,y-105);
vertex(x+82,y-61);
vertex(x+34,y-23);
endShape(CLOSE);

quad (x+70,y-51,x+58,y-70,x+53,y-67,x+64,y-47);
quad (x+82,y-77,x+100,y-90,x+95,y-95,x+80,y-84);
quad (x+47,y-25,x+100,y-50,x+95,y-54,x+50,y-29);
quad (x+60,y-31,x+79,y-13,x+82,y-22,x+65,y-34);

//shell
stroke (20);
strokeWeight (4);
fill(250,0,80,60);
for (int r = 220; r>=10 ; r-=30) {
  ellipse (x+148, y+82, r, r);
}
}


