
void setup () {


  size (500,500);
  background (0);
  smooth();
  noCursor();
}


void draw() {

  noStroke();
  rectMode(CENTER);

  fill(255);
  rect (width/2,height/2,width,height);
  
  //cuello

  fill(200,0,120);
  rectMode(CENTER);
  rect(width/2,height/2+60,60,40);
  
  //HEAD 

  fill(map(mouseX,0,width,50,255),30,100);
  ellipse (width/2,height-300,280,230);



  //EYES

  //eye#1
  fill(255);
  ellipse (width/2-50,height-300,80,80);

  //eye#2
  fill(255);
  ellipse (width/2+50,height-300,80,80);







  //Coloreye#1
  fill(4,160,170);
  ellipse (width/2-60-map(mouseX,0,width,0,-20),height-305,40,40);

  //Coloreye#2
  fill(4,160,170);
  ellipse (width/2+40-map(mouseX,0,width,0,-20),height-305,40,40);



  //Brighteye#1
  fill(255);
  ellipse (width/2-50-map(mouseX,0,width,0,-20),height-305,20,20);

  //Brighteye#2
  fill(255);
  ellipse (width/2+50-map(mouseX,0,width,0,-20),height-305,20,20);



  //NOUSE
  fill(0);
  ellipse (width/2,height-250,20,10);




  //MOUTH
  fill(0);
  rect (width/2,height-225,90,25);

  //CIRCULO
  fill(0);
  ellipse (width/2,height-210,90,55);

  //DIENTES
  fill(255);
  rect (width/2,height-233,90,10);

  //BODY
  fill(200,0,120);
  rect (width/2,height-100,250,150);
}




