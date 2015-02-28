

// "Honeycomb Topologies"
// by Sahar Fikouhi 
//
// This program was developed for the needs of the dissertation 
// "Honeycomb topologies; design rationalisation of a free form space frame structure"
// in the framework of the MSc Adaptive Architecture & Computation,
// the Bartlett School of Graduate Studies,
// University College London,
// September 2009


// sections of the spring class are taken from "Topological Self-Organisation: Using a particle-spring system to generate structural space-filling lattices" by Tassos Kanellos 
//http://www.aac.bartlett.ucl.ac.uk/reports/2007.html
//sections of the nurrbs function are taken from "Triangular mesh fitted to NURBS surface" by Alasdair Turner  http:// www.openprocessing.org/visuals/?visualID=3013


int num=50;//this affects the density!! 
float r;

import processing.dxf.*;
boolean record = false;
PFont font;
Nurbs surface;
Cylinder [][]tube;
boolean reSizeAll,reSizeAll1, relax, release, joint,angles, colour, fabricate, visible, texts;
boolean calcpos=false;

float rotX; 
float rotY; 
float scaleFactor = 1; 

color Red = color(255,0,0);
color Blue = color(0,0,255);
color Green= color(56,142,14);
color yellow = color(252,240,0);
color purple = color(183,41,167);
color L_green = color(178,255,231);
color L_blue =color(30,213,247);
color orange =color (237,131,0);
color grey =color (120,121,121);
color pink =color (255,183,205);
float averageUU, averageVV;

Button[] but = new Button[7];

void setup(){
  size(800,800,P3D);
  surface= new Nurbs();
  tube=new Cylinder [700][700];
  visible= true;


  but[4] = new Button (20,height-30,70,20,"NURBS",false); 
  but[0] = new Button (100,height-30,70,20,"RELAX", false); 
  but[1] = new Button (180,height-30,70,20,"RELEASE",false); 
  but[2] = new Button (260,height-30,70,20,"LENGTH",false); 
  but[5] = new Button (340,height-30,70,20,"ANGLES",false); 
  but[6] = new Button (500,height-30,70,20,"FAB",false); 
  but[3] = new Button (420,height-30,70,20,"JOINT",false); 
}

void draw(){
  if (record == true) {
    beginRaw(DXF, "optimised_sc0.65Con1.dxf"); // Start recording to the file
  }

  background(0);
  // frameRate(10);
  lights();
  font = loadFont("Calibri-Bold-48.vlw");
  textFont(font,14);

  for(int q=0; q<but.length; q++){  
    but[q].display(); 
  }
  //println(hs1.getPos());
  if(texts){
    String s = "PRESS 1,2,3,4 or 5 AND";
    String s1 = "a, s, d, f or g to move control points";
    text(s,580,height-30,0);
    text(s1,580,height-10,0);
  }
  buttons();
  colorBox(25 , 5, 25 ,""+av,Red);
  colorBox(55 , 5, 25 ,""+av1,Blue);
  colorBox(85 , 5, 25 ,""+av2,Green);
  colorBox(115 , 5, 25 ,""+av3,yellow);
  colorBox(145 , 5, 25 ,""+av4,purple);
  colorBox(175 , 5, 25 ,""+av5,L_green);
  colorBox(205 , 5, 25 ,""+av6,L_blue);
  colorBox(235 , 5, 25 ,""+av7,orange);
  colorBox(265 , 5, 25 ,""+av8,grey);
  colorBox(295 , 5, 25 ,""+av9,pink);

  stroke(255);

  if (reSizeAll==true){
    D_R ();
  }
  if (reSizeAll1==true){
    D_R1();
  }
  if (relax==true){
    calcpos=true; 
    D_R ();
    D_R1();
  }

  if (release==true){
    calcpos=false;
    release();
  }

  translate(400,600,-1200);
  // translate(1500,-600,-1200);
  // rotateX(PI/2);
  rotateX(rotY); 
  rotateY(rotX);  
  scale(scaleFactor); 
  translate(-600,0,600);

  surface.display();
  if (joint==true){
    display_Joints();
  }
  if (angles==true){
    changeAngle();
  }
  if (record == true) {
    endRaw();
    record = false; // Stop recording to the file
  }


}
void keyPressed() {
  if (key == 'R' || key == 'r') { // Press R to save the file
    record = true;
  }
  if (key=='m'){
    saveFrame("jointscolor1.jpeg");

  }
}

void changeAngle(){
  //a2= b2 + c2- 2bccosA
  fabricate=true;
  visible=false;

  for (int p = 1; p <num-1; p+=1)
  {
    for (int q =(p%2)*2+1; q<num-1; q+=4)
    {
      if(p>1&&q>1 &&p<num-3 &&q<num-3){ 
        tube[p][q] = new Cylinder(nodes[p][q]);

        //tube[p][q].y=nodes[p][q].pos.y-100;
        //println("L");
      }
    }
  }

}

void printLengths(){ //to print lengths

    for (int p = 1; p <num-1; p+=1)
  {
    for (int q =(p%2)*2+1; q<num-1; q+=4)
    {
      if(p>1 &&p<num-2 &&q<num-2&&q>0){ 
        //println(spring1[p][q].len+":"+spring2[p][q].len+":"+spring3[p][q].len);
        println(spring1[p][q].len);
        println(spring2[p][q].len);
        println(spring3[p][q].len);

      }
    }
  } 

}
void calcAngle(){
  for (int p = 1; p <num-1; p+=1)
  {
    for (int q =(p%2)*2+1; q<num-1; q+=4)
    {
      if(p>1&&q>1 &&p<num-3 &&q<num-3){ 
        //angle between green and blue
        float a = ((sq(spring1[p][q].len)) + (sq(spring3[p][q].len)) - (sq(springB[p][q].len)))/(2*spring1[p][q].len*spring3[p][q].len);
        float angle= acos(a);

        float e= ((sq(spring1[p][q].len)) + (sq(spring3[p][q].len)) - (sq(springE[p][q].len)))/(2*spring1[p][q].len*spring3[p][q].len);
        float angle4= acos(e);

        //red and blue
        float b = ((sq(spring1[p][q].len)) + (sq(spring2[p][q].len)) - (sq(springA[p][q].len)))/(2*spring1[p][q].len*spring2[p][q].len);
        float angle1= acos(b);

        float d = ((sq(spring1[p][q].len)) + (sq(spring2[p][q].len)) - (sq(springD[p][q].len)))/(2*spring1[p][q].len*spring2[p][q].len);
        float angle3= acos(d);

        // green and red
        float c = ((sq(spring2[p][q].len)) + (sq(spring3[p][q].len)) - (sq(springC[p][q].len)))/(2*spring2[p][q].len*spring3[p][q].len);
        float angle2= acos(c);

        float f = ((sq(spring2[p][q].len)) + (sq(spring3[p][q].len)) - (sq(springF[p][q].len)))/(2*spring2[p][q].len*spring3[p][q].len);
        float angle5= acos(f);

        println(round(degrees(angle))+":"+round(degrees(angle1))+":"+round(degrees(angle2))+":"+round(degrees(angle3))+":"+round(degrees(angle4))+":"+round(degrees(angle5))); 

      }
    }
  }
}

void mouseReleased(){

  if( but[2].on==true){
    printLengths();
  }

  if( but[5].on==true){
    calcAngle();
  }     
}

void mouseDragged() 
{ 
  if(mouseY<height-90){
    if (mouseButton==LEFT){ 

      rotX += (mouseX - pmouseX) * 0.005; 
      rotY -= (mouseY - pmouseY) * 0.005; 
    } 
    if (mouseButton==RIGHT){ 
      if (scaleFactor>0.01){ 
        scaleFactor += 0.01*(mouseX-pmouseX); 
      } 
      else{ 
        scaleFactor += abs(0.01*(mouseX-pmouseX)); 
      } 
    } 
  }
} 

void buttons(){
  if(mousePressed){
    if(mouseX > but[0].BposX && mouseX < (but[0].BposX+but[0].Bside) && mouseY > but[0].BposY && mouseY < (but[0].BposY+but[0].Bside2)){
      but[0].on=true;//relax
      but[1].on=false;//release
      but[2].on=false;
      but[3].on=false;
      but[4].on=false;
      but[5].on=false;
      but[6].on=false;
      relax=true;
      release=false;
      joint=false;
      ctrlPts=false;
      angles=false;
      colour = true;
      //  visible=true;
    }

    else if (mouseX > but[1].BposX && mouseX < (but[1].BposX+but[1].Bside) && mouseY > but[1].BposY && mouseY < (but[1].BposY+but[1].Bside2)){
      but[0].on=false;
      but[1].on=true;
      but[2].on=false;
      but[3].on=false;
      but[4].on=false;
      but[5].on=false;
      but[6].on=false;
      release=true;
      relax=false;
      joint=false;
      ctrlPts=false;
      angles=false;
      colour = true;
      //  visible=true;
    }
    else if (mouseX > but[2].BposX && mouseX < (but[2].BposX+but[2].Bside) && mouseY > but[2].BposY && mouseY < (but[2].BposY+but[2].Bside2)) {
      but[0].on=false;
      but[1].on=false;
      but[2].on=true;
      but[3].on=false;
      but[4].on=false;//nurbs
      but[5].on=false;
      but[6].on=false;
      release=false;
      relax=false;
      joint=false;
      ctrlPts=false;
      angles=false;
      colour = true;
    }

    else if (mouseX > but[3].BposX && mouseX < (but[3].BposX+but[3].Bside) && mouseY > but[3].BposY && mouseY < (but[3].BposY+but[3].Bside2)) {
      but[0].on=false;
      but[1].on=false;
      but[2].on=false;
      but[3].on=true;
      but[4].on=false;
      but[5].on=false;
      but[6].on=false;
      joint=true;
      fabricate=false;
      release=false;
      relax=false;
      ctrlPts=false;
      angles=false;
      colour = true;
    }
    else if (mouseX > but[4].BposX && mouseX < (but[4].BposX+but[4].Bside) && mouseY > but[4].BposY && mouseY < (but[4].BposY+but[4].Bside2)) {
      but[0].on=false;
      but[1].on=false;
      but[2].on=false;
      but[3].on=false;
      but[4].on=true;
      but[5].on=false;
      but[6].on=false;
      joint=false;
      release=false;
      relax=false;
      ctrlPts=true;
      angles=false;
      colour = false;
      visible=true;
    }
    else if (mouseX > but[5].BposX && mouseX < (but[5].BposX+but[5].Bside) && mouseY > but[5].BposY && mouseY < (but[5].BposY+but[5].Bside2)) {
      but[0].on=false;
      but[1].on=false;
      but[2].on=false;
      but[3].on=false;
      but[4].on=false;
      but[5].on=true;
      but[6].on=false;
      joint=false;
      release=false;
      relax=false;
      ctrlPts=false;
      angles=false;
      colour = false;
      // visible=true;
    }
    else if (mouseX > but[6].BposX && mouseX < (but[6].BposX+but[6].Bside) && mouseY > but[6].BposY && mouseY < (but[6].BposY+but[6].Bside2)) {
      but[0].on=false;
      but[1].on=false;
      but[2].on=false;
      but[3].on=false;
      but[4].on=false;
      but[5].on=false;
      but[6].on=true;
      angles=true;
      joint=true;
      release=false;
      relax=false;
      ctrlPts=false;
      colour = false;
    }
  }
}


































