


boolean dibuixaCercle = true;

boolean dibuixaFons = true;

int sz = 100;

int posX, posY, velX, velY;







void setup() {
 
  //fons
  size (450,450);
  posX = width/2;
  posY = height/2;
  velX = 2;
  velY = 3;
}
 
 


 


void draw() {
  background(0,255);

   
 
 //dons ratllat 
stroke(10,10,215);
strokeWeight(10);
line(15,0,15,450);
 
stroke(20,20,225);
strokeWeight(10);
line(25,0,25,450);
 
stroke(30,30,235);
strokeWeight(10);
line(35,0,35,450);
 
stroke(40,40,245);
strokeWeight(10);
line(45,0,45,450);
 
 
 
stroke(60,60,255);
strokeWeight(10);
line(60,0,60,450);
 
stroke(60,40,255);
strokeWeight(10);
line(70,0,70,450);
 
stroke(60,20,255);
strokeWeight(10);
line(80,0,80,450);
 
stroke(60,0,255);
strokeWeight(10);
line(90,0,90,450);
 
stroke(55,10,255);
strokeWeight(10);
line(105,0,105,450);
 
stroke(50,20,255);
strokeWeight(10);
line(115,0,115,450);
 
stroke(45,30,255);
strokeWeight(10);
line(125,0,125,450);
 
stroke(40,40,255);
strokeWeight(10);
line(135,0,135,450);
 
stroke(50,40,245);
strokeWeight(10);
line(150,0,150,450);
 
stroke(60,40,235);
strokeWeight(10);
line(160,0,160,450);
 
stroke(70,40,225);
strokeWeight(10);
line(170,0,170,450);
 
stroke(80,40,215);
strokeWeight(10);
line(180,0,180,450);
 
stroke(80,50,225);
strokeWeight(10);
line(195,0,195,450);
 
stroke(80,60,225);
strokeWeight(10);
line(205,0,205,450);
 
stroke(80,70,225);
strokeWeight(10);
line(215,0,215,450);
 
stroke(80,80,225);
strokeWeight(10);
line(225,0,225,450);
 
stroke(80,100,200);
strokeWeight(10);
line(240,0,240,450);
 
stroke(70,120,200);
strokeWeight(10);
line(250,0,250,450);
 
stroke(60,140,200);
strokeWeight(10);
line(260,0,260,450);
 
stroke(50,160,200);
strokeWeight(10);
line(270,0,270,450);
 
stroke(50,180,200);
strokeWeight(10);
line(285,0,285,450);
 
stroke(50,200,200);
strokeWeight(10);
line(295,0,295,450);
 
stroke(50,220,200);
strokeWeight(10);
line(305,0,305,450);
 
stroke(50,200,200);
strokeWeight(10);
line(315,0,315,450);
 
stroke(50,180,200);
strokeWeight(10);
line(330,0,330,450);
 
stroke(50,160,200);
strokeWeight(10);
line(340,0,340,450);
 
stroke(60,140,200);
strokeWeight(10);
line(350,0,350,450);
 
stroke(70,120,200);
strokeWeight(10);
line(360,0,360,450);

stroke(80,100,200);
strokeWeight(10);
line(375,0,375,450);
 
stroke(80,80,225);
strokeWeight(10);
line(385,0,385,450);
 
stroke(80,70,225);
strokeWeight(10);
line(395,0,395,450);
 
stroke(80,60,225);
strokeWeight(10);
line(405,0,405,450);

stroke(80,50,225);
strokeWeight(10);
line(420,0,420,450);
 
stroke(75,40,230);
strokeWeight(10);
line(430,0,430,450);
 
stroke(70,40,235);
strokeWeight(10);
line(440,0,440,450);
 
stroke(75,40,240);
strokeWeight(10);
line(450,0,450,450);

 
  //actualitzem posicio
  posX = posX+velX;
  posY = posY+velY;
   
  //tracem
  fill(255,255);
  if(posX>width/2){
     
  ellipse(posX,posY,300,100);
  } else {
   ellipse(posX,posY,100,300);
  }
 
    if(dibuixaCercle){
  fill(mouseY,mouseX,100);
  ellipse(posX,posY,sz,sz);
    } else {
        fill(mouseY,mouseX,100);
  ellipse(posX,posY,mouseY,mouseX);
    }
     
     

 //comprovem la posiciÃ³ X
  if((posX - (sz)<0)||(posX + (sz)>width)){
    velX = -velX;
  }
    //comprovem la posiciÃ³ Y
  if((posY - (sz/4)<0)||(posY + (sz/4)>height)){
    velY = -velY;
  }
}
 
void mousePressed()  {
//    posX = width/2;
//  posY = height/2;
//  velX = 2;
//  velY = 3;

dibuixaCercle = !dibuixaCercle;
dibuixaFons = !dibuixaFons;
}
 



