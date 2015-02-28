
size(250,250);
background(#1960F5);smooth();
 
noStroke();
fill(#09ADD8,90);
quad(110,70,80,130,220,230,70,80);
 
noStroke();
fill(#09ADD8,90);
quad(110,80,80,140,230,240,70,90);
 
noStroke();
fill(#09ADD8,90);
quad(110,100,80,160,220,260,70,110);
 
noStroke();
fill(#09ADD8,90);
quad(110,70,80,130,220,230,70,80);
 
translate(160,50);
rotate(90);
fill(#09ADD8,90);
quad(110,70,80,130,220,230,70,80);
 
translate(10,10);
rotate(100);
fill(#09ADD8,110);
quad(80,40,50,100,190,200,40,50);
 
translate(0,0);
rotate(0);
fill(#09ADD8,110);
quad(80,40,50,100,190,200,40,50);
 
translate(0,0);
rotate(0);
fill(#09ADD8,110);
quad(80,40,50,100,190,200,40,50);
 
translate(0,0);
rotate(0);
fill(#09ADD8,90);
quad(110,80,80,140,220,240,70,90);
 
translate(0,0);
rotate(0);
fill(#09ADD8,110);
quad(80,40,50,100,190,200,40,50);
 
translate(0,0);
rotate(0);
fill(#09ADD8,110);
quad(80,40,50,100,190,200,40,50);
 
translate(0,0);
rotate(0);
fill(#09ADD8,110);
quad(80,40,50,100,190,200,40,50);
 
translate(0,0);
rotate(0);
fill(#09ADD8,110);
quad(80,40,50,100,190,200,40,50);
 
translate(0,0);
rotate(0);
fill(#09ADD8,110);
quad(80,40,50,100,190,200,40,50);
 
fill(#09ADD8,90);
quad(110,90,80,150,220,250,70,100);
 
translate(50,170);
rotate(180);
fill(#09ADD8,90);
quad(110,70,80,130,220,230,70,80);
 
fill(#09ADD8,110);
quad(80,40,50,100,190,200,40,50);
 
translate(0,0);
rotate(0);
fill(#09ADD8,90);
quad(120,70,90,130,230,230,80,80);
 
for(int bob=0; bob<200;bob=bob+5){
  stroke(bob+5, bob-50,50,bob+50);
  strokeWeight(2);
line(60,60,bob,10);
line(60,60,bob,25);
line(60,60,bob,50);
line(60,60,bob,75);
line(60,60,bob,1);
line(60,60,bob,105);
line(60,60,bob,150);
}
save("ey_rough.png");
