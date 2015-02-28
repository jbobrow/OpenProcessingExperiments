
void setup() { 
size (500,500);
}

void draw() { 
  
smooth();
background(24,31,28);
strokeWeight(2);
stroke(101,245,236);
  
  
  fill(225,250,237);

//Body
ellipse(mouseX,mouseY+100,90,180);


    
  if (mousePressed) { 
    //Head
ellipse(mouseX,mouseY-30,125,125);
strokeWeight(1);
ellipse(mouseX+10,mouseY-30,80,80);
fill(24,31,28);
ellipse(mouseX,mouseY-40,20,20);
ellipse(mouseX+30,mouseY-40,15,15); 
  } else { 
    //Head
ellipse(mouseX,mouseY,125,125);
strokeWeight(1);
ellipse(mouseX+10,mouseY+10,80,80);
fill(24,31,28);
ellipse(mouseX,mouseY,20,20);
ellipse(mouseX+30,mouseY,15,15);
  } 

fill(225,250,237);

//Fingers
ellipse(mouseX+53,173,5,9);
ellipse(mouseX+60,170,5,9);
ellipse(mouseX+67,173,5,9);

//Palm
ellipse(mouseX+60,190,20,30);


}


