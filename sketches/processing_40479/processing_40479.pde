
//background blue
float bkB = 0;

// jelly red
float jR = 0;

void setup (){
size(700,700);
smooth();
}

void draw() {
background(0,0,bkB);
instructions();
waterDepth();
seaCreature();
seaSkeleton();
jelly();
  

// Constrain all color values to between 0 and 255.
jR = constrain(jR,0,255);
bkB = constrain(bkB,0,255);

  
//end void draw  
}


//instructions @ top left
void instructions (){
loadFont("SansSerif-12.vlw"); 
text("start up here", 15, 30); 
text("swim down slowly", 15, 50); 
text("press Z to zap!", 15, 70); 
}

//water depth illusion
void waterDepth(){
    if (mouseY < height/2) {
    bkB = bkB+3; 
  } else {
    bkB = bkB-3;
  }
}

// deep sea creature
void seaCreature(){
if (mouseY > (height/2)) {
  fill(255,0,10);
  ellipse(200,600,300,180);
  quad(10,550,60,600,10,650,25,600);
  fill(0,0,bkB);
  ellipse(330,600,100,50);
  fill(100,10,10);
  ellipse(275,570,30,30);
  fill(255,255,0);
  ellipse(280,565,30,30);
  fill(0,255,200);
  ellipse(285,565,25,25);
  }
}


// sea skeleton
void seaSkeleton(){
if (keyPressed && mouseY > (height/2)) {
    if ((key == 'z') || (key == 'Z')) {
// body
  fill(255);
  ellipse(200,600,301,181);
  quad(10,550,60,600,10,650,25,600);
  fill(0,0,bkB);
  ellipse(330,600,100,50);
//dead eye  
  fill(0,0,bkB);
  ellipse(280,565,35,35);
//bones  
  fill(0,0,bkB);
//top  
  quad(60,500,70,500,80,600,70,600);
  quad(80,500,90,500,100,600,90,600);
  quad(100,500,110,500,120,600,110,600);
  quad(120,500,130,500,140,600,130,600);
  quad(140,500,150,500,160,600,150,600);
  quad(160,500,170,500,180,600,170,600);
  quad(180,500,190,500,200,600,190,600);
  quad(200,500,210,500,220,600,210,600);
  quad(220,500,230,500,240,600,230,600);
//bottom
  quad(70,610,80,610,70,700,60,700);
  quad(90,610,100,610,90,700,80,700);
  quad(110,610,120,610,110,700,100,700);
  quad(130,610,140,610,130,700,120,700);
  quad(150,610,160,610,150,700,140,700);
  quad(170,610,180,610,170,700,160,700);
  quad(190,610,200,610,190,700,180,700);
  quad(210,610,220,610,210,700,200,700);
  quad(230,610,240,610,230,700,220,700);
    }
  }
}

void jelly(){
  // jelly body
  noCursor();
  noStroke();
  fill(jR,255,200);
  ellipse(mouseX,mouseY,100,100);
  rect(mouseX-49,mouseY-1,99,52);
  ellipse(mouseX,mouseY+50,120,30);
      if (mouseY < height/2) {
    jR = jR+2; 
  } else {
    jR= jR-2;
  }
  
// jelly tentacles  
noStroke();
bezier(mouseX, mouseY+150, mouseX+10, mouseY+10, mouseX+30, mouseY+30, mouseX-20, mouseY+200);
bezier(mouseX-15, mouseY+100, mouseX-10, mouseY+10, mouseX-10, mouseY+10, mouseX-40, mouseY+250);  
bezier(mouseX+5, mouseY+100, mouseX-5, mouseY+10, mouseX-5, mouseY+10, mouseX-5, mouseY+250); 
bezier(mouseX+35, mouseY+100, mouseX+20, mouseY+10, mouseX+20, mouseY+10, mouseX+40, mouseY+150);  
}

