
size(250, 250);
background(#c2afd7);
smooth();
 
fill(#d76fa5, 30);//four triangles 
stroke(#5f5f5f,30);
strokeWeight(5);
for(int f=60; f<=height; f+=5) {
 triangle(width/2,height/2+f, 0,height,width,height);
 triangle(width/2,height/2-f, 0,0,width,0);
 triangle(height/2-f,width/2,0,0,0,height);
 triangle(height/2+f,width/2,width,height,width,0);
 //quad(125-f,185,65,125,125,65+f,185,125);
}
fill(#d76fa5, 40);//middle circle
stroke(255,130);
strokeWeight(0.35);
for(int i=100;i>0;i-=5){
 ellipse(width/2,height/2,i,i);
}
  
stroke(255,120);//four lines
strokeWeight(2);
line(0,0,89,89);
line(width,0,161,90);
line(0,height,89,161);
line(width,height,161,161);

noFill();
stroke(255,60);
strokeWeight(6);
int r=30;//to change circle radius
ellipse(50,50,r,r);//top left
ellipse(200,50,r,r);//top right
ellipse(50,200,r,r);//bottom left
ellipse(200,200,r,r);//bottom right

  

