
float v = mouseX; 

void setup(){
  size(425,400);
  smooth();
}


void draw(){
   background(255);
   
   v=100+mouseX/3.0;
  
//head
noFill();
arc(200,80, 100,100, 3.2, 6.3);

//ears
//left
ellipse(90,140, 120,120);
  //inside
  ellipse(90,140, 70,70);
//right
ellipse(310,140, 120,120);
  //inside
  ellipse(310,140, 70,70);
  
//eyes 
//left
fill(255);
float eS = map(v, 0, width, 80, 140);
ellipse(150,100, eS,eS); //80-140
fill(0);
float iS = map(v, 0, width, 30, 60);
ellipse(150,100,iS,iS);//30-60
//right
fill(255);
ellipse(250, 100, eS,eS);
fill(0);
ellipse(250,100,iS,iS);
  
//bottom face
fill(255);
stroke(0,0,0);
strokeWeight(1);
ellipse(200,200, 250,150);

//nostrils
//left
ellipse(185,180, 20,20);
noFill();
arc(184,165, 30,22, 3.0, 6.3);
//right
ellipse(215, 180, 20,20);
noFill();
arc(215,165, 30,22, 3.0, 6.3);


//mouth
float mS = map(v, 0, width, 20, 50);
ellipse(200, 240, mS,mS); //20-50
noFill();
arc(200,220, 100,100,0.8, 2.3);

}


