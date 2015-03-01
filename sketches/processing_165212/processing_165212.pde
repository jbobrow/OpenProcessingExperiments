
  void setup() {
    size(255,255);
  smooth();
ellipseMode(CENTER);
  }
   
  void draw () {
 
background(255);


//fill(74,181,179);
fill(mouseX-60,mouseY-80,mouseX-100);
if(mousePressed) ellipse(mouseX+30,mouseY,1000,1000);
fill(mouseX,mouseY,mouseX-150);
if(mousePressed) ellipse(mouseX+30,mouseY,200,200);
fill(mouseX-80,mouseY-60,mouseX-150);
if(mousePressed) ellipse(mouseX+30,mouseY,150,150);
fill(mouseX-100,mouseY-100,mouseX-50);
if(mousePressed) ellipse(mouseX+30,mouseY,100,100);



 fill(200);
 noStroke();
ellipse (mouseX,mouseY,60,60);
fill(200);
noStroke();
ellipse (mouseX+60,mouseY,60,60);
fill(150);
ellipse (mouseX+15,mouseY,30,30);
fill(150);
ellipse (mouseX+45,mouseY,30,30);



//dot(mouseX+50,mouseY+50);
//ellipse(



}

