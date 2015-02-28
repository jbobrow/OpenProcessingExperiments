
int num = 400;



float[] redbullets = new float[num];
float[] bluebullets = new float[num];
float[] bulletspeed = new float[num];


void setup() {
  size(400, 400);
 // background(0,255,0);
 
 
for (int x=0; x<num; x++) {
   redbullets[x] = random(40,width-40);
bluebullets[x] = random(40,width-40);
bulletspeed[x] = (3);



 }
}


  
  
  void draw(){
    background(0,255,0);
    
    
        // draw the armies
    
  for(int a =  20; a<height; a+=50){
    redguys(30,a);
    blueguys(width-30,a);}
    
    //red guy bullets
  
   for ( int y = 0; y< num ; y++){
      strokeWeight(1);
      stroke(255,0,0);
     line( redbullets[y],y,redbullets[y]+10,y);
     
     redbullets[y] = redbullets[y] + bulletspeed[y];
         if ( redbullets[y] > width + 10) {
       redbullets[y] = 50;
      
  }
  
}

//blue guy bullets

 for ( int y = 0; y< num ; y++){
      strokeWeight(1);
      stroke(0,0,255);
     line( bluebullets[y],y,bluebullets[y]+10,y);
     
     bluebullets[y] = bluebullets[y] - bulletspeed[y];
         if ( bluebullets[y] < 0) {
       bluebullets[y] = width -50;
      
  }
  
}

  }
    
    
    
    // red guys
    
    void redguys(float x, float y) {
  pushMatrix(); // use transformations to make it easier to draw
  translate(x, y);
  fill(255,0,0);
    strokeWeight(2);
      stroke(0);

  triangle(-8, 0,8,0,0,32 );
  ellipse(0,-4,8,8);
  line(8,3,16,3);
  line(2,6,24,6);
    line(12,10,12,6);
line(6,10,6,6);
  //strokeWeight(1);

  popMatrix(); // reset the matrix
}

 // blue guys
    
    void blueguys(float x, float y) {
  pushMatrix(); 
  translate(x, y);
  fill(0,0,255);
  triangle(-8, 0,8,0,0,32 );
  ellipse(0,-4,8,8);
  line(-8,3,-16,3);
  strokeWeight(2);
  line(-2,6,-24,6);
    line(-12,10,-12,6);
line(-6,10,-6,6);
  popMatrix();
}
