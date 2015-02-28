
float x = 0;
float y = 0;

void setup(){
  size(500,500);
  background(0);

}

void draw(){
  background(255);

  if (mousePressed) {
       background (0);

    pushMatrix();
fill(225);
translate(width/2,height/2);
rotate(radians(second()*600-900));
rect(0,0-2.5,100,4);
popMatrix();

    pushMatrix();
fill(225);
translate(width/2,height/2);
rotate(radians(second()*500-400));
rect(0,0-2.5,70,4);
popMatrix();

pushMatrix();
stroke(255,0,0);
strokeWeight(4);
line(250,250,mouseX,mouseY);
popMatrix();
  
pushMatrix();
     noStroke();
translate(width/2,height/2);
fill(255);
for(int i=0; i<60; i++){
  rotate(radians(360/60));
rect(125,0,mouseY,1);}
popMatrix();

pushMatrix();
translate(width/2,height/2);
fill(255);
for(int i=0; i<12; i++){
  rotate(radians(360/12));
rect(mouseX,0,20,5);}
popMatrix();


fill(255,0,0);
noStroke();
ellipse(width/2,height/2,20,20);
  }
  
  
  else {
   
  background (255);
  
  fill(105,105,105);
  rect(180,420,140,45,7);
 
  String s = "Crazy Button";
  fill(255);
  text(s,190,450);
  textSize(20);
  
pushMatrix();
translate(width/2,height/2);
fill(0);
for(int i=0; i<12; i++){
  rotate(radians(360/12));
rect(120,0,20,5);
}
popMatrix();
pushMatrix();
translate(width/2,height/2);
fill(0);
for(int i=0; i<60; i++){
  rotate(radians(360/60));
rect(125,0,13,1);
}
popMatrix();

noFill();
stroke(0);
ellipse(width/2,height/2,300,300);

pushMatrix();
fill(255,0,0);
noStroke();
translate(width/2,height/2);
rotate(radians(second()*6-90));
rect(0,0-2.5,100,2);
popMatrix();

pushMatrix();
fill(0);
translate(width/2,height/2);
rotate(radians(minute()*6-90));
rect(0,0-2.5,100,4);
popMatrix();

pushMatrix();
fill(0);
translate(width/2,height/2);
rotate(radians(hour()*30-90));
rect(0,0-2.5,70,4);
popMatrix();

fill(255,0,0);
noStroke();
ellipse(width/2,height/2,20,20);
  }
}


