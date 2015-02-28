
boolean grid;
boolean Bsize;
int lineColor;
int lineWeight;

void setup(){
  size(800,600);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  grid = false;
  Bsize = false;
  lineColor = 1;
  lineWeight = 4;
  background(360, 0, 100);
  fill(50);
  noStroke();
  rect(0,520,800,80);  //Panel
  fill(250);
  rect(20,550,30,30);  //1st Button
  rect(750,550,30,30);  //Last Button
   stroke(360,0,1);
   strokeWeight(1);
   line(25,555,45,555);
   strokeWeight(4);
   line(25,560,45,560);
   strokeWeight(10);
   line(26,570,43,570);
   
   strokeWeight(1);
   line(760,555,760,575);
   line(770,555,770,575);
   line(755,560,775,560);
   line(755,570,775,570);
   
   noStroke();

}



void mousePressed() { 
  fill(50);
  noStroke();
//  rect(0,520,800,80);  //Panel
  fill(250);
  rect(20,550,30,30);  //1st Button
   stroke(360,0,1);
   strokeWeight(1);
   line(25,555,45,555);
   strokeWeight(4);
   line(25,560,45,560);
   strokeWeight(10);
   line(26,570,43,570);
   noStroke();
   rect(750,550,30,30);  //Last Button
   
   strokeWeight(1);
   line(760,555,760,575);
   line(770,555,770,575);
   line(755,560,775,560);
   line(755,570,775,570);
   noStroke();

  //Weight Changer

    if(mouseX > 20 && mouseX < 50 && mouseY > 550 && mouseY < 580) {
    if(mousePressed){
      if(Bsize){
         Bsize = false;
         println("false");
       } else if (!Bsize){
           Bsize = true;
           println("true");
         }
       }
           if (Bsize == true) {  //pop up panel
             fill(150);
             rect(65,520,190,80);
             fill(360,0,100);
             rect(80,550,30,30); //light
             rect(140,550,30,30);  //mid
             rect(200,550,30,30);  //heavy
             
             stroke(360,0,1);
             strokeWeight(1);
             line(85,565,105,565);
             strokeWeight(4);
             line(145,565,165,565);
             strokeWeight(10);
             line(210,565,220,565);
             strokeWeight(1);
             line(760,555,760,575);
             line(770,555,770,575);
             line(755,560,775,560);
             line(755,570,775,570);
             noStroke();
               
             
       } else {                  //reset panel
            fill(50);
            noStroke();
            rect(0,520,800,80);  //Panel
            fill(250);
            rect(20,550,30,30);  //1st Button
               rect(750,550,30,30);  //Last Button
             stroke(360,0,1);
             strokeWeight(1);
             line(25,555,45,555);
             strokeWeight(4);
             line(25,560,45,560);
             strokeWeight(10);
             line(26,570,43,570);
               strokeWeight(1);
               line(760,555,760,575);
               line(770,555,770,575);
               line(755,560,775,560);
               line(755,570,775,570);
               noStroke();

       }
  }
  
  
  //grid
  if (mouseX > 750 && mouseX < 780 && mouseY > 550 && mouseY < 580) {
     if(mousePressed){
       if(grid){
         grid = false;
         println("false");
       } else if (!grid){
           grid = true;
           println("true");
         }
       }
    //println("grid T/F");
    //GRID
    if (grid) {
      stroke(220);
      strokeWeight(1);
      for(int x = 0; x < 40; x++){
        for(int y = 0; y < 26; y++){
          noFill();
          rect(x*20,y*20,20,20);
      } 
    } 
  } else { //no grid
   //   fill(360,0,100);
    //  rect(0,0,800,520);
    strokeWeight(1);
    stroke(360,0,100);
      for(int x = 0; x < 40; x++){
        for(int y = 0; y < 26; y++){
          noFill();
          rect(x*20,y*20,20,20);
        }
      }
  }
}

}

void draw(){
    if(mousePressed){
  //  println("x:"+ mouseX+ "Y:" + mouseY);
    }
  
  //WeightCharger
  
   if (Bsize == true) {
     if(mouseX > 80 && mouseX < 110 && mouseY > 550 && mouseY < 580) {
       if(mousePressed){
         println("1");
         lineWeight = 1;
      }
     }
     if(mouseX > 140 && mouseX < 170 && mouseY > 550 && mouseY < 580) {
       if(mousePressed){
         println("2");
         lineWeight = 4;
      }
     }
     if(mouseX > 200 && mouseX < 230 && mouseY > 550 && mouseY < 580) {
       if(mousePressed){
         println("3");
         lineWeight = 10;
      }
     }
     }
  //DRAW
  if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 520) {
    if(mousePressed){
    stroke(360,100,1);
    strokeWeight(lineWeight);
    line(pmouseX,pmouseY,mouseX,mouseY);
    } 
  }
}


