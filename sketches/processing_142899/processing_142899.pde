
PFont font;
int fa, fb, fc;
int v1, v2, v3;
int inili=40;
PImage imgCa, imgCb, imgCc;
String a, t, i;
int btn=30;
int conta1, conta2, conta3; //para contar cuantas veces se ha tirado el dado
String verso, verso2, verso3;
String linea1, linea2, linea3, linea4, linea5, linea6;
String [] li1= new String[18];//almacenar varios versos en una sola linea
String[] b = { 
  "Soft sympathetic patch of ground", "Oh beautiful scene in decay", 
  "There to remind us that nothing stays the same", "If this be my last night on earth", 
  "Let me remember this for all that is worth", "Wild fruits, sands, override on the vine"
};
String[] c = { 
  "Wild creatures come gather round", "The birds they feed before they take flight", 
  "As the weary sun succumbs to their heavy eyelids", "If this be my last night on earth", 
  "This is your last night on earth", "They sing to me their drunken tunes"
};
String[] d = { 
  "To suckle their wine", "Remember us for all that we were", 
  "Take sweet memories with you", "with you", 
  "Plant those seeds somewhere new", "That is life"
};
    /* @pjs preload="a0.jpg,a1.jpg,a2.jpg,a3.jpg,a4.jpg,a5.jpg,a6.jpg,
    b0.jpg,b1.jpg,b2.jpg,b3.jpg,b4.jpg,b5.jpg,b6.jpg,
    c0.jpg,c1.jpg,c2.jpg,c3.jpg,c4.jpg,c5.jpg,c6.jpg"; */
void setup() {

  size(800, 700);
  font = loadFont("Serif-48.vlw");
  textFont(font);
  a="Click on the buttons and build a poem";
  t="POEM FINISHED";
  i="To start again please push C";
  conta1=0;
  conta2=0;
  conta3=0;
  v1=conta1;
  v2=conta2;
  v3=conta3;
  verso=" ";
  verso2=" ";
  verso3=" ";
  linea1=" ";
  linea2=" ";
  linea3=" ";
  linea4=" ";
  linea5=" ";
  linea6=" ";
  fa=0;
  fb=0;
  fc=0;
  smooth();
}

void draw() {
  background(155, 134, 109);//219, 201, 179
  fill(0);
  textSize(40);
  text(a, width/2-textWidth(a)/2, 50);
  vineta(25);
  dado(115);
  vineta(280);
  dado(370);
  vineta(540);
  dado(630);
  textSize(15);
  fill(255);
  text(v1, 125, 445);
  text(v2, 380, 445);
  text(v3, 640, 445);
  fill(0);
  text(t, width/2-textWidth(t)/2, 495);
  fill(232, 222, 211);
  strokeWeight(2);
  stroke(0);
  rect(25, 500, 750, 165);
  fill(0);
  textSize(12);
  text(i, width/2-textWidth(i)/2, 685);

  //-------FOTOS
  imgCa=loadImage("a"+fa+".jpg");
  image(imgCa, 25, 101);
  imgCb=loadImage("b"+fb+".jpg");
  image(imgCb, 280, 101);
  imgCc=loadImage("c"+fc+".jpg");
  image(imgCc, 540, 101);

  //----FRASE 1
  textSize(10);
  fill(255);
  text(verso, 140- textWidth(verso)/2, 393);

  //----FRASE 2
  text(verso2, 395- textWidth(verso2)/2, 393);

  //----FRASE 3
  text(verso3, 655- textWidth(verso3)/2, 393);

  //--------LINEAS DE 3 FRASES
  textSize(14);
  fill(0);
  text(linea1, inili, 525);
  text(linea2, inili, 550);
  text(linea3, inili, 575);
  text(linea4, inili, 600);
  text(linea5, inili, 625);
  text(linea6, inili, 650);

  //-------ROLL OVERS EN BOTONES
  if (mousePressed) {
    if (mouseX>115 && mouseX<165 && mouseY>425 && mouseY<475) {
      if (conta1<6) {
        fill(0);
        rect(115, 425, btn, btn);
      }
    }
    else if (mouseX>370 && mouseX<420 && mouseY>425 && mouseY<475) {
      if (conta2<6) {
        fill(0);
        rect(370, 425, btn, btn);
      }
    }
    else if (mouseX>630 && mouseX<680 && mouseY>425 && mouseY<475) {
      if (conta3<6) {
        fill(0);
        rect(630, 425, btn, btn);
      }
    }
  }


  if (keyPressed == true) { 
    if (key== 'c') {
        conta1=0;
  conta2=0;
  conta3=0;
  v1=conta1;
  v2=conta2;
  v3=conta3;
  verso=" ";
  verso2=" ";
  verso3=" ";
  linea1=" ";
  linea2=" ";
  linea3=" ";
  linea4=" ";
  linea5=" ";
  linea6=" ";
  fa=0;
  fb=0;
  fc=0;
    }
  }

  println(conta1);
}

void mouseReleased() {
  if (mouseX>115 && mouseX<165 && mouseY>425 && mouseY<475) {
    if (conta1<7) {
      conta1++; //cada vez que se oprime el boton aumenta el valor
    }
    if (conta1==1) {
      fa=int(random(1, 6));
      verso= b[int(random(6))];
      li1[0]=verso;
      linea1=li1[0] + ". ";
      v1=conta1;
    }
    else if (conta1==2) {
      fa=int(random(1, 6));
      verso= b[int(random(6))];
      li1[3]=verso;
      linea2=li1[3] + ". ";
      v1=conta1;
    }
    else if (conta1==3) {
      fa=int(random(1, 6));
      verso= b[int(random(6))];
      li1[6]=verso;
      linea3=li1[6] + ". ";
      v1=conta1;
    }
    else if (conta1==4) {
      fa=int(random(1, 6));
      verso= b[int(random(6))];
      li1[9]=verso;
      linea4=li1[9] + ". ";
      v1=conta1;
    }
    else if (conta1==5) {
      fa=int(random(1, 6));
      verso= b[int(random(6))];
      li1[12]=verso;
      linea5=li1[12] + ". ";
      v1=conta1;
    }
    else if (conta1==6) {
      fa=int(random(1, 6));
      verso= b[int(random(6))];
      li1[15]=verso;
      linea6=li1[15] + ". ";
      v1=conta1;
    }
  }
  else if (mouseX>370 && mouseX<420 && mouseY>425 && mouseY<475) {
    if (conta2<7) {
      conta2++;
    }
    if (conta2==1) {
      fb=int(random(1, 6));
      verso2= c[int(random(6))];
      li1[1]=verso2;
      linea1+=li1[1] + ". ";
      v2=conta2;
    }
    else if (conta2==2) {
      fb=int(random(1, 6));
      verso2= c[int(random(6))];
      li1[4]=verso2;
      linea2+=li1[4] + ". ";
      v2=conta2;
    }
    else if (conta2==3) {
      fb=int(random(1, 6));
      verso2= c[int(random(6))];
      li1[7]=verso2;
      linea3+=li1[7] + ". ";
      v2=conta2;
    }
    else if (conta2==4) {
      fb=int(random(1, 6));
      verso2= c[int(random(6))];
      li1[10]=verso2;
      linea4+=li1[10] + ". ";
      v2=conta2;
    }
    else if (conta2==5) {
      fb=int(random(1, 6));
      verso2= c[int(random(6))];
      li1[13]=verso2;
      linea5+=li1[13] + ". ";
      v2=conta2;
    }
    else if (conta2==6) {
      fb=int(random(1, 6));
      verso2= c[int(random(6))];
      li1[16]=verso2;
      linea6+=li1[16] + ". ";
      v2=conta2;
    }
  }
  else if (mouseX>630 && mouseX<680 && mouseY>425 && mouseY<475) {
    if (conta3<7) {
      conta3++;
    }
    if (conta3==1) {
      fc=int(random(1, 6));
      verso3= d[int(random(6))];
      li1[2]=verso3;
      linea1+=li1[2] + ".";
      v3=conta3;
    }
    else if (conta3==2) {
      fc=int(random(1, 6));
      verso3= d[int(random(6))];
      li1[5]=verso3;
      linea2+=li1[5] + ". ";
      v3=conta3;
    }
    else if (conta3==3) {
      fc=int(random(1, 6));
      verso3= d[int(random(6))];
      li1[8]=verso3;
      linea3+=li1[8] + ". ";
      v3=conta3;
    }
    else if (conta3==4) {
      fc=int(random(1, 6));
      verso3= d[int(random(6))];
      li1[11]=verso3;
      linea4+=li1[11] + ". ";
      v3=conta3;
    }
    else if (conta3==5) {
      fc=int(random(1, 6));
      verso3= d[int(random(6))];
      li1[14]=verso3;
      linea5+=li1[14] + ". ";
      v3=conta3;
    }
    else if (conta3==6) {
      fc=int(random(1, 6));
      verso3= d[int(random(6))];
      li1[17]=verso3;
      linea6+=li1[17] + ". ";
      v3=conta3;
    }
  }
}


//-------- FUNCIONES CREADAS POR MI----------

void vineta(int x) {
  noStroke();
  fill(150, 80);
  rect(x+5, 105, 233, 303);
  strokeWeight(6);
  stroke(40);
  fill(40);
  rect(x, 100, 230, 300);
}

void dado(int x) {
  strokeWeight(1);
  stroke(30);
  fill(40);
  rect(x, 425, btn, btn);
}



