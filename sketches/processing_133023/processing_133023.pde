
void setup(){
  size(500,500);
}
  void draw(){
     if(mousePressed && (mouseButton == RIGHT)){fill(255,255,255);}
     else if(mousePressed && (mouseButton == LEFT)){fill(0,15,0);}
   background(mouseX/2,mouseY/2,mouseY/2);
  noStroke();
fill(0);
rectMode(CENTER);
fill(random(mouseX,500),random(mouseY,300),random(500));
rect(mouseX,random(mouseY-50,mouseY+50),1500,random(5,30));
translate(width/2,height/2);
rectMode(CENTER);
fill(random(mouseX,500),random(mouseY,300),random(500));
rect(mouseX,random(mouseY-50,mouseY+50),1500,random(5,30));
translate(width/2,height/2);
rotate(PI/3);
rect(mouseX,random(mouseY-50,mouseY+50),3000
,random(5,30));
rotate(PI/3);
rect(mouseX,random(mouseY,mouseY+100),3000
,random(5,30));
}




