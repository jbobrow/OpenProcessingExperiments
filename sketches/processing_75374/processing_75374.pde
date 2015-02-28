
int r=78;
int g=84;
int b=115;
int o=225;

void setup(){
  size(800,600);
  smooth();
  frameRate(10);
  
}
void draw(){
  background(r,g,b,o);
  if(mouseY<height/2){
    r=78; 
    g=84;
    b=115;
    o=225;
}
else{
  r=r+int(random(0,225))-200;
  g=g+int(random(0,225))-200;
  b=b+int(random(0,225))-200;
  o=o+int(random(0,225))+200;
}

 for(int x=0; x<width; x=x+100){
    for(int y=0; y<height; y=y+100){
      strokeWeight(1);
      stroke(225);
     ellipseMode(CENTER);
      ellipse(x,y,10,10);
      line(x,y,mouseX,mouseY);
      noFill();
      rect(x,y,100,100);
    }
}
   
 
 
  stroke(random(0,225),random(0,225),random(0,225),random(0,225));
  strokeWeight(4);
  /*N*/
  /*
  line(50,50,50,150);
  line(50,50,125,150);
  line(125,150,125,50); */
  
  line(mouseX,mouseY,mouseX,mouseY+100);
  line(mouseX,mouseY,mouseX+75,mouseY+100);
  line(mouseX+75,mouseY+100,mouseX+75,mouseY);
  
  /*A*/
  /*
  line(180,50,140,150);
  line(180,50,220,150);
  line(160,100,200,100); */
  
   line(mouseX+130,mouseY,mouseX+90,mouseY+100);
   line(mouseX+130,mouseY,mouseX+170,mouseY+100);
   line(mouseX+110,mouseY+50,mouseX+150,mouseY+50);
  
  /*M*/
  /*
  line(235,150,235,50);
  line(235,50,275,100);
  line(275,100,315,50);
  line(315,50,315,150); */
  
   line(mouseX+185,mouseY+100,mouseX+185,mouseY);
   line(mouseX+185,mouseY,mouseX+225,mouseY+50);
   line(mouseX+225,mouseY+50,mouseX+265,mouseY);
   line(mouseX+265,mouseY,mouseX+265,mouseY+100);
  
  
  /*K*/
   line(mouseX+320,mouseY,mouseX+320,mouseY+100);
   line(mouseX+320,mouseY+50,mouseX+380,mouseY);
   line(mouseX+320,mouseY+50,mouseX+380,mouseY+100);
 /* 
  line(370,50,370,150);
  line(370,100,430,50);
  line(370,100,430,150); */
  /*Y*/
  line(mouseX+395,mouseY,mouseX+435,mouseY+50);
  line(mouseX+435,mouseY+50,mouseX+475,mouseY);
  line(mouseX+435,mouseY+50,mouseX+435,mouseY+100);
  /* 
  line(445,50,485,100);
  line(485,100,525,50);
  line(485,100,485,150); */
  
  /*U*/
  line(mouseX+490,mouseY,mouseX+490,mouseY+85);
  line(mouseX+490,mouseY+85,mouseX+510,mouseY+100);
  line(mouseX+510,mouseY+100,mouseX+540,mouseY+100);
  line(mouseX+540,mouseY+100,mouseX+560,mouseY+85);
  line(mouseX+560,mouseY+85,mouseX+560,mouseY);
  /*
  line(540,50,540,135);
  line(540,135,560,150);
  line(560,150,590,150);
  line(590,150,610,135);
  line(610,135,610,50); */
  
  
}

