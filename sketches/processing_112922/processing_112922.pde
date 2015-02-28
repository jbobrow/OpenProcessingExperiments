
//Lucrecia Esteban

int px;
int pxMov;
int px2;
int pxMov2;
int px3;
int pxMov3;
int py;
int pyMov;
int py2;
int pyMov2;

void setup (){
  size(900,530);
    px=230;
    pxMov=int(random(1,6));
     px2=230;
    pxMov2=int(random(1,6));
     px3=230;
    pxMov3=int(random(1,6));
    py=160;
    py2=280;
    pyMov=int(random(1,6));
    pyMov2= int(random(1,6));
 }
 
 void mousePressed (){
   
 if(mouseX<250 & mouseX>0 & mouseY<350 & mouseY>0){
    colorMode(RGB,800,200,80);
    }
 if(mouseX>250 & mouseX<570 & mouseY>0 & mouseY<140){
    colorMode(RGB,80,200,80);
    }
 if(mouseX>250 & mouseX<570 & mouseY>140 & mouseY<530){
    colorMode(HSB, 100,200,100);
    }
  
 if(mouseX>570 & mouseX<650 & mouseY>0 & mouseY<350){
    colorMode(HSB, 135,550,15);
    }
    
 if(mouseX>650 & mouseX<790 & mouseY>0 & mouseY<270){
    colorMode(RGB, 250,550,500);
    }   
    
  if(mouseX>790 & mouseX<900 & mouseY>0 & mouseY<350){
    colorMode(RGB, 900,500,100);
    }  
    
    if(mouseX>790 & mouseX<900 & mouseY>420 & mouseY<530){
    colorMode(RGB, 900,500,100);
    }    
    
   if(mouseX>570 & mouseX<900 & mouseY>350 & mouseY<420){
    colorMode(HSB, 400,900,100);
    }   
    
    if(mouseX>0 & mouseX<250 & mouseY>350 & mouseY<420){
    colorMode(RGB, 400,900,100);
  }
  
  if(mouseX>0 & mouseX<250 & mouseY>420 & mouseY<530){
    colorMode(HSB, 900,400,200);
  }
  
    if(mouseX>570 & mouseX<790 & mouseY>420 & mouseY<530){
    colorMode(HSB, 100,800,100);
    } 
    
   if(mouseX>650 & mouseX<790 & mouseY>270 & mouseY<350){
    colorMode(HSB, 900,200,100);
    }   
    
 }

void draw(){
  
  background (231,183,75);  
  
  noStroke();
  fill(245,202,97);
  rect(250,0,320,140); //rectángulo ocre medio arriba
  
  fill(134,145,43);
  ellipse(320,310,320,300); //círculo relleno verde
  
  fill(182,113,36,40);
  rect(0,0,250,350);//rectángulo superior izquierdo, ocre oscuro
  fill(182,113,36,60);
  rect(10,0,240,350);
  fill(182,113,36,80);
  rect(20,0,230,350);
  fill(182,113,36,100);
  rect(30,0,220,350);
  fill(182,113,36,120);
  rect(40,0,210,350);
  fill(182,113,36,140);
  rect(50,0,200,350);
  fill(182,113,36,160);
  rect(60,0,190,350);
  fill(182,113,36,180);
  rect(70,0,180,350);
  fill(182,113,36,200);
  rect(80,0,170,350);
  fill(182,113,36,220);
  rect(90,0,160,350);
  fill(182,113,36,240);
  rect(100,0,150,350);
  fill(182,113,36,255);
  rect(110,0,140,350);
  
  
  /*alternativa
  //fill(182,113,36,100);
  //triangle(0,350,0,0,250,0);
  //fill(182,113,36,120);
  //triangle(0,330,0,0,240,0);
  //fill(182,113,36,140);
  //triangle(0,300,0,0,230,0);
  //fill(182,113,36,160);
  //triangle(0,270,0,0,220,0);
  //fill(182,113,36,140);
  //triangle(10,350,250,10,250,350);
  //fill(182,113,36,140);
  //triangle(25,350,250,20,250,350);
  //fill(182,113,36,160);
  //triangle(50,350,250,30,250,350);
  //fill(182,113,36,150);
  //quad(250,0,250,10,10,350,0,350);*/
    
  
  fill(84,37,45);
  rect(0,350,250,70); //rectángulo medio izquierdo, bordeaux
  
  fill(143,140,84,125);
  rect(0,420,250,130); //rectángulo inferior izquierdo, verde mate claro
  fill(143,140,84,130);
  rect(0,440,250,130);
  fill(143,140,84,135);
  rect(0,460,250,130);
  fill(143,140,84,140);
  rect(0,480,250,130);
  fill(143,140,84,145);
  rect(0,500,250,130);
  fill(143,140,84,150);
  rect(0,520,250,130);
  fill(143,140,84,155);
  rect(0,530,250,130);
  
  //líneas verdes encima de rectángulo ocre medio
  strokeWeight(1.5);
  stroke(134,145,43);
  line(250,10,570,10);
  line(250,20,570,20);
  line(250,30,570,30);
  line(250,40,570,40);
  line(250,50,570,50);
  line(250,60,570,60);
  
    
  strokeWeight(1);
  stroke(233,235,80);
  noFill();
  ellipse(320,310,320,300); //círculo sin relleno líneal amarillo
  

  noStroke();  
  fill(118,59,55,100);
  rect(790,0,110,550); //rectángulo largo derecho vertical bordeaux
  fill(118,59,55,110);
  rect(800,0,110,550);
  fill(118,59,55,120);
  rect(810,0,110,550);
  fill(118,59,55,130);
  rect(820,0,110,550);
  fill(118,59,55,140);
  rect(830,0,110,550);
  fill(118,59,55,150);
  rect(840,0,110,550);
  fill(118,59,55,160);
  rect(850,0,110,550);
  fill(118,59,55,170);
  rect(860,0,110,550);
  fill(118,59,55,180);
  rect(870,0,110,550);
  fill(118,59,55,190);
  rect(880,0,110,550);
  fill(118,59,55,200);
  rect(890,0,110,550);
  
  
  fill(76,46,48);
  rect(570,0,80,350); //primer rectángulo derecho vertical bordeaux
  
  fill(139,121,67);
  rect(650,0,140,270); //segundo rectángulo derecho vertical verde/ocre
  
  noStroke();
  fill(201,102,36,70);
  rect(570,270,220,80);//primer rectángulo horizontal derecho naranja
  
  strokeWeight(4);
  stroke(245,202,97,230);
  line(790,0,790,350);//línea derecha amarilla vertical
  
  noStroke();
  fill(129,29,33);
  rect(570,350,330,70);//segundo rectángulo horizontal derecho bordeaux
  
  fill(182,111,36);
  rect(570,420,220,130); //tercer rectángulo horizontal derecho ocre
  
  fill(224,184,123);
  rect(600,450,160,140); //rectángulo beige de dentro del tercer rectángulo horizontal derecho ocre
  
  strokeWeight(6);
  stroke(245,202,97,120);
  line(0,420,900,420);//línea horizontal larga amarilla abajo 
  
  noStroke();
  fill(84,37,45);
  rect(px,20,70,70); //primer cuadrado pequeño medio, bordeaux
  
  fill(214,179,116);
  rect(px+15,35,40,40); //primer cuadrado beige de dentro del cuadrado bordeaux
  
  fill(84,37,45);
  rect(px2,110,70,70);//segundo cuadrado pequeño medio, bordeaux
  
  fill(214,179,116);
  rect(px2+15,125,40,40);//segundo cuadrado beige de dentro del cuadrado bordeaux
   
  fill(84,37,45);
  rect(px3,200,70,70);//tercer cuadrado pequeño medio, bordeaux
    
  fill(214,179,116);
  rect(px3+15,215,40,40);//tercer cuadrado beige de dentro del cuadrado bordeaux
    
  px = px + pxMov;
  
  if (px>829) {
    pxMov=-2;
  }
    
  
  if (px == 0) {
    pxMov =1;
    }
    
    px2 = px2 + pxMov2;
  
  if (px2>829) {
    pxMov2=-1;
  }
    
  
  if (px2 == 0) {
    pxMov2 =1;
    }
    
      px3 = px3 + pxMov3;
  
  if (px3>829) {
    pxMov3=-2;
  }
    
  
  if (px3 == 0) {
    pxMov3 =2;
    }
    
      //círculos pequeños derecha  
  noFill();
  strokeWeight(1);
  stroke(76,46,48);
  ellipse(680,py,90,80);
  stroke(76,46,48);
  ellipse(680,py2,90,80);
  
    py = py + pyMov;
  
  if (py>529) {
    pyMov=-2;
  }
    
  
  if (py == 0) {
    pyMov =1;
    }
  
      py2 = py2 + pyMov2;
  
  if (py2>529) {
    pyMov2=-1;
  }
    
  
  if (py2 == 0) {
    pyMov2 =1;
    }  
  
  strokeWeight(5);
  stroke(84,37,45,120);
  line(250,0,250,530);//línea bordeaux izquierda larga vertical

   
}

