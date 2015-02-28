
 int deg;

void setup(){
  size(854,480);
  background(125);
  
  
  
  
}



void draw(){
 
  //right arm//
  stroke(0);
  strokeWeight(3);
  noFill();
  arc(585, 150, 300, 300, 0, radians(90));
  arc(735, 115, 70, 70, 0, radians(180));
  
  noStroke();
  
  
  
  //right arm//
  
  //Donut//
  fill(238,199,133);
  arc(width/2, height/2+30,330,330,radians(0),radians(360));
  noFill();
 //Donut//  
 
 
 //Frosting// 
  fill(238,133,203);
  arc(width/2, height/2+30,300,300,radians(0),radians(360));
  noStroke();
 //Frosting//
 
   //outer hole// 
  fill(238,199,133);
  arc(width/2, height/2+70,80,80,radians(0),radians(360));
  noStroke();
 //inner hole//
 
 //inner hole// 
  fill(125);
  arc(width/2, height/2+70,60,60,radians(0),radians(360));
  noStroke();
 //inner hole//
 
 
 
 
   //glassess left//
  stroke(1);
  strokeWeight(1);
  fill(0);
  beginShape();
  vertex(300,200);
  vertex(410,200);
  curveVertex(410,200);
  vertex(355,300);
 
  endShape(CLOSE);
  noStroke();
  noFill();
  //glassess left//
  
  //connector//
  fill(0);
  stroke(0);
  strokeWeight(3);
  line(380,230,470,230);
  
  //connector//
  
   //glassess right//
  stroke(1);
  strokeWeight(1);
  fill(0);
  beginShape();
  vertex(445,200);
  vertex(555,200);
  curveVertex(495,200);
  vertex(500,300);
 
  endShape(CLOSE);
  noStroke();
  noFill();
  //glassess right//
 
  //Hat//
  
   //top of hat//
  //stroke(255);//
  line(280,150,250,30);
  
  
  
  //top of hat//
  stroke(0);
  fill(0);
  beginShape();
  vertex(280,150);
  vertex(250,30);
  curveVertex(250,30);
  curveVertex(325,60);
  curveVertex(415,20);
  curveVertex(500,40);
  curveVertex(540,40);
  curveVertex(600,30);
  curveVertex(540,30);
  vertex(600,30);
  vertex(570,150);
    
  
  endShape(CLOSE);
  noFill();
  
  
  
  //bill//
  fill(0);
  //stroke(255);//
  strokeWeight(2);
  rectMode(CENTER);
  rect(width/2,150,350,30,30);
  noFill();
  noStroke();
  //bill//
  
 
  
  //star//
  
  //star//
  
  //Hat//
  
  

}


