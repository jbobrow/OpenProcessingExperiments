
void setup(){
size(800,800);
}
void draw(){
background(255);
ellipseMode(CENTER);
//this function is for mouse press

if(mousePressed) {
  fill(32,132,232);
}else{
  fill(255);
}
  noStroke();
   //body
     ellipse(mouseX,mouseY+200,200,250);
      //head
  ellipse(mouseX,mouseY,220,220);
  //symbol
  rect(mouseX-53,mouseY+135,100,125);
  if(mousePressed) {
  fill(32,12,232);
}else{
  fill(255);
}
  noStroke();
  //left arm
  ellipse(mouseX-100,mouseY+145,100,80);
  //right arm
  ellipse(mouseX+100,mouseY+145,100,80);
  //left leg
  ellipse(mouseX-100,mouseY+300,70,100);
  //right leg
  ellipse(mouseX+100,mouseY+300,70,100);
    //left ear
  ellipse(mouseX+-100,mouseY-100,90,90);
  //right ear
  ellipse(mouseX+100,mouseY-100,90,90);
 
  
  if(mousePressed) {
  fill(255);
}
  //right eye
    ellipse(mouseX+47,mouseY-40,25,50);
  //left eye
  ellipse(mouseX-47,mouseY-40,25,50);
  stroke(255);
 fill(255);
  strokeWeight(7.5);
    rect(mouseX-30,mouseY+135,60,100);
       //nose
     noFill();
     stroke(255);
     strokeWeight(2);
  ellipse(mouseX,mouseY+25,50,29);
  fill(255);
  ellipse(mouseX-110,mouseY-130,35,35);
    ellipse(mouseX-100,mouseY-100,25,25);
    ellipse(mouseX+100,mouseY-100,25,25);
    if(mousePressed) {
     fill(232,132,32);
    }else{
      fill(255);
    }
      rect(mouseX-15,mouseY+145,30,80);
 line(mouseX-200, mouseY+200, mouseX-20, mouseY-200);


}


