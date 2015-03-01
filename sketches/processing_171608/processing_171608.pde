
int frames = 9;
int panel = 0;
PImage skeleton = new PImage[frames];
float xpos, ypos;

void setup (){
  
  size(600, 600);
  for(int i=0; i<9;i++){
  skeleton[i]=loadImage("Skeleton"+i+".png");
}
  
}

void draw(){
  
  fill(0);
  rect(0,0,600,600);
  
  
  if(keyPressed){
    if(key == 'r'){
      xpos++;
      panel = (panel+1) % frames;
      image(skeleton[panel%frames], 0, 0);
      println(panel);
      
    }
  } else {
    image(skeleton[panel%frames], 0, 0);
  }
  
 
}
  
  


