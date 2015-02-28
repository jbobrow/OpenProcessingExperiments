
void setup()
{
  size(600,600);
  background(69,189,234);
}




void draw()
{
  background(69,189,234);
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

  //cap de l'abella//
  stroke(0);
  fill(0);
  ellipse(mouseX-20,mouseY,20,10);
  //punxó de l'abella//
  line(mouseX+15,mouseY,mouseX+25,mouseY);
  //cos de l'abella//
  fill(210,220,10);
  stroke(0);
  strokeWeight(3);
  ellipse(mouseX,mouseY,40,20);
  //ralles abella//
  strokeWeight(4);
  line(mouseX,mouseY-9,mouseX,mouseY+9);
  line(mouseX-10,mouseY-9,mouseX-10,mouseY+9);
  line(mouseX+10,mouseY-9,mouseX+10,mouseY+9);
 //ales//
  fill(255);
  arc(mouseX,mouseY-15,15,25,HALF_PI+QUARTER_PI,TWO_PI+QUARTER_PI,OPEN);
  arc(mouseX,mouseY+15,15,25,-QUARTER_PI,PI+QUARTER_PI,OPEN);
  noCursor();
}






