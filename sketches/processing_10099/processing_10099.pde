
int button_size=20;
color fill_color;
int thick;
color eraser_color=color(255);
color active_color;
int drawMode;
int x, y, x1, y1;
int points=0;
int drawTurn;
PImage img;
String path;
String saveScreen;
PImage canvas = createImage(width,height,RGB);

void setup(){
  size(600,600);
  background(255);
}

void draw()
{
  drawTools();
  clear();
  drawingMode();
  drawSquare();
}

void drawTools()
{
  stroke(0,0,0); //light red
  fill(255,200,200);
  rect(0,0,button_size, button_size);
  
  stroke(0,0,0); //light green
  fill(200,255,200);
  rect(button_size,0,button_size,button_size);
  
  stroke(0,0,0); //light blue
  fill(200,200,255);
  rect(button_size*2,0,button_size,button_size);
  
  stroke(0,0,0); //light yellow
  fill(255,255,200);
  rect(0,button_size,button_size,button_size);
  
  stroke(0,0,0); //light cian
  fill(125,255,255);  
  rect(button_size,button_size,button_size,button_size);
  
  stroke(0,0,0); //light magenta
  fill(255,200,255);  
  rect(button_size*2,button_size,button_size,button_size);
  
  stroke(0,0,0);
  fill(255,0,0); //red
  rect(0,button_size*2,button_size,button_size);
  
  stroke(0,0,0);
  fill(0,255,0); //green
  rect(button_size,button_size*2,button_size,button_size);
  
  stroke(0,0,0);
  fill(0,0,255); //blue
  rect(button_size*2,button_size*2,button_size,button_size);
  
  stroke(0,0,0);
  fill(255,255,0); //yellow
  rect(0,button_size*3,button_size,button_size);
  
  stroke(0,0,0);
  fill(0,255,255); //cian
  rect(button_size,button_size*3,button_size,button_size);
  
  stroke(0,0,0);
  fill(255,0,255); //magenta
  rect(button_size*2,button_size*3,button_size,button_size);
  
  stroke(0,0,0);
  fill(180,0,0); //dark red
  rect(0,button_size*4,button_size,button_size);
  
  stroke(0,0,0);
  fill(0,180,0); //dark green
  rect(button_size,button_size*4,button_size,button_size);
  
  stroke(0,0,0);
  fill(0,0,180); //dark blue
  rect(button_size*2,button_size*4,button_size,button_size);
  
  stroke(0,0,0);
  fill(180,180,0); //dark yellow
  rect(0,button_size*5,button_size,button_size);
  
  stroke(0,0,0);
  fill(0,180,180); //dark cian
  rect(button_size,button_size*5,button_size,button_size);
  
  stroke(0,0,0);
  fill(180,0,180); //dark magenta
  rect(button_size*2,button_size*5,button_size,button_size);
  
  
  //brush
  stroke(0,0,0); //brush 3
  fill(255,255,255);
  rect(0,button_size*7,button_size*1.5,button_size*2);
  noStroke();
  fill(0);
  ellipse(15,button_size*7+20,3,3);
  
  stroke(0,0,0);//brush 5
  fill(255,255,255);
  rect(0,button_size*9,button_size*1.5,button_size*2);
  noStroke();
  fill(0);
  ellipse(15,button_size*9+20,5,5);
  
  stroke(0,0,0);//brush7
  fill(255,255,255);
  rect(0,button_size*11,button_size*1.5,button_size*2);
  noStroke();
  fill(0);
  ellipse(15,button_size*11+20,7,7);
  
  stroke(0,0,0);//brush 9
  fill(255,255,255);
  rect(0,button_size*13,button_size*1.5,button_size*2);
  noStroke();
  fill(0);
  ellipse(15,button_size*13+20,9,9);
  
  stroke(0,0,0);//brush 11
  fill(255,255,255);
  rect(0,button_size*15,button_size*1.5,button_size*2);
  noStroke();
  fill(0);
  ellipse(15,button_size*15+20,11,11);
  
  stroke(0,0,0);//brush 13
  fill(255,255,255);
  rect(0,button_size*17,button_size*1.5,button_size*2);
  noStroke();
  fill(0);
  ellipse(15,button_size*17+20,13,13);
  
  stroke(0,0,0);//brush 15
  fill(255,255,255);
  rect(0,button_size*19,button_size*1.5,button_size*2);
  noStroke();
  fill(0);
  ellipse(15,button_size*19+20,15,15);
  
  stroke(0,0,0);//brush 17
  fill(255,255,255);
  rect(0,button_size*21,button_size*1.5,button_size*2);
  noStroke();
  fill(0);
  ellipse(15,button_size*21+20,17,17);
  
  stroke(0,0,0);//brush 19
  fill(255,255,255);
  rect(0,button_size*23,button_size*1.5,button_size*2);
  noStroke();
  fill(0);
  ellipse(15,button_size*23+20,19,19);
  
  
  //eraser
  stroke(0,0,0); //eraser 3
  fill(255,255,255);
  rect(30,button_size*7,button_size*1.5,button_size*2);
  stroke(0);
  ellipse(45,button_size*7+20,3,3);
  
  stroke(0,0,0);//eraser 5
  fill(255,255,255);
  rect(30,button_size*9,button_size*1.5,button_size*2);
  stroke(0);
  ellipse(45,button_size*9+20,5,5);
  
  stroke(0,0,0);//eraser 7
  fill(255,255,255);
  rect(30,button_size*11,button_size*1.5,button_size*2);
  stroke(0);
  ellipse(45,button_size*11+20,7,7);
  
  stroke(0,0,0);//eraser 9
  fill(255,255,255);
  rect(30,button_size*13,button_size*1.5,button_size*2);
  stroke(0);
  ellipse(45,button_size*13+20,9,9);
  
  stroke(0,0,0);//eraser 11
  fill(255,255,255);
  rect(30,button_size*15,button_size*1.5,button_size*2);
  stroke(0);
  ellipse(45,button_size*15+20,11,11);
  
  stroke(0,0,0);//eraser 13
  fill(255,255,255);
  rect(30,button_size*17,button_size*1.5,button_size*2);
  stroke(0);
  ellipse(45,button_size*17+20,13,13);
  
  stroke(0,0,0);//eraser 15
  fill(255,255,255);
  rect(30,button_size*19,button_size*1.5,button_size*2);
  stroke(0);
  ellipse(45,button_size*19+20,15,15);
  
  stroke(0,0,0);//eraser 17
  fill(255,255,255);
  rect(30,button_size*21,button_size*1.5,button_size*2);
  stroke(0);
  ellipse(45,button_size*21+20,17,17);
  
  stroke(0,0,0);//eraser 19
  fill(255,255,255);
  rect(30,button_size*23,button_size*1.5,button_size*2);
  stroke(0);
  ellipse(45,button_size*23+20,19,19);
  
  stroke(0);//draw square
  fill(255);
  rect(70,540,60,60);
  stroke(0);
  fill(255);
  rect(80,550,40,40);
  
  stroke(0);//draw filled square 
  fill(255);
  rect(130,540,60,60);
  stroke(0);
  fill(0);
  rect(140,550,40,40);
  
  stroke(0);//draw ellipse
  fill(255);
  rect(190,540,60,60);
  smooth();
  stroke(0);
  fill(255);
  ellipse(220,570,40,40);
  
  stroke(0);//draw filled ellipse
  fill(255);
  rect(250,540,60,60);
  smooth();
  stroke(0);
  fill(0);
  ellipse(280,570,40,40);
  
  stroke(0);//draw free
  fill(255);
  rect(310,540,60,60);
  smooth();
  stroke(0);
  beginShape();
  curveVertex(340,550);
  curveVertex(340,550);
  curveVertex(320,580);
  curveVertex(350,590);
  curveVertex(350,590);
  endShape();
 
  //clear screen
  stroke(0);
  fill(0);
  rect(0,540,60,60);
  
  //save image
  stroke(0,0,0);
  fill(255,0,0);
  rect(540,540,60,60); 
  
  //load image
  stroke(0,0,0);
  fill(0,255,0);
  rect(480,540,60,60);
}

void mousePressed()
{   
  if(mouseButton==LEFT){
    if(mouseX>480&&mouseX<540&&mouseY>540&&mouseY<600){//SAVE IMAGE
      path=selectInput();
      if(path!=null)
      img=loadImage(path);
      image(img,60,0);}
    if(mouseX>540&&mouseX<600&&mouseY>540&&mouseY<600){//
      canvas = get(60,0,width-60,height-60);
      saveScreen = selectOutput();
      if(saveScreen != null);
      canvas.save(saveScreen);
    }
     if((mouseX > 0 && mouseX < 60)&&(mouseY > 0 && mouseY < 120))
  {
    int colornumber=(int)(mouseX/button_size)+(int)((mouseY/button_size*3));
    println(colornumber);
    
    switch(colornumber)
    {
      case 0:
        fill_color=color(255,200,200); //set colour to light red
        break;
      case 1:
        fill_color=color(200,255,200);//set color to light green
        break;
      case 2:
        fill_color=color(200,200,255);//set color to light blue
        break;
      case 3:
        fill_color=color(255,255,200);//set color to light yellow
        break;
      case 4:
        fill_color=color(200,255,255);//set color to light cian
        break;
      case 5:
        fill_color=color(255,200,255);//set color to light magenta
        break;        
      case 6:
        fill_color=color(255,0,0);//set color to red
        break;        
      case 7:
        fill_color=color(0,255,0);//set color to green
        break;        
      case 8:
        fill_color=color(0,0,255);//set color to blue
        break;        
      case 9:
        fill_color=color(255,255,0);//set color to yellow
        break;      
      case 10:
        fill_color=color(0,255,255);//set color to cian
        break;  
      case 11:
        fill_color=color(255,0,255);//set color to magenta
        break;        
      case 12:
        fill_color=color(180,0,0);//set color to dark red
        break;      
      case 13:
        fill_color=color(0,180,0);//set color to dark green
        break;  
      case 14:
        fill_color=color(0,0,180);//set color to dark blue
        break;        
      case 15:
        fill_color=color(180,180,0);//set color to dark yellow
        break;      
      case 16:
        fill_color=color(0,180,180);//set color to dark cian
        break;  
      case 17:
        fill_color=color(180,0,180);//set color to dark magenta
        break;
    }
active_color=fill_color;
    }
  }

if(mouseY > 140 && mouseY < 500){
      if(mouseX > 0 && mouseX < 30){
         active_color=fill_color;}
      if(mouseX > 30 && mouseX < 60){
         active_color=color(255); }
    if(mouseX > 0 && mouseX < 60){
      int brushnumber=(int)((mouseY-140)/40);
      println(brushnumber);
    
      switch(brushnumber)//brush size
      {  
        case 0:
          thick=3;
          break;
        case 1:
          thick=5;
          break;        
        case 2:
          thick=7;
          break;        
        case 3:
          thick=9;
          break;        
        case 4:
          thick=11;
          break;        
        case 5:
          thick=13;
          break;  
        case 6:
          thick=15;
          break;        
        case 7:
           thick=17;
           break;         
        case 8:
           thick=19;
           break;
}}
}
}

void drawingMode(){
  if(mousePressed){
  if((mouseX>70&&mouseX<130)&&(mouseY>540&&mouseY<600)){
    drawMode=2;}
  if((mouseX>130&&mouseX<190)&&(mouseY>540&&mouseY<600)){
    drawMode=3;}
  if((mouseX>190&&mouseX<250)&&(mouseY>540&&mouseY<600)){
    drawMode=4;}
  if((mouseX>250&&mouseX<310)&&(mouseY>540&&mouseY<600)){
    drawMode=5;}
  if((mouseX>310&&mouseX<370)&&(mouseY>540&&mouseY<600)){
    drawMode=1;}}}

void clear(){
  if(mousePressed){
  if((mouseX>0&&mouseX<60)&&(mouseY>540&&mouseY<600)){
    background(255);
    drawTools();}}}

void mouseDragged(){
    if(drawMode==1){
    noStroke();
    fill(active_color);
    ellipse(mouseX,mouseY,thick,thick);}}
    
void drawSquare(){
     if(drawMode==2){
      if(mousePressed){
        if(points==0){
          x=mouseX;
          y=mouseY;
          stroke(active_color);
          point(x,y);
          points=1;}
      else{
          x1=mouseX;
          y1=mouseY;
          stroke(active_color);
          noFill();
          rect(x,y,x1-x,y1-y);
          points=0;}}}
          
      if(drawMode==3){
        if(mousePressed){
          if(points==0){
          x=mouseX;
          y=mouseY;
          stroke(active_color);
          point(x,y);
          points=1;}
        else{
          x1=mouseX;
          y1=mouseY;
          noStroke();
          fill(active_color);
          rect(x,y,x1-x,y1-y);
          points=0;}}}
          
        if(drawMode==4){
        if(mousePressed){
          if(points==0){
          x=mouseX;
          y=mouseY;
          stroke(active_color);
          point(x,y);
          points=1;}
        else{
          x1=mouseX;
          y1=mouseY;
          stroke(active_color);
          noFill();
          ellipse(x,y,x1-x,y1-y);
          points=0;}}}
          
        if(drawMode==5){
        if(mousePressed){
          if(points==0){
          x=mouseX;
          y=mouseY;
          stroke(active_color);
          point(x,y);
          points=1;}
        else{
          x1=mouseX;
          y1=mouseY;
          noStroke();
          fill(active_color);
          ellipse(x,y,x1-x,y1-y);
          points=0;}}}}

    
    

