
int value = 50;
void setup(){
  size(500,500);
colorMode(RGB);
noStroke();
background(20,20,50);
}
  
void draw(){
  noStroke();
  {
  fill(40,random(200),random(140));
  rect(110,random(500),50,50);
  fill(200,random(100),random(100));
  ellipse(200,random(500),20,20);
   fill(random(200),random(100),220);
  ellipse(270,random(500),20,20);
  fill(random(200),random(100),20);
  ellipse(290,random(500),20,20);
  fill(random(200),random(200),120);
  ellipse(320,random(500),50,50);
  fill(random(250),225,random(250));
   ellipse(240,random(500),40,40);
    fill(random(250),random(225),random(250));
   ellipse(80,random(500),40,40);
   fill(random(250),225,random(250));
  rect(420,random(500),40,40);
  fill(value+random(20));
  rect(random(500),350,30,30);
  fill(value+random(20));
  rect(random(500),300,30,30);
   fill(value+random(20));
  rect(random(500),200,50,50);
  fill(value+random(20));
  rect(random(500),70,20,20);
  
  
  
  }
   
}

