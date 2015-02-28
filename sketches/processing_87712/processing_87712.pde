
void setup() {
  size(640, 480);
  background(0xFF1F265D);
  smooth();
  frameRate(12);
}

void draw() {
  //desk
  stroke(0xFF0F0500);
  fill(0xFF290E01);
  quad(90, 250, width-90, 250, width+100, 400, -100, 400);
  
  fill(0xFF0F0500);
  rect(0, 380, width, height-380);
  
  fill(0xFF0A0300);
  rect(0, 400, width, height-400);
  
  //back of monitor
  stroke(15);
  rectMode(CENTER);
  fill(0);
  rect(width/2, (height/2)-80, 280, 190, 7);

  //screen
  fill(255);
  rect(width/2, (height/2)-83, 260, 160);

  fill(random(0, 255), random(0, 255), random(0, 255), 100);
  rect(width/2, (height/2)-83, 260, 160);

  //hinges
  fill(0);
  rect((width/2)-130, (height/2)+20, 10, 10);
  rect((width/2)+130, (height/2)+20, 10, 10);

  //base
  quad((width/2)-140, (height/2)+20, 
    (width/2)+140, (height/2)+20, 
    (width/2)+200, (height/2)+80, 
    (width/2)-200, (height/2)+80);
    
  quad((width/2)+200, (height/2)+80, 
    (width/2)-200, (height/2)+80, 
    (width/2)-203, (height/2)+87, 
    (width/2)+203, (height/2)+87);
    
  rectMode(CORNER);
  rect((width/2)-203, (height/2)+86, 406, 8, 6);
  
  quad((width/2)-203, (height/2)+93, 
    (width/2)+203, (height/2)+93, 
    (width/2)+190, (height/2)+100, 
    (width/2)-190, (height/2)+100);
  
  //power
  fill(15);
  rect((width/2)-130, (height/2)+24, 260, 3);
  
  fill(255,80);
  ellipse((width/2)+120, (height/2)+25, 3, 3);
  
  //keyboard
  fill(0xFFBC21FF);
  quad((width/2)-135, (height/2)+35, 
    (width/2)+135, (height/2)+35, 
    (width/2)+158, (height/2)+58, 
    (width/2)-158, (height/2)+58);
    
  fill(0xFF212EFF);
  quad((width/2)-40, (height/2)+35, 
    (width/2)+60, (height/2)+35, 
    (width/2)+70, (height/2)+58, 
    (width/2)-60, (height/2)+58);
    
  fill(0xFF580DFF,200);
  quad((width/2)-80, (height/2)+35,
    (width/2)-30, (height/2)+35,
    (width/2)-50, (height/2)+58,
    (width/2)-100, (height/2)+58); 
 
  quad((width/2)+50, (height/2)+35,
    (width/2)+100, (height/2)+35,
    (width/2)+110, (height/2)+58,
    (width/2)+60, (height/2)+58);  
    
  fill(0);
  dottedLine((width/2)-137, (height/2)+35, (width/2)+126, (height/2)+35, 21);
  dottedLine((width/2)-143, (height/2)+41, (width/2)+132, (height/2)+41, 22);
  dottedLine((width/2)-148, (height/2)+47, (width/2)+137, (height/2)+47, 23);
  dottedLine((width/2)-153, (height/2)+53, (width/2)+142, (height/2)+53, 24);
  
  //mouse
  stroke(15);
  noFill();
  quad((width/2)-40, (height/2)+60, 
    (width/2)+40, (height/2)+60, 
    (width/2)+50, (height/2)+75, 
    (width/2)-50, (height/2)+75);

  //light
  
}

void dottedLine(float x1, float y1, float x2, float y2, float steps){
  for(int i=0; i<=steps; i++) {
    float x = lerp(x1, x2, i/steps);
    float y = lerp(y1, y2, i/steps);
    noStroke();
    rect(x, y, 11, 6);
  }
}


