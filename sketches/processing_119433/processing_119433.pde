
size(400,565);
background(232,255,196);
smooth();

//kurozi
fill(0); 
rect(260,0,260,565);
rect(0,380,400,400);
rect(135,280,400,400);

//sirozi
stroke(232,255,196);
strokeWeight(2);
line(0,400,400,400);
line(260,0,260,565);

noStroke();
fill(232,255,196);
rect(265,100,300,235);
rect(170,360,300,90);

ellipse(125,500,180,180);

//line 
int i = 0;
stroke(0);
for(int x=0; x<400; x+=100){
  for(int y=0; y<565; y+=5){
  line(x++,y,-1000,600);
}
}

strokeWeight(1);
for(int x=0; x<=width; x+=20){
  for(int y=0; y<=height; y+=20){
  if(x == 100 || x == 300){
    fill(232,255,196);
  }
  else{
    fill(0);
  }
  ellipse(x,130,10,10);
  println("x=" + x);
  }
}


//aka
noStroke();
fill(255,0,0);
triangle(20,100,100,40,370,520);


 



