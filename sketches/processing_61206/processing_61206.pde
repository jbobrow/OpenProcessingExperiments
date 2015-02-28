

import processing.pdf.*;
import controlP5.*;
ControlP5 controlP5;

float var1;
float var2;
float var3;
float var4;
float var5;
float var6;
float var7;
float var8;
float dm;
float rueck;
float gesamt;
boolean record;
Slider[] sliders;

void setup(){
  size(900, 400);
  background(255);
  noStroke();
  smooth();
  
  

  
  for(int i=0; i<8; i++){
    float mg = random(50, 100);
    switch(i){
      case 0:
        var1 = mg;
        break;
      case 1:
        var2 = mg;
        break;
      case 2:
        var3 = mg;
        break;
      case 3:
        var4 = mg;
        break;
      case 4:
        var5 = mg;
        break;
      case 5:
        var6 = mg;
        break;
      case 6:
        var7 = mg;
        break;
      case 7:
        var8 = mg;
        break;
    }    
  }
  
    gesamt = (var1+var2+var3+var4+var5+var6+var7+var8)/8;
  rueck = random(20, 50);
  
  controlP5 = new ControlP5(this);
  controlP5.setColorActive(color(80, 70));
  controlP5.setColorBackground(color(170, 70));
  controlP5.setColorForeground(color(50, 70));
  controlP5.setColorLabel(color(50));
  controlP5.setColorValue(color(255));
  
  sliders = new Slider[9];
  int sl = 0;
  
  sliders[sl] = controlP5.addSlider("var1", 0, 100, var1, 10, int(random(3)), 200, 20);
  sliders[sl++].setLabel("ONE");
  sliders[sl] = controlP5.addSlider("var2", 0, 100, var2, 10, 35, 200, 20);
  sliders[sl++].setLabel("TWO");
  sliders[sl] = controlP5.addSlider("var3", 0, 100, var3, 10, 60, 200, 20);
  sliders[sl++].setLabel("THREE");
  sliders[sl] = controlP5.addSlider("var4", 0, 100, var4, 10, 85, 200, 20);
  sliders[sl++].setLabel("FOUR");
  sliders[sl] = controlP5.addSlider("var5", 0, 100, var5, 10, 110, 200, 20);
  sliders[sl++].setLabel("FIVE");
  sliders[sl] = controlP5.addSlider("var6", 0, 100, var6, 10, 135, 200, 20);
  sliders[sl++].setLabel("SIX");
  sliders[sl] = controlP5.addSlider("var7", 0, 100, var7, 10, 160, 200, 20);
  sliders[sl++].setLabel("SEVEN");
  sliders[sl] = controlP5.addSlider("var8", 0, 100, var8, 10, 185, 200, 20);
  sliders[sl++].setLabel("EIGHT");
  //sliders[sl] = controlP5.addSlider("rueck", 0, 150, rueck, 10, 210, 200, 20);
  //sliders[sl++].setLabel("Sonnenenergie");
}

void draw(){
  if(record==true){
    //String dateiname = words + ".pdf";
    beginRecord(PDF, "####.pdf");
  }
  
  background(255);
  noStroke();
  
    gesamt = (var1+var2+var3+var4+var5+var6+var7+var8)/8;
  //ellipse(500, 200, gesamt, gesamt);

  for(int i=0; i<8; i++){
    fill(0, 20);
    pushMatrix();
    translate(width/2, height/2*random(0.2)+130);
    rotate(PI/4*i);
    //rect(-20, 0, 40, -150);
    
    switch(i){
      case 0:
        dm = var1;
        fill(0,0,0,90);
        break;
      case 1:
        dm = var2;
          fill(0,0,0,95);
        break;
      case 2:
        dm = var3;
          fill(0,0,0,95);
        break;
      case 3:
        dm = var4;
         fill(5,5,5,90);
        break;
      case 4:
        dm = var5;
        fill(10,10,10,70);
        break;
      case 5:
        dm = var6;
        fill(10,10,10,70);
        break;
      case 6:
        dm = var7;
          fill(10,10,10,70);
        break;
      case 7:
        dm = var8;
        fill(255, 204, 0, 70);
        break;
    }   
    
    rect(-20, 0, 40, -dm);
    popMatrix();
    //arc(500, 200, dm, dm, 0+PI/4*i, PI/4*(i+1));
    //fill(60, 208, 211, 60);
   // arc(500, 200, dm/5, dm/5, 0+PI/4*i, PI/4*(i+1));
    //vertex(500+cos(PI/4*i)*dm/3,200+sin(PI/4*i)*dm/3);
  }
  endShape();
  stroke(255);
  noFill();
  for(int i=0; i<8; i++){
    //line(500,200,500+cos(PI/4*i)*800,200+sin(PI/4*i)*800);
    //ellipse(500, 200, 100*(i+1), 100*(i+1));
  }
  
  
  noStroke();
  fill(111, 137, 189, 60);
 // ellipse(500, 200, rueck, rueck);
  
  if(record == true){
    endRecord();
    record=false;
  }
}

void keyPressed(){
  if(key == 's' || key == 'S'){
    record = true;
  }
}

