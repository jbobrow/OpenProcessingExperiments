

void setup(){
size(600, 600);
background(0);
}


void draw() {
  background(0);
  
  if(mousePressed == true) {
    strokeWeight(15);
  stroke(255,100);
line(width/2,height/2,mouseX,mouseY);
 strokeWeight(20);
 stroke(255,70);
line(width/2,height/2,mouseX,mouseY);
 strokeWeight(40);
 stroke(255,50);
line(width/2,height/2,mouseX,mouseY);
    
 strokeWeight(10);
  stroke(221,128,255,150);
line(width/2,height/2,mouseX+10,mouseY+10);
  stroke(175,229,249,150);
line(width/2,height/2,mouseX-10,mouseY-10);
  stroke(176,247,206,150);
line(width/2,height/2,mouseX-10,mouseY+10);
  stroke(175,229,249,150);
line(width/2,height/2,mouseX+10,mouseY-10);

 strokeWeight(15);
stroke(221,128,255,50);
line(width/2,height/2,mouseX+30,mouseY+30);
  stroke(175,229,249,50);
line(width/2,height/2,mouseX-30,mouseY-30);
  stroke(176,247,206,50);
line(width/2,height/2,mouseX-30,mouseY+30);
  stroke(175,229,249,50);
line(width/2,height/2,mouseX+30,mouseY-30);

 strokeWeight(17);
 stroke(175,229,249,20);
line(width/2,height/2,mouseX+40,mouseY+40);
 stroke(221,128,255,20);
line(width/2,height/2,mouseX-40,mouseY-40);
  stroke(175,229,249,20); 
line(width/2,height/2,mouseX-40,mouseY+40);
 stroke(176,247,206,20);
line(width/2,height/2,mouseX+40,mouseY-40);
 
  strokeWeight(12);
  stroke(175,229,249,70);
line(width/2,height/2,mouseX+20,mouseY+20);
 stroke(221,128,255,70);
line(width/2,height/2,mouseX-20,mouseY-20);
  stroke(175,229,249,70); 
line(width/2,height/2,mouseX-20,mouseY+20);
 stroke(176,247,206,70);
line(width/2,height/2,mouseX+20,mouseY-20);
 
} else {
strokeWeight(6);
  stroke(221,128,255,150);
line(width/2,height/2,mouseY,mouseX);
  stroke(175,229,249,150);
line(width/2,height/2,mouseY*2,mouseX/2);
  stroke(176,247,206,150);
line(width/2,height/2,mouseX,mouseY*2);
  stroke(175,229,249,150);
line(width/2,height/2,mouseX*2,mouseY*2);

  stroke(221,128,255,50);
line(width/2,height/2,mouseY*2,mouseX);
  stroke(175,229,249,50);
line(width/2,height/2,mouseY*3,mouseX/3);
  stroke(176,247,206,50);
line(width/2,height/2,mouseX,mouseY*3);
  stroke(175,229,249,50);
line(width/2,height/2,mouseX*3,mouseY*3);

 stroke(175,229,249,20);
line(width/2,height/2,mouseY-100,mouseX);
 stroke(221,128,255,20);
line(width/2,height/2,mouseY-100,mouseX+100);
  stroke(175,229,249,20); 
line(width/2,height/2,mouseX,mouseY-100);
 stroke(176,247,206,20);
line(width/2,height/2,mouseX-100,mouseY-100);
  
   stroke(175,229,249,70);
line(width/2,height/2,mouseY-50,mouseX);
 stroke(221,128,255,70);
line(width/2,height/2,mouseY,mouseX+50);
  stroke(175,229,249,70); 
line(width/2,height/2,mouseX,mouseY-50);
 stroke(176,247,206,70);
line(width/2,height/2,mouseX-50,mouseY);
}

  
}






