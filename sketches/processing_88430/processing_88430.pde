
color clickColor;

void setup(){
  size(800,600);
  
}

void draw(){
background(255,255,204);

pushMatrix();
if (keyPressed==false){
fill(210,142,155);
if (mousePressed==true && mouseButton == LEFT){fill(random(255), random(255), random(255));}
else{fill(210,142,155);}
translate(-300,-80);
if (mousePressed == true && mouseButton == RIGHT){scale(.5);}

quad(300+mouseX,450+mouseY,800+mouseX,450+mouseY,800+mouseX,80+mouseY,300+mouseX,80+mouseY);
}


popMatrix();


 
//Box lines//
pushMatrix();

line(520+mouseX,300+mouseY,-130+mouseX,800+mouseY);
strokeWeight(2);
line(420+mouseX,300+mouseY,-220+mouseX,800+mouseY);
popMatrix();
 
//intersecting lines//
pushMatrix();
strokeWeight(1);
line(110,290-mouseY/2,-190/2,0);
strokeWeight(2);
line(110,290-mouseY/2,-210,150);
popMatrix();
 
//orange line, black line//
pushMatrix();
strokeWeight(2);
line(100+mouseX,400,-100,490);
strokeWeight(5);
stroke(210+mouseX,146,81,220);
line(110+mouseX,393,-103,487);
popMatrix();
 
//box with lines//

pushMatrix();
stroke(0);
strokeWeight(2);

fill(255,0,0);
quad(580,320,720,255,650,120,510,180);
fill(200);
quad(720,255,840,200,770,70,650,120);
fill(0,0);
quad(840,200,960,70,890,20,770,70);
fill(200);
quad(650,460,790,395,720,255,580,320);
fill(0,0);
quad(790,395,1000,300,840,200,720,255);
fill(255);
quad(725,600,860,540,790,395,650,460);

popMatrix();
 
//circle//
pushMatrix();
fill(210,146,81,150);
strokeWeight(3);
ellipse(840,120,300+mouseX,300);
popMatrix();
 
//smaller circle//
pushMatrix();
fill(174,203,157,150);
strokeWeight(3);
ellipse(860,120,250+mouseX,250);
popMatrix();

}


