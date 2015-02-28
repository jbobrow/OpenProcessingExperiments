
// Palette is "infographics"

 color[] palette = {#FF2C38, #FFFFED, #FF9A3A, #FFF040, #67D9FF};

  

int x = 0;




void setup(){

  size(600, 300);

  smooth();

}

 

 void draw(){

  background(palette[0]);

 

  stroke(#FFFFED);

  line(100, 50, 500, 50);




  stroke(palette[4]);

  strokeWeight(10);

  fill(palette[1]);

  rect(x, 50, 75, 50);

}

 

void keyPressed(){

  x += 10;

}
