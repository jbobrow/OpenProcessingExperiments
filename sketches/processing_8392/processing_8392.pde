

int [] xwaarden = new int[10];
int [] ywaarden = new int[10];


float r = 0; 
float g = 0; 
float b = 0;


void setup(){
 size(600,600);
 smooth();
 for(int i=0;i<10;i++)
 { xwaarden[i] = 100*int(random(0,10));
   ywaarden[i] = int(random(0,height));
 } 
}


void draw()
{ background(0);
  noStroke();

  //head 
   fill(#996633); 
  //ellipseMode(CENTER); 
  ellipse(mouseX,mouseY,100,100); 
  //ears
  ellipse(mouseX-30,mouseY-55,50,50); 
  ellipse(mouseX+30,mouseY-55,50,50); 
  //body 
  ellipse(mouseX,mouseY+100,120,150); 
  //feet
  ellipse(mouseX+30,mouseY+180,60,60); 
  ellipse(mouseX-30,mouseY+180,60,60); 
  //hands
  ellipse(mouseX-55,mouseY+65,50,50); 
  ellipse(mouseX+55,mouseY+65,50,50); 
  //white fill ears
  fill(255); 
  ellipse(mouseX-30,mouseY-55,30,30); 
  ellipse(mouseX+30,mouseY-55,30,30);
  //white fill body
  ellipse(mouseX,mouseY+100,70,110); 
  // eyes
  fill(0); 
  ellipse(mouseX-10,mouseY-10,10,10); 
  ellipse(mouseX+10,mouseY-10,10,10);
  //mouth
  rect(mouseX, mouseY+15,20,1); 
  
  
  for(int i=0;i<10;i++)
  {rondjes(xwaarden[i],ywaarden[i]);
  }
}

void rondjes(int x, int y)
  {fill(r,g,b); 
   ellipse(x, y, 50, 50);
}

void mousePressed() { 
    r = random(255); 
    g = random(255); 
    b = random(255); 
}




