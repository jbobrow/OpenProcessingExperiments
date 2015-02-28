
//el alien que hize la última vez ahora al pulsar dos veces sobre la pupila hará una imitación de CSI 
//aparte se moverá una nave espacial al fondo 



boolean csi=false;
int x = 0;
int posicionCentroOvni = 516;
void setup(){
  size(600,400); 
}
void draw(){
  

  //fondo cambiante a una especie de naranja
  if (csi){
  background(#F5BD05);
  //la nave espacial del alien se moverá hacia la izquierda y volverá a aparecer por la derecha 
  strokeWeight(5);
  fill(0,180,240);
  ellipse(posicionCentroOvni - 4,105,40,20);
  fill(#C4BEBE);
  bezier(posicionCentroOvni - 47,113,posicionCentroOvni,99,posicionCentroOvni,99,posicionCentroOvni + 41,113);
  bezier(posicionCentroOvni - 47,113,posicionCentroOvni,127,posicionCentroOvni,127,posicionCentroOvni + 41,113);
  posicionCentroOvni = posicionCentroOvni - 3;
  if (posicionCentroOvni == 0){
  posicionCentroOvni = 600;
  }
  fill(255,255,255);
  textSize(50);
  text("YEAAAAAAAAH!", 138, 40 );
  fill(255,255,255);
  textSize(20);
  text("DEAL WITH IT", 460, 334);}
  else background(#28CADB);
  println(x);
  
  /*arc(303,235,40,25,0, PI,CHORD);
  fill(255,255,255);
  rect(250,235,20,20);
  rect(340,235,20,20);*/  
 
  //cursor mouse
  println(mouseX+","+mouseY);
  
  //cara
  fill(#62CE6A);
  ellipse(302,175,230,260);
  strokeWeight(3);
  line(293,168,289,194);
  line(314,167,316,193);
  
  //ojo1
  fill(0,0,0);
  ellipse(258,128,50,80);
  fill(255,255,255);
  ellipse(259,131,random(30,40),random(30,40));
  
  //ojo2
  fill(0,0,0);
  ellipse(351,118,50,80);
  fill(255,255,255);
  ellipse(351,121,random(30,40),random(30,40));
  
  //cejas
  curve(230,89,251,75,273,75,287,85);
  curve(375,83,359,72,345,70,325,78);
  
  //orejas de alien
  fill(255,0,0);
  ellipse(510,167,30,30);
  fill(255,0,0);
  ellipse(95,168,30,30);
  fill(#62CE6A);
  triangle(187,192,115,170,187,156);
  fill(#62CE6A);
  triangle(417,188,490,170,415,153);
  

  
  //perilla
  fill(0,0,0);
  triangle(279,303,300,333,325,303);
  
  //gafas de sol quita y pon has de ponerselas con doble clic sobre sus extrañas pupilas
  fill(#D1342C);
  ellipse(mouseX - 46,mouseY + 7,50,50);
  ellipse(mouseX + 40,mouseY + 1,50,50);
  line(mouseX -21,mouseY + 5,mouseX -11,mouseY);
  line(mouseX - 11,mouseY,mouseX,mouseY);
  line(mouseX,mouseY,mouseX + 15,mouseY + 4);
  line(mouseX + 34,mouseY - 1,mouseX + 31,mouseY + 13);
  line(mouseX - 53,mouseY - 3,mouseX - 62,mouseY + 10);
  line(mouseX - 41,mouseY + 5,mouseX - 51,mouseY + 18);
  line(mouseX + 50,mouseY - 11,mouseX + 45,mouseY + 7); 
  
  
  //animacion boca
  //su boca se pondrá seria cuando le pongas las gafas
  if(x == 0){
 fill(0,0,0);
  arc(303,235,150,125,0, PI);
  fill(255,255,255);
  rect(250,235,20,20);
  rect(340,235,20,20);

  }else if(x > 1){
  fill(0,0,0);
  line(247,233,361,233);
  fill(255,255,255);
  rect(250,235,20,20);
  rect(340,235,20,20);
  }
  


}
 
void mousePressed(){
  if (mouseY > 100 && mouseY < 130 && mouseX >290 && mouseX < 325){
    x = x + 1;
    csi = true;
    }  
}



