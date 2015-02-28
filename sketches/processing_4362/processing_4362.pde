
//Nikolina Borak//Architectural Computing ARCH1391 Module Two 2009

//this is a modification of the orignial [Rain-city] by David Hawkins, 
//licensed under Creative Commons Attribution-Share Alike 3.0 license. 
//Work: http://openprocessing.org/visuals/?visualID=1340. 
//License: http://creativecommons.org/licenses/by-sa/3.0/ ] 



final static int screenW = 800;  
final static int screenH = 400;  
final int blockSize = 25;  
int maxW = int(screenW/blockSize);  
int maxH = int(screenH/blockSize);  
int towers[] = new int[maxW];  
// offset changed from 3 to 0 to allow the sketch to be controlled
int offset1 = 0;  
int offset2 = 0;  
 
// initial colours changed to resemble more of a city and forest
int color1 = color(119,94,30);  
int color2 = color(119,92,95);  
// this part is changed the numbers
int baseR1 = 30;  
int baseG1 = 0;  
int baseB1 = 0;  
int spreadR1 = 0;  
int spreadG1 = 0;  
int spreadB1 = 0;  
int adjust1 = 60;  
  
 
  
 
  
void setup()   
{  
  size(screenW, screenH);  
// background colour changed
  background(20,139,18);  
  noStroke(); 
//framerate changed 
 frameRate(10);  
 // there is no more pImage
  
  //smooth();  
  reset();  
  for(int ii = 0; ii < towers.length; ii++) towers[ii] = (int)random(maxH);  
  for(int ii = 0; ii < towers.length; ii++) towers[ii] = (int)random(maxW);  
  
}  
  
  
void draw()  
{  
  translate(width, height);  
  rotate(0.003);  
  translate(-width, -height);  
  translate(-1,1);  
  //placement and organising the towers to assure that towers only slighlty  
  //cover the forest 
//adjusted the widht and height
  int adder = int(random(maxW - 15));  
  int adder2 = int(random(maxH - 10));  
  
//adds the different towers 
  towers[adder] += random(1, 4);  
  towers[adder+1] += random(1, 4);  
  towers[adder+2] += random(1, 4);  
//added extra code to allow 4 differnt towers to be developed instead of one
  towers[adder+3] += random (1,4); 
    
    
 //whole section deleted
    
    
  if (towers[adder] > maxH || mousePressed)  
  {  
     reset();  
       
  }  
 
    
 //deleted data
   
    
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
  //same code as original
void reset()  
{  
  for(int ii = 0; ii < towers.length; ii++) towers[ii] = (int)random(maxH / 4);  
     
     
   //colour-choosing algorithm - pick two colours not too far from the base colours, and make sure they're apart tonally.   
   int adjust = (int)random(adjust1/2, adjust1);  
   if(random(1.0) < 0.5) adjust *= -1;  
     
   color1 = color(random(baseR1 - spreadR1, baseR1 + spreadR1) + adjust, random(baseG1 - spreadG1, baseG1 + spreadG1)+ adjust, random(baseB1 - spreadB1, baseB1 + spreadB1)+ adjust);  
   adjust = -adjust;  
    
    //deleted code 
    
   offset1 = (int)random(5);  
   offset2 = (int)random(5);  
   //orange colour 
   //changed colour and size of smoke clouds
   fill(30,89, 97);  
   ellipse(random(width/2), random(height/2), random(300,500), random(20));  
   ellipse(random(width/2), random(height/2), random(300,500), random(20));  
   ellipse(random(width/2), random(height/2), random(300,500), random(20));  
 
 
 
   float rnd = random(1.0);  
   //println(rnd);  
   if(rnd < 0.1)  
   
 //deleted data
  
 
{  
  int startX = (int)random(width);  
  int stopX = startX - (int)random(width/2);  
  stroke(random(255));  
   line(startX, 0, stopX, height);  
   noStroke();  
}} 


