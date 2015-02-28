

int rayon = 5 ;      
int incrementation=0;
float noiseScale = 0;
float noiseScaleY= 0;
float x, y;

void setup(){
  size(600,200);    
  background(125);  
  noStroke();       
  smooth();         
  frameRate(20);    
  rectMode(CENTER);
  //noCursor();
}

void draw(){

  //background(125);
  fill(125,1);
  noStroke();
  rect(0,0,width*2, height*2);
  float transparence = 0; 
  //----------------------                                       
  if(incrementation<width){
    noiseScale+=.02;                            
    noiseScaleY+=.025;
    //---------------------------------
    float noiseVal = noise(noiseScale) ;     
    float noiseValY= noise(noiseScaleY);
    //----------------------------------
    transparence = noiseVal*75;             
    //---------------------------------- conversion    
    rayon = int(random(5,24));               
    //rayon = int(noiseVal*30);
    //x = random(width);               
    //y = random(height);              
    x = noiseVal * width;
    y = noiseValY * height;
    //----------------------------------
    fill(255, transparence);   
    ellipse(x, y ,rayon, rayon);       
    //---------------------------------
    incrementation++;                  
  }
  //-------------------------------------
  incrementation=0;
  //-------------------------------------
  println("incrementation = " + incrementation + " transparence = " + transparence);
  //stroke(0,15);
  //line(mouseX, mouseY, x, y);
  
}





