
class Marca{
 String texto;
 String sigla;
 float y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16,y17;
 String Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,Y10,Y11,Y12,Y13,Y14,Y15,Y16,Y17;
 color c;
 float media;
 boolean teste;
 int t;
 
 Marca(String _y1, String _y2, String _y3, String _y4, String _y5, String _y6, String _y7, String _y8, String _y9, String _y10, String _y11, String _y12, String _y13, String _y14, String _y15, String _y16, String _y17, String _sigla, String _texto){
  y1=map(float(_y1),0,100,maxY, minY); 
  y2=map(float(_y2),0,100,maxY, minY);
  y3=map(float(_y3),0,100,maxY, minY);
  y4=map(float(_y4),0,100,maxY, minY);
  y5=map(float(_y5),0,100,maxY, minY);
  y6=map(float(_y6),0,100,maxY, minY);
  y7=map(float(_y7),0,100,maxY, minY);
  y8=map(float(_y8),0,100,maxY, minY);
  y9=map(float(_y9),0,100,maxY, minY);
  y10=map(float(_y10),0,100,maxY, minY);
  y11=map(float(_y11),0,100,maxY, minY);
  y12=map(float(_y12),0,100,maxY, minY);
  y13=map(float(_y13),0,100,maxY, minY);
  y14=map(float(_y14),0,100,maxY, minY);
  y15=map(float(_y15),0,100,maxY, minY);
  y16=map(float(_y16),0,100,maxY, minY);
  y17=map(float(_y17),0,100,maxY, minY);
  Y1=_y1;
  Y2=_y2;
  Y3=_y3;
  Y4=_y4;
  Y5=_y5;
  Y6=_y6;
  Y7=_y7;
  Y8=_y8;
  Y9=_y9;
  Y10=_y10;
  Y11=_y11;
  Y12=_y12;
  Y13=_y13;
  Y14=_y14;
  Y15=_y15;
  Y16=_y16;
  Y17=_y17;
  
  sigla=_sigla;
  texto=_texto;
  media= float(_y1) + float(_y2) + float(_y3) + float(_y4) + float(_y5) + float(_y6) + float(_y7) + float(_y8) + float(_y9) + float(_y10) + float(_y11) + float(_y12) + float(_y13) + float(_y14) + float(_y15) + float(_y16) + float(_y17) ;
  media=media/17;
  teste=false;

 }
 
  void mouseOver(int mx,int my){
  if((mx>0 && mx<gx1-5) && (my > y1-2 && my < y1 +2)){
   teste=true;
  } 
  else{
   teste=false; 
  }
 }
 
 void display(){
  c=color(100);
   textSize(t);
   if(teste){
   strokeWeight(3); 
   stroke(255);
  }
  else{
   strokeWeight(1); 
   stroke(175,0,0,175);
  }

  noFill();
  
  beginShape();
   vertex(gx1, y1);
   vertex(gx2, y2);
   vertex(gx3, y3);
   vertex(gx4, y4);
   vertex(gx5, y5);
   vertex(gx6, y6);
   vertex(gx7, y7);
   vertex(gx8, y8);
   vertex(gx9, y9);
   vertex(gx10, y10);
   vertex(gx11, y11);
   vertex(gx12, y12);
   vertex(gx13, y13);
   vertex(gx14, y14);
   vertex(gx15, y15);
   vertex(gx16, y16);
   vertex(gx17, y17);
  endShape(); 
  
  fill(100);
  textAlign(RIGHT);
  
  if(teste){
   fill(255);
   //textSize(12);
   t++;
   t=constrain(t,7,14);
   textAlign(LEFT);
   text(Y1,gx1,y1-10);
   text(Y2,gx2,y2-10);
   text(Y3,gx3,y3-10);
   text(Y4,gx4,y4-10);
   text(Y5,gx5,y5-10);
   text(Y6,gx6,y6-10);
   text(Y7,gx7,y7-10);
   text(Y8,gx8,y8-10);
   text(Y9,gx9,y9-10);
   text(Y10,gx10,y10-10);
   text(Y11,gx11,y11-10);
   text(Y12,gx12,y12-10);
   text(Y13,gx13,y13-10);
   text(Y14,gx14,y14-10);
   text(Y15,gx15,y15-10);
   text(Y16,gx16,y16-10);
   text(Y17,gx17,y17-10);
  }
  else{
   t--;
   t=constrain(t,7,14); 
  }
  textAlign(RIGHT);
  text(texto, gx1-5, y1);
 }
 

  
}

