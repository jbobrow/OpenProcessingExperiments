
PFont f; 
PImage p;

void setup(){
size(400,400);
f=loadFont("Ayuthaya-48.vlw");
//background(0);
p=loadImage("sectionpageiconcopy35.png");
}


void draw(){
    
  if(mouseX>200){background(0);}
  else{background(255);
  }
  
noStroke();

if(mouseX>200){fill(8,250,232);}
else{fill(231,19,232);
}
rect(100,40,200,370);

if (mouseX>200){fill(255);}
else{fill(0);
}
bezier(135,370, 60,0, 336,0,265,370); 

//Font
{  
textFont(f,26); 
textAlign(CENTER/2);

if(mouseX>200){fill(255);}
else{fill(0);
}
}

text("Verrazano",50,50);

//LOWER RIGHT 
//yellow circle
  fill(251,255,41);
  stroke(255);
  if(mouseX>200&&mouseY>200){ellipse(mouseX,mouseY,50,50);
  }
  
  //LOWER LEFT 
//purple circle
  fill(110,96,250);
  stroke(251,255,41);
  if(mouseX<200&&mouseY>200){ellipse(mouseX,mouseY,50,50);
  }
  
//UPPER LEFT
//teal circle
  fill(8,250,232);
  stroke(251,255,41);
  if(mouseX<200&&mouseY<200){ellipse(mouseX,mouseY,50,50);
  }
    
//UPPER RIGHT
//magenta circle
  fill(231,19,232);
  stroke(251,255,41);
  if(mouseX>200&&mouseY<200){ellipse(mouseX,mouseY,50,50);
  }

imageMode(CENTER);
image(p, mouseX, mouseY);


}

