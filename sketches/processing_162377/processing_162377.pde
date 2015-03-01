
void setup(){
 size(800, 600);
 background(4, 47, 62);
 noStroke();
 fill(255);
 rect(200,20, 580, 560,10);
 fill(252, 231, 174);
 rect(20,20,160, 40+50+20+50+20+50+20+50+70, 10);
 stroke(255);
 strokeWeight(3);
 fill(204, 31, 48); //button1
 rect(40, 40, 50, 50, 10);
 fill(26 , 61, 110);//button2
 rect(90+20, 40, 50, 50, 10);
 fill(239, 91, 86); //button3
 rect(40, 40+50+20, 50, 50, 10);
 fill(88, 61, 152);//button4
 rect(90+20, 40+50+20, 50, 50, 10);
 fill(247, 183, 23); //button5
 rect(40, 40+50+20+50+20, 50, 50, 10);
 fill(255);//button6
 rect(90+20, 40+50+20+50+20, 50, 50, 10);
 fill(94, 190, 131); //button7
 rect(40, 40+50+20+50+20+50+20, 50, 50, 10);
 fill(76, 76, 76);//button8
 rect(90+20, 40+50+20+50+20+50+20, 50, 50, 10);
  fill(65, 106, 179); //button9
 rect(40, 40+50+20+50+20+50+20+50+20, 50, 50, 10);
 fill(0);//button10
 rect(90+20, 40+50+20+50+20+50+20+50+20, 50, 50, 10);

}

void draw(){
  if(mousePressed){
    if( 760>mouseX && mouseX> 200 && mouseY>0 ==true){
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    /*
    if( 760>mouseX && mouseX> 200 && mouseY>0 ==true){
      ellipse(pmouseX, pmouseY, 10, 10);
    }*/
   if(mouseX>40 && mouseX <90 && mouseY >40 && mouseY< 90){
     stroke(204, 31, 48);
     strokeWeight(5);
   }
   if(mouseX>110 && mouseX<160 && mouseY > 40 && mouseY <90){
     stroke(26, 61, 110);
     strokeWeight(5+5); 
   }
   if(mouseX> 40 && mouseX<90 && mouseY> 110 && mouseY<160){
     stroke(239, 91, 86);
     strokeWeight(5+5+5);
   } 
   if(mouseX>110 && mouseX < 160 && mouseY >110 && mouseY <160){
     stroke(88, 61, 152);
     strokeWeight(5+5+5+5);
   }
   if(mouseX> 40 && mouseX< 90 && mouseY>180 && mouseY< 230){
    stroke(247, 183, 23);
    strokeWeight(5+5+5+5+5);
   }
   if(mouseX>110 & mouseX<160 && mouseY> 180 && mouseY<230){
    stroke(255);
    strokeWeight(5+5+5+5+5+5);
   }
 if(mouseX> 40 && mouseX< 90 && mouseY> 250 && mouseY<300){
   stroke(94, 190, 131);
   strokeWeight(5+5+5+5+5+5+5);
 }
 if(mouseX>110 && mouseX<160 && mouseY> 250 && mouseY<300){
   stroke(76, 76, 76);
  strokeWeight(5+5+5+5+5+5+5+5);
 }
 if(mouseX>40 && mouseX<90 && mouseY> 320 && mouseY<370){
   stroke(65, 106, 179);
    strokeWeight(5+5+5+5+5+5+5+5+5);
 }
 if(mouseX> 110 && mouseX< 160 && mouseY > 320 && mouseY< 370){
   stroke(0);
   strokeWeight(5+5+5+5+5+5+5+5+5+5);
  }
  }
}
