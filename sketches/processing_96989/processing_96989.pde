
float pX = 400;
float vX = 5;
float pY = 150;
float vY = 3;
float brX=50;
float brY=20;
int a=#5CF0FA;
int b=#F732CA;

void setup() {
  size(500, 500);
  rectMode(CENTER);
 
}

void draw() {
  background(#FFBA39);

  pX = pX + vX;
  pY = pY + vY;

  //comprobem
  if (pX + brX > width) {
    vX = -vX;
    pX = width -brX;
  } 
   if (pX-brX <0) { 
    vX = -vX;
    pX = brX;
  }
  //eix Y. zona agarre.
    if (pY + 110 > height) {
    vY = -vY;
    pY = height -110;
  } 
  //adalt
   if (pY-85 <0) { 
     vY = -vY;
    pY = 85;
  }
  
//dibuix
  
//cos

//canvi de color segons quadrant

if((pX<width/2)||(pY>height/2)){
stroke(a);
fill(a);
}
else{
  fill(b);
  stroke(b);
}

strokeWeight(1);
rect(pX,pY,60,100);
ellipse(pX,pY-50,60,70);

//braços
ellipse(pX+25,pY-10,brX,brY);
ellipse(pX-25,pY-10,brX,brY);

//cosa blanca cos
stroke(255);
strokeWeight(15);
line(pX-23,pY+50,pX+23,pY+50);

//agarre   
noStroke();
stroke(108,69,7);
fill(108,69,7);
rect(pX,pY+75,8,40);
ellipse(pX,pY+95,8,20);

//cara
noFill();
strokeWeight(3);
stroke(255);
ellipse(pX,pY-35,10,20);  

if((pX<width/2)||(pY>height/2)){
fill(a);
}
else{
  fill(b);
}

noStroke();
rect(pX,pY-50,30,30);


fill(0);
strokeWeight(2);
stroke(255);
ellipse(pX+10,pY-50,8,20);
ellipse(pX-10,pY-50,8,20);  

}

void mousePressed(){
  pX=mouseX;
  pY=mouseY;
  brY=random(5,80);
}



