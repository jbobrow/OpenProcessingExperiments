
int sizeRect=10;
float coord1=50;
float coord2=0;
int colorNum=0;
int trans=100;
color[] palette=new color[4];

void setup(){
  frameRate(10);
  smooth();
  
  palette[0]=color(0,0,0);
  palette[1]=color(255,255,255);
  palette[2]=color(0,0,50);
  palette[3]=color(100,100,100);
  
  size(500,500);
 
}

void draw(){
  
      colorNum=int(random(palette.length));
      fill(palette[colorNum],int(random(0,100)));
      colorNum=int(random(palette.length));
      stroke(palette[colorNum],int(random(0,100)));
      
  
      beginShape();
      vertex(coord1,coord2);
      coord1=random(0,500);
      coord2=random(0,500);
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
      coord2=random(0,500);
      endShape(CLOSE);

}

