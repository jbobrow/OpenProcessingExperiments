
//This is my charachter for Interactive digital media 2.4.14

int bWidth = 80;
int bHeight = 121;
float eHWidth = 13;
int hWidth=50;
int hHeight=50;


//Oliver Olive
void setup(){ 
 size(500,500);//size of playing feild
 smooth();
 rectMode(CENTER);
}

void draw() {
background(225);
noStroke();
fill(0);

beginShape();//legleft
vertex(230,200);
vertex(195,200);
vertex(184,300);
vertex(188,320);
vertex(192,320);
vertex(190,290);
endShape();


beginShape(); //left foot
vertex(188,320);
vertex(180,323);
vertex(192,323);
vertex(192,320);
endShape();


beginShape();//legright
vertex(170,200);
vertex(205,170);
vertex(216,300);
vertex(212,320);
vertex(210,320);
vertex(210,290);
endShape();


beginShape(); //Right foot
vertex(212,320);
vertex(220,323);
vertex(210,323);
vertex(210,320);
endShape();


fill(165,159,38);//shirt color

  ellipse(200, 220, bWidth, bHeight);//body 

fill(255);
ellipse(200, 200, hHeight, hWidth);//head
smooth();
stroke(1);
strokeWeight(1.5);

 ellipse(190, 200, eHWidth, eHWidth);//Left eye 
 ellipse(210, 200, eHWidth, eHWidth);//right eye

fill(0);
strokeWeight(1);
//ellipse(190,200,3,3); //Eye ball left
//ellipse(210,200,3,3);//Eye ball right
if(mouseX < 195 && mouseX > 185){
  ellipse(mouseX,200,3,3);//Moving Eye ball right
  ellipse(mouseX+20,200,3,3);
}else if(mouseX > 195){
   ellipse(195,200,3,3);
   ellipse(215, 200, 3, 3);
}else if(mouseX < 185){
  ellipse(186,200,3,3);
  ellipse(206, 200, 3, 3);
}


beginShape();
vertex(230,210);//right arm 
vertex(230,240);
vertex(210,250);
vertex(225,235);
endShape();
beginShape();
vertex(170,210);//left arm 
vertex(170,240);
vertex(190,250);
vertex(175,235);
endShape();
fill(160,17,10);
ellipse(200,182,40,16);
strokeWeight(1.5);
line(200,167,200,180);

  if (mousePressed == true) {
    bWidth += 5;
    bHeight += 5;
   
    hWidth =60;
    hHeight =60;
  
  if (eHWidth<18) { 
    
    eHWidth += .5 ;
    
  //  if (mouseX=200){
    //  ellipse(mouseX, 200, 5,5);
      
   // }
    
  }
    
  }
}


 


