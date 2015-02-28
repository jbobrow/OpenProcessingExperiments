
int x = 230;
int y = 150;
int a = 250;
int b = 300;

void setup (){
  size(500,500);
  smooth();
}

void draw (){
  background(204);
  //NECK
  fill(36,114,180);
  noStroke();
  rect(x,y,40,30);
  fill(191,225,255,10);
  rect(265,y,6,30);
  //HEAD
  fill(191,225,255);
  noStroke();
  arc(250,155,100,100,PI,TWO_PI);
  fill(mouseX,94,173);
  arc(230,134,20,20,PI,TWO_PI);//LEFT EYE
  arc(270,134,20,20,PI,TWO_PI);//RIGHT EYE
  //BODY
  fill(191,mouseX,255);
  ellipse(a,b+30,10,10);//SMALL BOTTOM
  fill(36,mouseY,180);
  ellipse(a,b,50,50);//LARGE BOTTOM
  fill(191,225,255);
  rect(200,175,100,120);//MAIN
  fill(36,114,180,50);
  rect(275,175,20,120);//STRIPE LARGE
  fill(237,247,255,60);
  rect(275,175,6,120);//STRIPE SMALL
}



