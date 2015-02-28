
    float ecken=10;
  
  void setup() {
    size(500,500);
  smooth();
ellipseMode(CENTER);
  }
  
  void draw () {

background(255);


if (mousePressed){
ecken = ecken+1.5;
translate (random(10,20),random(10,20));
  }



fill(255);
ellipse (mouseX,mouseY,60,60);
fill(255);
ellipse (mouseX+60,mouseY,60,60);

fill(255);
ellipse (mouseX,mouseY,random(10,15),random(10,15));
fill(255);
ellipse (mouseX+60,mouseY,random(10,15),random(10,15));







fill(0);
if(mousePressed) ellipse (mouseX,mouseY,random(100+ecken,120+ecken),random(100+ecken,120+ecken))  ;
fill(0);
if(mousePressed)  ellipse (mouseX+60,mouseY,random(100+ecken,120+ecken),random(100+ecken,120+ecken));
fill(255);
if(mousePressed) ellipse (mouseX,mouseY,random(40,50),random(40,50))  ;
fill(255);
if(mousePressed)  ellipse (mouseX+60,mouseY,random(40,50),random(40,50))  ;



// Augen still
fill(0);

ellipse (mouseX,mouseY,30,30);
ellipse (mouseX+60,mouseY,30,30);
   
   
   //Mund
   fill(255);
if(mousePressed)  ellipse (mouseX+30,mouseY+60,5+ecken/6,10+ecken/6);
}


