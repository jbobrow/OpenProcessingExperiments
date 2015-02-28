
//comments are awesome!
void setup() {
  size(800, 800);//canvas
 frameRate(2);//rate of movement
 
}//end of void setup

float setCircleSize(float originX, float originY, float posX, float posY){
  float distance = dist(originX, originY, posX, posY);
  if(distance <= 150.0) {
    return 100.0;
  } else if(distance > 150.0 && distance <= 300.0 ) {
     return 80.0;
  } else if(distance > 300.0 && distance <= 450.0) {
     return 60.0;
  } else if(distance > 450.0 && distance <= 600.0) {
    return 40.0;
  } else if(distance > 600.0 && distance <= 750.0) {
    return 30.0;
  } else{
    return 15.0;
 }
}

void draw() {
  //all variables 
  float i = 0;//sunspots
  float size1 = random(75);//sunspots-width
  float size2 = random(150);//purple lensspots
  float size3 = random(100);//green lensspots
  float size4 = random(150);//yellow lensspot
  float ray = 0;//sunray
  float origin = random(800);//sunrays; origin jumps around?
  //float origin2 = random(500, 600);
  float lens = 1;
  float hue1 = random(150, 250);
  float hue2 = random(150, 250);
  float t = origin + 75;
  float k = t + 50;
  float s = 0;
  float l = 600;
  float a = 0; 
  float n = 600;
  float p = random(origin +-85);
  
  
  //background color
  background( 139, 125, 107);
  
  //sunspots or yellow dots
  while (i < 800){ //how many dots on the screen
    noStroke();
    fill(255, 228, 181, random(5, 50));
    float ypos = (int)random(800);
    float size = setCircleSize(origin, origin, i, ypos);
    ellipse (i, ypos, size, size); //position and size of dots
    i++;//allowing dots to move constantly
  }//end of sunspots
   
   //sun rays
   while (ray < 100){ //number of rays shown
      stroke(255, 255, 224, 75);
      strokeWeight(random(3)); //thickness
      line (origin, origin, random(800), random(800)); //origin and end points
      ray++; //keeps moving
   }//end of sunrays
   

  fill( hue1, 0, hue2, 30);// purple lensflare
  noStroke();
  ellipse( t, t, size2, size2); 
 
  fill (0, hue1, 100, 35);// green lensflare
  noStroke();
  ellipse( k, k, size3, size3);
  
 fill( 0, 0, hue1, 35);//blue lensflare
 noStroke();
 ellipse( p, p, size4, size4);
 }//end of void draw
   
void keyPressed(){
  saveFrame( "Pic ##");
}
  
