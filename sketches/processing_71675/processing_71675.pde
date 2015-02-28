
//Original Grid size is 20x30
 
 
 
 float bgcolor=128;
 float c1=0;
 float c2=bgcolor;
 float c3=255;
 int move = 1;
 int rMouseX = mouseX;

 void mouseReleased(){
 c2=128;}
 void keyReleased(){
 background(c2);}
 
void setup(){
size(1000,1000);


}
void drawalien(int x, int y) {
  rectMode(CORNERS);
  ellipseMode(CORNERS);

      //Face Shape
fill(c3,c2,c2);
  ellipse(x-70,  y-125,  x+70,  y+115  );
stroke(c2);
fill(c2);
  rect(x-70,     y+55,     x+70,     y+75);
  ellipse(x-100,     y+25,     x-45,     y+135);
  ellipse(x+40,     y+25,     x+95,     y+135);
        
        //eyes 
fill(c1);
noStroke();
  ellipse(x-60,     y-5,     x-30,     y+15);
  ellipse(x+30,     y-5,     x+60,     y+15);
  ellipse(x-30,     y-55,     x+30,     y-35);
     
      //Pupils
fill(c3);
  ellipse(x-50,     y-5,     x-40,     y+5);
  ellipse(x+40,     y-5,     x+50,     y+5);
  ellipse(x-10,     y-55,     x+10,     y-35);
     
      //Nostrils
fill(c1);
  ellipse(x-15,     y+25,     x-5,     y+45);
  ellipse(x+5,     y+25,     x+15,     y+45);
     
     //line
stroke(0);
  line(x+60,     y-85,     x+60,     y-155);
  line(x+60,     y-155,    x+100,    y-155);
  line(x+100,    y-155,    x+100,    y-95);
  line(x-60,     y-85,     x-60,     y-155);
  line(x-60,     y-155,    x-100,    y-155);
  line(x-100,    y-155,    x-100,    y-95);

      //face Lines
  line(x-20,     y+55,     x-30,     y+25);
  line(x-30,     y+25,     x-60,     y+20);
  line(x+20,     y+55,     x+30,     y+25);
  line(x+30,     y+25,     x+60,     y+20);
}

void draw(){
  int i=0;
 //background(c2);
  //drawalien(mouseX,mouseY);
if(mousePressed && mouseButton==LEFT){
  c2=50;
background(c2);
drawalien(mouseX,mouseY);
mouseY = mouseY+10;
}

if(mousePressed && mouseButton==RIGHT){
   c2=128;
   //background(c2);
  drawalien(mouseX,mouseY);
  mouseX = mouseX+10;
  
  
if(mouseX>width){
  mouseX=-10;}}
  
if(mouseY>1000){
  mouseY=-10;

}
if(keyPressed){
 int b=-512;
 while(b<width){
   drawalien((b+mouseX),mouseY);
   b = b+256;
   
   }
    }
  }
