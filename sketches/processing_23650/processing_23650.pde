
size(400,400);
background(0,156,255);
smooth();
stroke(255,242,0);
strokeWeight(2);
for(int y=0; y<=height; y+=20){
  for(int x=0; x<=width; x+=20){
    line(x,0,width/2,height/2);
    line(0,y,width/2,height/2);
    line(400,y,width/2,height/2);
    line(x,400,width/2,height/2);
  }
}
//feet
stroke(0);
strokeWeight(10);
strokeJoin(ROUND);
line(143,140,143,176);
line(127,136,127,172);
//body
fill(255);
stroke(255);
strokeWeight(10);
strokeJoin(ROUND);
beginShape();
vertex(125,120);
vertex(145,130);
vertex(145,170);
vertex(125,165);
endShape(CLOSE);
//balck part
fill(0);
strokeWeight(0);
beginShape();
vertex(120,120);
vertex(150,130);
vertex(150,160);
vertex(120,155);
endShape(CLOSE);
//arms
stroke(0);
strokeWeight(10);
strokeJoin(ROUND);
line(150,150,157,162);
line(125,140,115,157);
//papper box head
fill(255,230,171);
strokeWeight(1);
stroke(0);
beginShape();
vertex(93,140);
vertex(93,50);
vertex(130,40);
vertex(195,50);
vertex(195,140);
vertex(158,150);
endShape(CLOSE);
line(93,50,158,60);
line(158,60,195,50);
line(158,60,158,150);
//black eyes
fill(0);
stroke(0);
ellipse(107,101,22,22);//left eye
ellipse(142,105,22,22);//right eye
//eye line
stroke(255);
strokeWeight(2);
line(100,100,115,102);
line(135,104,150,106);

