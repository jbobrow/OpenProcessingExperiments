

void setup() {  
  size(500,400);
  background (250);
  counter = 0;
}

void draw() {  

if(mousePressed == true) 
float angle = map(mouseX, 0, width, 0, TWO_PI);
translate(200, 200);
rotate(angle);
strokeWeight(3);
line(0, 0, 80, 0);


 fill(130,191,146);
 ellipse(90, 200, 20, 20);
 fill(77,163,100)
 ellipse(150,110,60,60);
 fill(108,235,131);
 ellipse(130,300,40,40);
 fill(242,153,58);
 ellipse(40,160,50,50); 
 fill(237,186,90);
 ellipse(90,80,35,35);
 fill(214,212,111);
 ellipse(100,260,40,40);
 
 }
 

 
 
