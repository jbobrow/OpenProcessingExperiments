
//assignment 2. oliver hensel-brown.

void setup(){
  size (700,500);
}

void draw(){
    //BACKGROUND PATTERN
  //first loop darker red
  background(139,28,28);
  smooth();
  for(int x = 0; x<=width; x = x+30) {
    for(int y = 0; y<=height; y = y+30){
      fill(211,45,45);
      noStroke();
      ellipse(x,y,32,32);
    }
  }
  
  //second loop lighter red
  for(int x = 0; x<=width; x=x+30){
    for(int y =0; y<=height; y=y+30){
      fill(203,82,82);
      ellipse( x, y, 20,20);
    }
  }
  //spot light for standing in
  fill(255);
  ellipse(530,400,200,50);

//MONSTER
    
    fill(0);
    
    //BODY
    beginShape();
    vertex(590,150);
    vertex(520,170);
    vertex(540,220);
    vertex(540,290);
    vertex(585,290);
    vertex(605,210);
    endShape();

    //rightleg
    beginShape();
    vertex(540,275);
    vertex(480,320);
    vertex(510,390);
    vertex(515,390);
    vertex(505,325);
    vertex(545,290);
    endShape();
    
    //leftleg
    beginShape();
    vertex(580,270);
    vertex(537,328);
    vertex(560,400);
    vertex(565,400);
    vertex(560,330);
    vertex(585,290);
    endShape();
    
    //neck
    beginShape();
    vertex(547,170);
    vertex(547,130);
    vertex(510,115);
    vertex(515,100);
    vertex(558,125);
    vertex(565,170);
    endShape();
    
    //head
    beginShape();
    vertex(514,90);
    vertex(490,70);
    vertex(440,80);
    vertex(443,120);
    vertex(480,114);
    vertex(490,140);
    vertex(507,130);
    vertex(515,120);
    endShape();
    
    //eye
    fill(255);
    ellipse(490,97,14,14);
    fill(0);
    ellipse(488,98,8,8);
    
    //left foot
    beginShape();
    vertex(515,385);
    vertex(490,392);
    vertex(487,403);
    vertex(520,400);
    endShape();
    
     //right foot
     fill(0);
    beginShape();
    vertex(565,390);
    vertex(540,399);
    vertex(536,413);
    vertex(570,407);
    endShape();
    


fill(255,72,0);
if(mousePressed){
  //FLAME
  beginShape();
  vertex(440,138);
  vertex(270,100);
  vertex(140,150);
  vertex(120,240);
  vertex(200,320);
  vertex(350,300);
  endShape();
  //fill(255);
  triangle(380,127,340,130,300,70);
  triangle(340,127,300,130,250,80);
  triangle(300,110,270,130,180,95);
  triangle(250,113,240,130,150,100);
  triangle(380,137,360,140,326,75);
  triangle(310,110,280,130,190,65);
  triangle(310,120,280,140,190,55);
  triangle(390,137,370,140,337,80);
  triangle(270,124,270,144,100,130);
  triangle(270,135,296,177,86,145);
  triangle(270,130,296,200,87,160);
  triangle(240,150,240,230,70,180);
  triangle(240,160,240,240,70,230);
  triangle(240,170,240,230,78,200);
  triangle(240,200,240,250,80,280);
  triangle(240,170,240,250,80,220);
  triangle(240,190,240,260,60,240);
  triangle(240,200,240,260,100,260);
  triangle(240,240,240,280,85,320);
  triangle(240,227,240,280,50,300); 
  triangle(240,250,240,280,70,314);
  triangle(240,240,240,280,130,330);
  triangle(240,240,240,300,160,340);
  triangle(240,230,240,280,111,325);
  triangle(240,260,270,280,170,340);
  triangle(240,260,270,280,170,362);
  triangle(250,260,290,280,190,374);
  triangle(300,260,330,280,250,374);
  triangle(328,260,360,280,320,378);
  triangle(290,260,330,280,205,395);
  triangle(300,260,330,280,260,374);
  triangle(300,260,339,280,296,350);
  triangle(300,260,339,280,314,360);
  triangle(360,260,320,280,340,370);
  triangle(360,260,320,280,350,360);
  triangle(380,200,340,200,366,330);
  triangle(380,200,340,200,378,330);
  triangle(400,160,360,160,390,280);
  triangle(400,160,360,160,406,250);
  

  
   //left arm 2
   fill(0);
    beginShape();
    vertex(530,170);
    vertex(480,160);
    vertex(430,220);
    vertex(440,220);
    vertex(484,177);
    vertex(530,185);
    endShape();
    
    //left hand 2
      beginShape();
      vertex(450,205);
      vertex(420,215);
      vertex(430,230);
      vertex(452,209);
      endShape();
      //fingers 2
      fill(0);
      triangle(420,215,426,220,390,220);
      triangle(425,218,430,225,395,235);
      triangle(426,221,430,230,410,254);
    
    //right arm 2
    beginShape();
    vertex(590,150);
    vertex(590,165);
    vertex(625,157);
    vertex(660,220);
    vertex(670,220);
    vertex(630,140);
    endShape();
    
     //right hand 2
       beginShape();
       vertex(650,200);
       vertex(647,227);
       vertex(672,227);
       vertex(660,200);
       endShape();
       //fingers 2
       triangle(660,224,670,223,684,250);
       triangle(653,224,661,224,655,254);
       triangle(647,224,656,224,637,250);
       
       //JAW 2
     beginShape();
     vertex(485,120);
     vertex(455,147);
     vertex(475,150);
     vertex(490,139);
     endShape();
  
  

    
  } else{
      
     
      fill(0);
      //eyebrow toggle
      stroke(0);
      strokeWeight(6);
      line(477,94,497,91);
      
      //left arm 1
      
      noStroke();
    beginShape();
    vertex(530,170);
    vertex(480,150);
    vertex(440,210);
    vertex(450,210);
    vertex(484,167);
    vertex(530,185);
    endShape();
    
      //left hand 1
      beginShape();
      vertex(450,205);
      vertex(420,215);
      vertex(430,230);
      vertex(452,209);
      endShape();
      //fingers 1
      fill(0);
      triangle(420,215,426,220,390,230);
      triangle(425,218,430,225,395,240);
      triangle(426,221,430,230,410,250);
    
    //right arm 1
    
    beginShape();
    vertex(590,150);
    vertex(590,165);
    vertex(625,147);
    vertex(650,200);
    vertex(660,200);
    vertex(630,130);
    endShape();
    
       //right hand 1
       beginShape();
       vertex(650,200);
       vertex(647,227);
       vertex(670,225);
       vertex(660,200);
       endShape();
       //fingers
       fill(0);
       triangle(660,224,670,223,678,250);
       triangle(653,224,661,224,665,254);
       triangle(647,224,656,224,650,250);
       
     //JAW 1
     beginShape();
     vertex(485,120);
     vertex(445,127);
     vertex(460,140);
     vertex(490,139);
     endShape();
    
      
  }

}

