
float color1 = 0;//color R pintar con pincel
float color2 = 0;//color G pintar con pincel
float color3 = 0;//color B pintar con pincel
int tamany = 1;//TamaÃ�Â±o pincel

void setup(){
  size(1000,695);
  background(255,255,255);
  smooth();
}
void draw (){
println (mouseX + "," + mouseY);
strokeWeight(2);
stroke(0);
//BORDES TABLA DIBUJO
fill(126, 64, 17);
rect(0,0,1000,20);
rect(0,0,141,695);
rect(0,675,1000,20);
rect(980,0,20,695);

//Rectangulo borde colores
rect (22,55,95,235);
fill(0);

//texto colores
textSize(25);
text("Colours",23,35);



//CUADORADOS COLORES


//Fila 1
    fill (163, 73, 164);
    rect (33,63,20,20);
    fill (200, 191, 231);
    rect (60,63,20,20); 
    fill (63, 72, 204);
    rect (87,63,20,20);
//Fila 2    
    fill (112, 146, 190);
    rect (33,90,20,20);
    fill (0, 162, 232);
    rect (60,90,20,20); 
    fill (153, 217, 234);
    rect (87,90,20,20);
//Fila 3    
    fill (34, 177, 76);
    rect (33,117,20,20);
    fill (181, 230, 29);
    rect (60,117,20,20); 
    fill (255, 242, 0);
    rect (87,117,20,20);
//Fila 4    
    fill (239, 228, 176);
    rect (33,144,20,20);
    fill (255, 127, 39);
    rect (60,144,20,20); 
    fill (255, 201, 14);
    rect (87,144,20,20);
//Fila 5    
    fill (237, 28, 36);
    rect (33,171,20,20);
    fill (255, 174, 201);
    rect (60,171,20,20); 
    fill (136, 0, 21);
    rect (87,171,20,20);
//Fila 6    
    fill (185, 122, 87);
    rect (33,198,20,20);
    fill (127, 127, 127);
    rect (60,198,20,20); 
    fill (195, 195, 195);
    rect (87,198,20,20);
//Fila 7    
    fill (0, 0, 0);
    rect (33,225,20,20);
    fill (255, 255, 255);
    rect (60,225,20,20); 
    fill (255, 255, 255);
    rect (87,225,20,20);

//Cuadro color actual
fill(color1,color2,color3);
rect(33,252,74,20);

//texto ?
fill(0);
textSize(20);
text("?",93,243); 

//texto RGB

textSize(20);
text("Code RGB",18,352); 
textSize(10);
text("R: "+color1,18,380);
text("G: "+color2,18,400);
text("B: "+color3,18,420);


//CLEAR
fill(176, 114, 67);
ellipse(70,520,80,80);
fill(0);
textSize(24);
text("CLEAR",31,530); 
//PRESS R
//textSize(15);
//text("Press 'r' to",13,607); 
//text("random colors",13,620); 



//Pintar al apretar
if (mousePressed) {
  strokeWeight (tamany);
  stroke (color1, color2, color3);
  line (mouseX,mouseY,pmouseX,pmouseY);
}


}



void mousePressed() {
 // Cambiar de color al seleccionar el cuadrado de color
  //FILA 1
    if (mouseX>33 && mouseX<53 && mouseY>63 &&mouseY< 83) {
     color1 = 163;
     color2 = 73;
     color3 = 164;
    }
    if (mouseX>60 && mouseX<80 && mouseY>63 &&mouseY<83 ) {
     color1 = 200;
     color2 = 191;
     color3 = 231;
    }
    if (mouseX>87 && mouseX<107 && mouseY>63 &&mouseY<83 ) {
     color1 = 63;
     color2 = 72;
     color3 = 204;
    }
    
  //FILA 2
    if (mouseX>33 && mouseX<53 && mouseY>90 &&mouseY<110 ) {
     color1 = 112;
     color2 = 146;
     color3 = 190;
    }
    if (mouseX>60 && mouseX<80 && mouseY>90 &&mouseY<110 ) {
     color1 = 0;
     color2 = 162;
     color3 = 232;
    }
    if (mouseX>87 && mouseX<107 && mouseY>90 &&mouseY<110 ) {
     color1 = 153;
     color2 = 217;
     color3 = 324;
    }
   
  //FILA 3
    if (mouseX>33 && mouseX<53 && mouseY>117 &&mouseY<137 ) {
     color1 = 34;
     color2 = 177;
     color3 = 76;
    }
    if (mouseX>60 && mouseX<80 && mouseY>117 &&mouseY<137 ) {
     color1 = 181;
     color2 = 230;
     color3 = 29;
    }
    if (mouseX>87 && mouseX<107 && mouseY>117 &&mouseY<137 ) {
     color1 = 255;
     color2 = 242;
     color3 = 0;
    }
   
  //FILA 4
     if (mouseX>33 && mouseX<53 && mouseY>144 &&mouseY<164 ) {
     color1 = 239; 
     color2 = 228;
     color3 = 176;
    }
    if (mouseX>60 && mouseX<80 && mouseY>144 &&mouseY<164 ) {
     color1 = 255;
     color2 = 127;
     color3 = 39;
    }
    if (mouseX>87 && mouseX<107 && mouseY>144 &&mouseY<164 ) {
     color1 = 255;
     color2 = 201;
     color3 = 14;
    }
  //FILA 5
     if (mouseX>33 && mouseX<53 && mouseY>171 &&mouseY<191 ) {
     color1 = 237;
     color2 = 28;
     color3 = 36;
    }
    if (mouseX>60 && mouseX<80 && mouseY>171 &&mouseY<191 ) {
     color1 = 255;
     color2 = 174;
     color3 = 201;
    }
    if (mouseX>87 && mouseX<107 && mouseY>171 &&mouseY<191 ) {
     color1 = 136;
     color2 = 0;
     color3 = 21;
    }
  //FILA 6
   if (mouseX>33 && mouseX<53 && mouseY>198 &&mouseY<218 ) {
     color1 = 185;
     color2 = 122;
     color3 = 87;
    }
    if (mouseX>60 && mouseX<80 && mouseY>198 &&mouseY<218 ) {
     color1 = 127;
     color2 = 127;
     color3 = 127;
    }
    if (mouseX>87 && mouseX<107 && mouseY>198 &&mouseY<218 ) {
     color1 = 195;
     color2 = 195;
     color3 = 195;
    }
 //FILA 7
    if (mouseX>33 && mouseX<53 && mouseY>225 &&mouseY<245 ) {
     color1 = 0;
     color2 = 0;
     color3 = 0;
    }
    if (mouseX>60 && mouseX<80 && mouseY>225 &&mouseY<245 ) {
     color1 = 255;
     color2 = 255;
     color3 = 255;
    }
    if (mouseX>87 && mouseX<107 && mouseY>225 &&mouseY<245 ) {
     color1 = random(255);
     color2 = random(255);
     color3 = random(255);
    }
    
     
  //Limpiar pantalla al seleccionar la cruz
   if (mousePressed && mouseX >35 && mouseX <105 && mouseY >491 && mouseY<550){
    background(255,255,255);
  } 
}
  
void keyPressed() {
//Aumentar y disminuir de tamaÃ�Â±o al apretar + y -
  if (key == '+' && tamany <50) {
    tamany = tamany+1;
  }
  if (key == '-' && tamany >0) {
    tamany = tamany-1;
  }
//Color del pincel aleatorio   
  if (key == 'r') {
    color1=random(255);
    color2=random(255);
    color3=random(255);
  }
}









