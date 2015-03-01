
//make a face

void setup(){
size(640,480);
smooth();
background(255);
}

void draw(){
background(255); //white

//EYES 
//testing mousepressed conditional

if (mousePressed == true){
  ellipse(200,212,10,10);
  fill(0,255,0);
}
  
fill(0,0,0);
ellipse(200,212,30,mouseY/4);

fill(0,0,0);
ellipse(430,212,30,mouseY/4);

//ACTUAL FACE
strokeWeight(5);
stroke(0,0,0);
noFill();
if(mouseX<400){
ellipse(width/2,height/2,420,420);
}
else if (mouseX>400){
  ellipse(width/2,height/2,mouseX,mouseY);
}
else if(mouseX<200){
  ellipse(width/2,height/2,mouseX,mouseY);
}


//NOSE
strokeWeight(5);
stroke(0,0,0);
if (mouseY<300) {
line(316,193,316,mouseY);
}
else if (mouseY>300){
  line(316,193,316,263);
}
else if (mouseY<200){
  line(316,193,316,263);
}
strokeWeight(5);
noFill();
stroke(0,0,0);
strokeWeight(5);
stroke(0,0,0);
line(160,174,238,174);

strokeWeight(5);
stroke(0,0,0);
line(394,174,472,174);

  
//mouth, changing width

  ellipse(width/2,height/2+100,mouseX/2,69);
}







