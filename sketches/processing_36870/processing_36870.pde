
void setup(){
  
size(650, 650);
background(0);
frameRate(4);
}
void draw(){
  println(mouseX);
  println(mouseY);
float w= 0; 
float s= 0;
float r=random(1, 50);
float g=random(1, 50);
float b=random(1, 50);
float box_size = 11; 
float box_space = 12; 
int margin =0; 
int linex = width;
int lineSize = 5;
int x=0;
int sy=10;


//draw lines
int y=2;


while(y<width){
  fill(206, 201, 222, 2);
  stroke(4);
  rect(y, 0, 650, 650);
  y=y+6;
}


// Draw gray boxes 

noStroke(); 
 
for (int i = margin; i < height-margin; i += box_space){
  if(box_size > 0){
    for(int j = margin; j < width-margin; j+= box_space){
      fill(random(box_size)*10);
      rect(j, i, box_size, box_size);
    }
    box_size = box_size - 0.6;
  }
}

//draw concentric circle
while (w<height){
  smooth();
  noFill();
  strokeWeight(2);
  stroke(random(r), random(g), random(b));
  ellipse(width/2, height/2, w/1.5, w/1.5);
  w=w+15;
}
//random appearing circle
int newCircle= 300;
while (newCircle<height){
  smooth();
  fill(255);
  strokeWeight(2);
  ellipse(random(newCircle), random(newCircle), 15, 15);
  newCircle=newCircle+55;
}

//random black circle
//random appearing circle
int blackCircle= 300;
while (blackCircle<height){
  smooth();
  fill(0);
  stroke(255);
  strokeWeight(2);
  ellipse(random(blackCircle), random(blackCircle), 35, 35);
  blackCircle=blackCircle+30;
}


//right random circle
float c=0;
while (c<height){
  smooth();
  noFill();
  stroke(random(r), random(g), random(b));
  ellipse(5, 443, random(c/2), random(c/2));
  c=c+15;
}

//left random circle
float dog=0;
while (dog<height){
  smooth();
  noFill();
  stroke(random(r), random(g), random(b));
  ellipse(543, 435, random(dog/1), random(dog/1));
  dog=dog+15;
}

//draw trinagle
int centerx=width/2;
int centery=310;
int Triangle_scale=75;
int ax=centerx;
int bx=centerx-Triangle_scale;
int cx=centerx+Triangle_scale;
int ay=centery-Triangle_scale;
int by=centery+Triangle_scale;
int cy=by;
fill(Triangle_scale);
triangle(ax, ay, bx, by, cx, cy);
//random triangle
for(int i=Triangle_scale; i>0; i=i-10)
{
  bx=centerx-i;
  cx=centerx+i;
  ay=centery-i;
  by=centery+i;
  cy=by;
  fill(i);
  triangle(random(ax)/2, ay, bx, by, cx, random(cy)/2);
  
}
//regular triangle
for(int i=Triangle_scale; i>0; i=i-10)
{
  bx=centerx-i;
  cx=centerx+i;
  ay=centery-i;
  by=centery+i;
  cy=by;
  fill(i);
  triangle(ax, ay, bx, by, cx, cy);
  
}

//more triangles 
for(int i=Triangle_scale; i>0; i=i-10)
{
  bx=centerx+i;
  cx=centerx-i;
  ay=centery+i;
  by=centery-i;
  cy=by;
  fill(i);
  triangle((ax), (ay), bx, by, cx, cy);
}


//random triangle
for(int i=Triangle_scale; i>0; i=i-10)
{
  bx=centerx+i;
  cx=centerx-i;
  ay=centery+i;
  by=centery-i;
  cy=by;
  fill(i);
  triangle(random(ax/2), random(ay/2), bx, by, cx, cy);
}

rectangles:




//freaking cirlces
fill(255, 50);
ellipse (width/2, height/2, 45, 45);

}





