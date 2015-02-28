
float L1, x, y, tamanho, intx, inty;
void setup() {
  // size(displayWidth, displayHeight);
  size(900, 450);
  frameRate(20);
  background(255);
  L1=25;
  tamanho=40;
  intx=(width-floor(width/(tamanho+2))*(tamanho+2))/2;
  inty=(height-floor(height/(tamanho+2))*(tamanho+2))/2;
  x=intx;
  y=inty;
}

void draw() {
  noStroke();
  
  //if the next column would fall out of the window,  it moves to the "next line"
  if (x+tamanho>width) {  
    y=y+tamanho+2;
    x=intx;
  }

  // if the line would fall out of the window it starts over
  if (y+tamanho>height) { 
   // save("bezier"+int(random(50))+".jpg");
    y=inty;
    background(255);
    tamanho = random(20, 150);  //randomly pics a new size for the tiles

    // this are used to center the tiles in the display window
    intx=(width-floor(width/(2+tamanho))*(2+tamanho))/2;  
    inty=(height-floor(height/(2+tamanho))*(2+tamanho))/2;
    x=intx;
    y=inty;
  }

  //this does the actual drawing of the tiles
  translate (x+tamanho/2, y+tamanho/2);
  fill(random(255), random(255), random(255));  //random colors
  rect(-tamanho/2, -tamanho/2, tamanho+1, tamanho+1); 
  fill(random(255), random(255), random(255));
  ellipse (0, 0, tamanho, tamanho);
  fill(random(255), random(255), random(255));
  ellipse (random(-tamanho/5, tamanho/5), random(-tamanho/5, tamanho/5), tamanho/2, tamanho/2); // eccentric ellipse

  x=x+tamanho+2; // this increments the position.
}
