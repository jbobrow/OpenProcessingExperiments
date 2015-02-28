
//Pacman Chase

//Set up image
void setup(){
size(600,600);
}


//Make map lines
void makeLines(){
  fill(0,0,255);
rect(0,200,600,50);
rect(0,350,600,50);
}
//Make pacman and pellets

float gapsize = 0;
float maxsize = 0.18 * PI;
float dotgap = 60;
float dotoffset = 0;
boolean direction = false;

void draw(){
fill(0,0,0);
rect(0,0,width,height);
makeLines();
dotoffset -= 0.5;
if(dotoffset < 0-dotgap)
  dotoffset = 0; 
  
  for(int i = 80; i < width + dotgap; i += dotgap){
      fill(255,255,150);
       ellipse(float(i) + dotoffset, 300, 10, 10);
    }
    

    fill(255,255,0);
   

    if(direction){
      gapsize -= 0.02;
    } else {
      gapsize += 0.02;
    }
     
    if(gapsize > maxsize){
      direction = true;
    }
    if(gapsize < 0){
      direction = false;
    }
    arc(49,300,75,75,gapsize,2*PI-gapsize);
   
  



}



