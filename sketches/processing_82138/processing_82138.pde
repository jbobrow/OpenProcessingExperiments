
void setup (){
  size (500,500);
  background(255);
}

void draw(){
  translate(width/2,height/2);
  for (int i=0;i<360;i+=20)
  { //première ligne
  
  strokeWeight(2);
  rotate(radians(30));
  //plus du centre
  line(10,10,10,20);
  line(5,15,15,15);
  // deuxième ligne de plus
  stroke(100);
  line(50,40,50,80);
  line(30,60,70,60);
  //même choses sous la ligne pour faire effet de transparence
strokeWeight(10);
stroke(0,150);
  line(50,40,50,80);
  line(30,60,70,60);
  // troisième ligne de plus
  strokeCap(SQUARE);
  strokeWeight(5);
  line (200,100,200,300);
  line(100,200,300,200);
  //troisième ligne en plus épais
  strokeCap(ROUND);
 strokeWeight(30);
  stroke(0,150);
  line(200,100,200,300);
  line(100,200,300,200);
  }
  noLoop();
}


