
int xpos;
int ypos;


void setup(){
  size(800,600);
  background(255,253,227);
  noStroke();
  fill(255,253,160);
  rect(0,400,width, height);
 
  //board
  
  fill(95,188,139);
  rect(40,50,720,400);
  fill(147,130,44);
  rect(30,450,740,20);
  
  //eraser
  fill(#524222);
  rect(100,425,70,5);
  fill(#B2E8E7);
  rect(102,430, 67,20);
  fill(#957459);
  rect(130, 420, 10,10);
  
  //chalks
  fill(255);
  rect(160, 443, 40, 7);
  fill(#FCBBB0);
  rect(700, 443, 40, 7);
  fill(#B0D2FC);
  rect(630, 443, 40, 7);
  
  //button!eraser
  fill(#524222);
  rect(40,480,60,110);
  fill(#B2E8E7);
  rect(45,485, 50,100);
  fill(#B0D2FC);
  rect(50,485, 5, 100);
  fill(#B0D2FC);
  rect(60,485, 5, 100);
  fill(#B0D2FC);
  rect(70,485, 5, 100);
  fill(#B0D2FC);
  rect(80,485, 5, 100);
  fill(#B0D2FC);
  rect(90,485, 5, 100);
  
  
  //color buttons
  fill(255);
  ellipse(130, 510, 40, 40);
  
  fill(#FCBBB0);
  ellipse(130, 560, 40, 40);
  
  fill(#B0D2FC);
  ellipse(180, 510, 40, 40);
  
  fill(#FAEE6D);
  ellipse(180, 560, 40, 40);
  
  //triangle button
  strokeWeight(15);
  stroke(#71A7C1);
  noFill();
  triangle( 240, 560, 340, 560, 290, 500);
  strokeWeight(0.7);
  stroke(70);
  line( 250, 560, 250, 565);
  line( 260, 560, 260, 565);
  line( 270, 560, 270, 565);
  line( 280, 560, 280, 565);
  line( 290, 560, 290, 565);
  line( 300, 560, 300, 565);
  line( 310, 560, 310, 565);
  line( 320, 560, 320, 565);
  line( 330, 560, 330, 565);
  
  //elllipse butotn
  strokeWeight(15);
  stroke(#71A7C1);
  noFill();
  arc( 420, 500, 100, 100, 0, PI);
  line (370, 500, 470, 500);
  strokeWeight(0.7);
  stroke(70);
  line( 380, 500, 380, 495);
  line( 390, 500, 390, 495);
  line( 400, 500, 400, 495);
  line( 410, 500, 410, 495);
  line( 420, 500, 420, 495);
  line( 430, 500, 430, 495);
  line( 440, 500, 440, 495);
  line( 450, 500, 450, 495);
  line( 460, 500, 460, 495);
  
  //camera
  noStroke();
  fill(150);
  rect(670, 510, 80, 50);
  fill (70);
  ellipse(710, 535, 40,40);
  fill( 200);
  ellipse( 710, 535, 30,30);
  fill(70);
  rect(673,505, 15, 5);
  fill(255);
  ellipse( 720, 530, 5,5);
  
  
  
}

void draw(){
   float a =random(50,710);
  float b = random(60, 390);
  
  if ( mousePressed) {
    if(mouseX>50 && mouseX<750 && mouseY > 60 && mouseY<440){
    //stroke(255);
    strokeWeight(5);
    line(pmouseX, pmouseY, mouseX, mouseY);}
    
    if(mouseX > 40 && mouseY > 480 && mouseX < 100 && mouseY< 590){
    stroke(95,188,139);
    }  
    
    if(mouseX > 110 && mouseY > 490 && mouseX < 150 && mouseY < 530 ){
    strokeWeight (5);
    stroke(255);
    }
    
    if(mouseX> 110 && mouseY > 540 && mouseX<150 && mouseY < 580 ) {
      stroke(#FCBBB0);
    }
    
    if (mouseX> 160 && mouseY > 490 && mouseX < 200 && mouseY < 530 ) {
    stroke(#B0D2FC);
    }
    
    if ( mouseX>160 && mouseY > 540 && mouseX <200 && mouseY<589) {
    stroke (#FAEE6D);
    }
    
    if ( mouseX > 250 && mouseX < 330 && mouseY>510 && mouseY<550 ){

     noFill();
      triangle( a, b, a+30, b, a+15, b+10 );
    }
    
    if ( mouseX> 380 && mouseX < 460 && mouseY > 460 && mouseY<540){
    noFill();
      ellipse(a,b,random(0,30),random(0,30));
    }
    
    if( mouseX > 670 && mouseX < 750 && mouseY > 510 && mouseY < 560){
     
    save("####.jpg");
    } 
   
    
    
  
  }
  
 
}


    
