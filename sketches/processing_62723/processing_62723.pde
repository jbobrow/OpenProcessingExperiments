
//a fly that flies around in a random fashion and stops now and then ..
//when he moves, there is certain probability that he moves certain direction...that direction 
//every frame there is certain probably he moves...and certain probability that he stops.
//could be expressed as with a vector and an angel..

class Fly {
   //what variables about the fly ..what elements of the fly needs to change
   PVector loc; 
   PImage img;
   float theta;
   
   Fly () {
     loc = new PVector (width/2, height/2); //DO NOT re-declare loc by adding 'new' at front
     img = loadImage("flyimg.jpg"); 
     theta = 0;
  }
   void update() {
     
     theta = random(PI*2);
     println(theta);
   }
   
   void render() {
     
     //rotate image so the head of flyimage is pointing towards theta
     pushMatrix();
     translate(fly.loc.x, fly.loc.y);
     translate(img.width/2, img.height/2);
     rotate(theta-PI*1.3); //first estimate then trial and error
     image(img, 0,0); 
     popMatrix();
   }
   
   void walk() { 
   
     float r = random(15);
     PVector newLoc = new PVector ( 10,10);
     float xInc = r*cos(theta); //polar to cartesian conversion
     float yInc = r*sin(theta);
     newLoc.x = loc.x + xInc;
     newLoc.y = loc.y + yInc;
     loc = newLoc;
     loc.x = constrain (loc.x, width/3+30, width*2/3-40);
     loc.y = constrain (loc.y, height/3+30, height*2/3-43);
   }
   
}


