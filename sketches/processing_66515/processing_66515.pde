
int x1 = 100;
int y1 = 100;
int x2 = 200;
int y2 = 100;
int x3 = 300;
int y3 = 100;
int x4 = 400;
int y4 = 100;
int x5 = 100;
int y5 = 200;
int x6 = 200;
int y6 = 200;
int x7 = 100;
int y7 = 300;
int x8 = 300;
int y8 = 300;
int x9 = 100;
int y9 = 400;
int x10 =400;
int y10 =400;
int x11=500;
int y11=500;



void setup(){
  size(600,600);
  
  
}

void draw(){
   background(255,0,0);
   ellipse(x1,y1,30,30);
   ellipse(x6,y6,30,30);
   ellipse(x8,y8,30,30);
   ellipse(x10,y10,30,30);
   ellipse(x5,y5,30,30);
   ellipse(x7,y7,30,30);
   ellipse(x9,y9,30,30);
   ellipse(x2,y2,30,30);
   ellipse(x3,y3,30,30);
   ellipse(x4,y4,30,30);
   ellipse(x11,y11,30,30);
   
   if (mouseX>x1-15 && mouseX<x1+15  && mouseY>y1-15 && mouseY<y1+15) {
     x1--;
     y1--;
   }
   
   if(mouseX>x2-15 && mouseX<x2+15 && mouseY>y2-15 && mouseY<y2+15) {
     x2--;
     y2--;
   }
   
   if(mouseX>x3-15 && mouseX<x3+15 && mouseY>y3-15 && mouseY<y3+15) {
     x3--;
     y3--;
   }
   
   if(mouseX>x4-15 && mouseX<x4+15 && mouseY>y4-15 && mouseY<y4+15) {
     x4--;
     y4--;
   }
   
   if(mouseX>x5-15 && mouseX<x5+15 && mouseY>y5-15 && mouseY<y5+15) {
     x5--;
     y5--;
   }
   
   if(mouseX>x6-15 && mouseX<x6+15 && mouseY>y6-15 && mouseY<y6+15) {
     x6--;
     y6--;
   }
   
   if(mouseX>x7-15 && mouseX<x7+15 && mouseY>y7-15 && mouseY<y7+15) {
     x7--;
     y7--;
   }
   
   if(mouseX>x8-15 && mouseX<x8+15 && mouseY>y8-15 && mouseY<y8+15) {
     x8--;
     y8--;
   }
   
   if(mouseX>x9-15 && mouseX<x9+15 && mouseY>y9-15 && mouseY<y9+15) {
     x9--;
     y9--;
   }
   
   if(mouseX>x10-15 && mouseX<x10+15 && mouseY>y10-15 && mouseY<y10+15) {
     x10--;
     y10--;
   }
   
   if(mouseX>x11-15 && mouseX<x11+15 && mouseY>y11-15 && mouseY<y11+15) {
     x11--;
     y11--;
   }
            
   
}

