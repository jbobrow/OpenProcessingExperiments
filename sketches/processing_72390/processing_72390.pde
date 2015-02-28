
int x = 0;
int y = 0;
int r;
int g;
int b;
int r1;
int g1;
int b1;

void setup(){
  size(700,700);
  noStroke();
  background(0); 
}

void draw(){
  for(int rw=0; rw<4; rw++){ //start row loop and repeat 4 times
    y=rw*175; //set Y-axis coordinate, double for each row
    for(int c=0; c<4; c++){ //start column loop and repeat 4 times
      x=c*175; //set X-axis coordinate, double for each column
      if (c % 2 == 0){ //if even column then use color set A
        if (rw % 2 == 0){ //if even row then use color set A
          r=0; g=255; b=0;
          r1=255; g1=0; b1=0;
        } else { //if odd row then alternate color set A
          r=255; g=0; b=0;
          r1=0; g1=255; b1=0;    
        }
      } else { //if odd column then use color set B
        if (rw % 2 == 0){ //if even row then use color set B
          r=0; g=0; b=255;
          r1=75; g1=0; b1=75;
        } else { //if odd row then alternate color set B
          r=75; g=0; b=75;
          r1=0; g1=0; b1=255;    
        }
      }
      fill(r,g,b); //shape part 1/2
      beginShape();
      vertex(x,y+87.5);
      vertex(x+87.5,y);
      vertex(x+87.5,y+87.5);
      vertex(x,y+175);
      endShape();
      fill(r1,g1,b1); //shape part 2/2
      beginShape();
      vertex(x+87.5,y);
      vertex(x+175,y+87.5);
      vertex(x+175,y+175);
      vertex(x+87.5,y+87.5);
      endShape();
    }
  }
  noLoop(); //finish drawing
}

