

int esp = 30; 
int a,b,ac,bc;

void setup(){
  size(500,500);
}


//"tablero"
void draw(){

  for(int j=0 ; j<20 ; j++){

    for(int i=0 ; i<20 ; i++){

      if( (i+j) % 2 == 0 ){ //cuadrados negros

        fill(ac+mouseY,bc+mouseY,mouseX);
        ellipse(a+10,b+10,30,30);

      }

      else{

        fill(255-(ac+mouseY),130-(bc+mouseY),mouseX);//cambio de color por movimiento del mouse
        ellipse(a+5,b+5,15,15);
      }
      rect( i * 25 , j * 25 , 25 , 25 );

    }

  }

  for (int y = 0; y < height; y += esp){
    for (int x = 0; x < width; x += esp){
      helice(x, y);
    }
  }
}

void helice(int _x, int _y){
  float d = dist(mouseX, mouseY, _x, _y);
  pushMatrix(); // 
  translate(_x, _y);
  rotate(d * millis()*0.000008); 
  fill(255-ac,255-bc,(mouseX+mouseY)/2);
  noStroke();
  beginShape();//estrella
  vertex(308, 260);
  vertex(305, 266);
  vertex(297, 266);
  vertex(304, 269);
  vertex(302, 276);
  vertex(308, 271);
  vertex(315, 277);
  vertex(313, 270);
  vertex(319, 267);
  vertex(310, 266);
  endShape(CLOSE);


  popMatrix();
}





