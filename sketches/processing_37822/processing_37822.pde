
void setup(){
  // Background
  size(1100,800);
  smooth();
  noStroke();
 
  
  background(3,10,26);
  fill(224,211,145);
  rect(0,300,1100,500);
  
  
    //shadows
   fill(49,37,26);//brown
  ellipse(313,519,400,130);
  ellipse(553,590,280,100);
  ellipse(738,561,200,80);
  
  
  
  // Big Lemon in the back
  //body
  pushMatrix();
  rotate(PI/6);
  fill(255,214,3);
  ellipse(480,150,420,350);
  popMatrix();
  //white circle
  fill(255);
  ellipse(370,400,330,300);
  //inner yellow circle
  fill(255,249,64);
  ellipse(370,400,280,250);
  //lines
  stroke(255);
  strokeWeight(10);
  line(306,291,424,519);
  line(426,290,305,510);
  line(240,356,501,446);
  line(239,444,501,353);
  noStroke();
  fill(49,37,26);//brown
  ellipse(367,402,30,40);
  
  
  
  
  
  
  
  
    //BOTTOM SLICE LEMON
  pushMatrix();
  rotate(PI/6);
  fill(255,214,3);//bright yellow
  ellipse(970,50,80,60);
  ellipse(910,30,150,230);
  fill(255);//white
  ellipse(880,30,130,240);
  fill(255,249,64);//lightyellow
  ellipse(880,30,100,210);
  popMatrix();
  
  //lines
  stroke(255);
  strokeWeight(8);
  line(803,381,688,553);
  line(811,439,683,496);
  line(789,497,709,438);
  line(744,544,743,394);
  noStroke();
  pushMatrix();
  rotate(PI/6);
  fill(49,37,26);//brown
  ellipse(880,30,10,25);
  popMatrix();
  
  
  
  
  
  
  //TOP SLICE OF LEMON
   //body
  pushMatrix();
  rotate(PI/6);
  fill(255,214,3);//bright yellow
  ellipse(770,100,200,300);
  fill(255);//white
  ellipse(740,100,180,290);
  fill(255,249,64);//lightyellow
  ellipse(740,100,150,260);
  popMatrix();
  
  //lines
  stroke(255);
  strokeWeight(8);
  line(663,354,519,564);
  line(552,388,628,535);
  line(603,348,582,571);
  line(683,420,501,496);
  noStroke();
  pushMatrix();
  rotate(PI/6);
  fill(49,37,26);//brown
  ellipse(740,100,15,30);
  popMatrix();
  
  
  
  
  
  

}


//void draw(){
//print(mouseX+","+mouseY+"               ");
//}

