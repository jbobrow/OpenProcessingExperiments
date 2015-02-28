
int a=40;
float velocidad=0;
float xpos; 
float ypos;
int sz;


int botonColor1X = 140, botonColor1Y = 727, botonColor1Size = 15;
int botonColor2X = 155, botonColor2Y = 727, botonColor2Size = 15;
//nuevo3x
int botonColor3X = 170, botonColor3Y = 727, botonColor3Size = 15;

int botonColor4X = 185, botonColor4Y = 727, botonColor4Size = 15;
int botonColor5X = 200, botonColor5Y = 727, botonColor5Size = 15;
int botonColor6X = 215, botonColor6Y = 727, botonColor6Size = 15;
int botonColor7X = 230, botonColor7Y = 727, botonColor7Size = 15;
int botonColor8X = 245, botonColor8Y = 727, botonColor8Size = 15;
int botonColor9X = 260, botonColor9Y = 727, botonColor9Size = 15;
int botonColor10X = 275, botonColor10Y = 727, botonColor10Size = 15;
int botonColor11X = 290, botonColor11Y = 727, botonColor11Size = 15;
int botonColor12X = 305, botonColor12Y = 727, botonColor12Size = 15;
int botonColor13X = 320, botonColor13Y = 727, botonColor13Size = 15;
int botonColor14X = 335, botonColor14Y = 727, botonColor14Size = 15;
int botonColor15X = 350, botonColor15Y = 727, botonColor15Size = 15;

//int botonTool1X = 150, botonTool1Y = 700, botonTool1Size = 20;
int botonTool2X = 170, botonTool2Y = 700, botonTool2Size = 20;
int botonTool3X = 190, botonTool3Y = 700, botonTool3Size = 20;
///nuevos tools 4-10

int botonTool4X = 210, botonTool4Y = 700, botonTool4Size = 20;
int botonTool5X = 230, botonTool5Y = 700, botonTool5Size = 20;
int botonTool6X = 250, botonTool6Y = 700, botonTool6Size = 20;
//int botonTool7X = 270, botonTool7Y = 700, botonTool7Size = 20;
//int botonTool8X = 290, botonTool8Y = 700, botonTool8Size = 20;
//int botonTool9X = 310, botonTool9Y = 700, botonTool9Size = 20;
int botonTool10X = 270, botonTool10Y = 700, botonTool10Size = 20;
int botonTool11X = 290, botonTool11Y = 700, botonTool11Size = 20;
///nuevos tools 4-10

int botonBorrarX = 785, botonBorrarY = 15, botonBorrarSize = 20;
int botonBorraX = 785, botonBorraY = 35, botonBorraSize = 100;
int concualcolor = 0, concualtool = 0, borrar = 0;

void setup() {
  size(800, 750);
  background(255);
  xpos = width/70;
  ypos = height/70;
  sz = width/70;
}

void draw() {
  if (borrar == 1) {
    background(250);
    borrar = 0;
  }
  if (borrar== 2) {
    background(0);
    borrar = 0;
  }



  /////////marco 

  smooth();






  PFont f= loadFont("RosewoodStd-Regular-10.vlw");

  textFont(f, 40);
  stroke(255);
  fill(100, 50);
  text("Estrellas", 10, 40);

  PFont f2= loadFont("RosewoodStd-Regular-3.vlw");
  textFont(f2, 32);
  fill(255, 120);

  text("Pincel", 10, 714);
  text("color", 10, 743);



  fill(205, 20);
  rect(0, 685, 380, 68);
  fill(200, 20);
  rect(780, 0, 40, 80);



  //colores
  strokeWeight(1);
  fill(0, 150, 200);
  rect(botonColor1X, botonColor1Y, botonColor1Size, botonColor1Size);

  fill(0, 200, 2);
  rect(botonColor2X, botonColor2Y, botonColor2Size, botonColor2Size);
  //nuevox3
  fill(250, 0, 0);

  rect(botonColor3X, botonColor3Y, botonColor3Size, botonColor3Size); 

  //nuevos colores 4-15
  fill(0, 48, 149);
  rect(botonColor4X, botonColor4Y, botonColor4Size, botonColor4Size); 

  fill(242, 184, 22);
  rect(botonColor5X, botonColor5Y, botonColor5Size, botonColor5Size); 

  fill(242, 22, 165);
  rect(botonColor6X, botonColor6Y, botonColor6Size, botonColor6Size); 

  fill(22, 242, 240);
  rect(botonColor7X, botonColor7Y, botonColor7Size, botonColor7Size); 

  fill(188, 160, 186);
  rect(botonColor8X, botonColor8Y, botonColor8Size, botonColor8Size); 

  fill(203, 12, 191);
  rect(botonColor9X, botonColor9Y, botonColor9Size, botonColor9Size); 

  fill(248, 252, 43);
  rect(botonColor10X, botonColor10Y, botonColor10Size, botonColor10Size); 

  fill(43, 252, 51);
  rect(botonColor11X, botonColor11Y, botonColor11Size, botonColor11Size); 

  fill(172, 250, 175);
  rect(botonColor12X, botonColor12Y, botonColor12Size, botonColor12Size); 

  fill(152, 12, 15);
  rect(botonColor13X, botonColor13Y, botonColor13Size, botonColor13Size); 

  fill(0, 14, 70);
  rect(botonColor14X, botonColor14Y, botonColor14Size, botonColor14Size); 

  fill(193, 108, 16);
  rect(botonColor15X, botonColor15Y, botonColor15Size, botonColor15Size); 




  fill(100);
  rect(botonTool2X, botonTool2Y, botonTool2Size, botonTool2Size);

  //toolnueva

  fill(170);
  rect(botonTool3X, botonTool3Y, botonTool3Size, botonTool3Size);

  //tools nueva 4-10

  fill(140);
  rect(botonTool4X, botonTool4Y, botonTool4Size, botonTool4Size);



  fill(100);
  rect(botonTool5X, botonTool5Y, botonTool5Size, botonTool5Size);


  fill(170);
  rect(botonTool6X, botonTool6Y, botonTool6Size, botonTool6Size);



  fill(140);
  rect(botonTool10X, botonTool10Y, botonTool10Size, botonTool10Size);

  ////
  fill(250);
  rect(botonBorrarX, botonBorrarY, botonBorrarSize, botonBorrarSize);

  fill(0);
  rect(botonBorraX, botonBorraY, botonBorraSize, botonBorraSize);

  pushMatrix();
  translate(width/2, height/2);
  Star();
  popMatrix();

  textFont(f2, 15);
  fill(255);

  text("1", 177, 714);
  text("2", 197, 714);
  text("3", 217, 714);
  text("4", 237, 714);
  text("5", 257, 714);
  text("6", 277, 714);
  text("guardar", 297, 714);

  //define que color se va a usar
  if ((mousePressed == true)&&(mouseX>0)&&(mouseX<800)&&(mouseY>0)&&(mouseY<670)) {
    if (concualcolor == 1) {
      stroke(0, 150, 200, 100);
      fill(0, 150, 200, 100);
    }
    if (concualcolor == 2) {
      stroke(0, 200, 2, 100);
      fill(0, 200, 2, 100);


      //nuwvo
    }
    if (concualcolor == 3) {
      stroke(200, 2, 0, 100);
      fill(200, 2, 0, 100);
    }
    if (concualcolor == 4) {
      stroke(0, 48, 149, 100);
      fill(0, 48, 149);
    }
    if (concualcolor == 5) {
      stroke(242, 184, 22, 100);
      fill(242, 184, 22);
    }
    if (concualcolor == 6) {
      stroke(242, 22, 165, 100);
      fill(242, 22, 165);
    }

    if (concualcolor == 7) {
      stroke(22, 242, 240, 100);

      fill(22, 242, 240);
    }


    if (concualcolor == 8) {
      stroke(188, 160, 186, 100);
      fill(188, 180, 186+random (100), 100);
    }


    if (concualcolor == 9) {
      stroke(203, 12, 191, 100);
      fill(203, 12, 191);
    }


    if (concualcolor == 10) {
      stroke(248, 253, 43, 100);
      fill(248, 252, 43);
    }


    if (concualcolor == 11) {
      stroke(43, 252, 51, 100);
      fill(43, 252, 51);
    }


    if (concualcolor == 12) {
      stroke(172, 250, 175, 20);
      fill(172, 250, 175, 100);
    }


    if (concualcolor == 13) {
      stroke(155, 12, 15, 100);
      fill(152, 12, 15);
    }


    if (concualcolor == 14) {
      stroke(0, 14, 70, 100);
      fill(0, 14, 70);
    }


    if (concualcolor == 15) {
      stroke(193, 108, 16, 100);
      fill(193, 108, 16);
    }


    if (concualtool ==2) {
      translate(400, 350);
      rotate(velocidad);
      velocidad=velocidad-PI/4;

      line(mouseX-500, mouseY-300, 8+a, 8);
    }
    //estrella
    if (concualtool == 3) {
      translate(400, 350);
      rotate(velocidad);
      velocidad=velocidad-PI/6;
      line(mouseX-300, mouseY-300, 30, 30);
    }  
    //tool 4 -10

      if (concualtool == 4) {
      translate(400, 350);
      rotate(velocidad);
      velocidad=velocidad-PI/6;
      ellipse(mouseX-250, mouseY-250, 1*PI, 1*PI);
      ellipse(mouseX-300, mouseY-300, 1*PI, 1*PI);
      ellipse(mouseX-350, mouseY-350, 1*PI, 1*PI);
      ellipse(mouseX-400, mouseY-400, 1*PI, 1*PI);
    }


    if (concualtool == 5) {

      translate(400, 350);
      velocidad=velocidad-PI/5;
      rotate(velocidad);
      line(mouseX, mouseY, 30, 30);
    }

    if (concualtool == 6) {
      translate(400, 350);
      velocidad=velocidad-PI/10;
      rotate(velocidad);
      line(mouseX-200, mouseY-200, 30, 30);
    }



    if (concualtool == 10) {
      translate(400, 350);
      velocidad=velocidad-PI/5 ;
      rotate(velocidad);
      ellipse (mouseX, mouseY, 5, 5);
      ellipse (mouseX-482, mouseY-482, 3, 3);
    }
  }
}

void mouseReleased() {
  if ((mouseX>=botonColor1X)&&
    (mouseX<=botonColor1X+botonColor1Size)&&
    (mouseY>=botonColor1Y)&&
    (mouseY<=botonColor1Y+botonColor1Size)) {
    concualcolor = 1;
  }
  if ((mouseX>=botonColor2X)&&
    (mouseX<=botonColor2X+botonColor2Size)&&
    (mouseY>=botonColor2Y)&&
    (mouseY<=botonColor2Y+botonColor2Size)) {
    concualcolor = 2;
  }

  //nuevo

  if ((mouseX>=botonColor3X)&&
    (mouseX<=botonColor3X+botonColor3Size)&&
    (mouseY>=botonColor3Y)&&
    (mouseY<=botonColor3Y+botonColor3Size)) {
    concualcolor = 3;
  }

  if ((mouseX>=botonColor4X)&&
    (mouseX<=botonColor4X+botonColor4Size)&&
    (mouseY>=botonColor4Y)&&
    (mouseY<=botonColor4Y+botonColor4Size)) {
    concualcolor = 4;
  }

  if ((mouseX>=botonColor5X)&&
    (mouseX<=botonColor5X+botonColor5Size)&&
    (mouseY>=botonColor5Y)&&
    (mouseY<=botonColor5Y+botonColor5Size)) {
    concualcolor = 5;
  }
  if ((mouseX>=botonColor6X)&&
    (mouseX<=botonColor6X+botonColor6Size)&&
    (mouseY>=botonColor6Y)&&
    (mouseY<=botonColor6Y+botonColor6Size)) {
    concualcolor = 6;
  }

  if ((mouseX>=botonColor7X)&&
    (mouseX<=botonColor7X+botonColor7Size)&&
    (mouseY>=botonColor7Y)&&
    (mouseY<=botonColor7Y+botonColor7Size)) {
    concualcolor = 7;
  }



  if ((mouseX>=botonColor8X)&&
    (mouseX<=botonColor8X+botonColor8Size)&&
    (mouseY>=botonColor8Y)&&
    (mouseY<=botonColor8Y+botonColor8Size)) {
    concualcolor = 8;
  }

  if ((mouseX>=botonColor9X)&&
    (mouseX<=botonColor9X+botonColor9Size)&&
    (mouseY>=botonColor9Y)&&
    (mouseY<=botonColor9Y+botonColor9Size)) {
    concualcolor = 9;
  }

  if ((mouseX>=botonColor10X)&&
    (mouseX<=botonColor10X+botonColor10Size)&&
    (mouseY>=botonColor10Y)&&
    (mouseY<=botonColor10Y+botonColor10Size)) {
    concualcolor = 10;
  }

  if ((mouseX>=botonColor11X)&&
    (mouseX<=botonColor11X+botonColor11Size)&&
    (mouseY>=botonColor11Y)&&
    (mouseY<=botonColor11Y+botonColor11Size)) {
    concualcolor = 11;
  }

  if ((mouseX>=botonColor12X)&&
    (mouseX<=botonColor12X+botonColor12Size)&&
    (mouseY>=botonColor12Y)&&
    (mouseY<=botonColor12Y+botonColor12Size)) {
    concualcolor = 12;
  }

  if ((mouseX>=botonColor13X)&&
    (mouseX<=botonColor13X+botonColor13Size)&&
    (mouseY>=botonColor13Y)&&
    (mouseY<=botonColor13Y+botonColor13Size)) {
    concualcolor = 13;
  }

  if ((mouseX>=botonColor14X)&&
    (mouseX<=botonColor14X+botonColor14Size)&&
    (mouseY>=botonColor14Y)&&
    (mouseY<=botonColor14Y+botonColor14Size)) {
    concualcolor =14;
  }

  if ((mouseX>=botonColor15X)&&
    (mouseX<=botonColor15X+botonColor15Size)&&
    (mouseY>=botonColor15Y)&&
    (mouseY<=botonColor15Y+botonColor15Size)) {
    concualcolor = 15;
  }



  if ((mouseX>=botonTool2X)&&
    (mouseX<=botonTool2X+botonTool2Size)&&
    (mouseY>=botonTool2Y)&&
    (mouseY<=botonTool2Y+botonTool2Size)) {
    concualtool = 2;
  }

  //nuevotool

  if ((mouseX>=botonTool3X)&&
    (mouseX<=botonTool3X+botonTool3Size)&&
    (mouseY>=botonTool3Y)&&
    (mouseY<=botonTool3Y+botonTool3Size)) {
    concualtool = 3;
  }

  if ((mouseX>=botonTool4X)&&
    (mouseX<=botonTool4X+botonTool4Size)&&
    (mouseY>=botonTool4Y)&&
    (mouseY<=botonTool4Y+botonTool4Size)) {
    concualtool = 4;
  }
  if ((mouseX>=botonTool5X)&&
    (mouseX<=botonTool5X+botonTool5Size)&&
    (mouseY>=botonTool5Y)&&
    (mouseY<=botonTool5Y+botonTool5Size)) {
    concualtool = 5;
  }

  if ((mouseX>=botonTool6X)&&
    (mouseX<=botonTool6X+botonTool6Size)&&
    (mouseY>=botonTool6Y)&&
    (mouseY<=botonTool6Y+botonTool6Size)) {
    concualtool = 6;
  }


  if ((mouseX>=botonTool10X)&&
    (mouseX<=botonTool10X+botonTool10Size)&&
    (mouseY>=botonTool10Y)&&
    (mouseY<=botonTool10Y+botonTool10Size)) {
    concualtool = 10;
  }
  
  if ((mouseX>=botonTool11X)&&
    (mouseX<=botonTool11X+botonTool11Size)&&
    (mouseY>=botonTool11Y)&&
    (mouseY<=botonTool11Y+botonTool11Size)) {
    save("test.jpg"); 
     println("test saved");
  }

  if ((mouseX>=botonBorrarX)&&
    (mouseX<=botonBorrarX+botonBorrarSize)&&
    (mouseY>=botonBorrarY)&&
    (mouseY<=botonBorrarY+botonBorrarSize)) {
    borrar = 1;
  }

  if ((mouseX>=botonBorraX)&&
    (mouseX<=botonBorraX+botonBorraSize)&&
    (mouseY>=botonBorraY)&&
    (mouseY<=botonBorraY+botonBorraSize)) {
    borrar = 2;
  }
}


void Star() {

  smooth();
  fill(255);
  stroke (255, 50);
  int cont=0;

  translate(-258, 322);
  while (cont <2) {
    beginShape();
    vertex(xpos/cont, ypos/cont-sz/2);
    vertex(xpos/cont+sz/6, ypos/cont-sz/6);
    vertex(xpos/cont+sz/2, ypos/cont-sz/11);
    vertex(xpos/cont +sz/4, ypos/cont+sz/8);
    vertex(xpos/cont+sz/3, ypos/cont+sz/2);
    vertex(xpos/cont, ypos/cont+sz/3);
    vertex(xpos/cont-sz/3, ypos/cont+sz/2);
    vertex(xpos/cont-sz/4, ypos/cont+sz/6);
    vertex(xpos/cont-sz/2, ypos/cont-sz/9);
    vertex(xpos/cont-sz/6, ypos/cont-sz/6);
    endShape(CLOSE); 

    cont = cont +1;
  }
}



