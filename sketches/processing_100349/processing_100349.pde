
Spot foo[] = new Spot[30];  // Since you'll want more than one spot create an array to store multiple spots

int r1 = 170;
int g1 = 201;
int b1 = 156;
int r2 = 0;
int g2 = 199;
int b2 = 226;
int a = 150;
int backc = 188;
float BARhite = 0.0769;

int maxRadius;
float interfaceW;
float interfaceH;

//float barwidth;
//float barheight;
float topbarW;
float topbarH;
float speed;


void setup(){
 size(480,600);
// barwidth = 0.04;
// barheight = 0.5;
// interfaceW = width;
// interfaceH = BARhite*height;
// topbarW = barheight*width;
// topbarH = barwidth*height;
 maxRadius = 90;
 speed = 0.5; // from 0-1
 
// fill(255,0,0);
// rect(0,0,0.02*width, interfaceH);
 
 // Whenever you want to do something to all your spots you need to iterate through the array:
for(int i=0;i<foo.length;i++) {
   // create a random colour.  By limiting r and g and setting a minimum for b we should get a selection of blues
   // while I adjusted color for the circles later, i couldn't delete this area without losing it all
 
  int r = (int) random(100);
  int g = (int) random(100);
   int b = 155 + (int) random(100);
  color colour = color(r,g,b);
   // create the Spot objects:
   foo[i] = new Spot(random(width),0,random(maxRadius), colour);
 }
 smooth();
 
}

//BACKGROUND VALUE CONTROL AND DRAW
void draw(){
   background(backc);
    //begin "if mouse gets near edges do controls of inner and outer circles
    
     if (mouseY > ((1-BARhite)*height)) {
	 backc = ((255*mouseX)/width); //change background shade
         fill(255-backc);
         rect(0,height*(1-BARhite),width,height*(BARhite));  //black bar on bottom 
         stroke(backc);
         line(mouseX,(1-BARhite)*height, mouseX, height);
     }
     
 
     //red TOP -- INNER CIRCLE
       if (mouseY < BARhite*height) { //outer circle, red control
	 r2 = ((255*mouseX)/width);
         noStroke();  
         fill(r2,g2,b2); //red box on top L to gauge red value
         rect(0,0,width, BARhite*height); //line to guage red value
         fill(255,0,0); //IDENTIFIER
         rect(0,0,BARhite*width,BARhite*height); //line to guage red value
         stroke(0);
         line(mouseX,0,mouseX,BARhite*height);
     }
     
       //green TOP -- INNER CIRCLE
          if ( mouseY > (2*BARhite*height) && mouseY < (3*BARhite*height)) {
   g2 = ((255*mouseX)/width);
         noStroke();  
         fill(r2,g2,b2); //green box on RIGHT to gauge green value of inner circle
         rect(0,BARhite*2*height, width, BARhite*height);
          fill(0,255,0); //IDENTIFIER
         rect(0,BARhite*2*height,BARhite*width,BARhite*height); //line to guage red value
         stroke(255-backc);
         line(mouseX,(BARhite*2*height),mouseX, (BARhite*3*height));  //line to tell green value
     }
     

       //blue TOP -- INNER CIRCLE
          if ( mouseY > (4*BARhite*height) && mouseY < (5*BARhite*height)) {
   b2 = ((255*mouseX)/width);
         noStroke();  
         fill(r2,g2,b2); //green box on RIGHT to gauge green value of inner circle
         rect(0,BARhite*4*height, width, BARhite*height);
          fill(0,0,255); //IDENTIFIER
         rect(0,BARhite*4*height,BARhite*width,BARhite*height); //line to guage red value
         stroke(255-backc);
         line(mouseX,(BARhite*4*height),mouseX, (BARhite*5*height));  //line to tell green value
     }
     
   
    
     //red TOP -- OUTER CIRCLE
           if (mouseY > (6*BARhite*height) && mouseY < (7*BARhite*height)) { //outer circle, red control
   r1 = ((255*mouseX)/width);
         noStroke();  
         fill(r1,g1,b1); //red box on top L to gauge red value
         rect(0,BARhite*6*height,width, BARhite*height); //line to guage red value
         fill(255,0,0); //IDENTIFIER
         rect(width-BARhite*width,BARhite*6*height,BARhite*width,BARhite*height); //line to guage red value
         stroke(0);
         line(mouseX,(BARhite*6*height),mouseX,BARhite*7*height);
     }
     
       //green TOP -- OUTER CIRCLE
          if ( mouseY > (8*BARhite*height) && mouseY < (9*BARhite*height)) {
   g1 = ((255*mouseX)/width);
         noStroke();  
         fill(r1,g1,b1); //green box on RIGHT to gauge green value of inner circle
         rect(0,BARhite*8*height, width, BARhite*height);
          fill(0,255,0); //IDENTIFIER
         rect(width-BARhite*width,BARhite*8*height,BARhite*width,BARhite*height); //line to guage red value
         stroke(255-backc);
         line(mouseX,(BARhite*8*height),mouseX, (BARhite*9*height));  //line to tell green value
     }
     

       //blue TOP -- OUTER CIRCLE
          if ( mouseY > (10*BARhite*height) && mouseY < (11*BARhite*height)) {
   b1 = ((255*mouseX)/width);
         noStroke();  
         fill(r1,g1,b1); //green box on RIGHT to gauge green value of inner circle
         rect(0,BARhite*10*height, width, BARhite*height);
          fill(0,0,255); //IDENTIFIER
         rect(width-BARhite*width,BARhite*10*height,BARhite*width,BARhite*height); //line to guage red value
         stroke(255-backc);
         line(mouseX,(BARhite*10*height),mouseX, (BARhite*11*height));  //line to tell green value
     }
          
  
  //
//
//
// TEXT of VALUES to SCREEN
//text values on LEFT which define INSIDE circle
fill(255-backc);
text("r",10, BARhite*height*.5+4);
text(r2, 18, BARhite*height*.5+4);

text("g", 10, (3*BARhite-0.5*BARhite)*height+4);
text(g2, 18, (3*BARhite-0.5*BARhite)*height+4);
     
text("b", 10, (5*BARhite-0.5*BARhite)*height+4);
text(b2, 18, (5*BARhite-0.5*BARhite)*height+4);

//text values on RIGHT which define OUTSIDE circle
fill(255-backc);
text("r",width-BARhite*width-18, (7*BARhite-0.5*BARhite)*height+4);
text(r1, width-BARhite*width-10, (7*BARhite-0.5*BARhite)*height+4);

text("g", width-BARhite*width-18, (9*BARhite-0.5*BARhite)*height+4);
text(g1, width-BARhite*width-10, (9*BARhite-0.5*BARhite)*height+4);
     
text("b", width-BARhite*width-18, (11*BARhite-0.5*BARhite)*height+4);
text(b1, width-BARhite*width-10, (11*BARhite-0.5*BARhite)*height+4);

fill(backc); 
text("k", width/2-10, (13*BARhite-0.5*BARhite)*height+4);
text(backc, width/2, (13*BARhite-0.5*BARhite)*height+4);    

 // display the spots:
 for(int i=0;i<foo.length;i++) {
   foo[i].display();
 }
 
}

class Spot {
 float x, y, radius;
 float vx,vy; // to store velocities
 color colour;

 Spot(float xpos, float ypos, float r, color c) {
   x = xpos;
   y = ypos;
   vx = random(-1,1);  // create small random horizontal velocity
   vy = 1 + random(3);  // set a vertical velocity
   radius = r;
   colour = c;
 }
 
 void display() {
   color from = color(r1,g1,b1,a);
   color to = color(r2,g2,b2,a);
   color interA = lerpColor(from, to, .25);
   color interB = lerpColor(from, to, .5);
   color interC = lerpColor(from, to, .75);
   
   noStroke();
   
   fill(from);
   ellipse(x, y, radius*5, radius*5);

   fill(interA);
   ellipse(x, y, radius*4, radius*4);
    
   fill(interB);
   ellipse(x, y, radius*3, radius*3);

    fill(interC);
   ellipse(x, y, radius*2, radius*2);
   
   fill(to);
   ellipse(x, y, radius, radius);
       x += vx*speed;
         y += vy*speed; 
   
 //  if mouseX = x and  mouseY = y{
 //    x = mouseX;
 //    y = mouseY;
 //  }
  //   else if x <> mouseX and y <> mouseY; {
  
  //   }
   
   // If they go beyond the bottom of the screen one option is to simply place them back at the top:
   if(y > height + (maxRadius * 5)) {
     // by resetting all these it will look like a different ball
     int r = (int) random(100);
     int g = (int) random(100);
     int b = 155 + (int) random(100);
     colour = color(r,g,b);
     radius = 1+random(30);
     vx = random(-1,1);  // create small random horizontal velocity
     vy = 1 + random(3);  // set a vertical velocity
     x = random(width);
     y = -(maxRadius * 5);
  }
 }
}  



