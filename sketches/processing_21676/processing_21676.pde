
void setup(){
  //(250,250)
  size(500, 500);
  smooth();
  background(255);
  noFill();
   
  //Background Lines
  strokeWeight(30);
  line(480, 500, 480, 0);
  strokeWeight(20);
  line(440, 500, 440, 0);
  strokeWeight(15);
  line(400, 500, 400, 0);
  strokeWeight(10);
  line(360, 500, 360, 0);
  strokeWeight(5);
  line(330, 500, 330, 0);
  strokeWeight(4);
  line(300, 500, 300, 0); //1 pattern ends
  
  strokeWeight(2.5);
  line(270, 500, 270, 0);
  strokeWeight(10);
  line(240, 500, 240, 0);
  strokeWeight(15);
  line(200, 500, 200, 0);
  strokeWeight(10);
  line(160, 500, 160, 0);
  strokeWeight(15.5);
  line(120, 500, 120, 0);
  strokeWeight(19);
  line(90, 500, 90, 0);
  strokeWeight(20);
  line(60, 500, 60, 0);
  strokeWeight(30);
  line(20, 500, 20, 0); // 2 pattern ends

//Circles
  stroke(#623c80,450);
  strokeWeight(20);
  ellipse(500, 0, 550, 500);
  ellipse(500, 0, 450, 400);
  ellipse(500, 0, 350, 300);
  ellipse(500, 0, 250, 200);
  ellipse(500, 0, 150, 100);
  ellipse(500, 0,  50,  20);
  
  stroke(#47438d,200);
  strokeWeight(20);
  ellipse(0, 500, 550, 550);
  ellipse(0, 500, 450, 450);
  ellipse(0, 500, 350, 350);
  ellipse(0, 500, 250, 250);
  ellipse(0, 500, 150, 150);
  ellipse(0, 500, 50, 50);
  
  stroke(153,102,153,80);
  strokeWeight(20);
  ellipse(0, 250, 550, 550);
  ellipse(0, 250, 450, 450);
  ellipse(0, 250, 350, 350);
  ellipse(0, 250, 250, 250);
  ellipse(0, 250, 150, 150);
  ellipse(0, 250, 50, 50);
  
  stroke(#6e67c4,95);
  strokeWeight(12.5);
  ellipse(385, 385, 250, 250);
  ellipse(385, 385, 200, 200);
  ellipse(385, 385, 150, 150);
  ellipse(385, 385, 100, 100);
  
  stroke(#3b1e9a,100);
  strokeWeight(12.5);
  ellipse(100, 100, 350, 350);
  ellipse(100, 100, 275, 275);
  ellipse(100, 100, 200, 200);
  ellipse(100, 100, 125, 125);
  ellipse(100, 100, 50, 50);
  

//middle circle
   
  stroke(#b0b0fb,440);
  strokeWeight(15);
  ellipse(250, 250, 300, 300);
  ellipse(250, 250, 150, 150);
  
  stroke(#bcaaf7,460);
  strokeWeight(15);
  ellipse(250, 250, 225, 225);
  
  
  stroke(#bcaaf7,470);
  strokeWeight(10);
  ellipse(250, 250, 75, 75);
  
  stroke(#c7ff99, 125);
  fill(#D2EFC9);
   
     
}

//circles

void draw(){
  float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(weight);
  ellipse(mouseX, mouseY, 20, 20);
}

