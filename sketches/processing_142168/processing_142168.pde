
int colorHeart;

void setup() {
  background(255);
  size(600, 600);
 colorMode(HSB,100);
  noFill();
  colorHeart=(2442);
}
 
float r=0;
float disfusion=1;
 
void draw() {
 
  float w=600;
  float h=600;
 
  strokeWeight(random(0.1, 0.2));
  
  stroke(48, 100, 100, 30);
  
    //first heart

beginShape();
    fill(colorHeart);

    smooth();
    bezier(160,188,240,140,250,220,160,292);
    bezier(160,188,80,140,90,220,160,292);
  endShape();

 
  bezier(
  w/2, (h/4)+random(10),
  w/3+random(disfusion), h/8+random(disfusion),
  15+random(disfusion), 80+random(disfusion),
  w/2, (h/3)*1.8);
   

  bezier(
  w/2, (h/4)+random(10),
  ((w/3)*2)-random(disfusion), (h/8)+random(disfusion),
  (w-15)-random(disfusion), 80+random(disfusion),
  w/2, (h/3)*1.8);
   
  if (disfusion<width) {
 
    disfusion+=1;
  }else{
    noLoop();
  }
}

