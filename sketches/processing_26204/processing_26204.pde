

class Baby{
  //GLOBAL VARIABLES
  float x=0;   
  float y=0;   
  
  
 
 //CONSTRUCTOR 
 Baby(float tempx, float tempy){
  //specify 
  x= tempx;
  y= tempy;
  
   
 }
 
 
 //FUNCTION 
  void display(){

   

//arms
stroke(182,234,247);
fill(182,234,247);
ellipse(170,280,50,70);
ellipse(330,280,50,70);
//body 
stroke(182,234,247);
fill(182,234,247);
ellipse(250,400,200,400);
//bed frame
stroke(191,108,0);
fill(191,108,0);
rect(250,320,500,30);
rect(0,430,30,200);
rect(100,430,30,200);
rect(200,430,30,200);
rect(300,430,30,200);
rect(400,430,30,200);
rect(500,430,30,200);

//hands
fill(247,223,171);
stroke(247,223,171);
ellipse(150,320,70,40);
ellipse(350,320,70,40);


//display baby's face 
fill(247,223,171);
stroke(247,223,171);
ellipse(250,150,170,150);
ellipse(250,200,190,150);
//eyes
fill(255);
stroke(255);
ellipse(200,150,40,50);
ellipse(300,150,40,50);
rectMode(CENTER);
rect (200,160,40,30);
rect(300,160,40,30);
//eyes2
fill(0,126,255);
stroke(0,126,255);
ellipse(200,150,32,38);
ellipse(300,150,32,38);
rect(200,165,34,23);
rect(300,165,34,23);
//eyes3
fill(4,87,171);
stroke(4,87,171);
ellipse(200,150,25,31);
ellipse(300,150,25,31);
rect(200,165,25,21);
rect(300,165,25,21);
//shiny eyes 
stroke(255,255,255,0);
fill(255,255,255,150);
ellipse(210,143,22,15);
ellipse(310,143,22,15);

//closed eyes 

if(mouseX>200 && mouseY>150) {
fill(247,223,171);
stroke(247,223,171);
ellipse(200,150,40,50);
ellipse(300,150,40,50);
rectMode(CENTER);
rect (200,160,40,30);
rect(300,160,40,30);
}


{
//nose
stroke(255,194,88);
fill(255,194,88);
ellipse(240,200,15,15);
//nose
stroke(247,223,171);
fill(247,223,171);
ellipse(244,202,15,15);

//mouth 
stroke(200,118,150);
line (240,230,250,230);
//cheek
stroke(c1,c2,c3,90);
fill(c1,c2,c3,90);

ellipse(180,210,50,50);
ellipse(320,210,50,50);
//cheek color change 

if (mouseX<180){
stroke(255,0,0,100);
fill(255,0,0,100);
 ellipse(180,210,50,50);
ellipse(320,210,50,50);

 
}
if (mouseY<210){
stroke(255,0,0,100);
fill(255,0,0,100);
 ellipse(180,210,50,50);
ellipse(320,210,50,50);
  
  
}else{
 stroke(c1,c2,c3,90);
fill(c1,c2,c3,90);
  ellipse(180,210,50,50);
ellipse(320,210,50,50);
}

//hair

stroke(255,253,103);
fill(255,253,103);
ellipse(250,90,90,60);
stroke(247,223,171);
fill(247,223,171);
ellipse(260,100,75,50);


//if mouth
//stroke(255,118,150);
//fill(255,118,150);
//ellipse(250,230,25,25);

///////////////////////////////


  }
}

}

