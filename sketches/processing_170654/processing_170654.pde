
void setup () {
   size(600,600);
   background(0,0,0);
   
 }
 int value = 255;
 int value2= 255;
 boolean trigger = false;
 float augmentaY = 450;
 int colorDents=0;
 int tamanyUlls=75;
 int moviment=4;
 int colorAnell=0;
 int anellX=150;
 int anellY=30;
 int morat1=87;
 int morat2=35;
 int morat3=100;
 int t=0;
void draw(){
  println(mouseX+","+mouseY);//mouse
  
  fill(87,35,100);
  stroke(83,35,100);
  //front
  arc(300, 250, 350, 300, PI, 2*PI, OPEN);
  
  noFill();  
  beginShape();
  curveVertex(126,250);
  curveVertex(151,370);
  endShape();
  
  fill(87,35,100);
  stroke(87,35,100);
  //Lluna
  beginShape();
  vertex(502, 20);
  bezierVertex(520, 25, 100, 0, 470, 75);
  fill(87,35,100);
  //Cara
  beginShape();
    vertex(125, 250);
    vertex(125, 373);
    vertex(216, 471);
    vertex(375, 471);
    vertex(475, 373);
    vertex(475, 250);
    endShape(CLOSE);
  endShape();
  //venes  
stroke(morat1,morat2,morat3);

beginShape();
  curveVertex(311,151);
  curveVertex(311,151);
  curveVertex(323,174);
  curveVertex(315,191);
  curveVertex(315,191);
endShape();

beginShape();
  curveVertex(317,147);
  curveVertex(317,147);
  curveVertex(326,159);
  curveVertex(335,154);
  curveVertex(335,154);
endShape();

beginShape();
  curveVertex(342,160);
  curveVertex(342,160);
  curveVertex(331,175);
  curveVertex(322,195);
  curveVertex(322,195);
endShape();

if( trigger==true){
  noFill();
    morat1=morat1-2;
    morat2=morat2-2;
    morat3=morat3-2;
}

 
  
  fill(255,255,255);
  stroke(colorDents,0,0);
  strokeWeight(1.5);
  //dents
  beginShape(TRIANGLE_STRIP);
    vertex(203, 360);
    vertex(231, 408);
    vertex(250, 360);
    vertex(278, 408);
    vertex(296, 360);
    vertex(314, 408);
    vertex(342, 360);
    vertex(360, 408);
    vertex(388, 360);
  endShape();
  //color dels dents
  if(trigger==true){
  colorDents= colorDents+3;
  }
  
 tamanyUlls=tamanyUlls+moviment;
  fill(value,value2,0);
  stroke(255,0,0);
  strokeWeight(1);
  //ulls
  ellipse(228,236,tamanyUlls,tamanyUlls);
  ellipse(365,236,tamanyUlls,tamanyUlls);
  fill(0,0,0);
  noStroke();
  
  

  //ull esquerre mou
  float ullE = map(mouseX, 0, width, 210, 250);
  //ull dret mou
  float ullD = map(mouseX, 0, width, 340, 375);
  //altura moviment ulls
  float ullX = map(mouseY, 0, height, 210, 260);
   if (t >= 0 && t < 10){
    //pupil·la esquerra
    ellipse(ullE,ullX,25,25);
     
    //pupuil·la dreta
      ellipse(ullD,ullX,25,25);
   } 

  //color dels ulls
  if(trigger == true){
    value2=value2-3;
   }

  
  noFill();
  stroke(0,0,0);
  strokeWeight(1);
  //nas
    curve(400,400,250,315,300,303,350,400);
    curve(400,400,300,303,350,315,350,400);
    
  fill(0,0,0);
  noStroke();
  //forats del nas
    ellipse(272,311,4,4);
    ellipse(319,311,4,4);
  
  noFill();
  stroke(0,0,0);
  strokeWeight(5);
  //celles  
  line(205,161,275,229);
  line(390,161,320,229);
  

  noFill();
  stroke(255,0,0);
  strokeWeight(2.5);
  //sang boca
  line(360,408,355,420);
  line(355,420,360,438);
  line(360,438,355,450);
  line(230,408,225,420);
  line(225,420,230,438);
  line(230,438,225,450);
  //expansió sang
    if(trigger ==true && augmentaY<=470 ){
  line(225,450,225,augmentaY);
  line(355,450,355,augmentaY);
  augmentaY= augmentaY+0.3;
  }
  else if(trigger == true || trigger == false  && augmentaY>470) {
    
  line(225,450,225,470);
  line(355,450,355,470);
  }
  
 
  fill(87,35,100);
  stroke(87,35,100);
  //Banya dreta
  beginShape();
  curveVertex(383,116);
  curveVertex(383,116);
  curveVertex(403,100);
  curveVertex(406,81);
  curveVertex(400,50);
  curveVertex(448,103);
  curveVertex(446,162);
  curveVertex(383,116);
  endShape();
  //Banya esquerra
  beginShape();
  curveVertex(218,116);
  curveVertex(218,116);
  curveVertex(192,106);
  curveVertex(184,92);
  curveVertex(177,61);
  curveVertex(173,50);
  curveVertex(141,100);
  curveVertex(154,164);
  curveVertex(154,164);
  endShape();
  
  noFill();
  stroke(0,0,0);
  strokeWeight(1.5);
  //cicatriu
  line(414,334,444,267);
  line(404,311,434,326);
  line(414,294,441,304);
  line(424,274,450,283);
  
  fill(87,35,100);
  stroke(0,0,0);
  strokeWeight(1.5);
  //linia de la front
  line(218,113,296,132);
  line(296,132,383,113);
  
  fill(87,35,100);
  stroke(87,35,100);
  //orella dreta
  beginShape();
  curveVertex(476,238);
  curveVertex(476,238);
  curveVertex(546,162);
  curveVertex(476,316);
  curveVertex(476,316);
  endShape();
  //orella esquerra
  beginShape();
  curveVertex(125,238);
  curveVertex(125,238);
  curveVertex(42,162);
  curveVertex(125,316);
  curveVertex(125,316);
  endShape();
  
  stroke(0,0,0); 
  strokeWeight(1); 
  //part orella interna
  beginShape();
  curveVertex(489,234);
  curveVertex(489,234);
  curveVertex(502,218);
  curveVertex(530,186);
  curveVertex(511,228);
  curveVertex(489,271);
  curveVertex(489,271);
  endShape();
  
  beginShape();
  curveVertex(114,234);
  curveVertex(114,234);
  curveVertex(94,217);
  curveVertex(62,187);
  curveVertex(82,228);
  curveVertex(106,271);
  curveVertex(106,271);
  endShape();
  //arracades
  fill(255,0,0);
  ellipse(480,295,10,10);
  ellipse(120,295,10,10);
  //anell dimoni
   anellX=anellX+moviment;
  anellY=anellY+moviment;
  noStroke();
  if(trigger == true){
  fill(colorAnell,0,0);
  ellipse(295,65,anellX,anellY);
  fill(0,0,0);
  ellipse(295,65,120,20);
  colorAnell=colorAnell+3;
  }
 
  //moviment ulls
  
  if((tamanyUlls<0)||(tamanyUlls>width)){}
  
    moviment = -moviment;
    
  //text 
  fill(0,0,0);
  if(trigger==true){
    fill(colorAnell,0,0);
    textSize(40);
    text("Voy a por ti", 185, 537);
    colorAnell=colorAnell+3;
  }
  
  
}



void mousePressed(){

trigger = true;

}
void mouseReleased(){

trigger = false;
}


