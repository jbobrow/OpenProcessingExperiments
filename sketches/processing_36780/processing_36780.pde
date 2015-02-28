
//HW 4 (hw revised)
//Copyright Samantha Zucker, September 2011, Pittsburgh, PA 15289

float x,y,wd,ht,wdc,htc; 

  color white  = color(255,255,255);
  color peach  = color(237,169,105);
  color yellow = color(250,241,172);
  color gree= color(224,245,210);
  color purple = color(161,131,173);
  
void setup ()
{
  
size(400,400);

//variables

  x=50;
  y=50;
  wd=300;
  ht=300;
  wdc=300;//(circles wd)
  htc=300;//(circles ht)
   

  
}

void draw()

{
 
 
  
  //background circles
    
  smooth();
  noStroke();
  ellipseMode(CENTER);
   
 
  fill(white);
  ellipse(width/2,height/2, wdc+300, htc+300);
 
  fill(gree);
  ellipse(width/2,height/2, wdc+100, htc+100);
   
  fill(yellow);
  ellipse(width/2,height/2, wdc+50, htc+50);
  
   
  //reference circle
  
 fill(peach);
 noStroke();
 ellipseMode(CENTER);
 ellipse(width/2,height/2,wdc,htc);
  
  
 
  
  
 //S
 fill(255,255,255);
 stroke(255,255,255);
 strokeWeight(2);
  
  
 beginShape();
  
 //reference point
 curveVertex(x+.375*wd, y+.5*ht);
  
 //shape,outside
 curveVertex(x+.35*wd, y+.35*ht);
 curveVertex(x+.3*wd, y+.25*ht);
 curveVertex(x+.25*wd, y+.225*ht);
 curveVertex(x+.2*wd, y+.225*ht);
 curveVertex(x+.15*wd, y+.25*ht);
 curveVertex(x+.1*wd, y+.35*ht);
 curveVertex(x+.113*wd, y+.4*ht);
 curveVertex(x+.15*wd, y+.45*ht);
 curveVertex(x+.2*wd, y+.5*ht);
  
 curveVertex(x+.3*wd, y+.575*ht);
 curveVertex(x+.35*wd, y+.65*ht);
 curveVertex(x+.325*wd, y+.75*ht);
 curveVertex(x+.25*wd, y+.8*ht);
 curveVertex(x+.1*wd, y+.75*ht);
 curveVertex(x+.05*wd, y+.65*ht);
 curveVertex(x+.075*wd, y+.65*ht);
 curveVertex(x+.1*wd, y+.75*ht);
 curveVertex(x+.25*wd, y+.8*ht);
 curveVertex(x+.325*wd, y+.75*ht);
 curveVertex(x+.35*wd, y+.65*ht);
 curveVertex(x+.3*wd, y+.55*ht);
 curveVertex(x+.2*wd, y+.45*ht);
 curveVertex(x+.125*wd, y+.35*ht);
 curveVertex(x+.15*wd, y+.25*ht);
 curveVertex(x+.2*wd, y+.225*ht);
 curveVertex(x+.25*wd, y+.225*ht);
 curveVertex(x+.3*wd, y+.275*ht);
 curveVertex(x+.325*wd, y+.35*ht);
 curveVertex(x+.35*wd, y+.35*ht);
 curveVertex(x+.35*wd, y+.35*ht);
  
 endShape();
  
  
 //r
 beginShape();
  
 //reference point
 curveVertex(x+.35*wd, y+.2*ht);
  
 //shape
 curveVertex(x+.4*wd, y+.25*ht);
 curveVertex(x+.45*wd, y+.45*ht);
 curveVertex(x+.45*wd, y+.55*ht);
 curveVertex(x+.45*wd, y+.8*ht);
 curveVertex(x+.475*wd, y+.8*ht);
 curveVertex(x+.45*wd, y+.55*ht);
 curveVertex(x+.45*wd, y+.45*ht);
 curveVertex(x+.5*wd, y+.3*ht);
 curveVertex(x+.55*wd, y+.25*ht);
 curveVertex(x+.6*wd, y+.3*ht);
 curveVertex(x+.65*wd, y+.3*ht);
 curveVertex(x+.625*wd, y+.25*ht);
 curveVertex(x+.575*wd, y+.225*ht);
 curveVertex(x+.5*wd, y+.3*ht);
 curveVertex(x+.45*wd, y+.45*ht);
 curveVertex(x+.45*wd, y+.35*ht);
 curveVertex(x+.45*wd, y+.25*ht);
 curveVertex(x+.4*wd, y+.25*ht);
 //reference point
 curveVertex(x+.4*wd, y+.25*ht);
  
 endShape();
 
//z
beginShape();
//reference point
curveVertex(x+.525*wd, y+.35*ht);
//shape
curveVertex(x+wd*.675, y+ht*.275);
curveVertex(x+wd*.875, y+ht*.275);
curveVertex(x+wd*.75, y+ht*.45);
curveVertex(x+wd*.65, y+ht*.6);
curveVertex(x+wd*.6, y+ht*.75);
curveVertex(x+wd*.6, y+ht*.8);
curveVertex(x+wd*.625, y+ht*.775);
curveVertex(x+wd*.7, y+ht*.75);
curveVertex(x+wd*.8, y+ht*.75);
curveVertex(x+wd*.8, y+ht*.775);
curveVertex(x+wd*.625, y+ht*.775);
curveVertex(x+wd*.6, y+ht*.8);
curveVertex(x+wd*.6, y+ht*.75);
curveVertex(x+wd*.65, y+ht*.55);
curveVertex(x+wd*.725, y+ht*.45);
curveVertex(x+wd*.875, y+ht*.275);
curveVertex(x+wd*.75, y+ht*.275);
curveVertex(x+wd*.675, y+ht*.3);
curveVertex(x+wd*.675, y+ht*.275);
 
curveVertex(x+wd*.675, y+ht*.275);
 
endShape();

}

void mousePressed()
{
 if(dist(mouseX,mouseY,width/2,height/2)<wd/2)
 //if in the orange circle
 {
   peach = color(random(200,250),random(150,200),random(100,150));
 //change orange color
 }
 else if(dist(mouseX,mouseY,width/2,height/2)<(wd+50)/2)
 //if in the yellow circle
 {
 yellow = color(random(220,256),random(210,250),random(100,150)); 
 //change yellow color
 }
 else if(dist(mouseX,mouseY,width/2,height/2)<(wd+100)/2)
 //if in the green circle
 {
 gree= color(random(100,150),random(200,256),random(150,220));  
 //chane green color
 }
 else
 //if outside the circles
 {
 white= color(random(100,256),random(100,256),random(100,256));   
 //change background color
 }
}

void keyPressed()
{
  if (key ==CODED){
    
    if(keyCode==LEFT){
    //circles smaller  
      wdc = wdc - .1*wdc;
      htc = htc - .1*htc;
    }
   if (keyCode==RIGHT)
   {
      //circles larger
      wdc = wdc + .1*wdc;
      htc = htc + .1*htc;
    } 
   if(keyCode==SHIFT) 
   {
     //circles reset
     
     wdc=300;
     htc=300;
   }
  }
  
  
  
}
