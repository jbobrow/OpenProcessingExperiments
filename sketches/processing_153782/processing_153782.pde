
void setup() {
  background(0);
  size(600,600);
  noStroke();
  fill(255,0,0,random(70,130));
  rect(0,random(100,300),600,100);
  rect(100,0,200,500);
  fill(0,2,220,90);
  ellipse(200,random(300,400),400,400);
  fill(225,10,0,160);
  triangle(random(200,90),500,300,random(70,100),random(390,500),450);

  noFill();
  stroke(random(90,255));
  rect(random(300,400),random(0,100),random(100,250),300);
  fill(500,100,400,100);
  arc(500,random(200,400),random(500,600),700,1,6);
  stroke(200);
  line(300,0,random(0,100),400);
  line(100,0,500,600);
  line(random(0,80),0,300,600);
  line(600,random(5,200),20,600);
  noStroke();
  quad(random(5,90),10,200,300,500,40,50,random(400,600));}
  
  


