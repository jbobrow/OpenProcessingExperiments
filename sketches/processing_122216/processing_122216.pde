
int modi = 1;
float x = 0;
float y;

void setup () {
size(1280, 720);
  background(#ffb400);
  frameRate(25);
String s = "1=Sun 2=Clouds 3=Beach 4=Ocean 5=Experimental s= Save";
fill(50);
text(s,1170, 625, 95, 90);

}
void draw () {
  if (mousePressed) {

    //println(modi);
    
  if (modi==5) { 
  x = mouseX + sin(frameCount/25.0)*25 ;
y = mouseY+ cos(frameCount/25.0)*25;

  fill(#ffffff);
   stroke(255,90,0,30);
   strokeWeight(70);
   ellipse(x,y,2,2);
  }
  
    if (modi==2) {
     y = mouseY+ random(-10, 50);
     x = mouseX+ random(-10, 50); 
    
      fill(#ffffff, 50);
      ellipse(x, y, 40, 40);
      noStroke();
 
    }

    if (modi==1) { 
      y = mouseY;
      x = mouseX; 
      
      fill(#ff5a00); 
      stroke(255,90,0,30);
      strokeWeight(70);
               ellipse(x, y, 250, 250);

    }

    if (modi==3) {
  fill(#d8c07e);
x = mouseX + sin(frameCount)*10 ;
y = mouseY + cos(frameCount)*10;
noStroke();

 ellipse(x,y, 50, 50);

x = x + sin(frameCount/20.0)*10 ;
y = y + cos(frameCount/20.0)*10;

fill(#6c5400);
 ellipse(x,y,2,2);

x = x + sin(frameCount/30.0)*10 ;
y = y + cos(frameCount/30.0)*10;

fill(#ffffff);
 ellipse(x,y,2,2);
 
 x = x + sin(frameCount/40.0)*10 ;
y = y + cos(frameCount/40.0)*10;

fill(#2c2406);
 ellipse(x,y,3,3);
 
 x = x + sin(frameCount)*10;
y = y + cos(frameCount)*10;

fill(#fffcf2);
 ellipse(x,y,3,3);
    }
    if (modi==4) {
  
  y = mouseY+ random(-30,30);
    x = mouseX+ random(-30,30); 

  fill(#1d4ea7); 
  float r = random(10,20);
   ellipse(x,y,30,30);

  stroke(#1b489a);
  float dicke = random(20);
  strokeWeight(dicke);

  }

}
}
void keyPressed() {
  if (key=='1') {
    //println("klick")
    modi = 1;
  }
  if (key=='2') {
    modi = 2;
  }

  if (key=='3') {
    modi = 3;
  }

  if (key=='4') {
    modi = 4;
  }
    if (key=='5') {
    modi = 5;
  }
  
  if (key=='s'){
  saveFrame ("bild###.jpg");
  }
  
}


/*toll

  x = mouseX + sin(frameCount/80.0)*80 ;
y = mouseY;

fill(#ffffff);
 ellipse(x,y,2,2); */


