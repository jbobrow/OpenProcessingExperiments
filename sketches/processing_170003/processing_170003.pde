
void setup(){
  size (500,500);
}
void draw(){
  background(0,0,0);
  //cara
  strokeWeight(1);
  stroke(164,198,57);
  fill(164,198,57);
  arc(250,150,250,250,PI,TWO_PI);
  stroke(255,255,255);
  fill(255,255,255);
  ellipse(200,100,20,20);
  ellipse(300,100,20,20);
  //cuerpo
  stroke(164,198,57);
  fill(164,198,57);
  rect(125,170,250,200);
   //piernas
  rect(160,370,50,75);
  rect(295,370,50,75);
  arc(185,445,50,50,0,PI);//arcos de las puntas
  arc(320,445,50,50,0,PI);
  //manos
    //mano izquierda
  rect(50,220,50,100);
  arc(75,220,50,50,PI,TWO_PI);
  arc(75,320,50,50,0,PI);  
      //mano derecha  
  rect(400,220,50,100);
  arc(425,220,50,50,PI,TWO_PI);
  arc(425,320,50,50,0,PI);  
  //antenes
  strokeWeight(10);
  line(125,30,170,100);
  line(375,30,330,100);
}



