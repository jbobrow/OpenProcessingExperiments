
void setup(){
  size(410,300);
  background(#00BFFF);
}
void draw(){
  noStroke();
  
  fill(#A4A4A4); //cabeza!
  rect(30,10,350,280);
  rect(10,40,390,220);
  stroke(0);
  line(30,10,380,10);
  line(30,290,380,290);
  line(10,40,10,260);
  line(400,40,400,260);
  line(30,10,30,40);
  line(10,40,30,40);
  line(380,10,380,40);
  line(380,40,400,40);
  line(380,260,380,290);
  line(380,260,400,260);
  line(10,260,30,260);
  line(30,260,30,290);
  
  fill(#FFBF00); //pico!
  ellipse(210,200,160,50);
  
  noStroke();
  fill(0); //hojo!(parte negra) 1
  rect(100,90,70,20);
  rect(110,80,20,40);
  rect(140,80,20,40);
  rect(120,120,30,10);
  rect(130,130,10,10);
  fill(#FF0000);//parte roja!
  rect(110,90,20,20);
  rect(140,90,20,20);
  rect(120,100,30,20);
  rect(130,120,10,10);
  
  fill(0); //hojo!(parte negra) 2
  rect(250,90,70,20);
  rect(260,80,20,40);
  rect(290,80,20,40);
  rect(270,120,30,10);
  rect(280,130,10,10);
  fill(#FF0000);//parte roja!
  rect(260,90,20,20);
  rect(290,90,20,20);
  rect(270,100,30,20);
  rect(280,120,10,10);
  
}


