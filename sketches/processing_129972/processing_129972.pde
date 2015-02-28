
int vX1=150;
int vX2=250;
int vX3=350;
int vX4=450;
int vY1=150;
int vY2=100;
void setup(){
  size(600,300);
  smooth();
}
void draw(){
  background(255);
  //líneas rectangulo superior
  line (vX1,vY1,vX2,vY2);
  line (vX2,vY2,vX4,vY2);
  line (vX4,vY2,vX3,vY1);
  line (vX1,vY1,vX3,vY1);
  //líneas rectangulo inferior
  line (vX1,vY1+50,vX2,vY2+50);
  line (vX2,vY2+50,vX4,vY2+50);
  line (vX4,vY2+50,vX3,vY1+50);
  line (vX1,vY1+50,vX3,vY1+50);
  //líneas que unen los dos rectangulos
  line (vX1,vY1,vX1,vY1+50);
  line (vX2,vY2,vX2,vY2+50);
  line (vX4,vY2,vX4,vY2+50);
  line (vX3,vY1,vX3,vY1+50);
  //rectangulos para la ilusión de un espacio
  //rectangle frontal
  if ((mouseX>vX1)&&(mouseX<vX3)&&(mouseY>vY1)&&(mouseY<vY1+50)){
    fill(#FA3535);
    quad(vX1,vY1,vX3,vY1,vX3,vY1+50,vX1,vY1+50);//rectangle frontal
    fill (255);
    quad(vX2,vY2,vX4,vY2,vX3,vY1,vX1,vY1);//rectangle superior
    }
    //rectangle superior
    if ((mouseX>vX2)&&(mouseX<vX3)&&(mouseY>vY2)&&(mouseY<vY1)){
      fill(#359FFA);
      quad(vX2,vY2,vX4,vY2,vX3,vY1,vX1,vY1);//rectangle superior
      fill(255);
      quad(vX1,vY1,vX3,vY1,vX3,vY1+50,vX1,vY1+50);//rectangle frontal
    }
    //rectangle lateral dret
    if ((mouseX>vX3)&&(mouseX<vX4)&&(mouseY<vY1)&&(mouseY>vY2)){
      fill(#FAEA35);
      quad(vX3,vY1,vX4,vY2,vX4,vY2+50,vX3,vY1+50);//rectangle lateral dret
      fill(255);
      quad(vX2,vY2,vX4,vY2,vX3,vY1,vX1,vY1);//rectangle superior
    }
    //rectangle lateral esquerre
    if ((mouseX>vX3-200)&&(mouseX<vX4-200)&&(mouseY<vY1)&&(mouseY>vY2)){
      fill(#D835FA);
      quad(vX1,vY1,vX2,vY2,vX2,vY2+50,vX1,vY1+50);
      fill(255);
      quad(vX2,vY2,vX4,vY2,vX4,vY1,vX2,vY2+50);
    }
    if((mouseX>vX3)&&(mouseX<vX4)&&(mouseY>vY1)&&(mouseY<vY1+50)){
      fill(#76FA35);
      quad(vX2,vY2+50,vX4,vY2+50,vX3,vY1+50,vX1,vY1+50);
      fill(255);
      quad(vX1,vY1,vX2,vY2,vX2,vY2+50,vX1,vY1+50);
}
}



