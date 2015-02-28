


void setup () {
  size (700,700);
  background (255,252,214,1);
  smooth();
}


int cs = 70;
float speedLine;

void draw () {
  speedLine = abs (mouseX-pmouseX);
  println (speedLine);
  //frameRate (10);
  noStroke();
  smooth();
  
  if (keyPressed) {
    
    if (key=='1') cs = 10;
    if (key=='2') {cs = 20;
                  ellipse(mouseX+random(-20,20),mouseY+random(-20,20), mouseX-pmouseX,mouseX-pmouseX);}
    if (key=='3') {fill (255,136,8,190);
                    noStroke();
                    rect (mouseX+random(5,-40),mouseY+random(5), mouseX-pmouseX,mouseX-pmouseX);}
      
    if (key=='4') {fill(random(247),random(112),random(7));
                   noStroke();
                  ellipse(mouseX,mouseY,random(-40,cs),random(50,cs));}
    if (key=='5') {stroke(30);
                  line(mouseX,mouseY,pmouseX,pmouseY);
                  fill (0,random(255),random(255),150);
                  ellipse(mouseX,mouseY,20,20);}
    if (key=='6') filter (BLUR,1);    
    if (key=='7') filter (GRAY);


 stroke (30,100,10);
  //fill (0,random(255),random(255),80);
  fill (150+random(0,100), random(0,21), random(0,21));
  //line(random(mouseX),random(mouseY),mouseX+random(-40,30),mouseY+random(-50));
  noStroke();
  ellipse (mouseX,mouseY,random(cs,20),random(-40,cs));
}
  
  
  
  if (mousePressed) {
    
    //strokeWeight(0.1+speedLine/20);
    stroke(0, 50);
    strokeWeight(0.1+speedLine/20);
    //line(mouseX, mouseY, width, mouseX);
    //line(mouseX, mouseY, 0, mouseX);
    stroke(0);
    strokeWeight(0.5+speedLine/20);
    line(pmouseX, pmouseY, mouseX, mouseY);}
  
    
   // stroke(30);
   // line(mouseX,mouseY,pmouseX,pmouseY);
   // fill(random(255),random(255),0,90);
   // ellipse(mouseX,mouseY,20,20);
  

  
}

