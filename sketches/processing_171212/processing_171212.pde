
/* @pjs preload="canvas6.jpg"; */
PImage foto;
boolean pinzellada = true;
int color1 = 0;
int color2 = 0;
int color3 = 0;
int color4 = 0;
int color5 = 0;
int color6 = 0;
boolean blau1 = false;
boolean lila = false;
boolean rosa = false;
boolean vermell = false;
boolean groc1 = false;
boolean groc2 = false;
boolean negre = false;
boolean marro = false;
boolean ocre = false;
boolean verd1 = false;
boolean verd2 = false;
boolean blau2 = false;
boolean tinta = false;
boolean pinzell2 = false;
boolean pinzell3 = false;
boolean pinzell4 = false;
boolean pinzell5 = false;


void setup(){
  size(1200, 650);
  foto = loadImage("canvas6.jpg");
  image(foto, 0, 0);
  
  
   
}
void draw(){
  
 
  
  //pinzell gruixut
  
   if (pinzell3 == true && mouseX>1038 && mouseX<1154 && mouseY>0 && mouseY<63){
   pinzell5 = true;
   pinzell4 = false;
   }
   
  if (pinzell5 == true && pinzellada == false && mouseX>365 && mouseX<1100 && mouseY>109 && mouseY<595){
    
    noStroke();    
    fill(random(color1, color2), random(color3, color4), random(color5, color6));
    beginShape();
    curveVertex(mouseX-26+random(15), mouseY-18+random(10));
    curveVertex(mouseX-11+random(15), mouseY-15+random(10));
    curveVertex(mouseX+28+random(15), mouseY-26+random(10));
    curveVertex(mouseX+32+random(15), mouseY-18+random(10));
    curveVertex(mouseX+45+random(15), mouseY-16+random(10));
    curveVertex(mouseX+44+random(15), mouseY-8+random(10));
    curveVertex(mouseX+34+random(15), mouseY+0+random(10));
    curveVertex(mouseX+38+random(15), mouseY+7+random(10));
    curveVertex(mouseX+26+random(15), mouseY+17+random(10));
    curveVertex(mouseX+9+random(15), mouseY+23+random(10));
    curveVertex(mouseX-28+random(15), mouseY+22+random(10));
    curveVertex(mouseX-41+random(15), mouseY+11+random(10));
    curveVertex(mouseX-37+random(15), mouseY-2+random(10));
    curveVertex(mouseX-28+random(15), mouseY-10+random(10));
    curveVertex(mouseX-26+random(15), mouseY-18+random(10));
    endShape();
             
  }
  //pinzell prim
  
  if (pinzell2 == true && mouseX>0 && mouseX<206 && mouseY>130 && mouseY<164){
   pinzell4 = true;
   pinzell5 = false;
   }
  if (pinzell4 == true && pinzellada == false && mouseX>365 && mouseX<1100 && mouseY>109 && mouseY<595){
    
  noStroke();    
    fill(random(color1, color2), random(color3, color4), random(color5, color6));
    beginShape();
        
    curveVertex(mouseX-20+random(7), mouseY-4+random(4));
     curveVertex(mouseX-15+random(7), mouseY+2+random(4));
    curveVertex(mouseX-19+random(7), mouseY+14+random(4));
    curveVertex(mouseX-5+random(7), mouseY+6+random(4));
    curveVertex(mouseX-15+random(7), mouseY+19+random(4));
    curveVertex(mouseX+26+random(7), mouseY-8+random(4));
    curveVertex(mouseX+16+random(7), mouseY-6+random(4));
    curveVertex(mouseX+26+random(7), mouseY-19+random(4));
    curveVertex(mouseX+9+random(7), mouseY-8+random(4));
    curveVertex(mouseX+10+random(7), mouseY-16+random(4));
    curveVertex(mouseX-20+random(7), mouseY-4+random(4));
    
    endShape();
           
}

  

//colors

if (blau1 == true && mouseX>51 && mouseX<113 && mouseY>239 &&mouseY<298){
    color1 = 72;
    color2 = 72;
    color3 = 72;
    color4 = 142;
    color5 = 205;
    color6 = 205;
  }
  if (lila == true && mouseX>70 && mouseX<130 && mouseY>306 &&mouseY<362){
    color1 = 82;
    color2 = 145;
    color3 = 69;
    color4 = 69;
    color5 = 148;
    color6 = 148;
  }
  if (rosa == true && mouseX>89 && mouseX<146 && mouseY>370 &&mouseY<427){
    color1 = 175;
    color2 = 175;
    color3 = 44;
    color4 = 44;
    color5 = 69;
    color6 = 170;
  }
  if (vermell == true && mouseX>105 && mouseX<163 && mouseY>433 &&mouseY<490){
    color1 = 201;
    color2 = 201;
    color3 = 35;
    color4 = 97;
    color5 = 35;
    color6 = 35;
  }
  if (groc1 == true && mouseX>120 && mouseX<180 && mouseY>498 &&mouseY<555){
    color1 = 203;
    color2 = 203;
    color3 = 154;
    color4 = 194;
    color5 = 50;
    color6 = 50;
  }
  if (groc2 == true && mouseX>137 && mouseX<198 && mouseY>565 &&mouseY<620){
    color1 = 236;
    color2 = 236;
    color3 = 189;
    color4 = 234;
    color5 = 75;
    color6 = 75;
  }
  if (negre == true && mouseX>144 && mouseX<206 && mouseY>215 &&mouseY<273){
    color1 = 45;
    color2 = 51;
    color3 = 26;
    color4 = 51;
    color5 = 20;
    color6 = 38;
  }
    if (marro == true && mouseX>166 && mouseX<223 && mouseY>279 &&mouseY<338){
    color1 = 186;
    color2 = 186;
    color3 = 93;
    color4 = 155;
    color5 = 60;
    color6 = 60;
  }
   if (ocre == true && mouseX>182 && mouseX<238 && mouseY>348 &&mouseY<402){
    color1 = 214;
    color2 = 214;
    color3 = 152;
    color4 = 203;
    color5 = 78;
    color6 = 78;
  }
    if (verd1 == true && mouseX>198 && mouseX<255 && mouseY>412 &&mouseY<468){
    color1 = 75;
    color2 = 164;
    color3 = 194;
    color4 = 194;
    color5 = 59;
    color6 = 59;
  }
   if (verd2 == true && mouseX>216 && mouseX<274 && mouseY>476 &&mouseY<530){
    color1 = 62;
    color2 = 62;
    color3 = 153;
    color4 = 153;
    color5 = 75;
    color6 = 148;
  }
  if (blau2 == true && mouseX>233 && mouseX<290 && mouseY>540 &&mouseY<594){
    color1 = 6;
    color2 = 6;
    color3 = 97;
    color4 = 179;
    color5 = 199;
    color6 = 199;
  }

  if (tinta == true && mouseX>103 && mouseX<218 && mouseY>0 &&mouseY<105){
    color1 = 0;
    color2 = 0;
    color3 = 0;
    color4 = 0;
    color5 = 0;
    color6 = 0;
  }
 
  
}
void mousePressed() {
   pinzellada = false;
    blau1 = true;
   lila = true;
   rosa = true;
   vermell = true;
   groc1 = true;
   groc2 = true;
   negre = true;
   marro = true;
   ocre = true;
   verd1 = true;
   verd2 = true;
   blau2 = true;
   tinta = true;
   pinzell2 = true;
   pinzell3 = true;
   
   
   
   
   
  
}
 
void mouseReleased() {
   pinzellada = true;
    
   blau1 = false;
   lila = false;
   rosa = false;
   vermell = false;
   groc1 = false;
   groc2 = false;
   negre = false;
   marro = false;
   ocre = false;
   verd1 = false;
   verd2 = false;
   blau2 = false;
   tinta = false;
   pinzell2 = false;
   pinzell3 = false;
   
  
   
   
}
void keyPressed() {
  
  
 
 //reset
  
 if (key == 'r'){
   image(foto, 0, 0);
  
  }
}


