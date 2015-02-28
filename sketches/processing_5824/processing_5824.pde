
//Eindopdracht Programmeren door Barbara Kamphuis, ECP1a
float r;
float g;
float b;
float a;

int x = 0;
int y = 0;
int speed = 3;
int state = 0;

int BloemX = 160;
int BloemY = 110;
float BloemXFill = 0;

void setup() {
  
  size (400,400);
  stroke(255);
  frameRate(40);
  
}

void draw () {
background (#BFE4FF);
  
//BloemRechtsOnder
  noStroke();
  fill(g,b,r,a);
  ellipse(300,300,60,60);
  ellipse(340,300,60,60);
  ellipse(300,340,60,60);
  ellipse(340,340,60,60);
 
//BloemLinksOnder 
  fill(g,b,r,a);
  ellipse(80,340,60,60);
  ellipse(120,340,60,60);
  ellipse(120,300,60,60);
  ellipse(80,300,60,60); 

//BloemLinksBoven  
  fill(g,b,r,a);
  ellipse(80,70,60,60);
  ellipse(120,70,60,60);
  ellipse(80,110,60,60);
  ellipse(120,110,60,60);

//BloemRechtsBoven  
  fill(g,b,r,a);
  ellipse(300,70,60,60);
  ellipse(340,70,60,60);
  ellipse(300,110,60,60);
  ellipse(340,110,60,60);
  
  g = random(0,255);
  b = random(0,255);
  r = random(0,255);
  a = random(0,255);

//BloemMiddenMetMuisBeweging
  if (mouseX < 200 && mouseY < 200) {
  fill (255);
  ellipse(170,170,60,60);
  ellipse(230,170,60,60);
  ellipse(170,230,60,60);
  ellipse(230,230,60,60);
 }else if (mouseX > 200 && mouseY < 200) {
 }
  
//Engel1
  noStroke();
  fill (#F43D6B);
  ellipse(x,y,45,100);
  fill(#FF9200);
  ellipse(x,y-74,50,50);
  fill(#E7003E);
  ellipse(x-10,y-77,10,10);
  fill(#E7003E);
  ellipse(x+10,y-77,10,10); 
  fill(255);
  ellipse(x,y-110,60,10);
  
//Engel2
  noStroke();
  fill (#F43D6B);
  ellipse(x,180,45,100);
  fill(#FF9200);
  ellipse(x,105,50,50);
  fill(#E7003E);
  ellipse(x-10,100,10,10);
  fill(#E7003E);
  ellipse(x+10,100,10,10); 
  fill(255);
  ellipse(x,y-280,60,10);
  
//MijnEngeltjesBewegen 
  if(state == 0 ) { 
  x = x + speed; 
  if (x > width-50) { 
    x = width-50; 
    state = 1; 
    } 
} else if (state == 1) { 
  y = y + speed - 2; 
  x = x - speed + 1; 
  if (x < 0) { 
   y = 175; 
   x = 0; 
   state = 2; 
  }  
} else if (state == 2) { 
    x = x + speed; 
  if (x > width-50) { 
   y = 175; 
   x = 350; 
   state = 3; 
} 
} else if (state == 3) { 
  y = y + speed - 2; 
  x = x - speed + 1; 
  if (x < 0) { 
   y = 350; 
   x = 0; 
   state = 4; 
} 
} else if (state == 4) { 
    x = x + speed; 
  if (x > width-50) { 
   y = 350; 
   x = 350; 
   state = 5; 
} 
} else if (state == 5) { 
  x = 0; 
  y = 0; 
  state = 0; 
} 
}





