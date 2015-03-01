
//Practica 2 Taller de Videojocs UPF 2015
//Title: n0_iDeas
//empesamos

void setup (){
size(255,255);
background(random(120), random(255), random(255),80);
}

void draw (){
  //Cinc Circumferències que es fan grans i petites
  fill (mouseX, mouseY, 0);
   line(mouseX-10, mouseY-10, mouseX+10, mouseY+10);
   line(mouseX-10, mouseY+10, mouseX+10, mouseY-10);
  ellipse (mouseX, mouseY, mouseY/7, mouseX/10);
  ellipse (mouseX+40, mouseY+40, mouseY/7, mouseX/10);
  ellipse (mouseX-40, mouseY+40, mouseY/7, mouseX/10);
  ellipse (mouseX+40, mouseY-40, mouseY/7, mouseX/10);
  ellipse (mouseX-40, mouseY-40, mouseY/7, mouseX/10);
  

  
  //Text n0_iDeas
if (mouseX>=(width/2-20) && mouseX<=(width/2+20) && (mouseY>=height/2-20) && (mouseY<=height/2+20)) {
if (mousePressed){
        fill(255);
        textSize(50);
        textAlign(CENTER);
        text("n0_iDeas",width/2,height/8*5);
}
}

  //TriangleInferiorIzquierda
  fill (random(0,255), 50, 0, 60);
  triangle (width/8, height/8*7, width/4, height/8*5, width/8*3, height/8*7);
  
  //TriangleSuperiorDerecha
    fill (random(0,255), 50, 0, 60);
  triangle (width/8*5, height/8, width/8*6, height/8*3, width/8*7, height/8);


//AbstraccionFondo
//EsquinaSuperiorIzquierda
fill(0,0,random(255),60);
stroke(255);
quad(random(120),random(120),random(120),random(120),random(120),random(120),random(120),random(120));

//EsquinaSuperiorDerecha
stroke(0,random(255),random(255));
line(125,125,random(115,255),random(0,135));

//EsquinaInferiorIzquierda
stroke(0,random(255),random(255));
line(125,125,random(0,145),random(115,255));

//EsquinaInferiorDerecha
fill(0,random(255),0,60);
stroke(255);
quad(random(130,255),random(130,255),random(130,255),random(130,255),random(130,250),random(130,255),random(130,255),random(130,255));

}
