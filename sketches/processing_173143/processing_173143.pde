
float counter =0;

void setup() {
  size(500,500);
  background(0);
  smooth();
}

void draw() {
  colorMode(HSB,360,100,100);
  //float counter_mouse=map(mouseX,0,PI,0.01,0.2);
  //float amlitude=map(sin(counter),-1,1,0,360);
  if(mouseX<=250){
    fill(319,42,93,50);
    
  }
  else{
     fill(354,92,97,50);
       if(mousePressed){
  fill(random(360),40,300,150);
    //int i=0;
  
    ellipse(random(width),random(height),40,40);
 //i=i+40;
  }
  else{
    fill(255,54,42);
    rect(0,0,500,500);
  }
  
 
  }
    
  ellipse(250,250,150,150);

}
