
PImage f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,f21,f22,f23,f24,f25,f26,f27,f28,f29,f30,f31,f32,f33;
Boto b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,b18,b19,b20,b21,b22,b23,b24,b25,b26,b27,b28,b29,b30,b31,b32,b33;
int pantalla=1;
boolean pasa = true;

void setup(){
  size(135, 130);
  f1 = loadImage("1a.gif");f2= loadImage("2a.gif");f3= loadImage("3a.gif");f4= loadImage("4a.gif");f5= loadImage("5a.gif");f6= loadImage("6a.gif");f7= loadImage("7a.gif");f8= loadImage("8a.gif");f9= loadImage("9a.gif");f10= loadImage("10a.gif");
 f11= loadImage("11a.gif");f12= loadImage("12a.gif");f13= loadImage("13a.gif");f14= loadImage("14a.gif");f15= loadImage("15a.gif");f16= loadImage("16a.gif");f17= loadImage("17a.gif");f18= loadImage("18a.gif");f19= loadImage("19a.gif");f20= loadImage("20a.gif");
 f21= loadImage("21a.gif");f22= loadImage("22a.gif");f23= loadImage("23a.gif");f24= loadImage("24a.gif");f25= loadImage("25a.gif");f26= loadImage("26a.gif");f27= loadImage("27a.gif");f28= loadImage("28a.gif");f29= loadImage("29a.gif");f30= loadImage("30a.gif");
 f31= loadImage("31a.gif");f32= loadImage("32a.gif");f33= loadImage("33a.gif");
  b1 = new Boto(0, 0, width,height,1,2);b2 = new Boto(0, 0, width, height,2,3);b3 = new Boto(0, 0, width, height,3,4);b4 = new Boto(0, 0, width, height,4,5);b5 = new Boto(0, 0, width, height,5,6);b6 = new Boto(0, 0, width, height,6,7);b7 = new Boto(0, 0, width, height,7,8);b8 = new Boto(0, 0, width, height,8,9);b9 = new Boto(0, 0, width, height,9,10);b10 = new Boto(0, 0, width, height,10,11);
 b11 = new Boto(0, 0, width, height,11,12);b12 = new Boto(0, 0, width, height,12,13);b13 = new Boto(0, 0, width, height,13,14);b14 = new Boto(0, 0, width, height,14,15);b15 = new Boto(0, 0, width, height,15,16);b16 = new Boto(0, 0, width, height,16,17);b17 = new Boto(0, 0, width, height,17,18);b18 = new Boto(0, 0, width, height,18,19);b19 = new Boto(0, 0, width, height,19,20);b20 = new Boto(0, 0, width, height,20,21);
 b21 = new Boto(0, 0, width, height,21,22);b22 = new Boto(0, 0, width, height,22,23);b23 = new Boto(0, 0, width, height,23,24);b24 = new Boto(0, 0, width, height,24,25);b25 = new Boto(0, 0, width, height,25,26);b26 = new Boto(0, 0, width, height,26,27);b27 = new Boto(0, 0, width, height,27,28);b28 = new Boto(0, 0, width, height,28,29);b29 = new Boto(0, 0, width, height,29,30);b30 = new Boto(0, 0, width, height,30,31);
 b31 = new Boto(0, 0, width, height,31,32);b32 = new Boto(0, 0, width, height,32,33);b33 = new Boto(0, 0, width, height,33,1);
  

}
void draw(){
  background(255);
  switch(pantalla){
    case 1: i1();break;
    case 2: i2();break;
    case 3: i3();break;
    case 4: i4();break;
    case 5: i5();break;
    case 6: i6();break;
    case 7: i7();break;
    case 8: i8();break;
    case 9: i9();break;
    case 10: i10();break;
    case 11: i11();break;
    case 12: i12();break;
    case 13: i13();break;
    case 14: i14();break;
    case 15: i15();break;
    case 16: i16();break;
    case 17: i17();break;
    case 18: i18();break;
    case 19: i19();break;
    case 20: i20();break;
    case 21: i21();break;
    case 22: i22();break;
    case 23: i23();break;
    case 24: i24();break;
    case 25: i25();break;
    case 26: i26();break;
    case 27: i27();break;
    case 28: i28();break;
    case 29: i29();break;
    case 30: i30();break;
    case 31: i31();break;
    case 32: i32();break;
    case 33: i33();break;
    
  }
  println(mouseX+","+mouseY);
}


void mousePressed(){
  
 b1.apreta();b2.apreta();b3.apreta();b4.apreta();b5.apreta();b6.apreta();b7.apreta();b8.apreta();b9.apreta();b10.apreta();
 b11.apreta();b12.apreta();b13.apreta();b14.apreta();b15.apreta();b16.apreta();b17.apreta();b18.apreta();b19.apreta();b20.apreta();
 b21.apreta();b22.apreta();b23.apreta();b24.apreta();b25.apreta();b26.apreta();b27.apreta();b28.apreta();b29.apreta();b30.apreta();
 b31.apreta();b32.apreta();b33.apreta();

  
}
void mouseReleased(){
  
  pasa = true;
}



class Boto {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti; 
  
  
  Boto(){
    xPos = 0;
    yPos = 0;
    c = color(255);
    widthB = width;
    heightB = height;
    pantallaActual = 1;
    pantallaDesti = 2;
  
  
  }
  Boto(float x, float y, float w, float h, int inici, int fi){
    
    xPos = x;
    yPos = y;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
    
  }
  
  void dibuixa(){
    fill(c,1);
    rect(xPos, yPos, widthB, heightB, 5);
    
  }
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual && pasa == true){
      pasa = false;
      pantalla = pantallaDesti;
    }
  }

}
void i1(){
  image(f1, 35, 30);
  b1.dibuixa();
}
void i10(){
  image(f10,35, 30);
  b10.dibuixa();
}
void i11(){
  image(f11,35, 30);
  b11.dibuixa();
}
void i12(){
  image(f12,35, 30);
  b12.dibuixa();
}
void i13(){
  image(f13,35, 30);
  b13.dibuixa();
}
void i14(){
  image(f14,35, 30);
  b14.dibuixa();
}
void i15(){
  image(f15,35, 30);
  b15.dibuixa();
}
void i16(){
  image(f16,35, 30);
  b16.dibuixa();
}
void i17(){
  image(f17,35, 30);
  b17.dibuixa();
}
void i18(){
  image(f18,35, 30);
  b18.dibuixa();
}
void i19(){
  image(f19,35, 30);
  b19.dibuixa();
}
void i2(){
  image(f2,35,30);
  b2.dibuixa();
}
void i20(){
  image(f20,35, 30);
  b20.dibuixa();
}
void i21(){
  image(f21,35, 30);
  b21.dibuixa();
}
void i22(){
  image(f22,35, 30);
  b22.dibuixa();
}
void i23(){
  image(f23,35, 30);
  b23.dibuixa();
}
void i24(){
  image(f24,35, 30);
  b24.dibuixa();
}
void i25(){
  image(f25,35, 30);
  b25.dibuixa();
}
void i26(){
  image(f26,35, 30);
  b26.dibuixa();
}
void i27(){
  image(f27,35, 30);
  b27.dibuixa();
}
void i28(){
  image(f28,35, 30);
  b28.dibuixa();
}
void i29(){
  image(f29,35, 30);
  b29.dibuixa();
}
void i3(){
  image(f3,35, 30);
  b3.dibuixa();
}
void i30(){
  image(f30,35, 30);
  b30.dibuixa();
}
void i31(){
  image(f31,35, 30);
  b31.dibuixa();
}
void i32(){
  image(f32,35, 30);
  b32.dibuixa();
}
void i33(){
  image(f33,35, 30);
  b33.dibuixa();
}
void i4(){
  image(f4,35, 30);
  b4.dibuixa();
}
void i5(){
  image(f5,35, 30);
  b5.dibuixa();
}
void i6(){
  image(f6,35, 30);
  b6.dibuixa();
}
void i7(){
  image(f7,35, 30);
  b7.dibuixa();
}
void i8(){
  image(f8,35, 30);
  b8.dibuixa();
}
void i9(){
  image(f9,35, 30);
  b9.dibuixa();
}


