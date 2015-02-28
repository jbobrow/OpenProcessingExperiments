
void setup (){
  size(500,500);
  background(170);
}

void draw() {

 translate(width/2,height/2);
  for (int i=0;i<360;i+=10) 
  {
    //je fais un + avec de la transparence et des extrémités carrés
    stroke(150,200);
    strokeCap(SQUARE);
    strokeWeight(50);
    rotate(radians(10));
    //ligne verticale
  line(150,25,150,275);
  //ligne horizontale
  stroke(200,200);
  line(25,150,275,150);

  
  //troisième +, plus au centre
  strokeWeight(1);
 line(40,20,40,60);
 line(20,40,60,40);
  }
  noLoop();
}


