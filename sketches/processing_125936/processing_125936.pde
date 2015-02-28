
void setup() {
  size(450,480);
  background(150,216,240);
  
  PFont font1;
  font1=loadFont("CenturyGothic-30.vlw");
  textFont(font1,30);       
  textAlign(CENTER);
  text("Touch my nose and find me!",225,450);
   }

void draw() {
  
  stroke(0,0,0);
  fill(164,147,247);
  ellipse(65,65,100,100);
  
  stroke(0,0,0);
  fill(127,237,196);
  ellipse(190,175,100,100);
  
  stroke(0,0,0);
  fill(240,109,124);
  ellipse(60,280,100,100);
  
  stroke(0,0,0);
  fill(245,203,226);
  ellipse(325,80,100,100);
  
  fill(0,0,0);
  ellipse(325,100,2,2);

  fill(255,255,255);
  stroke(0,0,0);
  ellipse(35,60,30,40);

  fill(255,255,255);
  stroke(0,0,0);
  ellipse(95,60,30,40);

  fill(0,0,0);
  stroke(0,0,0);
  ellipse(165,180,40,50);
  
  fill(0,0,0);
  stroke(0,0,0);
  ellipse(215,180,40,50);
  
  stroke(0,0,0);
  line(55,300,60,305);
  line(60,305,65,300);
  
  stroke(0,0,0);
  line(285,65,315,90);
  
  stroke(0,0,0);
  line(285,90,315,65);
  
  stroke(0,0,0);
  line(335,90,365,65);
  
  stroke(0,0,0);
  line(335,65,365,90);
  
  stroke(0,0,0);
  line(20,270,50,270);
  line(70,270,100,270);
  
  fill(0,0,0);
  ellipse(60,285,2,2);
  
  fill(0,0,0);
  ellipse(190,200,2,2);
  
  fill(0,0,0);
  ellipse(65,90,2,2);
  
  if(mouseX==325 && mouseY==100){
  fill(221,59,165);
  stroke(0,0,0);
  rect(300,130,50,80);

  stroke(0,0,0);
  line(270,170,300,130);
  line(350,130,380,170);
  line(300,210,300,250);
  line(350,210,350,250);
 
  fill(255,255,255);
  rect(0,250,450,480);
  
   PFont font1;
  font1=loadFont("CenturyGothic-Italic-60.vlw");
  textFont(font1,60);       
  fill(0,0,0);
  text("well done!",275,390);
  }
  }



