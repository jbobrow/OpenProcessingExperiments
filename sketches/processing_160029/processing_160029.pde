
 size(500, 600);
  background(#64FFFB);
  
  for (int y = 0; y < 30; y++) {
  for (int x = 0; x < 30; x++) {
    fill(255);
    ellipse(30 * x, 30 * y, 10, 10);
  }
}
 
   //ears
  fill(#030E48);
  ellipse(208, 140, 50, 50);
  ellipse(273, 140, 50, 50);
   
  //head
  fill(#004083);
  rect(200, 73, 80, 160);
   
  //eyes
  fill(255);
  ellipse(222, 103, 20, 30);
  fill(0);
  ellipse(222, 103, 10, 10);
  fill(255);
  ellipse(255, 103, 20, 30);
  fill(0);
  ellipse(255, 103, 10, 10);
 
  //nose
  fill(#FFE600);
  triangle(229, 156, 238, 139, 247, 156);
 
  //mouth
  fill(#FF8D00);
  arc(240, 195, 50, 60, 0, PI, 2);
 
  //left antenna
  fill(#C700FF);
  rect(218, 40, 10, 33);
  rect(186, 40, 32, 10);
  fill(#10FC05);
  ellipse(180, 45, 15, 15);
 
  //right antenna
  fill(#C700FF);
  rect(250, 40, 10, 33);
  rect(260, 40, 32, 10);
  fill(#10FC05);
  ellipse(299, 45, 15, 15);
 
  //neck
  fill(#004083);
  rect(225, 233, 30, 20);
 
  //body
  fill(#004083);
  rect(192, 253, 100, 200);
 
  //left arm
  fill(#030E48);
  rect(105, 277, 87, 20);
  rect(105, 190, 20, 87);
  rect(92, 158, 10, 23);
  rect(130, 158, 10, 23);
  rect(92, 180, 48, 10);
 
  //right arm
  fill(#030E48);
  rect(292, 277, 87, 20);
  rect(360, 277, 20, 87);
  rect(346, 364, 48, 10);
  rect(346, 374, 10, 23);
  rect(384, 374, 10, 23);
 
  //legs
  rect(254, 453, 20, 87);
  rect(210, 453, 20, 87);
 
  //feet
  fill(#D82774);
  rect(193, 540, 37, 10);
  rect(254, 540, 37, 10);


