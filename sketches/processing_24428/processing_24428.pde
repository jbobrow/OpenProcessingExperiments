
//Written by Levi Berge 21/03/2011

//import processing.pdf.*;

void setup (){
  size (500, 1000);
  //beginRecord(PDF, "LightningFinal.pdf");
  smooth();
  background(0, 0, 0);
  //frameRate (1);
  }

void draw (){

float n = 0;
while (n <1){
  
noStroke();

fill(252, 224, 0, random(120,220));
float x1 = random(10, 50);      float y1 = 0; 
float count = 0;

while(x1 < 510){
//down                                                                 //up
                                                                       float ux1 = x1+12;    float uy1 = y1;
float x2 = x1+random(-20,20.1);    float y2= y1+random(70,250);        float ux2 = x2+11;    float uy2= y2-20;
float x3 = x2+random(25,35.1);   float y3= y2+random(-18,-25);         float ux3 = x3+11;    float uy3= y3-20;
float x4 = x3+random(-20,20.1);    float y4= y3+random(70,250);        float ux4 = x4+10;    float uy4= y4+20;
float x5 = x4-random(25,35.1);   float y5= y4+random(-18,-25);         float ux5 = x5+10;    float uy5= y5+20;
float x6 = x5+random(-20,20.1);    float y6= y5+random(110,300);       float ux6 = x6+9;     float uy6= y6-20;
float x7 = x6+random(25,35.1);   float y7= y6+random(-18,-25);         float ux7 = x7+9;     float uy7= y7-20;
float x8 = x7+random(-20,20.1);    float y8= y7+random(70,250);        float ux8 = x8+8;     float uy8= y8+20;
float x9 = x8-random(25,35.1);   float y9= y8+random(-18,-25);         float ux9 = x9+8;     float uy9= y9+20;
float x10 = x9+random(-20,20.1);   float y10= y9+random(110,300);      float ux10 = x10+7;   float uy10= y10-20;
float x11 = x10+random(25,35.1); float y11= y10+random(-18,-25);       float ux11 = x11+7;   float uy11= y11-20;
float x12 = x11+random(-20,20.1);  float y12= y11+random(70,250);      float ux12 = x12+6;   float uy12= y12+20;
float x13 = x12-random(25,35.1); float y13= y12+random(-18,-25);       float ux13 = x13+6;   float uy13= y13+20;
float x14 = x13+random(-20,20.1);  float y14= y13+random(110,300);     float ux14 = x14+6;   float uy14= y14-20;
float x15 = x14+random(25,35.1); float y15= y14+random(-18,-25);       float ux15 = x15+5;   float uy15= y15-20;
float x16 = x15+random(-20,20.1);  float y16= y15+random(70,250);      float ux16 = x16+5;   float uy16= y16+20;
float x17 = x16-random(25,35.1); float y17= y16+random(-18,-25);       float ux17 = x17+5;   float uy17= y17+20;
float x18 = x17+random(-20,20.1);  float y18= y17+random(110,300);     float ux18 = x18+4;   float uy18= y18-20;
float x19 = x18+random(25,35.1); float y19= y18+random(-18,-25);       float ux19 = x19+4;   float uy19= y19-20;
float x20 = x19+random(-20,20.1);  float y20= y19+random(70,250);      float ux20 = x20+3;   float uy20= y20+20;
float x21 = x20-random(-25,-35.1); float y21= y20+random(-18,-25);     float ux21 = x21+2;   float uy21= y21+20;
float x22 = x21+random(-20,20.1);  float y22= y21+random(110,300);     float ux22 = x22+1;   float uy22 = y22;

beginShape();
x1 = x1-2;    
vertex(x1, y1);
x1 = x1+2;
vertex(x2, y2);    
vertex(x3, y3);    
vertex(x4, y4);    
vertex(x5, y5);    
vertex(x6, y6);    
vertex(x7, y7);    
vertex(x8, y8);    
vertex(x9, y9);    
vertex(x10, y10);  
vertex(x11, y11);  
vertex(x12, y12);  
vertex(x13, y13);  
vertex(x14, y14);  
vertex(x15, y15);  
vertex(x16, y16);  
vertex(x17, y17);  
vertex(x18, y18);  
vertex(x19, y19);  
vertex(x20, y20);  
vertex(x21, y21);  
vertex(x22, y22);  
vertex(ux22, uy22);
vertex(ux21, uy21);
vertex(ux20, uy20);
vertex(ux19, uy19);
vertex(ux18, uy18);
vertex(ux17, uy17);
vertex(ux16, uy16);
vertex(ux15, uy15);
vertex(ux14, uy14);
vertex(ux13, uy13);
vertex(ux12, uy12);
vertex(ux11, uy11);
vertex(ux10, uy10);
vertex(ux9, uy9);
vertex(ux8, uy8);
vertex(ux7, uy7);
vertex(ux6, uy6);
vertex(ux5, uy5);
vertex(ux4, uy4);
vertex(ux3, uy3);
vertex(ux2, uy2);
vertex(ux1, uy1);
endShape(CLOSE);  

x1 = x1+random(50, 100);
count = count+1;
}

fill(252, 153, 3, random(120,200));
x1 = random(10, 50);      y1 = 0; 
count = 0;

while(x1 < 510){
//down                                                                 //up
                                                                       float ux1 = x1+12;     float uy1 = y1;
float x2 = x1+random(-20,20.1);    float y2= y1+random(70,250);        float ux2 = x2+11;     float uy2= y2-20;
float x3 = x2+random(25,35.1);   float y3= y2+random(-18,-25);         float ux3 = x3+11;     float uy3= y3-20;
float x4 = x3+random(-20,20.1);    float y4= y3+random(70,250);        float ux4 = x4+10;     float uy4= y4+20;
float x5 = x4-random(25,35.1);   float y5= y4+random(-18,-25);         float ux5 = x5+10;     float uy5= y5+20;
float x6 = x5+random(-20,20.1);    float y6= y5+random(110,300);       float ux6 = x6+9;     float uy6= y6-20;
float x7 = x6+random(25,35.1);   float y7= y6+random(-18,-25);         float ux7 = x7+9;     float uy7= y7-20;
float x8 = x7+random(-20,20.1);    float y8= y7+random(70,250);        float ux8 = x8+8;     float uy8= y8+20;
float x9 = x8-random(25,35.1);   float y9= y8+random(-18,-25);         float ux9 = x9+8;     float uy9= y9+20;
float x10 = x9+random(-20,20.1);   float y10= y9+random(110,300);      float ux10 = x10+7;   float uy10= y10-20;
float x11 = x10+random(25,35.1); float y11= y10+random(-18,-25);       float ux11 = x11+7;   float uy11= y11-20;
float x12 = x11+random(-20,20.1);  float y12= y11+random(70,250);      float ux12 = x12+6;   float uy12= y12+20;
float x13 = x12-random(25,35.1); float y13= y12+random(-18,-25);       float ux13 = x13+6;   float uy13= y13+20;
float x14 = x13+random(-20,20.1);  float y14= y13+random(110,300);     float ux14 = x14+6;   float uy14= y14-20;
float x15 = x14+random(25,35.1); float y15= y14+random(-18,-25);       float ux15 = x15+5;   float uy15= y15-20;
float x16 = x15+random(-20,20.1);  float y16= y15+random(70,250);      float ux16 = x16+5;   float uy16= y16+20;
float x17 = x16-random(25,35.1); float y17= y16+random(-18,-25);       float ux17 = x17+5;   float uy17= y17+20;
float x18 = x17+random(-20,20.1);  float y18= y17+random(110,300);     float ux18 = x18+4;   float uy18= y18-20;
float x19 = x18+random(25,35.1); float y19= y18+random(-18,-25);       float ux19 = x19+4;   float uy19= y19-20;
float x20 = x19+random(-20,20.1);  float y20= y19+random(70,250);      float ux20 = x20+3;   float uy20= y20+20;
float x21 = x20-random(-25,-35.1); float y21= y20+random(-18,-25);     float ux21 = x21+2;   float uy21= y21+20;
float x22 = x21+random(-20,20.1);  float y22= y21+random(110,300);     float ux22 = x22+1;   float uy22 = y22;

beginShape();
x1 = x1-2;    
vertex(x1, y1);
x1 = x1+2;
vertex(x2, y2);    
vertex(x3, y3);    
vertex(x4, y4);    
vertex(x5, y5);    
vertex(x6, y6);    
vertex(x7, y7);    
vertex(x8, y8);    
vertex(x9, y9);    
vertex(x10, y10);  
vertex(x11, y11);  
vertex(x12, y12);  
vertex(x13, y13);  
vertex(x14, y14);  
vertex(x15, y15);  
vertex(x16, y16);  
vertex(x17, y17);  
vertex(x18, y18);  
vertex(x19, y19);  
vertex(x20, y20);  
vertex(x21, y21);  
vertex(x22, y22);  
vertex(ux22, uy22);
vertex(ux21, uy21);
vertex(ux20, uy20);
vertex(ux19, uy19);
vertex(ux18, uy18);
vertex(ux17, uy17);
vertex(ux16, uy16);
vertex(ux15, uy15);
vertex(ux14, uy14);
vertex(ux13, uy13);
vertex(ux12, uy12);
vertex(ux11, uy11);
vertex(ux10, uy10);
vertex(ux9, uy9);
vertex(ux8, uy8);
vertex(ux7, uy7);
vertex(ux6, uy6);
vertex(ux5, uy5);
vertex(ux4, uy4);
vertex(ux3, uy3);
vertex(ux2, uy2);
vertex(ux1, uy1);
endShape(CLOSE);  

x1 = x1+random(50, 100);
count = count+1;
}
n = n+1;
}
noLoop();
//endRecord();
}


