
int balloon,cheekscolorred,cheekscolorgreen,cheekscolorblue;

void setup (){
  balloon=75;
  cheekscolorred=242;
  cheekscolorgreen=221;
  cheekscolorblue=135;
  size(600,600);
  //sky
  fill(95,224,255);
  stroke(95,224,255);
  rect(0,0,600,600);
  //ground
  fill(40,188,46);
  stroke(40,188,46);
  rect(0,500,600,200);
  //sun
  fill(242,2509,28);
  stroke(242,2509,28);
  ellipse(0,0,200,200);
  //clouds
  fill(255);
  stroke(255);
  ellipse(150,150,200,50);
  //balloon tube
  fill(75,95,245);
  stroke(75,95,245);
  rect(280,530,100,30);
  //head
  fill(242,221,135);
  stroke(242,221,135);
  ellipse(650,450,600,600);
  //eyes
  fill(255);
  stroke(255);
  ellipse(450,350,50,100);
  //hatbottom
  fill(0);
  stroke(0);
  rect(350,175,250,50);
  //hattop
  rect(450,25,150,150);
  //hatring
  fill(255);
  rect(450,150,150,10);
  //nose
  fill(242,221,135);
  stroke(242,221,135);
  triangle(328,435,353,410,353,435);

}


void draw (){
  //cheeks
  fill(cheekscolorred,cheekscolorgreen,cheekscolorblue);
  stroke(cheekscolorred,cheekscolorgreen,cheekscolorblue);
  ellipse(450,525,100,100);
  //pupils
  fill(0);
  stroke(0);
  ellipse(435,350,10,10);
  //balloon ball
  fill(75,95,245);
  stroke(75,95,245);
  ellipse (275,535,balloon,balloon);
  balloon=balloon+1;
  cheekscolorred=cheekscolorred+1;
  cheekscolorgreen=cheekscolorgreen-1;
  cheekscolorblue=cheekscolorblue-1;

}
