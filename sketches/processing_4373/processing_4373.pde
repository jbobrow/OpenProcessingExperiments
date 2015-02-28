
//Cellular Lights by dieydarling, licensed under Creative Commons Attribution-Share Alike 3.0 license.
//Work: http://openprocessing.org/visuals/?visualID=2340
//License: http://creativecommons.org/licenses/by-sa/3.0/

int number = 30;
int a = 0, b = 255, c = 0; 

 
void setup() { 
   
  size(400, 600); 
  background(0); 
  fill(255, 0, 0); 
  frameRate(10);
 
} 
 
void draw() { 
   

  for(int i = 0;i<number;i++) {     
   for (int j = 0;j<number;j++) { 
     fill(random(230,255), random(130,245),random(0,0)); 
     noStroke(); 
     ellipse(i*(width/number+2), j*(width/number+9), (width/number)+2, (width/number)+2); 
   } 
 } 
}

//Cellular Lights by dieydarling, licensed under Creative Commons Attribution-Share Alike 3.0 license.
//Work: http://openprocessing.org/visuals/?visualID=2340
//License: http://creativecommons.org/licenses/by-sa/3.0/
    


