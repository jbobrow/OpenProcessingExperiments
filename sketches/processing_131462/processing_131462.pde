
ArrayList<Integer> planetx;
ArrayList<Integer> planety;
ArrayList<Float> rotationamt;
ArrayList<Float> planetspeed;
ArrayList<Float> planetsize;
int r;
int g;
int b;
boolean moveplanet;
boolean speedup;
void setup(){
  size(displayWidth,displayHeight);
  background(0);
  planetx = new ArrayList<Integer>();
  planety = new ArrayList<Integer>();
  rotationamt = new ArrayList<Float>();
  planetspeed = new ArrayList<Float>();
  planetsize = new ArrayList<Float>();
  moveplanet = true;
  speedup = true;
}


void draw(){
   background(0);
   noStroke();
   fill(255,205,0);
   ellipse(width/2,height/2,100,100);
   drawplanet();
  //for (int i = 1; i < xpos.size() ; i++){
    //if (xpos.size() = 1){
    //r =
    //g =
    //b =

    }
void drawplanet(){
  float planetdist = dist(mouseX,mouseY,(width/2),(height/2)); 
  for (int i=0; i<planetx.size(); i++){
   pushMatrix();
   translate(width/2,height/2);
   rotate(radians(rotationamt.get(i)));
   fill(255,125,65);
   ellipse(planetx.get(i), planety.get(i), planetsize.get(i), planetsize.get(i));
   popMatrix();
   if (moveplanet==true){
   rotationamt.set(i,rotationamt.get(i)+planetspeed.get(i));
   }
   //if (speedup==true){
   //planetspeed.add(50+0/planetdist);
   //}
   }
  
}


void mousePressed(){
  float planetdist = dist(mouseX,mouseY,(width/2),(height/2));
  if (planetdist>50){
  planetx.add(mouseX-(width/2));
  planety.add(mouseY-(height/2));
  rotationamt.add(1.0);
  planetspeed.add(50/planetdist);
  planetsize.add(planetdist/4);
  }
}
void keyPressed(){
  float planetdist = dist(mouseX,mouseY,(width/2),(height/2));
  if ((keyPressed == true) && (key == 's')){
    moveplanet=false;
  }
  if ((keyPressed == true) && (key == 'w')){
    moveplanet=true;
  
  }
  //if ((keyPressed == true) && (key == 'q')){
    //speedup=true;
  //}



}





