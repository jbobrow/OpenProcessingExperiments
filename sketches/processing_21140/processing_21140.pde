
/*Sarah Scialli
  HW 4- "Iterate"
*/

color strawberry = color(245, 106, 171);
color chocolate = color(77,54,35);
color vanilla = color(255,254, 229);
color cone = color(216,192, 146);

//small, med large sizes
//strawberry chocolate, vanilla
//sprinkes or no sprinkles

void setup(){
  size(640,480);
  smooth();  
  stroke(3);
  ellipseMode(CENTER);
  noLoop();
}
void draw(){
  background(251,229,252);
  for(int i =200;i<500; i+= 100){
    for(int j = 60; j<height; j+=160){
      int flavor = chooseFlavor(int(random(0,3)));
      String size = chooseSize(int(random(0,3)));
      int sprinkles = int(random(0,2));
      iceCream(size,i,j, flavor, sprinkles);  
    }
  }
  
}

String chooseSize(int x){ 
   switch(x){
     case 0:
       return "small";
     case 1:
       return "med";
     case 2:
       return "large";
   }
   return "error";
}

color chooseFlavor(int x){
   switch(x){
     case 0:
       return strawberry;
     case 1:
       return chocolate;
     case 2:
       return vanilla;
   }
   return color(0,0,0);
}

void iceCream(String i, float x, float y, color flavor, int sprinkles){
  float w = 0;
  float h = 0;
  float scoopW = 0;
  float scoopH = 0;
  if( i == "small"){
    w = 40;
    h = 80;
    scoopW = 45;
    scoopH = 40;
  }
  else if(i == "med"){
    w = 60;
    h = 90;
    scoopW = 65;
    scoopH = 55;
  }
  else{
    w = 80;
    h = 100;
    scoopW = 90;
    scoopH = 70;    
  }
  scoop(x,y,scoopW, scoopH, flavor, sprinkles, i);
  makeCone(x,y,w, h); 
}


//draw the cone
//x and y are center of top of cone
//w and h are width and height
void makeCone(float x,float y, float w, float h){
  fill(cone);
  float topLeftX = x -(0.5 * w);
  float topRightX = x +(0.5 * w);
  beginShape();
  vertex(topLeftX,y);
  vertex(topRightX,y);
  vertex(x,y+h);
  endShape(CLOSE);
  for (float i = topLeftX + 5; i< topRightX; i+=5){
   line(i,y,0.5 * (x + i) + (0.25 * w), h * x/w + y + 0.5 * h - h * i/w);

  }
  for (float i = topRightX -5; i>topLeftX; i-=5){
    line(i,y,0.5 * (x + i) - (0.25 * w), -h * x/w + y + 0.5 * h + h * i/w);
  } 
}

//draw the scoop
void scoop(float x,float y, float w, float h, color c, int sprinkles, String itsSize){
  fill(c);
  ellipse(x, y- 0.25 *h, w, h);
  if(sprinkles==1){
    sprinkles(x,y-0.25*h, w, h, itsSize);  
  }
}

//draw the sprinkles
void sprinkles(float x, float y, float w, float h, String itsSize){
  float top = y -0.5 * h;
  float bottom = y + 0.2 * h;
  float left = x - 0.5 * w;
  float right = x+0.5 * w;
  int amount = 0;
  if(itsSize == "small")
    amount = 50;
  else if(itsSize == "med")
    amount = 60;
  else{
    amount = 80;
  }
  for(int i = 0; i< amount; i++){
    stroke(random(255), random(255), random(255));
      boolean drawn = false;
      while(!drawn){
        float x1 = random(left, right);
        float y1 = random(top, bottom);
        float x2 = random(left, right);
        float y2 = random(top, bottom);
        if((dist (x1,y1, x,y) < 0.55 * h) && (dist(x2,y2, x,y) < 0.55 *h)){
          if(dist(x1, y1, x2, y2) < 8){
            line(x1, y1, x2,y2);   
            drawn = true;
          }
        }
      }
  }
  stroke(0);
  
}

