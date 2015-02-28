
void setup () {

  size (600, 600);
  background (200, 0, 0);
  //noStroke();
  smooth(); 
  noLoop();
}

void draw () {

  //background (234, 0, 0);
  for (int y =0; y < height; y =y +50){

    fill (0, 200, 0); //preenche a forma, neste caso preenche a elipse com a cor a que corresponde este numero rgb, neste caso é a cor verde  
    stroke (0,255,0);//cor do contorno também poderia ser em rgb 
    strokeWeight(15);
    ellipse (width, y, 150,150);  
    
    for (int x = 0; x < width; x = x + 150) {// isto é um ciclo que começa num lugar x

    //noStroke();
    ellipse (x , y, 150, 150);//os dois primeiros valores correspondem as coordenadas x e y respectivamente, as duas ultimas são a largura e altura
  
    
    }

}
  stroke(0, 255, 0);
  strokeWeight(50);
  line (width/2, 0, width/2, height);
  line (width/4, 0, width/4, height);
  line (width/2+width/4, 0, width/2+width/4, height);
}

