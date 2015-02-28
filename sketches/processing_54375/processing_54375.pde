
float x= 0;
float z=0; 
float herra=1;
float iconX=0;
float iconY=0;
float iH=30;
float iW=10;
float Tam=0;
float Ubi=0;
float R=0;
float G=0;
float B=0;
float T=255;
float Pallet=0;
float col=0;


void setup() {
  size(400, 400); 
  background(255);
}


void draw() {
  smooth();


    if (mousePressed==true) {
      if ((mouseX>40)&&(mouseX<1400)&&
        (mouseY>0)&&(mouseY<900)) {
        noCursor();
      }
    }
    else {
      cursor();
    }  
  noStroke();


  //Herramientas
  if ((mouseX>40)&&(mouseX<iH+(400))&&
    (mouseY>0)&&(mouseY<400)) {

    if ((Tam>=-20)&&(Tam!=0)) {
      Tam=random(-10, 10);
    }

    if ((Ubi>=-20)&&(Ubi!=0)) {
      Ubi=random(-20, 20);
    }

    if (herra==1) {
      if (mousePressed==true) {
        fill(R, G, B, T);
        ellipse(mouseX+Ubi, mouseY+Ubi, 20+Tam, 20+Tam);
      }
    }

    if (herra==2) {
      if (mousePressed==true) {
        stroke(R, G, B, T);
        line(mouseX+random(30)+Tam, mouseY+random(30)+Tam, mouseX+random(30)+Ubi, mouseY+random(30)+(Ubi));
        noStroke();
      }
    }


    if (herra==0) {
      if (mousePressed==true) {
        fill(R, G, B, T);
        rect(mouseX+Ubi, mouseY+Ubi, 20+Tam, 20+Tam);
      }
    }

 if (col==1) {
        R=random(255);
      G=random(255);
      B=random(255);
        } 

    if (herra==3 ) {
      if (mousePressed==true) {
        if (Tam<=-1) {
          strokeWeight(-(1+Tam));
        } 
        else {
          strokeWeight((1+Tam));
        }
        stroke(R, G, B, T);
        point(mouseX+Tam, mouseY+Ubi);
      }
    }
  }
  noStroke();
  println(R);
println(G);
println(B);
  // Campos de accion de los botones

  if (mousePressed==true) {
    if ((mouseX>iW/2)&&(mouseX<iH+(iW/2))&&
      (mouseY>iW/2)&&(mouseY<iH+(iW/2))) {

      background(255);
    }
  }


  if (mousePressed==true) {
    if ((mouseX>iW/2)&&(mouseX<iH+(iW/2))&&
      (mouseY>iH+iW)&&(mouseY<2*iH+iW)) {
      herra=1;
      Tam=0;
      Ubi=0;
    }
  }

  if (mousePressed==true) {
    if ((mouseX>iW/2)&&(mouseX<iH+(iW/2))&&
      (mouseY>2*iH+(iW/2*3))&&(mouseY<3*iH+(iW/2*3))) {
      herra=0;
      Tam=0;
      Ubi=0;
    }
  }



  if (mousePressed==true) {
    if ((mouseX>iW/2)&&(mouseX<iH+(iW/2))&&
      (mouseY>3*iH+(iW/2*4))&&(mouseY<4*iH+(iW/2*4))) {
      herra=2;
      Tam=0;
      Ubi=0;
    }
  }

  if (mousePressed==true) {
    if ((mouseX>iW/2)&&(mouseX<iH+(iW/2))&&
      (mouseY>4*iH+(iW/2*5))&&(mouseY<5*iH+(iW/2*5))) {
      herra=3;
      Tam=0;
      Ubi=0;
    }
  }

  if (mousePressed==true) {
    if ((mouseX>iW/2)&&(mouseX<iH+(iW/2))&&
      (mouseY>5*iH+(iW/2*6))&&(mouseY<6*iH+(iW/2*6))) {
      Tam=1;
      Ubi=1;
    }
  }


  if (mousePressed==true) {
    if ((mouseX>iW/2)&&(mouseX<iH+(iW/2))&&
      (mouseY>6*iH+(iW/2*7))&&(mouseY<7*iH+(iW/2*7))) {


col=1;
    }
  }





  if (mousePressed==true) {
    if ((mouseX>6)&&(mouseX<12)&&
      (mouseY>260)&&(mouseY<390)) {
      R=255-(2*(mouseY-260));
      col=0;
    }
  }

  if (mousePressed==true) {
    if ((mouseX>18)&&(mouseX<24)&&
      (mouseY>260)&&(mouseY<390)) {
      G=255-(2*(mouseY-260));
      col=0;
    }
  }

  if (mousePressed==true) {
    if ((mouseX>30)&&(mouseX<36)&&
      (mouseY>260)&&(mouseY<390)) {
      B=255-(2*(mouseY-260));
      col=0;
    }
  }

  fill(255);



  //caja herramientas

  iconX=0;
  iconY=0;
  fill (206, 206, 206);
  quad(0, 400, 40, 400, 40, 0, 0, 0);
  fill(255);
  for (iconY=0;iconY<+6; iconY++) {

    if (mousePressed==true) {
      if ((mouseX>iW/2)&&(mouseX<iH+(iW/2))&&
        (mouseY>iW/2)&&(mouseY<iH+(iW/2))) {
        if (iconY==0) {
          z=1;
        }
        else {
          z=0;
        }
      }
    }

    if (mousePressed==true) {
      if ((mouseX>iW/2)&&(mouseX<iH+(iW/2))&&
        (mouseY>iH+iW)&&(mouseY<2*iH+iW)) {
        if (iconY==1) {
          z=1;
        }
        else {
          z=0;
        }
      }
    }


    if (mousePressed==true) {
      if ((mouseX>iW/2)&&(mouseX<iH+(iW/2))&&
        (mouseY>2*iH+(iW/2*3))&&(mouseY<3*iH+(iW/2*3))) {
        if (iconY==2) {
          z=1;
        }
        else {
          z=0;
        }
      }
    }

    if (mousePressed==true) {
      if ((mouseX>iW/2)&&(mouseX<iH+(iW/2))&&
        (mouseY>3*iH+(iW/2*4))&&(mouseY<4*iH+(iW/2*4))) {
        if (iconY==3) {
          z=1;
        }
        else {
          z=0;
        }
      }
    }


    if (mousePressed==true) {
      if ((mouseX>iW/2)&&(mouseX<iH+(iW/2))&&
        (mouseY>4*iH+(iW/2*5))&&(mouseY<5*iH+(iW/2*5))) {
        if (iconY==4) {
          z=1;
        }
        else {
          z=0;
        }
      }
    }


    if (mousePressed==true) {
      if ((mouseX>iW/2)&&(mouseX<iH+(iW/2))&&
        (mouseY>5*iH+(iW/2*6))&&(mouseY<6*iH+(iW/2*6))) {
        if (iconY==5) {
          z=1;
        }
        else {
          z=0;
        }
      }
    }




noStroke();
fill(255);



    beginShape();
    vertex(iH-z, (iW-(iW/2)+(iH+(iW/2))*iconY)+z);
    vertex(iW+z, (iW-(iW/2)+(iH+(iW/2))*iconY)+z);
    vertex((iW-(iW/2))+z, (iW+(iH+(iW/2))*iconY)+z);
    vertex((iW-(iW/2))+z, (iH+(iH+(iW/2))*iconY)-z);
    vertex(iW+z, (iH+(iW/2)+(iH+(iW/2))*iconY)-z);
    vertex(iH-z, (iH+(iW/2)+(iH+(iW/2))*iconY)-z);
    vertex((iH+(iW/2))-z, (iH+(iH+(iW/2))*iconY)-z);
    vertex((iH+(iW/2))-z, (iW+(iH+(iW/2))*iconY)+z);
    endShape();
    arc((iH+(iH+(iW/2))*iconX)-z, (iW+(iH+(iW/2))*iconY)+z, iW, iW, TWO_PI-PI/2, TWO_PI);
    arc((iW+(iH+(iW/2))*iconX)+z, (iW+(iH+(iW/2))*iconY)+z, iW, iW, PI, TWO_PI-PI/2);
    arc((iW+(iH+(iW/2))*iconX)+z, (iH+(iH+(iW/2))*iconY)-z, iW, iW, PI/2, PI);
    arc((iH+(iH+(iW/2))*iconX)-z, (iH+(iH+(iW/2))*iconY)-z, iW, iW, 0, PI/2);
  }

  //el selector de color es separado debido a que el icono es un relleno especial

  beginShape();

  fill(R, G, B, T);
  vertex(iH, iW-(iW/2)+(iH+(iW/2))*iconY);
  vertex(iW, iW-(iW/2)+(iH+(iW/2))*iconY);
  vertex(iW-(iW/2), iW+(iH+(iW/2))*iconY);
  vertex(iW-(iW/2), iH+(iH+(iW/2))*iconY);
  vertex(iW, iH+(iW/2)+(iH+(iW/2))*iconY);
  vertex(iH, iH+(iW/2)+(iH+(iW/2))*iconY);
  vertex(iH+(iW/2), iH+(iH+(iW/2))*iconY);
  vertex(iH+(iW/2), iW+(iH+(iW/2))*iconY);
  endShape();
  arc(iH+(iH+(iW/2))*iconX, iW+(iH+(iW/2))*iconY, iW, iW, TWO_PI-PI/2, TWO_PI);
  arc(iW+(iH+(iW/2))*iconX, iW+(iH+(iW/2))*iconY, iW, iW, PI, TWO_PI-PI/2);
  arc(iW+(iH+(iW/2))*iconX, iH+(iH+(iW/2))*iconY, iW, iW, PI/2, PI);
  arc(iH+(iH+(iW/2))*iconX, iH+(iH+(iW/2))*iconY, iW, iW, 0, PI/2);
  strokeWeight(1);
  for (x=0;x<=130;x++) {
    stroke((255-x*2), 0, 0);
    line(6, 260+x, 12, 260+x);
    stroke(0, 255-x*2, 0);
    line(18, 260+x, 24, 260+x);

    stroke(0, 0, 255-x*2);
    line(30, 260+x, 36, 260+x);
  }
//icono de nuevo
beginShape();
fill(245);
noStroke();
vertex(12,10);//esquina superior ezquierda
vertex(12,30);//esquina inferior derecha
vertex(27,30);
vertex(27,18);
vertex(24,10);
vertex(12,10);

endShape();
fill(100);
triangle(27,18,22,10,22,18);

strokeWeight(2);
stroke(0,203,0);
line(20,22, 20,28);
line(17,25, 23,25);


//icono de la bola
noStroke();
fill(100);
ellipse(20,55,20,20);

//icono del cuadrado
rect(10,80,20,20);


//icono del spry de rallas

stroke(100);
strokeWeight(1);
line(10,115,30,135);
line(15,125,25,116);
line(11,130,16,130);
line(10,120,10,125);


//icono del punto
ellipse(20,160,3,3);



//icono de aleatorio
ellipse(20,200,3,3);
ellipse(15,195,4,4);
ellipse(15,190,6,6);
ellipse(25,185,2,2);
ellipse(25,196,4,4);
}


