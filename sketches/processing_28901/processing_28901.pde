
import processing.pdf.*;
import controlP5.*;
ControlP5 controlP5;

float wasser;
float kern;
float kohle;
float wind;
float bio;
float oel;
float erdgas;
float sonne;
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
    float mg = random(50, 150);
    switch(i){
      case 0:
        wasser = mg;
        break;
      case 1:
        kern = mg;
        break;
      case 2:
        kohle = mg;
        break;
      case 3:
        wind = mg;
        break;
      case 4:
        bio = mg;
        break;
      case 5:
        oel = mg;
        break;
      case 6:
        erdgas = mg;
        break;
      case 7:
        sonne = mg;
        break;
    }    
  }
  
  gesamt = (wasser + kern + kohle + wind + bio + oel + erdgas + sonne)/8;
  rueck = random(20, 150);
  
  controlP5 = new ControlP5(this);
  controlP5.setColorActive(color(80, 70));
  controlP5.setColorBackground(color(170, 70));
  controlP5.setColorForeground(color(50, 70));
  controlP5.setColorLabel(color(50));
  controlP5.setColorValue(color(255));
  
  sliders = new Slider[9];
  int sl = 0;
  
  sliders[sl] = controlP5.addSlider("wasser", 0, 150, wasser, 10, 10, 200, 20);
  sliders[sl++].setLabel("Wasserkraft");
  sliders[sl] = controlP5.addSlider("kern", 0, 150, kern, 10, 35, 200, 20);
  sliders[sl++].setLabel("Kernenergie");
  sliders[sl] = controlP5.addSlider("kohle", 0, 150, kohle, 10, 60, 200, 20);
  sliders[sl++].setLabel("Kohleenergie");
  sliders[sl] = controlP5.addSlider("wind", 0, 150, wind, 10, 85, 200, 20);
  sliders[sl++].setLabel("Windenergie");
  sliders[sl] = controlP5.addSlider("bio", 0, 150, bio, 10, 110, 200, 20);
  sliders[sl++].setLabel("Biomasse");
  sliders[sl] = controlP5.addSlider("oel", 0, 150, oel, 10, 135, 200, 20);
  sliders[sl++].setLabel("Erdöl");
  sliders[sl] = controlP5.addSlider("erdgas", 0, 150, erdgas, 10, 160, 200, 20);
  sliders[sl++].setLabel("Erdgas");
  sliders[sl] = controlP5.addSlider("sonne", 0, 150, sonne, 10, 185, 200, 20);
  sliders[sl++].setLabel("Sonnenenergie");
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
  
  gesamt = (wasser + kern + kohle + wind + bio + oel + erdgas + sonne)/8;
  //ellipse(500, 200, gesamt, gesamt);

  for(int i=0; i<8; i++){
    fill(0, 20);
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI/4*i);
    //rect(-20, 0, 40, -150);
    
    switch(i){
      case 0:
        dm = wasser;
        fill(89, 176, 219, 70);
        break;
      case 1:
        dm = kern;
        fill(173, 94, 157, 70);
        break;
      case 2:
        dm = kohle;
        fill(223, 74, 0, 70);
        break;
      case 3:
        dm = wind;
        fill(0, 20);
        break;
      case 4:
        dm = bio;
        fill(143, 199, 0, 70);
        break;
      case 5:
        dm = oel;
        fill(0, 70);
        break;
      case 6:
        dm = erdgas;
        fill(255, 255, 0, 70);
        break;
      case 7:
        dm = sonne;
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

