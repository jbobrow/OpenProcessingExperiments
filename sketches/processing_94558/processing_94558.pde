
/*

#FEAE35 254, 174, 53
#FF9000 255, 144, 0
#FB8410 251, 132, 16 
#F0522B 240, 82, 43

#69547F 105, 84, 127 
#471D63 71, 29, 99

#71CBD3 113, 203, 211 
#009792 0, 151, 146
#006AA8
#D3EBDB
#5BC2AD
#00A27D

#121212
#515A5F

*/

color[] oranges = {#feae35,#ff9000,#fb8410,#f0522b};
color[] greens =  {#71cbd3,#009792,#006aa8,#d3ebdb,#5bc2ad,#00a27d};
color[] violets = {#69547f,#471d63};

color[][] c = {oranges,greens, violets};

int counter;

void setup() {  //setup function called initially, only once
  size(880, 380);
  background(255);  //set background white
  colorMode(RGB);   
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  if(counter < 2 ){
      for( j = 0; j < 3; j++) {
          for( i = 0; i < 7; i++)
          {
            fill(c[int(random(4))][j],90);
            //fill(oranges[int(random(4))],90);
            r = random(20,60)
            ellipse(40+(random(6)+34)*(i*(j+1)), height/2, 30+r, 30+r);
          }
      }
  }
}
