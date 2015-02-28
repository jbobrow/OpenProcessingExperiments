
//DRAWING PROGRAM
//MALLIKA PURI
//MATH, PROGRAMMING, AND ART




// COLORS 

color COLOR1 = color(0);//black
color COLOR2 = color(255);//white
color COLOR3 = color(255,0,0);//red
color COLOR4 = color(242,101,12);//orange
color COLOR5 = color(255,247,0);//yellow
color COLOR6 = color(7,147,22);//green
color COLOR7 = color(0,23,255);//blue
color COLOR8 = color(99,39,203);//purple


color penColor = color(0,0,0);
float scribbleX, scribbleY;
int thick = 1; 
int x=300;
int y=300;
int y1=300;
int x1=300;
PImage img;




void setup() {
  size (600,600);






 
  for (int i = 0; i < 600; i++) {
  for (int j = 0; j < 600; j++) {
     stroke(i, 800, j);
     point(i, j);
    
  }
}
}
void draw(){
  
  
  
  
  
  
 

//BORDERS 

smooth();
noStroke();
fill(120);
 rect(0,0,600,33);
 fill(120);
 rect(0,0,33,600);
  fill(120);
 rect(567,0,33,600);
 fill(120);
 rect(0,567,600,33);  
  stroke(255);


 //PALETTE  
  
 smooth();
stroke(0);
strokeWeight(2);

  fill(COLOR2);
  ellipse(570,300,45,45); //white button
  
  fill(COLOR1);
  ellipse(570,345,45,45); //black button
  
  fill(COLOR3);
  ellipse(570,75,45,45); //red button 
  
 
  
  fill(COLOR5);
  ellipse(570,120,45,45); //yellow button
  
  fill(COLOR6);
  ellipse(570,30,45,45); //green button 
  

  
  fill(COLOR8);
  ellipse(570,165,45,45); //purple button

 fill(COLOR4);
  ellipse(570,210,45,45); //orange button 


  fill(COLOR7);
  ellipse(570,255,45,45); //blue button 


 
 
  
  
    if(mousePressed) {
    if(mouseX > 555 && mouseX < 600) {   
      if(mouseY > 0 && mouseY < 45){
        penColor = COLOR6;  //green             
        thick = 2;
      }
      
      
      else if(mouseY > 45 && mouseY < 90) {
        penColor = COLOR3;  //red
        thick = 2;
      }
      else if(mouseY > 90 &&  mouseY < 135){
        penColor = COLOR5; //yellow
        thick = 2;
      }
      
        else if(mouseY > 135 && mouseY < 180) {
          penColor =COLOR8; //purple
          thick = 2;
        }
      
       else if(mouseY > 180 && mouseY < 225){
          penColor = COLOR4;  //orange
          thick = 2;
        }
      
      
      
      
      else if(mouseY > 225 &&  mouseY < 270){
        penColor = COLOR7;  //blue
        thick = 2;
      }
     
     
     else if(mouseY > 270 && mouseY < 315){
          penColor = COLOR2; //white
          thick = 2;
        }
     
     
    }
    if(mousePressed){
      if(mouseX > 560 && mouseX < 600){
        if(mouseY > 315 && mouseY <360 ){
          penColor = COLOR1; //black
          thick = 2;
        }
       
        
        
       
      }
    }    
    stroke(penColor);
    strokeWeight(thick);
    line(scribbleX, scribbleY, mouseX, mouseY);
  }
  scribbleX = mouseX;
  scribbleY = mouseY; 
}
    
   void keyPressed()
{
if (key=='1')
{
  fill(COLOR1);
 rect(0,0,600,600);
}
if (key=='2')
{
 fill(COLOR2);
 rect(0,0,600,600);
}
if (key=='3')
{
 fill(COLOR3);
 rect(0,0,600,600);
}
if (key=='4')
{
 fill(COLOR4);
 rect(0,0,600,600);
}
if (key=='5')
{
 fill(COLOR5);
 rect(0,0,600,600);
}
if (key=='6')
{
 fill(COLOR6);
 rect(0,0,600,600);
}
if (key=='7')
{
 fill(COLOR7);
 rect(0,0,600,600);
}
if (key=='8')
{
 fill(COLOR8);
 rect(0,0,600,600);
}
if (key=='a')
{
 fill(COLOR5);
 rect(0,0,600,600);
  img = loadImage("dot1.png");
  image(img,0,0);
}
if (key=='b')
{
 fill(COLOR5);
 rect(0,0,600,600);
  img = loadImage("dot2.png");
  image(img,0,0);
}
if (key=='c')
{
 fill(COLOR5);
 rect(0,0,600,600);
  img = loadImage("dot3.png");
  image(img,0,0);
}
}

    
    
    
    
  

  
 
  
  
  
  
  
  
  
 
  
  
 
   




