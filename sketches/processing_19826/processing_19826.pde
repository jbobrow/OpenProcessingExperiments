
float angle=0.1;// variable for angle
PFont font;
 
void setup(){
  size(250,250);
  smooth();
  background(255);

}
 
void draw(){
   frameRate(99);
  fill(255,20);
  rect(0,0,height,width);
   
  angle=angle+1;
     translate(20,120); //offset
     rotate(angle-2); //rotate as angle-8 value
  fill(50,100,200,225);
 textSize(21);
 strokeWeight(0.7);
text("N6G4N5",20,60);
   fill(50,mouseY,mouseX,80);// mean postal code move with your mouse
   
 
  textSize(17);
  strokeWeight(2);
  text("N",random(250),random(200));
  text("6",random(225),random(150));
  text("G",random(200),random(100));
  text("4",random(100),random(120));
  text("N",random(150),random(260));
  text("5",random(50),random(300));
//small flash letters
  
}


