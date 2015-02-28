
//declaracio de les diferents variables
int x;
int posX, posY, velX, velY;
color abellaR,abellaG,abellaB,abella;
//definim variables
void setup()
{
  size(600,600);
  background(69,189,234);
  noCursor();
  posX = width/2;
  posY = height/2;
  velX = 3;
  velY = 3;
  abellaR=210;
  abellaG=220;
  abellaB=10;
  
}

void draw()
{
  background(69,189,234);
  fill(59,170,52);
  stroke(14,93,9);
  rect(300,300,20,300);
  //He  buscat pel help processing per poder fer una matriu i fer la flor// 
pushMatrix();
 
translate(300,300);
for(int i=0; i<80; i++){
     
    rotate(PI/5);
    fill(245,111,243);
    noStroke();
    ellipse(0,65,80,270);
}
popMatrix();
fill(240,93,44);
stroke(245,70,40);
strokeWeight(3);
ellipse(300,300,100,100);

//posicions
posX=posX+velX;
posY=posY+velY;

//Rebot abella
 //cap de l'abella//
  stroke(0);
  fill(0);
  ellipse(posX-20,posY,width/30,height/60);
  //punxó de l'abella//
  line(posX+15,posY,posX+25,posY);
  //cos de l'abella//
  fill(abellaR,abellaG,abellaB);
  stroke(0);
  strokeWeight(3);
  ellipse(posX,posY,width/15,height/30);
  //ralles abella//
  strokeWeight(4);
  line(posX,posY-9,posX,posY+9);
  line(posX-10,posY-9,posX-10,posY+9);
  line(posX+10,posY-9,posX+10,posY+9);
 //ales//
  fill(255);
  arc(posX,posY-15,width/40,height/24,HALF_PI+QUARTER_PI,TWO_PI+QUARTER_PI,OPEN);
  arc(posX,posY+15,width/40,height/24,-QUARTER_PI,PI+QUARTER_PI,OPEN);

//Condicional perque la figura es mogui en els límits X
  if((posX<width/15)||(posX>width-15)){
    velX=-velX;
  }

//Condicional perque la figura es mogui en els límits Y
if((posY<height/30)||(posY>height-30)){
    velY=-velY;
  }

}
   
void mousePressed() {
  if (abella == 0) {
    abellaR = int(random(0,210)); 
    abellaG = int(random(0,220)); 
    abellaB = int(random(0,10));
  } else {
    abellaR = 210;
    abellaG = 220;
    abellaB = 10;
  }

}


