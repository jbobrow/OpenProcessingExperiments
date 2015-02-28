
int sizeEllipse=1;
float coord1=57;
float coord2=101;
float strokeSize=1;
int colorNum=0;
int trans=100;
color[] palette=new color[5];

void setup(){
  frameRate(20);
  smooth();
  
palette[0]=color(0,0,0);
palette[1]=color(255,255,255);
palette[2]=color(255,0,0);

  size( 500, 500 );

  background(100);
  fill(#FFFFFF);

  for(int i = 1; i<10; i++){
    trans=int(random(50,100));
    colorNum=int(random(palette.length));
    strokeSize=random(1,20);
    strokeWeight(strokeSize);
    fill(palette[colorNum],trans);
    colorNum=int(random(palette.length));
    stroke(palette[colorNum]);
    
    sizeEllipse=int(random(10,100));
    ellipse(coord1, coord2, sizeEllipse, sizeEllipse);
    coord1=random(0,500);
    coord2=random(0,500);
    
    for(int k=1; k<3;k++){
      noStroke();
      beginShape();
      vertex(coord1,coord2);
      coord1=random(0,50);
      coord2=random(400,500);
      vertex(coord1,coord2);
      coord1=random(250,300);
      coord2=random(150,250);
      vertex(coord1,coord2);
      coord1=random(0,500);
      coord2=random(0,500);
      vertex(coord1,coord2);
      coord1=random(450,500);
      coord2=random(0,100);
      vertex(coord1,coord2);
      coord1=random(0,500);
      coord2=random(200,400);
      endShape(CLOSE);
    }
    
  }
}

void draw(){
  if(mousePressed){
   colorNum=int(random(palette.length));
   palette[0]=color(0,0,0);
   palette[1]=color(155,0,0);
   palette[2]=color(255,255,255);
   noFill();
   stroke(palette[colorNum],100);
   sizeEllipse=int(random(1,100));
   ellipse(mouseX,mouseY,sizeEllipse,sizeEllipse); 
  }
  
}

