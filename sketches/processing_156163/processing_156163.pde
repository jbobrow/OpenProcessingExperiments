
int mouse1;
int mouse2;
int mouse3;
int mouse4;
PImage party;
PFont Chalkboard50;
float x;
int ellipseY;
int ellipseZ;

void setup() {
  size(600, 600);
  party = loadImage("party.png");
  Chalkboard50 =loadFont("Chalkboard-50.vlw");
  ellipseY=0;
  ellipseZ=50;
 
  
}

void draw() {
  background(255, 255, 255);
  image(party, 0, 0, party.width/1.5, party.height/1.5);
  textFont(Chalkboard50);
  text("dancing..!", 200, 50);
  
   if (mousePressed == true) {
    fill(0);
  } else {
    fill(255,50,100);
  }
  rect(265, 290, 70, 70);
  ellipse(300,200,150,150);
  
  
  fill(255,255,255);
  ellipse(260,200,20,25);

  fill(255,255,255);
  ellipse(340,200,20,25);

  rect(275,240,50,10);
  fill(275,25,100); 
   
   
   
   

  
  if (290<mouseY && mouseY<350) {mouse1=mouseY;
  rect(190,mouseY,60,10);  }
  if(mouseY<=290) 
  {rect(190,290,60,10);}
  if(mouseY>=350) 
{rect(190,350,60,10);}
  
  
  if (290<mouseY && mouseY<350) {mouse2=mouseY;
  rect(350,mouseY,60,10);  }
  if(mouseY<=290)
  {rect(350,290,60,10);}
  if(mouseY>=350) {rect(350,350,60,10);}

   
 

  if (265<mouseX && mouseX<320 ) {mouse3=mouseX;
  rect(mouseX,370,20,60); 
  if (mouseX<=265);
  rect(265,370,20,60);






   }






   drawCircle(x);
   x = random(0,255);

   
   
   
   
 }
  
  
   
 void drawCircle(float fill){
   fill(fill);
   noStroke();
   ellipse(80,60,20,20); 
   ellipse(500,500,20,20);
   ellipse(100,300,20,20); 
   ellipse(450,100,20,20); 
   ellipse(530,300,20,20); 
   
    ellipse(400,ellipseY,10,10);
    ellipseY=ellipseY+1;
    ellipse(100,ellipseY,10,10);
    ellipseY=ellipseY+1;
    ellipse(300,ellipseY,10,10);
    ellipseY=ellipseY+1;


    ellipse(200,ellipseZ,10,10);
    ellipseZ=ellipseZ+1;
    ellipse(50,ellipseZ,10,10);
    ellipseZ=ellipseZ+1;
    ellipse(500,ellipseZ,10,10);
    ellipseZ=ellipseZ+1;

  




}

   
   











