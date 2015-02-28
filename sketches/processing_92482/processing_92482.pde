
/**********     Clouts26 March 10 2013                        **********/
/**********     Inspired by the project of Sabrina Lenzin     **********/
/**********     http://www.openprocessing.org/sketch/91792    **********/

color[] palette1=new color[11];
color[] palette2=new color[11];
color[] palette3=new color[11];
color[] palette4=new color[11];
color[] palette5=new color[11];
color[] laPalette;


int widthRect;
int noPalette;

void setup(){
  size(1000,500);
  background(255);
  smooth();
  
  palette1[0]=color(75,63,67);
  palette1[1]=color(94,88,92);
  palette1[2]=color(131,129,132);
  palette1[3]=color(214,214,214);
  palette1[4]=color(240,240,240);
  palette1[5]=color(249,249,249);
  palette1[6]=color(255,255,255);
  palette1[7]=color(226,12,17);
  palette1[8]=color(201,10,17);
  palette1[9]=color(164,7,9);
  palette1[10]=color(126,8,5);
    
  palette2[0]=color(128,131,136);
  palette2[1]=color(170,174,177);
  palette2[2]=color(191,195,198);
  palette2[3]=color(223,223,223);
  palette2[4]=color(243,243,243);
  palette2[5]=color(197,219,229);
  palette2[6]=color(172,208,222);
  palette2[7]=color(108,199,222);
  palette2[8]=color(77,178,202);
  palette2[9]=color(0,168,208);
  palette2[10]=color(0,155,201);
  
  palette3[0]=color(#008785);
  palette3[1]=color(#00a7a0);
  palette3[2]=color(#00afae);
  palette3[3]=color(#f5e44d);
  palette3[4]=color(#ffc242);
  palette3[5]=color(#ffa438);
  palette3[6]=color(#ff822e);
  palette3[7]=color(#ff5c3b);
  palette3[8]=color(#bcb741);
  palette3[9]=color(#b0a93a);
  palette3[10]=color(#8c862c);

  palette4[0]=color(#722d7e);
  palette4[1]=color(#844388);
  palette4[2]=color(#97419c);
  palette4[3]=color(#ba439d);
  palette4[4]=color(#d747a3);
  palette4[5]=color(#ee4caa);
  palette4[6]=color(#ffd080);
  palette4[7]=color(#ffc07f);
  palette4[8]=color(#fdb38b);
  palette4[9]=color(#fc8f96);
  palette4[10]=color(#f7639e);
  
  palette5[0]=color(#808c34);
  palette5[1]=color(#808c34);
  palette5[2]=color(#808c34);
  palette5[3]=color(#fdd685);
  palette5[4]=color(#fae3b3);
  palette5[5]=color(#faf2dd);
  palette5[6]=color(#593418);
  palette5[7]=color(#a0491d);
  palette5[8]=color(#d86723);
  palette5[9]=color(#ff882f);
  palette5[10]=color(#fea340);
  
  laPalette=palette1;
  widthRect=(width/palette1.length)-4;
  
  
}

void draw() { 
 
 //drawRectangle();
 if(mousePressed) {
    drawPoint(mouseX, mouseY);
  }
 

} 


void drawRectangle(){
  int pos_x=4;
  int pos_y=4;
   
   for(int i = 0; i<laPalette.length; i++){
     fill(laPalette[i]);
     rect(pos_x, pos_y, widthRect, widthRect, 7);
     pos_x=pos_x+widthRect+4;
   }
   pos_x=4;
   pos_y=pos_y+widthRect+4;
   for(int i = 0; i<laPalette.length; i++){
     fill(laPalette[i]);
     rect(pos_x, pos_y, widthRect, widthRect, 7);
     pos_x=pos_x+widthRect+4;
   }
   pos_x=4;
   pos_y=pos_y+widthRect+4;
   for(int i = 0; i<laPalette.length; i++){
     fill(laPalette[i]);
     rect(pos_x, pos_y, widthRect, widthRect, 7);
     pos_x=pos_x+widthRect+4;
   }
   pos_x=4;
   pos_y=pos_y+widthRect+4;
   for(int i = 0; i<laPalette.length; i++){
     fill(laPalette[i]);
     rect(pos_x, pos_y, widthRect, widthRect, 7);
     pos_x=pos_x+widthRect+4;
   }
   pos_x=4;
   pos_y=pos_y+widthRect+4;
   for(int i = 0; i<laPalette.length; i++){
     fill(laPalette[i]);
     rect(pos_x, pos_y, widthRect, widthRect, 7);
     pos_x=pos_x+widthRect+4;
   }

}

void keyPressed() {
 // println(keyCode);//49-50-51-52-53
  switch(keyCode){
   case 49:
     laPalette=palette1;
     break;
   case 50:
     laPalette=palette2;
     break;
    case 51:
     laPalette=palette3;
     break;
   case 52:
     laPalette=palette4;
     break;
   case 53:
     laPalette=palette5;
     break;
  default:
    laPalette=palette1;
    break;
  }
}

void drawPoint(int x, int y) {
  int iDColor = round(random(0,10));
  
  stroke(laPalette[iDColor]);
  strokeWeight(random(1,10));
  point(x,y);
  drawPoints(x,y);
   
  drawLines(x,y);
}
 
void drawPoints(int x, int y) {
  int iDColor = round(random(0,10));
  for(int i=0; i<5; i++) {
    stroke(laPalette[iDColor]);
    strokeWeight(random(1,5));
    fill(laPalette[iDColor]);
    ellipse(x+random(-30,30),y+random(-30,30), random(1,20), random(1,20));
  }
}
 
void drawLines(int x, int y) {
  int iDColor = round(random(0,10));
  strokeWeight(random(1,3));
  float x2 = x + random(-50,50);
  float y2 = y + random(-50,50);
  stroke(laPalette[iDColor]);
  line(x,y,x2,y);
  line(x,y,x,y2);
}




  




