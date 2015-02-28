
int x;
int y;
int Y_AXIS = 1;
int X_AXIS = 2;
PImage bg, bg2;
float offset;



void setup() {
  size(500, 480);
  bg = loadImage("Untitled 2.jpg");
  bg2 = loadImage("Untitled.jpg");



}



void draw() {
 
     

fill(255);  
tint(200,210,10);

  image(bg,0,0);
  float offsetTarget = map(mouseX,0,width,-bg2.width/2-width/2,0);
  offset+=(offsetTarget-offset)*0.05;
  tint(255,255,255,80);
  image(bg2,offset,40);

  y=0;
  x=0;

  while (y < 800){
    x=0;

    while (x < 800) {
      smooth();
      noFill();
      stroke(255,20);
      ellipse(x, y, 50, 100);



     
      noFill();
      stroke(234,203,73, random(10));
      ellipse(x-y,y,random(10),300);
      
       fill(255, random(50));
      stroke(234,203,73, random(10));
      ellipse(x+y-120,y+x,random(10),10);
      
      fill(255, random(50));
      stroke(234,203,73, random(10));
      ellipse(x+y-90,y+x,random(10),10);
      
             fill(255, random(50));
      stroke(234,203,73, random(10));
      ellipse(x+y,y+x,random(10),10);
      
       fill(255, random(50));
      stroke(234,203,73, random(10));
      ellipse(x+y,y+x-250,random(10),10);
      

  
      
      
    
     


      x=x+25;

    }




    y=y+25;
    x=x+25;

  }


}




