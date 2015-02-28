
int egg;
int eggWH;
int time;
int restart;
int x;



void setup(){
  size(500,500);
  restart();
}



void restart(){
  time=millis();
}



void draw(){

  background(148,192,252);
 noStroke();
     fill(124,95,72);
     beginShape();{
         vertex(500,105);
         vertex(395,112);
         vertex(340,30);
         vertex(335,35);
         vertex(380,115);
         vertex(200,118);
         vertex(200,125);
         vertex(400,130);
         vertex(500,125);
    endShape();}
  
//leaf
  fill(115,157,27);
  beginShape();{
    vertex(210,120);
    bezierVertex(200,100,80,50,100,250);
    bezierVertex(100,200,210,220,210,120);
    endShape();}
//butterfly eggs

  if ((millis() <= 2000) && (millis() >= time+0)){ //set time

     background(148,192,252);
     
     noStroke();
     fill(124,95,72);
     beginShape();{
         vertex(500,105);
         vertex(395,112);
         vertex(340,30);
         vertex(335,35);
         vertex(380,115);
         vertex(200,118);
         vertex(200,125);
         vertex(400,130);
         vertex(500,125);
    endShape();}
  
//leaf
  fill(115,157,27);
  beginShape();{
    vertex(210,120);
    bezierVertex(200,100,80,50,100,250);
    bezierVertex(100,200,210,220,210,120);
    endShape();}
    
  egg = 155;
  eggWH = 10;
  
  fill(255,119,33);
  ellipse(egg,egg,eggWH,eggWH);
  ellipse(egg+15,egg+7,eggWH,eggWH);
  ellipse(egg+3,egg+15,eggWH,eggWH);
}


//branch bkgd
  if ((millis() > 2000) && (millis() <= 4000)){ //set time
    background(148,192,252);
    noStroke();
    fill(124,95,72);
    beginShape();{
    vertex(500,105);
    vertex(395,112);
    vertex(340,30);
    vertex(335,35);
    vertex(380,115);
    vertex(200,118);
    vertex(200,125);
    vertex(400,130);
    vertex(500,125);
    endShape();}
  
//leaf
  fill(115,157,27);
  beginShape();{
    vertex(210,120);
    bezierVertex(200,100,80,50,100,250);
    bezierVertex(100,200,210,220,210,120);
    endShape();}
    
  fill(0);
  
//baby catepillar
    beginShape();{
    stroke(0);
    strokeWeight(3);
    vertex(210,115);
    bezierVertex(208,115,195,93,170,95);
    bezierVertex(170,95,165,94,170,90);
    bezierVertex(170,90,195,85,215,111);
    bezierVertex(215,111,220,116,208,115);
    endShape();}
    
//baby catepillar legs
    stroke(0);
    strokeWeight(3);
    line(210,115,207,118);
    line(205,110,202,114);
    line(200,105,196,110);
    line(182,95,180,103);
    line(176,93,174,102);
}

//adult catapillar
//branch bkgd
if ((millis() <= 6000) && (millis() >= 4000)){ //set time
  background(148,192,252);
  noStroke();
  fill(124,95,72);
  beginShape();{
    vertex(500,105);
    vertex(395,112);
    vertex(340,30);
    vertex(335,35);
    vertex(380,115);
    vertex(200,118);
    vertex(200,125);
    vertex(400,130);
    vertex(500,125);
    endShape();
  }
  
//leaf
  fill(115,157,27);
  beginShape();{
    vertex(210,120);
    bezierVertex(200,100,80,50,100,250);
    bezierVertex(100,200,210,220,210,120);
    endShape();}
     
//catepillar    
    stroke(165,224,18);
    strokeWeight(20);
    line(270,110,330,110);
    stroke(255);
    strokeWeight(3);
    
    for (int i=270;i<335;i+=6){ //dot pattern on catepillar
    ellipse(i,109,6,6);}  
}

//cucoon
//branch bkgd
if ((millis() <= 8000) && (millis() >= 6000)){ //set time
background(148,192,252); 
noStroke();
  fill(124,95,72);
  beginShape();{
    vertex(500,105);
    vertex(395,112);
    vertex(340,30);
    vertex(335,35);
    vertex(380,115);
    vertex(200,118);
    vertex(200,125);
    vertex(400,130);
    vertex(500,125);
    endShape();}
  
//leaf
  fill(115,157,27);
  beginShape();{
    vertex(210,120);
    bezierVertex(200,100,80,50,100,250);
    bezierVertex(100,200,210,220,210,120);
    endShape();}
    
//cucoon    
    noStroke();
    fill(255);
    ellipse(350,210,80,130);
    stroke(255);
    strokeWeight(5);
    line(350,125,350,150);
} 

//butterfly
//branch bkgd
if ((millis() <= 10000) && (millis() >= 8000)){ //set time
background(148,192,252);
noStroke();
  fill(124,95,72);
  beginShape();{
    vertex(500,105);
    vertex(395,112);
    vertex(340,30);
    vertex(335,35);
    vertex(380,115);
    vertex(200,118);
    vertex(200,125);
    vertex(400,130);
    vertex(500,125);
    endShape();}
  
//leaf
  fill(115,157,27);
  beginShape();{
    vertex(210,120);
    bezierVertex(200,100,80,50,100,250);
    bezierVertex(100,200,210,220,210,120);
    endShape();}
    
//antennae    
    stroke(0,95,216);
    strokeWeight(2);
    line(100,320,140,340);
    line(110,387,150,350);
     
//butterfly wings big color1   
    noStroke();
    fill(232,188,4);
    rotate(QUARTER_PI);
    ellipse(300,90,150,80);
    rotate(-QUARTER_PI);
    ellipse(230,280,80,80);
    rotate(QUARTER_PI/4);
    ellipse(260,353,80,150);
    ellipse(315,280,80,80);

//butterfly wings small color2
    fill(10,138,255);
    rotate(QUARTER_PI);
    ellipse(330,20,100,60);
    rotate(-QUARTER_PI);
    ellipse(281,238,50,50);
    rotate(QUARTER_PI/4);
    ellipse(320,275,60,100);
    ellipse(355,214,50,50);
 
//butterfly body
    stroke(0,95,216);
    strokeWeight(30);
    line(270,260,325,209);
}    
}



