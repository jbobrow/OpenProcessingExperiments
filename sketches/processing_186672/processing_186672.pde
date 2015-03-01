
 float px=6;
void setup() {
  size(600,600,P3D);
  colorMode(HSB);
 noStroke();
}
void draw() {
  background(36,0,68);
  if(mousePressed){
    px=px-2;
    }
 else{ 
 px=px+5;
 }

{fill(0,87,10);
 arc(px, 50, 80, 80, 0, PI);
  }
  {fill(255,87,10);
 line(px, 30 , 0, 45, 30, 50);
 stroke(160);
 line(45, px, 0, 75, 25, 35);
 stroke(160);
 line(75, px, 0, 30, 75, -50);
  }
   {fill(255,87,10);
 line(px-2, 30 , 0, 45, 30, 50);
 stroke(160);
 line(110, px-3, 0, 45, 25, 35);
 stroke(160);
 line(90, px-1, 0, 58, -75, -50);
  }
  
 
 {
    fill(36, 200, 200);
    rect(px, 100, width/2, height/2);
  }
  {
    fill(36, 200, 200);
    ellipse(50, 50, 100, 100);
  }
  {
    fill(36, 200, 200);
    ellipse(500,500, 100, 100);
  }
  
  
}

