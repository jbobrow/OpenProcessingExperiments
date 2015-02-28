
size(720, 360);
background(255, 255, 255);
fill(255);
stroke(0);
  for(int a=20; a<=560; a=a+180){ //draw background at first line and on the right
    stroke(255);
    if(a==20){
      fill(194, 184, 99);
    }else if(a==210){
      fill(168, 162, 210);
    }else if(a==380){
      fill(102, 154, 191);
    }else{
      fill(246, 94, 106); //color of the background at first line and on the right
    }
    rect(a, 20, 70, 140); //draw the background at first line and on the right
    if(a==20){
      fill(107, 132, 113);
    }else if(a==210){
      fill(114, 142, 119);
    }else if(a==380){
      fill(147, 126, 21);
    }else{
      fill(158, 124, 26); //color of the background at second line and on the right
    }
    rect(a, 200, 70, 140); //draw the background at second line and on the right
  }
  for(int a2=90; a2<=630; a2=a2+180){ //draw background at first line and on the left
    stroke(255);
    if(a2==90){
      fill(119, 128, 157);
    }else if(a2==270){
      fill(118, 131, 147);
    }else if(a2==450){
      fill(225, 219, 231);
    }else{
      fill(193, 201, 220); //color of the background at first line and on the left
    }
    rect(a2, 20, 70, 140); //draw the background at first line and on the left
    if(a2==90){
      fill(202, 184, 110);
    }else if(a2==270){
      fill(155, 158, 189);
    }else if(a2==450){
      fill(118, 149, 203);
    }else{
      fill(220, 93, 102); //color of the background at second line and on the left
    }
    rect(a2, 200, 70, 140); //draw the background at second line and on the left
  }
  for(int raggio1=290; raggio1>=90; raggio1=raggio1-40){ //definition of raggio1
    stroke(255);
    if(raggio1==290){
      fill(215, 261, 204);
    }else if(raggio1==250){
      fill(137,136,134);
    }else if(raggio1==210){
      fill(231,196,218);
    }else if(raggio1==170){
      fill(63, 130, 173);
    }else if(raggio1>=130){
      fill(196, 194, 173);
    }else{
      fill(0,43,27);
    }
  arc(0, 180, raggio1, raggio1, PI+HALF_PI, TWO_PI); //draw the 1Â° pie
  }
  for(int raggio2=290; raggio2>=90; raggio2=raggio2-40){ //definition of raggio2
    if(raggio2==290){
      fill(222, 149, 0);
    }else if(raggio2==250){
      fill(60, 100, 149);
    }else if(raggio2==210){
      fill(204, 220, 243);
    }else if(raggio2==170){
      fill(104, 56, 20);
    }else if(raggio2==130){
      fill(224, 243, 177);
    }else{
      fill(247, 131, 166);
    }
    arc(180, 0, raggio2, raggio2, HALF_PI, PI); //draw the 2Â° pie
  }
  for(int raggio3=290; raggio3>=90; raggio3=raggio3-40){ //definition of raggio3
    if(raggio3==290){
      fill(222, 149, 0);
    }else if(raggio3==250){
      fill(60, 100, 149);
    }else if(raggio3==210){
      fill(204, 220, 243);
    }else if(raggio3==170){
      fill(104, 56, 20);
    }else if(raggio3==130){
      fill(224, 243, 177);
    }else{
      fill(247, 131, 166);
    }
    arc(180, 0, raggio3, raggio3, 0, HALF_PI); //draw the 3Â° pie
  }  
    for(int raggio4=290; raggio4>=90; raggio4=raggio4-40){ //definition of raggio4
    if(raggio4==290){
      fill(247, 131, 166);
    }else if(raggio4==250){
      fill(219, 198, 109);
    }else if(raggio4==210){
      fill(62, 113, 179);
    }else if(raggio4==170){
      fill(228, 188, 176);
    }else if(raggio4==130){
      fill(135, 114, 59);
    }else{
      fill(148, 148, 172);
    }
    arc(360, 180, raggio4, raggio4, PI, PI+HALF_PI); //draw the 4Â° pie
  }
    for(int raggio5=290; raggio5>=90; raggio5=raggio5-40){ //definition of raggio5
    if(raggio5==290){
      fill(225, 197, 6);
    }else if(raggio5==250){
      fill(151, 199, 99);
    }else if(raggio5==210){
      fill(156, 165, 160);
    }else if(raggio5==170){
      fill(108,120, 180);
    }else if(raggio5==130){
      fill(158, 161, 152);
    }else{
      fill(231, 45, 50);
    }
    arc(360, 180, raggio5, raggio5, PI+HALF_PI, TWO_PI); //draw the 5Â° pie
  }
  for(int raggio6=290; raggio6>=90; raggio6=raggio6-40){ //definition of raggio6
    if(raggio6==290){
      fill(192, 0, 22);
    }else if(raggio6==250){
      fill(231, 232, 92);
    }else if(raggio6==210){
      fill(254, 143, 115);
    }else if(raggio6==170){
      fill(137, 211, 124);
    }else if(raggio6==130){
      fill(122, 141, 156);
    }else{
      fill(178, 215,172);
    }
    arc(540, 0, raggio6, raggio6, HALF_PI, PI); //draw the 6Â° pie
  }
  for(int raggio7=290; raggio7>=90; raggio7=raggio7-40){ //definition of raggio7
    if(raggio7==290){
      fill(192, 0, 22);
    }else if(raggio7==250){
      fill(231, 232, 92);
    }else if(raggio7==210){
      fill(254, 143, 115);
    }else if(raggio7==170){
      fill(137, 211, 124);
    }else if(raggio7==130){
      fill(122, 141, 156);
    }else{
      fill(178, 215,172);
    }
    arc(540, 0, raggio7, raggio7, 0, HALF_PI); //draw the 7Â° pie
  }
    for(int raggio8=290; raggio8>=90; raggio8=raggio8-40){ //definition of raggio8
    if(raggio8==290){
      fill(98, 155, 198);
    }else if(raggio8==250){
      fill(226, 235, 244);
    }else if(raggio8==210){
      fill(113, 109, 82);
    }else if(raggio8==170){
      fill(226, 239, 196);
    }else if(raggio8==130){
      fill(215, 158, 87);
    }else{
      fill(236, 173, 0);
    }
    arc(720, 180, raggio8, raggio8, PI, PI+HALF_PI); //draw the 8Â° pie
  }
    for(int raggio9=290; raggio9>=90; raggio9=raggio9-40){ //definition of raggio9
    if(raggio9==290){
      fill(98, 155, 198);
    }else if(raggio9==250){
      fill(226, 235, 244);
    }else if(raggio9==210){
      fill(113, 109, 82);
    }else if(raggio9==170){
      fill(226, 239, 196);
    }else if(raggio9==130){
      fill(215, 158, 87);
    }else{
      fill(236, 173, 0);
    }
    arc(720, 180, raggio9, raggio9, HALF_PI, PI); //draw the 9Â° pie
  }
  for(int raggio10=290; raggio10>=90; raggio10=raggio10-40){ //definition of raggio10
    stroke(255);
    if(raggio10==290){
      fill(210, 201, 196);
    }else if(raggio10==250){
      fill(127, 145, 105);
    }else if(raggio10==210){
      fill(231, 206, 176);
    }else if(raggio10==170){
      fill(115, 109, 133);
    }else if(raggio10==130){
      fill(223, 193, 61);
    }else{
      fill(186, 145, 189);
    }
  arc(540, 360, raggio10, raggio10, PI+HALF_PI, TWO_PI); //draw the 10Â° pie
  }
  for(int raggio11=290; raggio11>=90; raggio11=raggio11-40){ //definition of raggio11
    stroke(255);
    if(raggio11==290){
      fill(210, 201, 196);
    }else if(raggio11==250){
      fill(127, 145, 105);
    }else if(raggio11==210){
      fill(231, 206, 176);
    }else if(raggio11==170){
      fill(115, 109, 133);
    }else if(raggio11==130){
      fill(223, 193, 61);
    }else{
      fill(186, 145, 189);
    }
  arc(540, 360, raggio11, raggio11, PI, PI+HALF_PI); //draw the 11Â° pie
  }
    for(int raggio12=290; raggio12>=90; raggio12=raggio12-40){ //definition of raggio12
    if(raggio12==290){
      fill(225, 197, 6);
    }else if(raggio12==250){
      fill(151, 199, 99);
    }else if(raggio12==210){
      fill(156, 165, 160);
    }else if(raggio12==170){
      fill(108,120, 180);
    }else if(raggio12==130){
      fill(158, 161, 152);
    }else{
      fill(231, 45, 50);
    }
    arc(360, 180, raggio12, raggio12, 0, HALF_PI); //draw the 12Â° pie
  }
    for(int raggio13=290; raggio13>=90; raggio13=raggio13-40){ //definition of raggio13
    if(raggio13==290){
      fill(247, 131, 166);
    }else if(raggio13==250){
      fill(219, 198, 109);
    }else if(raggio13==250){
      fill(62, 113, 179);
    }else if(raggio13==170){
      fill(228, 188, 176);
    }else if(raggio13==130){
      fill(135, 114, 59);
    }else{
      fill(148, 148, 172);
    }
    arc(360, 180, raggio13, raggio13, HALF_PI, PI); //draw the 13Â° pie
  }
  for(int raggio14=290; raggio14>=90; raggio14=raggio14-40){ //definition of raggio14
    stroke(255);
    if(raggio14==290){
      fill(35, 42, 120);
    }else if(raggio14==250){
      fill(199, 191, 206);
    }else if(raggio14==210){
      fill(215, 67, 0);
    }else if(raggio14==170){
      fill(146, 161, 156);
    }else if(raggio14==130){
      fill(67, 146,127);
    }else{
      fill(206,202,103);
    }
  arc(180, 360, raggio14, raggio14, PI+HALF_PI, TWO_PI); //draw the 14Â° pie
  }
  for(int raggio15=290; raggio15>=90; raggio15=raggio15-40){ //definition of raggio15
    stroke(255);
    if(raggio15==290){
      fill(35, 42, 120);
    }else if(raggio15==250){
      fill(199, 191, 206);
    }else if(raggio15==210){
      fill(215, 67, 0);
    }else if(raggio15==170){
      fill(146, 161, 156);
    }else if(raggio15==130){
      fill(67, 146,127);
    }else{
      fill(206,202,103);
    }
  arc(180, 360, raggio15, raggio15, PI, PI+HALF_PI); //draw the 15Â° pie
  }
  for(int raggio16=290; raggio16>=90; raggio16=raggio16-40){ //definition of raggio16
    stroke(255);
    if(raggio16==290){
      fill(215, 261, 204);
    }else if(raggio16==250){
      fill(137,136,134);
    }else if(raggio16==210){
      fill(231,196,218);
    }else if(raggio16==170){
      fill(63, 130, 173);
    }else if(raggio16==130){
      fill(196, 194, 173);
    }else{
      fill(0,43,27);
    }
  arc(0, 180, raggio16, raggio16, 0, HALF_PI); //draw the 16Â° pie
  }
  for(int i=10; i<=550; i=i+180){ //draw line
    if(i==10){
      stroke(125, 184, 76);
    }else if(i==190){
      stroke(199, 204, 198);
    }else if(i==370){
      stroke(240, 160, 97);
    }else{
      stroke(212, 217, 197); //color of the lines
    }
    strokeWeight(20);
    noFill();
  rect(i, 10, 160, 160); //rect on first line
  }
  for(int i2=10; i2<=550; i2=i2+180){ //draw line
    if(i2==10){
      stroke(151, 181, 215);
    }else if(i2==190){
      stroke(205, 179, 180);
    }else if(i2==370){
      stroke(199, 198, 212);
    }else{
      stroke(231, 223, 128); //color of the lines
    }
    strokeWeight(20);
    noFill();
    rect(i2, 190, 160, 160);
    //endShape(CLOSE); //rect on second line
  }
  stroke(255);
  strokeWeight(3);
  noFill();
  rect(0, 0, 720, 360);
  for(int k1=0; k1<=540; k1=k1+180){
    stroke(255);
    strokeWeight(1);
    line(k1, 0, k1, 360);
  }
  stroke(255);
  strokeWeight(1);
  line(0, 180, 720, 180); //draw white line
  for(int k2=20;k2<=560;k2=k2+180){
    stroke(255);
    strokeWeight(1);
    rect(k2, 20, 140, 140);
    rect(k2, 200,140, 140);
  }
