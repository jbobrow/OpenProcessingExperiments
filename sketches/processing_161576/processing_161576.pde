
void setup(){
  size(700,500);
  background(255);
 smooth();
  frameRate(20);
}

 
void draw()
{
 float r = random(6,30);
 int switchNum = (int) random(1,17); // decides which of the if statements to chose
 if (mousePressed)
 {
 stroke(0);
 strokeWeight(random(.5,5.5));
strokeCap(ROUND);
  line(mouseX,mouseY,pmouseX,pmouseY); 
  noStroke();
fill(255,0,0);
  //ellipse(mouseX,mouseY,r,r); 
  fill(random(20,180),random(55,230),random(50,240));
  // ellipse(pmouseX,pmouseY,r,r);
  if (switchNum == 1){ellipse(mouseX-20,mouseY-20,r,r);}
  else if (switchNum == 2){ellipse(mouseX+20,mouseY,r,r);}
  else if (switchNum == 3){ellipse(mouseX-10,mouseY+20,r,r);}
  else if (switchNum == 4){ellipse(mouseX,mouseY-5,r,r);}
  else if (switchNum == 5){ellipse(mouseX-5,mouseY+12,r,r);}
  else if (switchNum == 6){ellipse(mouseX-25,mouseY+5,r,r);}
  else if (switchNum == 7){ellipse(mouseX-20,mouseY-12,r,r);}
  else if (switchNum == 8){ellipse(mouseX+30,mouseY+12,r,r);}
  else if (switchNum == 9){ellipse(mouseX+15,mouseY+30,r,r);}
  else if (switchNum == 10){ellipse(mouseX,mouseY+15,r,r);}
  else if (switchNum == 11){ellipse(mouseX-3,mouseY-17,r,r);}
  else if (switchNum == 12){ellipse(mouseX+7,mouseY-27,r,r);}
  else if (switchNum == 13){ellipse(mouseX+25,mouseY-19,r,r);}
  else if (switchNum == 14){ellipse(mouseX-30,mouseY+12,r,r);}
  else if (switchNum == 15){ellipse(mouseX+35,mouseY,r,r);}
  else if (switchNum == 16){ellipse(mouseX-5,mouseY+32,r,r);}
  else if (switchNum == 17){ellipse(mouseX+5,mouseY-40,r,r);}
  
 /* switch (1)
 {
   case '1': ellipse(mouseX-20,mouseY-20,r,r);
   case '2': ellipse(mouseX+20,mouseY,r,r);
   case '3': ellipse(mouseX-10,mouseY+20,r,r);
   case '4': ellipse(mouseX,mouseY-5,r,r);
   case '5': ellipse(mouseX-5,mouseY+12,r,r);
 } */
   
 }
 
}
 
 
 
void keyPressed(){
   if(key=='s'){
      saveImage();
 }
   if(key=='z'){
  background(255);
}
   if(key=='b'){
filter(BLUR);
}
}
   
 void saveImage() {
  String fileName = timeStamp()+".tiff";
  PImage imageSave = get(0,0,width,height);
  imageSave.save(fileName);
}
 
String timeStamp() {
 String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+millis();
 return timestamp;
}

