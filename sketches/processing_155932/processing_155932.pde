
/*
Day 02 Homework_By Eliana Xue Feng
*/

void setup(){
size(800,600);
frameRate(20);
}

void draw(){
//set up the background
background(245,238,17);
  
//Draw the Panda head
fill(253,252,255);
ellipse(mouseX,mouseY,250,200);
//ellipse(width/2,height/2,250,200);
//elipse(400,300,250,200);

//Draw the Panda eyes
fill(0,0,3);
ellipse(mouseX-60,mouseY-15,50,50);
ellipse(mouseX+60,mouseY-15,50,50);
//ellipse(width/2-60,height/2-15,50,50);
//ellipse(width/2+60,height/2-15,50,50);

//Draw the Panda eyeballs
stroke(255);
strokeWeight(8);
point(mouseX-60,mouseY-15);
point(mouseX+60,mouseY-15);
//point(width/2-60,height/2-15);
//point(width/2+60,height/2-15);

//Draw the Panda nose
stroke(0);
point(mouseX,mouseY+20);
//point(width/2,height/2+20)

//Draw the Panada nose
strokeWeight(4);
line(mouseX,mouseY+20,mouseX,mouseY+40);
//line(width/2,height/2+20,width/2,height/2+40);

//Draw the Panda mouth
noFill();
bezier(mouseX-40, mouseY+40,  mouseX-30, mouseY+50,  mouseX-20, mouseY+60,  mouseX, mouseY+40);
bezier(mouseX, mouseY+40,  mouseX+20, mouseY+60,  mouseX+30, mouseY+50,  mouseX+40, mouseY+40);
fill(242,22,62);
bezier(mouseX-20, mouseY+55,  mouseX-10, mouseY+70,  mouseX, mouseY+100,  mouseX+20, mouseY+55);

//bezier(width/2-40, height/2+40,  width/2-30, height/2+50, width/2-20, height/2+60,  width/2, height/2+40);
//bezier(width/2, height/2+40,  width/2+20,  height/2+60,  width/2+30, height/2+50,  width/2+40, height/2+40;
//fill(242,22,62);
//bezier(width/2-20, height/2+55,  width/2-10, height/2+70,  width/2, height/2+100,  width/2+20, height/2+55);

//Draw the Panda ears
fill(0,0,3);
ellipse(mouseX-100,mouseY-100,mouseX-340,mouseY-240);
ellipse(mouseX+100,mouseY-100,mouseX-340,mouseY-240);
//ellipse(width/2-100,height/2-100,width/2-340,height/2-240);
//ellipse(width/2+100,height/2-100,width/2-340,height/2-240);
}





