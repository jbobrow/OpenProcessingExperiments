
Ocell[] ocellsR = new Ocell[6];
Ocell[] ocellsB = new Ocell[6];
Ocell[] ocellsL = new Ocell[6];

boolean electricity = false;
int color1 = 30;
int color2 = 30;
int color3 = 30;
int opac = 255;
float var1;
float var2;
float var3;
float var4;
int opac2;
int pushG;
int pushR;

void setup() {
    size(900, 600);
    for (int i = 0; i < ocellsR.length; i++) {
      
        ocellsR[i] = new Ocell(random(width), 0, random(5,8), random(5, 10));
        ocellsB[i] = new Ocell(random(width), 0, random(5,8), random(5, 10));
        ocellsL[i] = new Ocell(random(width), 0, random(5,8), random(5, 10));
    }
        
    
}

void draw() {
  
      background(104, 208, 251);
      
      //núvols
      noStroke();
      fill(168, 224, 251);
      ellipse(885, 249, 179, 179);
      ellipse(762, 278, 179, 179);
      ellipse(689, 392, 179, 179);
      ellipse(864, 444, 321, 321);
      fill(255);
      ellipse(97, 318, 336, 336);
      ellipse(373, 363, 321, 321);
      ellipse(593, 524, 306, 306);
      ellipse(754, 597, 179, 179);
      ellipse(153, 507, 382, 382);
      ellipse(358, 584, 382, 382);
      
      
    
    for (int i = 0; i < ocellsR.length; i++) {
      
        ocellsR[i].dibuixaR();
        ocellsR[i].moure();
        ocellsB[i].dibuixaB();
        ocellsB[i].moure();
        ocellsL[i].dibuixaL();
        ocellsL[i].moure();

    }
    //electricity
    noStroke();
    fill(255, 251, 180, opac2);
    beginShape();
    vertex(0, 420+var1);
    vertex(40, 455+var2);
    vertex(60, 410+var1);
    vertex(100, 445+var2);
    vertex(110, 420+var1);
    vertex(130, 455+var2);
    vertex(160, 410+var1);
    vertex(180, 445+var2);
    vertex(210, 415+var1);
    vertex(220, 435+var2);
    vertex(260, 410+var1);
    vertex(280, 455+var2);
    vertex(295, 435+var1);
    vertex(315, 455+var2);
    vertex(335, 420+var1);
    vertex(365, 450+var2);
    vertex(380, 410+var1);
    vertex(390, 455+var2);
    vertex(420, 405+var1);
    vertex(455, 445+var2);
    vertex(475, 420+var1);
    vertex(490, 450+var2);
    vertex(500, 425+var1);
    vertex(530, 445+var2);
    vertex(570, 420+var1);
    vertex(595, 450+var2);
    vertex(610, 425+var1);
    vertex(640, 455+var2);
    vertex(675, 435+var1);
    vertex(705, 455+var2);
    vertex(735, 425+var1);
    vertex(760, 450+var2);
    vertex(785, 420+var1);
    vertex(795, 455+var2);
    vertex(800, 420+var1);
    vertex(830, 455+var2);
    vertex(855, 415+var1);
    vertex(875, 445+var2);
    vertex(885, 430+var1);
    vertex(900, 410+var2);
    
    vertex(900, 490+var3);
    vertex(885, 525+var4);
    vertex(875, 490+var3);
    vertex(855, 515+var4);
    vertex(830, 490+var3);
    vertex(800, 525+var4);
    vertex(795, 490+var3);
    vertex(785, 515+var4);
    vertex(760, 485+var3);
    vertex(735, 505+var4);
    vertex(705, 490+var3);
    vertex(675, 525+var4);
    vertex(640, 490+var3);
    vertex(610, 525+var4);
    vertex(595, 490+var3);
    vertex(570, 520+var4);
    vertex(530, 490+var3);
    vertex(500, 525+var4);
    vertex(490, 475+var3);
    vertex(475, 515+var4);
    vertex(450, 488+var3);
    vertex(420, 510+var4);
    vertex(395, 495+var3);
    vertex(380, 515+var4);
    vertex(365, 490+var3);
    vertex(335, 530+var4);
    vertex(315, 485+var3);
    vertex(295, 535+var4);
    vertex(280, 485+var3);
    vertex(260, 535+var4);
    vertex(220, 495+var3);
    vertex(210, 530+var4);
    vertex(180, 490+var3);
    vertex(160, 535+var4);
    vertex(130, 490+var3);
    vertex(110, 525+var4);
    vertex(90, 485+var3);
    vertex(50, 515+var4);
    vertex(30, 500+var3);
    vertex(0, 520+var4);
    endShape();
  
    //botons
    noStroke();
    fill(0);
    rect(850, 0, 55, 120);
    
    fill(81, 85, 87);
    ellipse(875, 35, 35, 35);
    ellipse(875, 90, 35, 35);
    
    fill(255, 0, 0);
    ellipse(875, 30+pushR, 35, 35);
    
    fill(0, 255, 0);
    ellipse(875, 85+pushG, 35, 35);
    
  
    
  if (electricity == true) {
   
     color1 = 253;
     color2 = 253;
     color3 = 210; 
     opac2 = 255;
     var1 = random(-20, 20);
     var2 = random(-30, 20);
     var3 = random(-20, 20);
     var4 = random(-20, 30);
     pushG = 0;
     pushR = 5;
     
     
  }
  if (electricity == false) {
    
     color1 = 30;
     color2 = 30;
     color3 = 30; 
     opac2 = 0;
     pushG = 5;
     pushR = 0;
     
  
  }
}


void mousePressed() {
  if(mouseX>858 && mouseX <893 && mouseY>12 && mouseY<47) {
    electricity = true;
  }
  if(mouseX>858 && mouseX <893 &&  mouseY>66 && mouseY<100) {
    electricity = false;
  }
    
    
    
    
    
   
}
  


class Ocell {
  float xPos = 0;
  float yPos = 0;
  float xvel = random(-2, 2);
  float xvel2 = xvel;
  float yvel; 
  float velneg;
 
 
    Ocell() {
  
       xPos = 0;
       yPos = 0;
       yvel = 1;
       velneg = 1;
    }
  
    Ocell(float x, float y, float vel, float velneg2){
    
      xPos = x;
      yPos = y;
      yvel= vel;
      velneg = velneg2;
      
    }
    
    
   void dibuixaR() {
   //ocellrosa
      //ales
      stroke(229, 116, 153, opac);
      strokeWeight(12);
      strokeCap(ROUND);
      line(xPos+6, yPos-47, xPos-7, yPos-58);
      line(xPos+83, yPos-47, xPos+96, yPos-58);
      
      //cos
      fill(229, 116, 153);
      noStroke();
      beginShape();
      vertex(xPos+51, yPos-72);
      vertex(xPos+49, yPos-88);
      vertex(xPos+47, yPos-80);
      vertex(xPos+33, yPos-91);
      vertex(xPos+37, yPos-82);
      vertex(xPos+39, yPos-70);
      vertex(xPos+42, yPos-65);
      vertex(xPos+51, yPos-71);
      endShape();
      ellipse(xPos+45, yPos-33, 90, 85);
      //ulls
      fill(253, 245, 249);
      ellipse(xPos+36, yPos-44, 32, 32);
      ellipse(xPos+68, yPos-44, 30, 30);
      //iris
      fill(31, 31, 31);
      ellipse(xPos+41, yPos-52, 10, 10);
      ellipse(xPos+73, yPos-51, 10, 10);
      fill(255);
      ellipse(xPos+43, yPos-54, 4, 4);
      ellipse(xPos+75, yPos-53, 4, 4);
      //bec
      fill(247, 225, 172);
      beginShape();
      vertex(xPos+47, yPos-30);
      vertex(xPos+52, yPos-33);
      vertex(xPos+57, yPos-30);
      vertex(xPos+52, yPos-25);
      endShape();
      
      //cable
      stroke(color1, color2, color3);
      strokeWeight(2);
      line(0, 464, 900, 464);
      
      //potetes
      stroke(247, 225, 172);
      strokeWeight(4);
      strokeCap(ROUND);
      line(xPos+36, yPos-2, xPos+32, yPos+1);
      line(xPos+36, yPos-2, xPos+37, yPos+3);
      line(xPos+36, yPos-2, xPos+41, yPos+1);
      line(xPos+56, yPos-2, xPos+52, yPos+1);
      line(xPos+56, yPos-2, xPos+57, yPos+3);
      line(xPos+56, yPos-2, xPos+61, yPos+1);
     
   }
   void dibuixaB() {
   //ocellblau
     //ales
      stroke(57, 80, 183, opac);
      strokeWeight(12);
      strokeCap(ROUND);
      line(xPos+11, yPos-51, xPos-9, yPos-59);
      line(xPos+76, yPos-51, xPos+96, yPos-59);
      
      //cos
      fill(57, 80, 183);
      noStroke();
      beginShape();
      vertex(xPos+51, yPos-81);
      vertex(xPos+53, yPos-97);
      vertex(xPos+47, yPos-89);
      vertex(xPos+40, yPos-100);
      vertex(xPos+34, yPos-79);
      vertex(xPos+42, yPos-74);
      vertex(xPos+51, yPos-81);
      endShape();
      ellipse(xPos+45, yPos-37, 85, 100);
      //ulls
      fill(253, 245, 249);
      ellipse(xPos+36, yPos-48, 32, 32);
      ellipse(xPos+68, yPos-48, 30, 30);
      //iris
      fill(31, 31, 31);
      ellipse(xPos+46, yPos-46, 10, 10);
      ellipse(xPos+77, yPos-45, 10, 10);
      fill(255);
      ellipse(xPos+48, yPos-48, 4, 4);
      ellipse(xPos+79, yPos-47, 4, 4);
      //bec
      fill(247, 225, 172);
      beginShape();
      vertex(xPos+45, yPos-29);
      vertex(xPos+54, yPos-34);
      vertex(xPos+63, yPos-29);
      vertex(xPos+54, yPos-22);
      endShape();
      
      //cable
      stroke(color1, color2, color3);
      strokeWeight(2);
      line(0, 464, 900, 464);
      
      //potetes
      stroke(247, 225, 172);
      strokeWeight(4);
      strokeCap(ROUND);
      line(xPos+36, yPos-1, xPos+32, yPos+2);
      line(xPos+36, yPos-1, xPos+37, yPos+4);
      line(xPos+36, yPos-1, xPos+41, yPos+2);
      line(xPos+56, yPos-1, xPos+52, yPos+2);
      line(xPos+56, yPos-1, xPos+57, yPos+4);
      line(xPos+56, yPos-1, xPos+61, yPos+2);
      
   }
   void dibuixaL() {
   //ocelllila
     //ales
      stroke(145, 111, 223, opac);
      strokeWeight(12);
      strokeCap(ROUND);
      line(xPos+11, yPos-42, xPos-9, yPos-50);
      line(xPos+76, yPos-42, xPos+96, yPos-50);
      
      //cos
      fill(145, 111, 223);
      noStroke();
      beginShape();
      vertex(xPos+51, yPos-74);
      vertex(xPos+40, yPos-90);
      vertex(xPos+34, yPos-72);
      vertex(xPos+42, yPos-67);
      vertex(xPos+51, yPos-74);
      endShape();
      ellipse(xPos+45, yPos-32, 88, 89);
      //ulls
      fill(253, 245, 249);
      ellipse(xPos+36, yPos-46, 30, 30);
      ellipse(xPos+66, yPos-46, 28, 28);
      //iris
      fill(31, 31, 31);
      ellipse(xPos+37, yPos-45, 10, 10);
      ellipse(xPos+67, yPos-45, 10, 10);
      fill(255);
      ellipse(xPos+39, yPos-47, 4, 4);
      ellipse(xPos+69, yPos-47, 4, 4);
      //bec
      fill(247, 225, 172);
      beginShape();
      vertex(xPos+44, yPos-30);
      vertex(xPos+51, yPos-35);
      vertex(xPos+58, yPos-30);
      vertex(xPos+51, yPos-23);
      endShape();
      
      //cable
      stroke(color1, color2, color3);
      strokeWeight(2);
      line(0, 464, 900, 464);
     
     //potetes
      stroke(247, 225, 172);
      strokeWeight(4);
      strokeCap(ROUND);
      line(xPos+36, yPos+1, xPos+32, yPos+4);
      line(xPos+36, yPos+1, xPos+37, yPos+6);
      line(xPos+36, yPos+1, xPos+41, yPos+4);
      line(xPos+56, yPos+1, xPos+52, yPos+4);
      line(xPos+56, yPos+1, xPos+57, yPos+6);
      line(xPos+56, yPos+1, xPos+61, yPos+4);
     }
     void moure(){
       
              if (electricity == false) {
                      yPos = yPos + yvel;
                      xPos = xPos + xvel;
                      opac = 255;
                       
                        if (yPos>= 460) {
                        xvel = 0;
                        yPos = 460;
                        opac = 0;
                        }
                    
              }
              if (electricity == true) {
                 
                    yPos = yPos - velneg;
                    opac = 255;
                    xPos = xPos + xvel;
                    xvel = xvel2;
                    
              }
     }
 }




