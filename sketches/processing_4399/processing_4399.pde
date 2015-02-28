
//Nikolina Borak//Architectural Computing ARCH1391 Module Two 2009 
 
//this is a modification of the orignial [Rain-city] by David Hawkins,  
//licensed under Creative Commons Attribution-Share Alike 3.0 license.  
//Work: http://openprocessing.org/visuals/?visualID=1340.  
//License: http://creativecommons.org/licenses/by-sa/3.0/ ]  
 
 
final static int screenW = 600;  //screen size changed
final static int screenH = 400;  
final int blockSize = 20;  //square sizes changed
int maxW = int(screenW/blockSize);  
int maxH = int(screenH/blockSize);  

int towers[] = new int[maxW];  
 //code deleted
int offset1 = 0;  
int offset2 = 0;  
 //colour changed
color color1 = color(40,80,6);  
color color2 = color(122,255,9);  
 
 //code numbers changed
int baseR1 = 30;  
int baseG1 = 0;  
int baseB1 = 0;  
int spreadR1 = 0;  
int spreadG1 = 0;  
int spreadB1 = 0;  
int adjust1 = 2;  
  
 
  
 
  
void setup()   
{  
  //setting up the inital screen 
  size(screenW, screenH);  
  background(255,255,255); 
  noStroke();  
  //the speed of the addition of the tower levels 
 frameRate(1);  
 
 //code has been deleted
}  
  
  
void draw()  
{  
  translate(width, height);  
  rotate(0.003);  
  translate(-width, -height);  
  translate(-1,1);  
  //placement and organising the towers to assure that towers only slighlty  
  //cover the forest 
  int adder = int(random(maxW - 15));  
  int adder2 = int(random(maxH - 10));  
  
//adds more towers 
  towers[adder] += random(1, 4);  
  towers[adder+1] += random(1, 4);  
  towers[adder+2] += random(1, 4);  
  //extra addition of tower to sketch
  towers[adder+3] += random (1,4); 
    
 //code has been deleted
 
  //resetting the towers 
    
  if (towers[adder] > maxH || mousePressed)  
  {  
     reset();  
       
  }  
 
    //some code has been deleted
    
  //towers  
  for(int index = 0; index < maxW; index++)  
  {  
    for(int countUp = 0; countUp < towers[index]; countUp++)  
    {  
      fill(color1);  
      rect(offset1 + blockSize * index, height - blockSize * countUp, blockSize - 3, blockSize - 3);  
    }  
  }  
}  
 
 // creating the city on top of the forest, forest disappearing behind the  
void reset()  
{  
  for(int ii = 0; ii < towers.length; ii++) towers[ii] = (int)random(maxH / 4);  
     
  //adjusting the tower's colour  
   int adjust = (int)random(adjust1/2, adjust1);  
 if(random(1.0) < 0.5) adjust *= -1;  
     
   color1 = color(random(baseR1 - spreadR1, baseR1 + spreadR1) + adjust, random(baseG1 - spreadG1, baseG1 + spreadG1)+ adjust, random(baseB1 - spreadB1, baseB1 + spreadB1)+ adjust);  
   adjust = -adjust;  
    
   offset1 = (int)random(5);  
   offset2 = (int)random(5);  
   
  // the congested clouds over the towers  
   
   fill(30,89, 97);  
   ellipse(random(width/2), random(height/2), random(600,500), random(20));  
   ellipse(random(width/2), random(height/2), random(600,500), random(20));  
   ellipse(random(width/2), random(height/2), random(600,500), random(20)); 
} 



