
// Lau Rasmussen - 2010


int stars = 750;
float[] px = new float[stars];
float[] py = new float[stars];
float[] angle = new float[stars];
float[] randomY = new float[stars];
int[] randomSpawn = new int[stars];
int[] starSize = new int[stars];
int[] starInitSize = new int[stars];
float[] radius = new float[stars];

int starMarkedSize = 8;
float speed = 0.01;


void setup(){
  size(600, 450);
  smooth();
 // frameRate(60);
//calculate randomly spawned stars and their size
  for (int c=0; c<stars; c++) {
    randomSpawn[c]=(int)random(0,360);
    radius[c]=random(0, width/1.5); 
    starInitSize[c] = (int)random(1,4); 
  }
}


void draw(){

 //The stroke wight combined with the transparent rectangle (drawn before each for loop) makes the smaller stars glimmer
 strokeWeight(1);
 fill(0, 10);
 rect(0, 0, width, height);
 for (int i=0; i<stars;i++) {
    px[i] = width/2 + cos(radians(-angle[i])-randomSpawn[i])*(radius[i]);
    py[i] = height/2 + sin(radians(-angle[i])-randomSpawn[i])*(radius[i]);
    
    angle[i] -= speed; //(det er sjovt at gange med i)
    starSize[i] = starInitSize[i];
    
    // Calculate mouse hit
    float mouseTjekX = px[i] - mouseX;
    float mouseTjekY = py[i] - mouseY;
    if (sqrt(sq(mouseTjekX) + sq(mouseTjekY)) < starInitSize[i]*2) {
      
      //if mouse hits - mark the star
      println("star number: "+ i + "star size " +starInitSize[i]);
      fill(random(0,255),random(0,255),random(0,255));
      ellipse (px[i], py[i], starMarkedSize, starMarkedSize);  
      } 
      //otherwise continue as if nothing happened
      else { 
      fill(255);
      ellipse (px[i], py[i], starSize[i], starSize[i]); 
      }
   
 }

}




                
                                                                                                                                                                                
