

void setup(){
  size(1100,600);
  smooth();
   //background(255);
   frameRate( 50);
}

void draw(){
  background(150);  
  stroke(0);
  strokeWeight( 35);
   line(mouseX/20+260,280,mouseX+ random(180),mouseY + random(180));
   
   stroke(0);
  strokeWeight( 18);
   line(mouseX/20+250,290,mouseX/40+230,140);
   
   //111
   stroke(0);
  strokeWeight( 18);
   line(mouseX/20+213,290,mouseX/40+120,170);
   
   
   stroke(0);
  strokeWeight( 18);
   line(mouseX/40+230,140,mouseX/40+120,170);
   //feet
   stroke(0);
  strokeWeight( 35);
   line(mouseX/20+220,310,210,460);
   
   stroke(0);
  strokeWeight( 18);
   line(mouseX/20+250,290,mouseX/20+213,300);
   
   //hands1
stroke(0);
strokeWeight( 18);
line(mouseX/40+120,170,mouseX/20+50,160);

stroke(0);
strokeWeight( 18);
line(mouseX/20+50,160,mouseX/40+60,80);

//hands2
   stroke(0);
  strokeWeight( 18);
   line(mouseX/40+230,140,mouseX/20+310,170);
   
  stroke(0);
  strokeWeight( 18);
   line(mouseX/20+310,170,mouseX/10+360,100);
   
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX/40+190,80,100,100);
  
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX/40+60,80,40,40);
  
  noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX/10+360,100,40,40);
  
//man2 , head
  noStroke();
  fill(mouseX/10,0,0);
  ellipseMode(CENTER);
  ellipse( 750 + random(mouseX/30) + mouseX/30,80 + random(mouseX/30),110,110);
//---
  stroke(mouseX/10,0,0);
  strokeWeight( 18);
  line(700 + random(mouseX/30) + mouseX/30,150,790 + random(mouseX/30) + mouseX/30,170);
  //  /
  stroke(mouseX/10,0,0);
  strokeWeight( 18);
  line(700 + random(mouseX/30) + mouseX/30,150,680 + random(mouseX/30),300);
  
  stroke(mouseX/10,0,0);
  strokeWeight( 18);
  line(700 + random(mouseX/30) + mouseX/30,150,620 + random(mouseX/30),250);
  
  //  /2
  stroke(mouseX/10,0,0);
  strokeWeight( 18);
  line(790 + random(mouseX/30) + mouseX/30,170,720 + random(mouseX/30),310);
  
  stroke(mouseX/10,0,0);
  strokeWeight( 18);
  line(790 + random(mouseX/30) + mouseX/30,170,800 + random(mouseX/30),310);
// ---down
  stroke(mouseX/10,0,0);
  strokeWeight( 18);
  line(680 + random(mouseX/30),300,720 + random(mouseX/30),310);
  
  stroke(mouseX/10,0,0);
  strokeWeight( 28);
  line(680 + random(mouseX/30),300,700 + random(mouseX/30),420);
  
  stroke(mouseX/10,0,0);
  strokeWeight( 28);
  line(720 + random(mouseX/30),310,760 + random(mouseX/30),450);

//eyes,left
   noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse( 730 + random(mouseX/40) + mouseX/30,60 + random(mouseX/40) + mouseX/80,20,30);

 stroke(150);
  strokeWeight( 3);
  line(730,60,730 + random(mouseX/40) + mouseX/30,60 + random(mouseX/40) + mouseX/80);

 stroke(mouseX/10,0,0);
  fill(255);
  ellipseMode(CENTER);
  ellipse( 730 + random(mouseX/60),60 + random(mouseX/60),20,30);
  
  noStroke();
  fill(mouseX/10,0,0);
  ellipseMode(CENTER);
  ellipse( 727 + random(mouseX/60),62 + random(mouseX/60),10,20);
//eyes,right
   noStroke();
  fill(0);
  ellipseMode(CENTER);
  ellipse( 770 + random(mouseX/40) + mouseX/30,60 + random(mouseX/40) + mouseX/80,20,30);

 stroke(150);
  strokeWeight( 3);
  line(770,60,770 + random(mouseX/40) + mouseX/30,60 + random(mouseX/40) + mouseX/80);

 stroke(mouseX/10,0,0);
  fill(255);
  ellipseMode(CENTER);
  ellipse( 770 + random(mouseX/60),60 + random(mouseX/60),20,30);
  
  noStroke();
  fill(mouseX/10,0,0);
  ellipseMode(CENTER);
  ellipse( 767 + random(mouseX/60),62 + random(mouseX/60),10,20);



}

