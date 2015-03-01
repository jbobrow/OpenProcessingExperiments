
//operation occurs once and is stagnant
void setup(){
  //the size of the frame
  size(600,600);
  //background color in void setup allows for "drawing" when mouseX is involved
}

void draw(){
  if (key == 'q' || key == 'Q'){
    proximity();}
  else if (key == 'w' || key == 'W'){
    symmetry();}
  else if (key == 'e' || key == 'E'){
    figureGround();}
}

void proximity(){
  background(175,50,50);
  fill(0);
  rect(500,200,50,50);
  rect(200,500,50,50);
  rect(320,115,50,50);
  rect(110,220,50,50);
  rect(500,500,50,50);
  rect(450,450,50,50);
  rect(400,400,50,50);
  rect(350,350,50,50);
  rect(300,300,50,50);
  rect(250,250,50,50);
  rect(200,200,50,50);
  rect(150,150,50,50);
  rect(100,100,50,50);
  rect(50,50,50,50);
}

void symmetry(){
  background(50,60,150);
  ellipse(400,100,100,100);
  ellipse(100,100,100,100);
  ellipse(380,200,80,80);
  ellipse(120,200,80,80);
  ellipse(360,300,60,60);
  ellipse(140,300,60,60);
  ellipse(340,400,40,40);
  ellipse(160,400,40,40);
  ellipse(320,500,20,20);
  ellipse(180,500,20,20);
}

void figureGround(){
  background(0,60,100);
  fill(50,100,0);
  rect(100,100,200,200);
  rect(110,110,180,180);
  rect(120,120,160,160);
  rect(130,130,140,140);
  rect(140,140,120,120);
  rect(150,150,100,100);
  rect(160,160,80,80);
  rect(170,170,60,60);
  rect(180,180,40,40);
  rect(190,190,20,20);
  rect(200,200,0,0);
}


