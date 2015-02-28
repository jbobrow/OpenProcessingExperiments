
color here;
color gone;


void setup(){
  size(800,600);
  smooth();
  background(0);
  mouseX=width/2; mouseY=height/2;
}

void draw(){
  
  //green/magenta
  float r=random (20);
  noStroke(); 
  here = color(100,random(255),50);
  gone = color(0); //black
  if(mousePressed){
    fill(gone);
  }else{
    fill(here);
  }
  ellipse(mouseX*1.5,mouseY,r,r);
  
  //blue
    float t=random (20);
  noStroke();
  here = color(0,50,random(255));
  gone = color(0);
    if(mousePressed){
    fill(gone);
  }else{
    fill(here);
  }
  ellipse(mouseX,mouseY*1.5,t,t);

  //red
    float s=random (20);
  noStroke();
  here = color(random(255),20,0);
  gone = color(0);
    if(mousePressed){
    fill(gone);
  }else{
    fill(here);
  }
  ellipse(mouseX*1.5,mouseY*1.5,s,s);
  
    //yellow
    float g=random (20);
  noStroke();
  here = color(random(255),random(190),0);
  gone = color(0);
    if(mousePressed){
    fill(gone);
  }else{
    fill(here);
  }
  ellipse(mouseX,mouseY,g,g);


}

