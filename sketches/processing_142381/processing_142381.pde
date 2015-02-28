
void setup() {
  size(500, 500);
  background(0, 0, 100);
}
 
void draw() {
  background(0, 0, 100);
stroke(1);
  fill(250, 0, 0);
  ellipse(450, 345, 80, 40);
  ellipse(450, 345, 40, 40);
  ellipse(375, 325, 40, 40);
  ellipse(340, 330, 40, 40);
  ellipse(270, 405, 20, 20);
  ellipse(275, 395, 30, 30);
  ellipse(285, 385, 40, 40);
  ellipse(300, 375, 50, 50);
  ellipse(400, 350, 100, 75);
  ellipse(330, 360, 80, 75);
  ellipse(380, 440, 150, 150);
    ellipse(390, 480, 200, 200);
  ellipse(400, 500, 250, 200);
  ellipse(400, 500, 250, 150);
  ellipse(400, 500, 250, 100);
  line(410, 500, 375, 365);
  line(360, 500, 360, 368);
  line(300, 500, 340, 376);
  line(500, 500, 390, 365);
  stroke(200);
  if(mousePressed){
    if(mouseX < 200){
  line(370, 360, random(0, 300), 0);
  line(370, 360, random(0, 300), 0);
  line(370, 360, random(0, 300), 0);
  line(370, 360, random(0, 300), 0);
  line(370, 360, random(0, 300), 0);
  line(370, 360, random(0, 300), 0);
  line(370, 360, random(0, 300), 0);
  line(370, 360, random(0, 300), 0);
  
    }
   if(mouseX > 200){
  line(370, 360, random(200, 450), 0);
  line(370, 360, random(200, 450), 0);
  line(370, 360, random(200, 450), 0);
  line(370, 360, random(200, 450), 0);
  line(370, 360, random(200, 450), 0);
  line(370, 360, random(200, 450), 0);
  line(370, 360, random(200, 450), 0);
  line(370, 360, random(200, 450), 0);
    }
      if(mouseY > 200){
  line(370, 360, 0, random(0, 200));  
  line(370, 360, 0, random(0, 200));
  line(370, 360, 0, random(0, 200));
  line(370, 360, 0, random(0, 200));
  line(370, 360, 0, random(0, 200));
  line(370, 360, 0, random(0, 200));
  line(370, 360, 0, random(0, 200));
  line(370, 360, 0, random(0, 200));
  
    }
    }
  
}
