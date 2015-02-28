
/* This is my attempt to make an "Exquisite Corpse" drawing program.
The screen is divided into three parts: head, body and legs. 
When the head and the body drawers have completed their section,
they click the "hide" button to hide their work so the next person
can contribute. When the leg section is completed, the drawer hits
the "show" button, so everyone can see the completed artwork. 

There are a few drawing tools and colors available, along with an "erase"
button so you can clear your area of the screen. 
*/

PFont f;
String a = "Hide";
String b = "Show";
boolean button1, button2, button3;


void setup(){
  size(400,720);
  smooth();
  background(240);
  stroke(0);
  ellipseMode(CENTER);
  textAlign(CENTER);
  f = createFont("ArialMT", 11, true);
 //String[] fontList = PFont.list();
 // println(fontList);
   textFont(f);
  
 
}


void mousePressed(){
   if(dist(mouseX, mouseY, 30, 30) < 15) {

       if(button1 == true) button1 = false;
       else button1 = true;
     
  
}
  if(dist(mouseX, mouseY, 30, 270) < 15){
    if(button2 == true) button2 = false;
    else button2 = true;
  }
  
  if(dist(mouseX,mouseY, 30, 510) < 15){
    if(button3 == true) button3 = false;
    else button3 = true;
  }
  
}

void draw(){
  background(240);
 
  //hide head button
  fill(255);
  ellipse(30,30,30,30);
  fill(255,0,0);
  text(a, 30,35);
  
 if (button1 == true){
  fill(255);
  rect(0,0,width,240);
  fill (200);
  ellipse(30,30,30,30);
  fill(255,0,0);
  text(b, 30,35);
 }

 

  
  //hide torso button
  if(dist(mouseX, mouseY, 30, 270) < 15) {
    if(mousePressed){
  fill(255);
  rect(0,240,width,240);
    }
  fill(200);
  ellipse(30,270,30,30);
  fill(255,0,0);
  text(b, 30,275);
  }
  else {fill(255);
  ellipse(30,270,30,30);
  fill(255,0,0);
  text(a, 30, 275);
  }
  

  
  //hide legs button
  if(dist(mouseX,mouseY, 30, 510) < 15){
    if(mousePressed){
  fill(255);
  rect(0,480,width,240);
}
  fill(200);
  ellipse(30, 510, 30, 30);
  fill(255,0,0);
  text(b, 30,515);
  }
  else {
    fill(255);
    ellipse(30, 510, 30, 30);
    fill (255, 0, 0);
    text(a, 30, 515);
  }
  
}






