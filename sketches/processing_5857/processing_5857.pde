
void setup () 
{
  size(400,400);
  smooth();
}

void draw () {
  background(255,255,0);
  
  
  // ellipse & rect staan in midden van het scherm "center"
  ellipseMode(CENTER) ;
 rectMode(CENTER); 

 noStroke ();
  if (mouseX < 200 && mouseY < 200) { 
    fill (148,6,128); 
    rect (100,100,200,200);     
  } else if (mouseX > 200 && mouseY < 200) { 
    fill (0,225,0); 
    rect (300,100,200,200); 
  } else if (mouseX < 200 && mouseY > 200) { 
    fill (3,197,166); 
    rect (100,300,200,200); 
  } else if(mouseX > 200 && mouseY > 200) { 
    fill (254,130,20); 
    rect(300,300,200,200); 
  } 
 if (mousePressed) {
 stroke (0);
   //grover benen
 stroke (0);
 line(mouseX-4,mouseY-10,pmouseX-15,pmouseY+60);
 line(mouseX+4,mouseY+10,pmouseX+15,pmouseY+60);  

 // grover armen
 line(mouseX-10,mouseY-20,pmouseX-40,pmouseY+10);
 line(mouseX+5,mouseY-20,pmouseX+40,pmouseY+2);
  //grover lichaam
 fill (71,45,252);
 ellipse (mouseX,mouseY,40,55);
 // grover hoofd
 fill (71,45,252);
 ellipse (mouseX,mouseY-43,50,40);
 // grover ogen
 fill (255);
 ellipse (mouseX-9,mouseY-58,15,18);
 ellipse (mouseX+9,mouseY-58,15,18);
 fill (0);
 ellipse (mouseX-9,mouseY-57,8,10);
  ellipse (mouseX+9,mouseY-57,8,10);
 //grover neus
 fill (230,160,0);
 ellipse (mouseX,mouseY-43,20,22);
 } else {
   
  //elmo's benen
 stroke (0);
 line(mouseX-4,mouseY-10,pmouseX-15,pmouseY+60);
 line(mouseX+4,mouseY+10,pmouseX+15,pmouseY+60);  

 // elmo's armen
 line(mouseX-10,mouseY-20,pmouseX-40,pmouseY+10);
 line(mouseX+5,mouseY-20,pmouseX+40,pmouseY+2);
 
 // elmo's lichaam
 fill (255,0,0);
 ellipse (mouseX,mouseY,40,55);
  
 // elmo's hoofd
 fill (255,0,0);
 ellipse (mouseX,mouseY-43,50,40);
  // elmo's ogen
  fill (255);
  ellipse (mouseX-9,mouseY-58,15,18);
  ellipse (mouseX+9,mouseY-58,15,18);
  fill (0);
  ellipse (mouseX-9,mouseY-57,8,10);
  ellipse (mouseX+9,mouseY-57,8,10);
  // elmo's neus
  fill (230,160,0);
  ellipse (mouseX,mouseY-43,20,22);
}

//void mousepressed () {
  //stroke (0);
  //grover lichaam
  // fill (71,45,252);
  // ellipse (mouseX,mouseY,40,55);
 // grover hoofd
  //fill (71,45,252);
  //ellipse (mouseX,mouseY-43,50,40);
   // elmo's ogen
  //fill (255);
 // ellipse (mouseX-9,mouseY-58,15,18);
  //ellipse (mouseX+9,mouseY-58,15,18);
  //fill (0);
  //ellipse (mouseX-9,mouseY-57,8,10);
 // ellipse (mouseX+9,mouseY-57,8,10);
  // elmo's neus
  //fill (230,160,0);
 // ellipse (mouseX,mouseY-43,20,22);
}
 
 
 

