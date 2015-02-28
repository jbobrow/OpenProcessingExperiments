
size(250,250);
background(#c8dafe);
for(int i=0;i<120;i+=10){
  stroke(0,70);
  strokeWeight(8);
  smooth();
  int x=10;
  line(0,height,x+i,150);//bottom left lines
  line(width,height,125+i,150);//bottom right lines
  line(125+i,150,125+i,0);// top left lines
  line(x+i,150,x+i,0);//top right lines
  stroke(255);
  strokeWeight(0.6);
   line(0,height,x+i,150);//bottom left lines
  line(width,height,125+i,150);//bottom right lines
  line(125+i,150,125+i,0);// top left lines
  line(x+i,150,x+i,0);//top right lines
}




