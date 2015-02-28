
void setup(){
      size(600,300);
      noSmooth();
      fill(120);
      background(150);
}
void draw(){
      if(mousePressed){
          stroke(275);
      } else {
          stroke(1);
      }
      // pink
      fill(220,120,120,178);
      ellipse(mouseX-37,mouseY,mouseX+37,mouseY);
     // violet
     fill(120,120,160,156);
      ellipse(mouseX-55,mouseY,mouseX+55,mouseY);
      // sky blue
      fill(178,78,275,158);
      ellipse(mouseX,mouseY-67,mouseX,mouseY+67);
      // red
      fill(190,190,15,250)
      rect(29,10,15,55);
      rect(45,35,30,12);
      rect(76,10,15,55)
      rect(100,10,15,55);
      rect(250,200,15,55);
      rect(220,200,15,55);
      fill(178,90,56,123);
      rect(200,265,90,17);
      fill(178,90,56,123);
      ellipse(197,265,15,25);
      ellipse(289,265,15,25);
      fill(129,240,34,100);
      ellipse(129,50,13,16);
      ellipse(129,25,13,16);
}

