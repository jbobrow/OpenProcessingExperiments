
int toolHeight = 20;
int toolWidth = 20;
int nbTools = 5;
boolean isFirstClick = false;
boolean penIsSlected = false;
boolean eraseIsSlected = false;
boolean lineIsSlected = false;
boolean cercleIsSlected = false;
boolean rectIsSlected = false;
color blackc = color(0, 0, 0), whitec = color(255, 255, 255), yellowc = color(237, 255, 0), redc = color(255,0,0), greenc = color(0,36,255), bluec = color(0 , 206, 8); 
color colorSelected;
PFont font;



void setup()
{
  size(640,360);
  background(255);
  smooth();
  font = loadFont("Helvetica-12.vlw"); 
  fill(0); 
  text("'s' to save your creation", width/2 - 80, height/2);
  textFont(font, 12); 
}

void draw()
{ 
  if(mousePressed && !isFirstClick){
    background(255);
    isFirstClick = true;
  }
  
  //*** Color selector ***//
  if(mousePressed && mouseX < 20 && mouseY < toolHeight*(nbTools+1) && mouseY > 20){
    colorSelected = blackc;
  }else if(mousePressed && mouseX < 20 && mouseY < toolHeight*(nbTools+2) && mouseY > 20){
    colorSelected = whitec;
  }else if(mousePressed && mouseX < 20 && mouseY < toolHeight*(nbTools+3) && mouseY > 20){
    colorSelected = redc;
  }else if(mousePressed && mouseX < 20 && mouseY < toolHeight*(nbTools+4) && mouseY > 20){
    colorSelected = greenc;
  }else if(mousePressed && mouseX < 20 && mouseY < toolHeight*(nbTools+5) && mouseY > 20){
    colorSelected = bluec;
  }else if(mousePressed && mouseX < 20 && mouseY < toolHeight*(nbTools+6) && mouseY > 20){
    colorSelected = yellowc;
  }
  
  fill(colorSelected);
  stroke(0);
  rect(640 - 20, 360 - 20, toolWidth, toolHeight);
  
  //*** Tool selector ***//
  //1 - Trace
  if(mousePressed && mouseX < 20 && mouseY < 20){
    penIsSlected = true;
    eraseIsSlected = false;
    lineIsSlected = false;
    cercleIsSlected = false;
    rectIsSlected = false;
  }

  if(mousePressed && penIsSlected && mouseX > 20){
    stroke(colorSelected);
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
  
  //2 - Aleatoire line
  if(mousePressed && mouseX < 20 && mouseY > 20 && mouseY < 40){
    lineIsSlected = true;
    penIsSlected = false;
    eraseIsSlected = false;
    cercleIsSlected = false;
    rectIsSlected = false;
  }

  if(mousePressed && lineIsSlected && mouseX > 20){
      stroke(colorSelected);
      float r = random(1.0);
      if(r < 0.2) {
        stroke(255); 
      } else {
        stroke(colorSelected); 
      }
      float sw = pow(random(1.0), 12);
      strokeWeight(sw * 4); 
      float x1 = random(-200, -100);
      float x2 = random(width+100, width+200);
      float y1 = random(-100, height+100);
      float y2 = random(-100, height+100);
      line(x1, y1, x2, y2);
      strokeWeight(1);
  }
  
  //3
  if(mousePressed && mouseX < 20 && mouseY > 40 && mouseY < 60){
    cercleIsSlected = true;
    penIsSlected = false;
    eraseIsSlected = false;
    lineIsSlected = false;
    rectIsSlected = false;
  }

  if(mousePressed && cercleIsSlected && mouseX > 20){
      stroke(colorSelected, 180);
      strokeWeight(mouseY/60);
    
      for (int ptY=0; ptY<20; ptY++) {
        for (int ptX=0; ptX<20; ptX++) {
    
          float posX = width/20 * ptX;
          float posY = height/20 * ptY;
    
          float shiftX = random(-mouseX, mouseX)/20;
          float shiftY = random(-mouseX, mouseX)/20;
    
          ellipse(posX+shiftX, posY+shiftY, mouseY/15, mouseY/15);
        }
      }
      strokeWeight(1);
  }
  
  //4
  if(mousePressed && mouseX < 20 && mouseY > 60 && mouseY < 80){
    rectIsSlected = true;
    cercleIsSlected = false;
    penIsSlected = false;
    eraseIsSlected = false;
    lineIsSlected = false;
  }

  if(mousePressed && rectIsSlected && mouseX > 20){
    stroke(colorSelected, 180);
    strokeWeight(random(0,10));
    fill(255);
    rect(mouseX, mouseY, random(0,100), random(0,100));
    strokeWeight(1);
  }
  
  //5 - Erase
 if(mousePressed && mouseX < 20 && mouseY > 80 && mouseY < 100){
    eraseIsSlected = true; 
    penIsSlected = false;
    lineIsSlected = false;
    cercleIsSlected = false;
    rectIsSlected = false;
  }

  if(mousePressed && eraseIsSlected && mouseX > 20){
    fill(colorSelected);
    stroke(colorSelected);
    rect(toolWidth+1, 0, 640 - toolWidth, 360);
  }
  createTool();
}

// To create toolbar
void createTool(){
    stroke(0);
    fill(0);
    rect(0, 0, toolWidth, 360);
  
    //create tools
    for(int i = 0 ; i < nbTools ; i ++){
      fill(0);
      text(i, (toolHeight-3)/2, (toolHeight)*i-4);
      fill(255);
      rect(0, toolHeight*i, toolWidth, toolHeight);
    }
    fill(0);
    text("!", (toolHeight-2)/2, (toolHeight)*nbTools-4);
     
    //create color panel
    //color1
    fill(blackc);
    rect(0, toolHeight*nbTools, toolWidth, toolHeight);
    //color2
    fill(whitec);
    rect(0, toolHeight*(nbTools+1), toolWidth, toolHeight);
    //color3
    fill(redc);
    rect(0, toolHeight*(nbTools+2), toolWidth, toolHeight);
    //color4
    fill(greenc);
    rect(0, toolHeight*(nbTools+3), toolWidth, toolHeight);
    //color5
    fill(bluec);
    rect(0, toolHeight*(nbTools+4), toolWidth, toolHeight);
    //color6
    fill(yellowc);
    rect(0, toolHeight*(nbTools+5), toolWidth, toolHeight);
    
  //*** End create toolbar ***//
}

// To save the creation
void keyReleased(){
  if (key == 's' || key == 'S'){
    saveFrame(timestamp()+"_##.png");
  }
}
  
// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
                
