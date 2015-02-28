
//Name: isakv
//Date:10/01/14
//Project: moving mouse

int x = 20;
int y = 20;

void setup() {  //setup function called initially, only once
  size(800, 800);
  
}

void draw() {  //draw function loops 
 
   background(0,255,255);  //set background white

 fill(224,224,224);             //grey
 ellipse(mouseX + 360,mouseY + 240,70,70);        //right ear
 ellipse(mouseX + 240,mouseY + 240,70,70);        //left ear
 ellipse(mouseX + 300,mouseY + 300,120,120);      //head
 
 fill(0,0,0);                  //black
 ellipse(mouseX + 300,mouseY + 310,20,20);       //nose
 
 fill(255,255,255);            //white     
 ellipse(mouseX + 275,mouseY + 280,30,30);      //left eye
 ellipse(mouseX + 325,mouseY + 280,30,30);      //right eye
 
 fill(0,0,0);                //black
 ellipse(mouseX + 275,mouseY + 280,5,5);       //left  eye dot
 ellipse(mouseX + 325,mouseY + 280,5,5);       //right eye dot
 
 fill(0,0,0);               //black
 rect(mouseX + 285,mouseY + 335,30,2);        //mouth
 
 
 
 
 
 } 
