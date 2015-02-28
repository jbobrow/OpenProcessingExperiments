
//Assignment 3E - Fibonacci Grid
size(400,400);
background(48,128,20);
int x = 10;
 
stroke(139,39,19,230);
strokeWeight(12);
line(5,x*34,395,x*34);

stroke(156,102,31,220);
strokeWeight(10);
line(5,x*21,395,x*21);
 
stroke(139,90,0);
strokeWeight(5);
line(5,x*13,395,x*13);

stroke(139,101,8);
strokeWeight(3);
line(5,x*8,395,x*8);

stroke(139,105,20);
strokeWeight(2);
line(5,x*5,395,x*5);
 
stroke(184,134,11);
strokeWeight(1);
line(x,5,x,395);
line(x*2,5,x*2,395);
line(x*3,5,x*3,395);
line(5,x,395,x);
line(5,x*2,395,x*2);
line(5,x*3,395,x*3);
 
stroke(139,105,20);
strokeWeight(2);
line(x*5,5,x*5,395);
 
stroke(139,101,8);
strokeWeight(3);
line(x*8,5,x*8,395);

stroke(139,90,0);
strokeWeight(5);
line(x*13,5,x*13,395);

stroke(156,102,31,220);
strokeWeight(10);
line(x*21,5,x*21,395);
 
stroke(139,39,19,230);
strokeWeight(12);
line(x*34,5,x*34,395);
