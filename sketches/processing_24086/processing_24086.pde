
void setup(){ 
size (300,280);
smooth();
noStroke();
}

void draw(){
//background
  for (int y=0; y<=height; y +=40){
  for (int x=0; x <=width; x +=40){
  fill(mouseX,60,140);
  ellipse(x,y,40,40);
  }
  }
  
//tail
fill (#660066);
ellipse (100,150,80,150);
fill (#336699);
rect (62,125,77,20);
rect (62,152,78,20);

//body
fill (#66CCFF);
ellipse (154,180,90,100);
fill (#FFFFFF);
ellipse (180,240,45,35); //right foot
fill (#66CCFF);
ellipse (175,212,45,55); //right leg
fill (#FFFFFF);
ellipse (128,240,55,40); //left foot
fill (#66CCFF);
ellipse (130,214,50,55); //left leg
fill(#FFFFFF);
ellipse (160,180,70,90); //belly

//arms
fill (#66CCFF);
ellipse (115,180,40,65);//left arm
ellipse (180,190,40,40);//right arm

//ears
triangle (105,15,89,100,143,40);//left ear outside
fill(#336699);
triangle (105,15,100,83,135,40);//left ear inside
fill (#66CCFF);
triangle (203,20,165,42,200,68);//right ear outside
fill (#336699);
triangle (203,20,167,49,200,68);//right ear inside

//head
fill(#66CCFF);
triangle (91,90,65,135,135,158); //left cheek
triangle (209,105,175,159,230,135); //right cheek
ellipse (150,100,120,120);

//eyes
fill (#336699);
triangle (145,78,85,118,155,120);//left eye shadow bottom
fill (#660066);
triangle (145,78,85,118,150,100);//left eye shadow top
fill(#336699);
triangle (185,79,172,120,212,120);//right eye shadow bottom
fill(#660066);
triangle (185,79,179,100,212,120);//right eye shadow top
fill (#000000);
rect (125,114,22,2);//left
rect (178,114,18,2);//right

//nose
fill (#FFFFFF);
ellipse (162,139,60,45);
fill(#336699);
triangle (155,120,175,120,165,135);
}
                
                
