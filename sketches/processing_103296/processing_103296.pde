
}

 void draw(){
   ellipse(mouseX,mouseY,200,200);
   ellipse ( mouseX+ -50, mouseY + -25, 50, 50); //eye
    ellipse (mouseX+50, mouseY+-25, 50, 50); //eye
    line (mouseX+50, mouseY+50,150, 250); //mouth
  
 if (mousePressed == true){ //creates purple background
    background(120,0,120);
    ellipse(mouseX,mouseY,200,200);
 
   
   ellipse(mouseX,mouseY,200,200);
ellipse ( mouseX+-50, mouseY+-25, 50, 50); //eye follows
ellipse (mouseX+50, mouseY+-25, 50, 50); //eye follows
line (mouseX+-50, mouseY+50,mouseX+50,mouseY+ 50); //mouth follows
arc(mouseX+2,mouseY+50,80,70, 0, PI); //smile when click
 }

if (mousePressed == false){ //no smile
ellipse(mouseX,mouseY,200,200);
ellipse ( mouseX+-50, mouseY+-25, 50, 50); //eye
ellipse (mouseX+50, mouseY+-25, 50, 50); //eye
line (mouseX+-50, mouseY+50,mouseX+50,mouseY+ 50); //mouth
}
 }
