

//Makes a grid of ellipses which cascades in a rainbow across
//the canvas. Changes hue parameter.

size(600,600);
noStroke();
smooth();
background(240);
colorMode(HSB,1200,100,100);  //range for hue is double width/height

for (int y=0; y<=600; y+=50){
  for (int x=0; x<=600; x+=50){
    float newHue= (x+y);
    fill(newHue,100,100,160);
    ellipse(x,y,70,70);
  }
}  


