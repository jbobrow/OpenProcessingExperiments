

import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
 
//int x;
//int y;

void setup(){
  size(350,700);
  background(255);
  smooth();
  minim = new Minim(this); 
  // this loads mysong.wav from the data folder
  song = minim.loadFile("f8c204.mp3");
  song.play();

}

void draw(){
  strokeWeight(1);
  line(50,0,50,700);
  line(100,0,100,700);
  line(150,0,150,700);
  line(200,0,200,700);
  line(250,0,250,700);
  line(300,0,300,700);
  line(0,50,350,50);
  line(0,100,350,100);
  line(0,150,350,150);
  line(0,200,350,200);
  line(0,250,350,250);
  line(0,300,350,300);
  line(0,350,350,350);
  line(0,400,350,400);
  line(0,450,350,450);
  line(0,500,350,500);
  line(0,550,350,550);
  line(0,600,350,600);
  line(0,650,350,650);

  fill(#ff0261);
  beginShape(); 
    vertex(150,50); 
    vertex(200,50);
    vertex(200,100);
    vertex(150,100);
  endShape(CLOSE);
//red

  fill(#f2854a);
  beginShape();
    vertex(125,100); 
    vertex(175,100);
    vertex(175,150);
    vertex(125,150);
  endShape(CLOSE);
//orange

  fill(#f9fb38);
  beginShape(); 
    vertex(175,100); 
    vertex(225,100);
    vertex(225,150);
    vertex(175,150);
  endShape(CLOSE);
//yellow

  fill(#33fd41);
  beginShape(); 
    vertex(150,150); 
    vertex(200,150);
    vertex(200,200);
    vertex(150,200);
  endShape(CLOSE);
//green

  fill(#00a5af);
  beginShape(); 
    vertex(125,200); 
    vertex(175,200);
    vertex(175,250);
    vertex(125,250); 
  endShape(CLOSE);
//teal

  fill(#236bff);
  beginShape(); 
    vertex(175,200); 
    vertex(225,200);
    vertex(225,250);
    vertex(175,250);
  endShape(CLOSE);
//blue

  fill(#7c2dfe);
  beginShape(); 
    vertex(150,250); 
    vertex(200,250);
    vertex(200,300);
    vertex(150,300);
  endShape(CLOSE);
//pp
  noStroke();
  
  background(#ffffff);
  fill(#ff0261);
  beginShape(); 
    vertex(150,50); 
    vertex(200,50);
    vertex(200,100);
    vertex(150,100);
  endShape(CLOSE);
//red

  fill(#f2854a);
  beginShape();
    vertex(125,100); 
    vertex(175,100);
    vertex(175,150);
    vertex(125,150);
  endShape(CLOSE);
//orange

  fill(#f9fb38);
  beginShape(); 
    vertex(175,100); 
    vertex(225,100);
    vertex(225,150);
    vertex(175,150);
  endShape(CLOSE);
//yellow

  fill(#33fd41);
  beginShape(); 
    vertex(150,150); 
    vertex(200,150);
    vertex(200,200);
    vertex(150,200);
  endShape(CLOSE);
//green

  fill(#00a5af);
  beginShape(); 
    vertex(125,200); 
    vertex(175,200);
    vertex(175,250);
    vertex(125,250); 
  endShape(CLOSE);
//teal

  fill(#236bff);
  beginShape(); 
    vertex(175,200); 
    vertex(225,200);
    vertex(225,250);
    vertex(175,250);
  endShape(CLOSE);
//blue

  fill(#7c2dfe);
  beginShape(); 
    vertex(150,250); 
    vertex(200,250);
    vertex(200,300);
    vertex(150,300);
  endShape(CLOSE);
//pp
  
  if(mouseX>150 && mouseX<200 && mouseY>50 && mouseY<100 || keyPressed && key=='a'){
    fill(#ff0261);//red
    pushMatrix();
      translate(0,0);  
      beginShape();
        vertex(150,360); 
        vertex(160,360);
        vertex(160,350);
        vertex(190,350);
        vertex(190,360); 
        vertex(200,360);
        vertex(200,390);
        vertex(190,390);
        vertex(190,400); 
        vertex(160,400);
        vertex(160,390);
        vertex(150,390);
      endShape(CLOSE);
      
      rect(150,400,10,10);
      rect(150,410,10,10);
      rect(140,420,10,10);
      rect(130,430,10,10);
      rect(120,440,10,10);
      rect(110,450,10,10);
      rect(100,460,10,10);
      rect(110,470,10,10);
      rect(120,480,10,10);
      rect(130,490,10,10);
      rect(140,500,10,10);
      
      rect(190,400,10,10);
      rect(200,410,10,10);
      rect(210,420,10,10);
      rect(220,430,10,10);
      rect(230,440,10,10);
      rect(220,450,10,10);
      rect(210,460,10,10);
      rect(220,470,10,10);
      rect(230,480,10,10);
      rect(240,490,10,10);
      rect(250,500,10,10);
      
      rect(170,400,10,10);
      rect(170,410,10,10);
      rect(180,420,10,10);
      rect(170,430,10,10);
      rect(180,440,10,10);
      rect(170,450,10,10);
      rect(160,460,10,10);
      rect(150,470,10,10);
      rect(160,480,10,10);
      rect(170,490,10,10);
      rect(180,500,10,10);
      
      rect(200,380,10,10);
      rect(210,390,20,10);
      rect(230,400,10,10);
      rect(240,410,10,10);
      rect(250,420,10,10);
      rect(260,430,10,10);
      rect(270,440,10,10);
      rect(260,450,10,10);
      rect(270,460,10,10);
      rect(280,470,10,10);
      rect(290,460,10,10);
      rect(300,450,10,10);
      
      rect(140,380,10,10);
      rect(130,390,10,10);
      rect(120,400,10,10);
      rect(110,410,10,10);
      rect(100,420,10,10);
      rect(90,430,10,10);
      rect(80,440,10,10);
      rect(70,450,10,10);
      rect(60,460,10,10);
      rect(70,470,10,10);
      rect(80,480,10,10);
      rect(70,490,10,10);
    popMatrix();
   
  }
  else if(mouseX>125 && mouseX<175 && mouseY>100 && mouseY<150 || keyPressed && key=='s') {
    fill(#f2854a);//orange
    pushMatrix(); 
      translate(-50,50); 
      beginShape();
       vertex(150,360); 
       vertex(160,360);
       vertex(160,350);
       vertex(190,350);
       vertex(190,360); 
       vertex(200,360);
       vertex(200,390);
       vertex(190,390);
       vertex(190,400); 
       vertex(160,400);
       vertex(160,390);
       vertex(150,390);
     endShape(CLOSE);
    
     rect(150,400,10,10);
     rect(140,410,10,10);
     rect(130,420,10,10);
     rect(120,430,10,10);
     rect(110,440,10,10);
     rect(120,450,10,10);
     rect(130,460,10,10);
     rect(140,470,10,10);
     rect(150,480,10,10);
     rect(160,490,10,10);
     rect(170,500,10,10);
    //left2
    
     rect(190,400,10,10);
     rect(200,410,10,10);
     rect(210,420,10,10);
     rect(220,430,10,10);
     rect(220,440,10,10);
     rect(230,450,10,10);
     rect(240,460,10,10);
     rect(250,470,10,10);
     rect(260,480,10,10);
     rect(270,490,10,10);
     rect(270,500,10,10);
    //rignt2
    
     rect(170,400,10,10);
     rect(170,410,10,10);
     rect(180,420,10,10);
     rect(180,430,10,10);
     rect(180,440,10,10);
     rect(170,450,10,10);
     rect(180,460,10,10);
     rect(180,470,10,10);
     rect(190,480,10,10);
     rect(200,490,10,10);
     rect(210,500,10,10);
    //middle
    
     rect(200,380,10,10);
     rect(210,390,20,10);
     rect(220,390,10,10);
     rect(230,390,10,10);
     rect(240,400,10,10);
     rect(240,410,10,10);
     rect(250,420,10,10);
     rect(260,430,10,10);
     rect(270,440,10,10);
     rect(280,450,10,10);
     rect(290,450,10,10);
     rect(300,450,10,10);
    //right1
    
     rect(140,380,10,10);
     rect(130,380,10,10);
     rect(120,390,10,10);
     rect(110,400,10,10);
     rect(100,410,10,10);
     rect(100,420,10,10);
     rect(90,430,10,10);
     rect(80,440,10,10);
     rect(70,450,10,10);
     rect(60,460,10,10);
     rect(70,450,10,10);
     rect(800,440,10,10);
    popMatrix();
    //letf 1
  }
  else if(mouseX>175 && mouseX<225 && mouseY>100 && mouseY<150 || keyPressed && key=='d') {
    fill(#f9fb38);//yellow
    pushMatrix(); 
      translate(50,50); 
      beginShape();
       vertex(150,360); 
       vertex(160,360);
       vertex(160,350);
       vertex(190,350);
       vertex(190,360); 
       vertex(200,360);
       vertex(200,390);
       vertex(190,390);
       vertex(190,400); 
       vertex(160,400);
       vertex(160,390);
       vertex(150,390);
     endShape(CLOSE);
    
     rect(160,400,10,10);
     rect(150,410,10,10);
     rect(150,420,10,10);
     rect(140,430,10,10);
     rect(140,440,10,10);
     rect(130,450,10,10);
     rect(130,460,10,10);
     rect(120,470,10,10);
     rect(120,480,10,10);
     rect(110,490,10,10);
     rect(110,500,10,10);
    //lefe2
    
     rect(190,400,10,10);
     rect(200,410,10,10);
     rect(200,420,10,10);
     rect(210,430,10,10);
     rect(210,440,10,10);
     rect(220,450,10,10);
     rect(220,460,10,10);
     rect(230,470,10,10);
     rect(230,480,10,10);
     rect(240,490,10,10);
     rect(240,500,10,10);
    //right2
    
     rect(170,400,10,10);
     rect(170,410,10,10);
     rect(170,420,10,10);
     rect(170,430,10,10);
     rect(180,440,10,10);
     rect(180,450,10,10);
     rect(170,460,10,10);
     rect(170,470,10,10);
     rect(180,480,10,10);
     rect(180,490,10,10);
     rect(170,500,10,10);
    //middle
    
     rect(200,380,10,10);
     rect(210,380,20,10);
     rect(220,380,10,10);
     rect(230,390,10,10);
     rect(230,400,10,10);
     rect(240,410,10,10);
     rect(250,420,10,10);
     rect(260,430,10,10);
     rect(270,440,10,10);
     rect(280,450,10,10);
     rect(280,460,10,10);
     rect(270,470,10,10);
    //right1
    
     rect(140,380,10,10);
     rect(130,390,10,10);
     rect(120,400,10,10);
     rect(110,390,10,10);
     rect(100,380,10,10);
     rect(90,370,10,10);
     rect(80,360,10,10);
     rect(70,350,10,10);
     rect(60,340,10,10);
     rect(50,350,10,10);
     rect(40,360,10,10);
     rect(30,370,10,10);
    popMatrix();     
    //left1
  }
  else if(mouseX>150 && mouseX<200 && mouseY>150 && mouseY<200 || keyPressed && key=='f') {
    fill(#33fd41);//green
    pushMatrix(); 
      translate(0,100); 
      beginShape();
       vertex(150,360); 
       vertex(160,360);
       vertex(160,350);
       vertex(190,350);
       vertex(190,360); 
       vertex(200,360);
       vertex(200,390);
       vertex(190,390);
       vertex(190,400); 
       vertex(160,400);
       vertex(160,390);
       vertex(150,390);
     endShape(CLOSE);
    
     rect(150,400,10,10);
     rect(150,410,10,10);
     rect(150,420,10,10);
     rect(140,420,10,10);
     rect(130,430,10,10);
     rect(120,440,10,10);
     rect(120,450,10,10);
     rect(110,460,10,10);
     rect(110,470,10,10);
     rect(100,480,10,10);
     rect(100,490,10,10);
    //left2
    
     rect(190,400,10,10);
     rect(200,410,10,10);
     rect(210,420,10,10);
     rect(220,420,10,10);
     rect(220,430,10,10);
     rect(230,440,10,10);
     rect(240,450,10,10);
     rect(240,460,10,10);
     rect(250,470,10,10);
     rect(250,480,10,10);
     rect(260,490,10,10);
    //right2
    
     rect(170,400,10,10);
     rect(170,410,10,10);
     rect(180,420,10,10);
     rect(180,430,10,10);
     rect(180,440,10,10);
     rect(190,450,10,10);
     rect(190,460,10,10);
     rect(200,470,10,10);
     rect(210,480,10,10);
     rect(220,490,10,10);
     rect(220,500,10,10);
    //middle
    
     rect(200,380,10,10);
     rect(210,390,20,10);
     rect(230,400,10,10);
     rect(240,410,10,10);
     rect(250,420,10,10);
     rect(260,430,10,10);
     rect(270,440,10,10);
     rect(280,450,10,10);
     rect(290,460,10,10);
     rect(300,470,10,10);
     rect(310,460,10,10);
     rect(320,450,10,10);
    //right1
    
     rect(140,380,10,10);
     rect(130,390,10,10);
     rect(120,400,10,10);
     rect(110,410,10,10);
     rect(100,420,10,10);
     rect(90,430,10,10);
     rect(80,440,10,10);
     rect(70,450,10,10);
     rect(60,460,10,10);
     rect(50,470,10,10);
     rect(40,480,10,10);
     rect(30,490,10,10);
    //left1
    popMatrix();     
  }
  
  else if(mouseX>125 && mouseX<175 && mouseY>200 && mouseY<250|| keyPressed && key=='j' ) {
    fill(#00a5af);//teal
    pushMatrix(); 
      translate(-50,150); 
      beginShape();
       vertex(150,360); 
       vertex(160,360);
       vertex(160,350);
       vertex(190,350);
       vertex(190,360); 
       vertex(200,360);
       vertex(200,390);
       vertex(190,390);
       vertex(190,400); 
       vertex(160,400);
       vertex(160,390);
       vertex(150,390);
     endShape(CLOSE);
    
     rect(150,400,10,10);
     rect(150,410,10,10);
     rect(140,410,10,10);
     rect(130,420,10,10);
     rect(120,430,10,10);
     rect(110,440,10,10);
     rect(100,450,10,10);
     rect(110,460,10,10);
     rect(120,470,10,10);
     rect(130,480,10,10);
     rect(140,490,10,10);
    //left2
    
     rect(190,400,10,10);
     rect(200,410,10,10);
     rect(210,420,10,10);
     rect(220,430,10,10);
     rect(230,440,10,10);
     rect(220,450,10,10);
     rect(210,460,10,10);
     rect(220,470,10,10);
     rect(230,480,10,10);
     rect(240,490,10,10);
     rect(250,500,10,10);
    //right2
    
     rect(170,400,10,10);
     rect(170,410,10,10);
     rect(180,420,10,10);
     rect(190,430,10,10);
     rect(190,440,10,10);
     rect(180,450,10,10);
     rect(180,460,10,10);
     rect(180,470,10,10);
     rect(170,480,10,10);
     rect(170,490,10,10);
     rect(180,500,10,10);
    //middle
    
     rect(200,380,10,10);
     rect(210,390,20,10);
     rect(220,400,10,10);
     rect(230,410,10,10);
     rect(240,420,10,10);
     rect(250,430,10,10);
     rect(260,420,10,10);
     rect(270,410,10,10);
     rect(280,400,10,10);
     rect(290,390,10,10);
     rect(300,380,10,10);
     rect(310,370,10,10);
    //right1
    
     rect(140,380,10,10);
     rect(130,380,10,10);
     rect(120,370,10,10);
     rect(110,360,10,10);
     rect(100,360,10,10);
     rect(90,370,10,10);
     rect(80,380,10,10);
     rect(70,390,10,10);
     rect(60,400,10,10);
     rect(50,410,10,10);
     rect(40,420,10,10);
     rect(30,430,10,10);
    //left1
    popMatrix();
  }
  else if(mouseX>175 && mouseX<225 && mouseY>200 && mouseY<250 || keyPressed && key=='k') {
    fill(#236bff);//blue
    pushMatrix(); 
      translate(50,150); 
      beginShape();
       vertex(150,360); 
       vertex(160,360);
       vertex(160,350);
       vertex(190,350);
       vertex(190,360); 
       vertex(200,360);
       vertex(200,390);
       vertex(190,390);
       vertex(190,400); 
       vertex(160,400);
       vertex(160,390);
       vertex(150,390);
     endShape(CLOSE);
    
     rect(150,400,10,10);
     rect(150,410,10,10);
     rect(140,400,10,10);
     rect(130,390,10,10);
     rect(120,400,10,10);
     rect(110,390,10,10);
     rect(100,390,10,10);
     rect(100,400,10,10);
     rect(110,410,10,10);
     rect(120,420,10,10);
     rect(130,430,10,10);
    //left2
    
     rect(190,400,10,10);
     rect(200,410,10,10);
     rect(210,420,10,10);
     rect(220,430,10,10);
     rect(230,440,10,10);
     rect(220,450,10,10);
     rect(210,460,10,10);
     rect(220,470,10,10);
     rect(230,480,10,10);
     rect(240,490,10,10);
     rect(250,500,10,10);
    //right2
    
     rect(170,400,10,10);
     rect(170,410,10,10);
     rect(180,420,10,10);
     rect(170,430,10,10);
     rect(180,440,10,10);
     rect(170,450,10,10);
     rect(160,460,10,10);
     rect(150,470,10,10);
     rect(160,480,10,10);
     rect(170,490,10,10);
     rect(180,500,10,10);
    //middle
    
     rect(200,380,10,10);
     rect(210,370,20,10);
     rect(220,360,10,10);
     rect(230,350,10,10);
     rect(240,350,10,10);
     rect(250,360,10,10);
     rect(260,370,10,10);
     rect(270,380,10,10);
     rect(280,390,10,10);
     rect(290,400,10,10);
     rect(300,410,10,10);
     rect(310,420,10,10);
    //right1
    
     rect(140,380,10,10);
     rect(130,370,10,10);
     rect(120,360,10,10);
     rect(110,350,10,10);
     rect(100,340,10,10);
     rect(90,330,10,10);
     rect(80,330,10,10);
     rect(70,340,10,10);
     rect(60,350,10,10);
     rect(50,360,10,10);
     rect(40,370,10,10);
     rect(30,380,10,10);
    //left1
    popMatrix();
  }
  else if(mouseX>150 && mouseX<200 && mouseY>250 && mouseY<300 || keyPressed && key=='l') {
    fill(#7c2dfe);//pp
    pushMatrix(); 
      translate(0,180); 
      beginShape();
       vertex(150,360); 
       vertex(160,360);
       vertex(160,350);
       vertex(190,350);
       vertex(190,360); 
       vertex(200,360);
       vertex(200,390);
       vertex(190,390);
       vertex(190,400); 
       vertex(160,400);
       vertex(160,390);
       vertex(150,390);
     endShape(CLOSE);
    
     rect(150,400,10,100);
//    rect(150,410,10,10);
//    rect(140,420,10,10);
//    rect(130,430,10,10);
//    rect(120,440,10,10);
//    rect(110,450,10,10);
//    rect(100,460,10,10);
//    rect(110,470,10,10);
//    rect(120,480,10,10);
//    rect(130,490,10,10);
//    rect(140,500,10,10);
    //left2
    
     rect(190,400,10,100);
//    rect(200,410,10,10);
//    rect(210,420,10,10);
//    rect(220,430,10,10);
//    rect(230,440,10,10);
//    rect(220,450,10,10);
//    rect(210,460,10,10);
//    rect(220,470,10,10);
//    rect(230,480,10,10);
//    rect(240,490,10,10);
//    rect(250,500,10,10);
    //right2
    
     rect(170,400,10,100);
//    rect(170,410,10,10);
//    rect(180,420,10,10);
//    rect(170,430,10,10);
//    rect(180,440,10,10);
//    rect(170,450,10,10);
//    rect(160,460,10,10);
//    rect(150,470,10,10);
//    rect(160,480,10,10);
//    rect(170,490,10,10);
//    rect(180,500,10,10);
    //middle
    
     rect(200,380,10,10);
     rect(210,390,10,100);
//    rect(230,400,10,10);
//    rect(240,410,10,10);
//    rect(250,420,10,10);
//    rect(260,430,10,10);
//    rect(270,440,10,10);
//    rect(260,450,10,10);
//    rect(270,460,10,10);
//    rect(280,470,10,10);
//    rect(290,460,10,10);
//    rect(300,450,10,10);
    //right1
    
     rect(140,380,10,10);
     rect(130,390,10,100);
//    rect(120,400,10,10);
//    rect(110,410,10,10);
//    rect(100,420,10,10);
//    rect(90,430,10,10);
//    rect(80,440,10,10);
//    rect(70,450,10,10);
//    rect(60,460,10,10);
//    rect(70,470,10,10);
//    rect(80,480,10,10);
//    rect(70,490,10,10);
    //left1
    popMatrix();    
  }
  else{
    noFill();
    beginShape();
      vertex(150,360); 
      vertex(160,360);
      vertex(160,350);
      vertex(190,350);
      vertex(190,360); 
      vertex(200,360);
      vertex(200,390);
      vertex(190,390);
      vertex(190,400); 
      vertex(160,400);
      vertex(160,390);
      vertex(150,390);
    endShape(CLOSE);
    
    rect(150,400,10,10);
    rect(150,410,10,10);
    rect(140,420,10,10);
    rect(130,430,10,10);
    rect(120,440,10,10);
    rect(110,450,10,10);
    rect(100,460,10,10);
    rect(110,470,10,10);
    rect(120,480,10,10);
    rect(130,490,10,10);
    rect(140,500,10,10);
    
    rect(190,400,10,10);
    rect(200,410,10,10);
    rect(210,420,10,10);
    rect(220,430,10,10);
    rect(230,440,10,10);
    rect(220,450,10,10);
    rect(210,460,10,10);
    rect(220,470,10,10);
    rect(230,480,10,10);
    rect(240,490,10,10);
    rect(250,500,10,10);
    
    rect(170,400,10,10);
    rect(170,410,10,10);
    rect(180,420,10,10);
    rect(170,430,10,10);
    rect(180,440,10,10);
    rect(170,450,10,10);
    rect(160,460,10,10);
    rect(150,470,10,10);
    rect(160,480,10,10);
    rect(170,490,10,10);
    rect(180,500,10,10);
    
    rect(200,380,10,10);
    rect(210,390,20,10);
    rect(230,400,10,10);
    rect(240,410,10,10);
    rect(250,420,10,10);
    rect(260,430,10,10);
    rect(270,440,10,10);
    rect(260,450,10,10);
    rect(270,460,10,10);
    rect(280,470,10,10);
    rect(290,460,10,10);
    rect(300,450,10,10);
    
    rect(140,380,10,10);
    rect(130,390,10,10);
    rect(120,400,10,10);
    rect(110,410,10,10);
    rect(100,420,10,10);
    rect(90,430,10,10);
    rect(80,440,10,10);
    rect(70,450,10,10);
    rect(60,460,10,10);
    rect(70,470,10,10);
    rect(80,480,10,10);
    rect(70,490,10,10);
    noFill();
  }
}
  
void stop()
{
  song.close();
  minim.stop();
 
  super.stop();
}


