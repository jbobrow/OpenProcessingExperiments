
color c;
void setup() {  //setup function called initially, only once
   
  size(900,900);
  noStroke();
   c=color(255,0,0);
  }
     
void draw() {  //draw function loops
background(3,46,57);

fill(0,0,0);
ellipse(150,150,160,160);
fill(188,187,186);
   ellipse(150,150,100,100);
  rect(100,150,100,200);
 fill(162,30,32);
 ellipse(130+mouseX/100,126+mouseY/50,30,30);
 ellipse(170+mouseX/100,126+mouseY/50,30,30)
rect(200+mouseY/50,170+mouseY/50,30,80);
 rect(70+mouseY/50,170+mouseY/50,30,80);
 fill(252,265,255);
   fill(188,187,186);
 triangle(100,250,150,250,125,300);
  triangle(150,150,100,250,175,300);
   
  fill(0,0,0);
 ellipse(750,150,160,160);
fill(188,187,186);
   ellipse(750,150,100,100);
  rect(700,150,100,200);
 fill(162,30,32);
 ellipse(770+mouseX/100,126+mouseY/50,30,30);
 ellipse(730+mouseX/100,126+mouseY/50,30,30)
rect(670+mouseY/50,170+mouseY/50,30,80);
 rect(800+mouseY/50,170+mouseY/50,30,80);
 fill(252,265,255);
   fill(188,187,186);
   
  fill(0,0,0);
ellipse(750,650,160,160);
fill(188,187,186);
   ellipse(750,650,100,100);
  rect(700,650,100,200);
 fill(162,30,32);
 ellipse(770+mouseX/100,634+mouseY/50,30,30);
 ellipse(730+mouseX/100,634+mouseY/50,30,30)
rect(670+mouseY/50,670+mouseY/50,30,80);
 rect(800+mouseY/50,670+mouseY/50,30,80);
 fill(252,265,255);
   fill(188,187,186);
   
  fill(0,0,0);
ellipse(150,650,160,160);
fill(188,187,186);
   ellipse(150,650,100,100);
  rect(100,650,100,200);
 fill(162,30,32);
 ellipse(130+mouseX/100,634+mouseY/50,30,30);
 ellipse(170+mouseX/100,634+mouseY/50,30,30)
rect(200+mouseY/50,670+mouseY/50,30,80);
 rect(70+mouseY/50,670+mouseY/50,30,80);
 fill(252,265,255);
   fill(188,187,186);
    
fill(0,0,0);
    rect(446,1,10,50);
    ellipse(450,70,100,100);
    
    fill(c);
    rect(446,70,10,10);
    rect(446,40,10,10);
    rect(446,100,10,10);
   rect(406,70,10,10);
   rect(486,70,10,10);
    
   rect(466,85,10,10);
   rect(426,55,10,10);
   rect(466,55,10,10);
   rect(426,85,10,10);
    
  fill(c);
 rect(80+mouseX/1,80+mouseY/1,10,10);
  
  }
  void mousePressed(){
  c=color(random(255),random(255),random(255));

  fill(random(255),random(255),random(255),150);
  noStroke(); 
  triangle(mouseX,mouseY, random(300,450), random(300,450),random(300,450), random(300,450));
  
  
  }
