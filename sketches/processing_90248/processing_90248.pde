
color[]stoplight ={#537F79,  #78A68F, #CBD49C, #FED457, #CB252A};
color[] palette= stoplight;

int lf = palette[1];
int mf = palette[1];
int rf = palette[1];
//int rf = palette[2];

int s=120;
void setup() {
  size(600, 200);
  smooth();
  rectMode(CENTER);
  stroke(palette[1]);
  strokeWeight(5);
}

void draw() {
  background(palette[0]);
  
  fill(lf);
  ellipse(width/4, height/2, s, s);
  
   fill(mf);
  ellipse(width/2, height/2, s, s);
  
   fill(rf);
  ellipse(width*3/4, height/2, s, s);
  
  
  //click s key
  if(keyPressed){
  if(key == 's')
    lf =palette[4];
  }else {
      lf = palette[1];
    }
    
     if(keyPressed){
  if(key == 'd')
    mf =palette[3];
  }else {
      mf = palette[1];
    }
    
     if(keyPressed){
  if(key == 'g')
    rf =palette[2];
  }else {
      rf = palette[1];
    }
    
}
