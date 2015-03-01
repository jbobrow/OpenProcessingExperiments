
//thanks to *allzero*

 float r = 250;

void setup(){

 size(800,800, P3D);
 smooth(8);
 
}

void draw(){
 background(0);
 translate(width/2, height/2, 0);
 rotateX(radians(mouseY));
 rotateY(radians(mouseX));
 rotateZ(radians(mouseX));


 for (int x = 10; x < mouseX/4; x+=20) {
   for (int y = 10; y < mouseY/4; y+=20) {
    stroke(x, 0, y);   
   }
 } ;
 
 for(float deg1=0; deg1<360; deg1 +=40){
  
  for (int x = 10; x < mouseX/4; x+=20) {
   for (int y = 10; y < mouseY/4; y+=20) {
    stroke(x, 0, y);   
   }
 } ;  strokeWeight(random(0,50));
    smooth();

   float theta = radians(deg1);
   for(float deg2 = 0; deg2 < 360; deg2 += 90){ 
   
      float bla = radians(deg2);
      float x = r * sin(bla) * cos(theta);
      float y = r * sin(bla) * sin(theta);
      float z = r * cos(bla);
      point(x,y,z);
         }
    }

    for(float deg1=0; deg1<360; deg1 +=1){
    strokeWeight(2);

   float theta = radians(deg1);
   for(float deg2 = 0; deg2 < 360; deg2 += 30){ 
   
      float bla = radians(deg2);
      float x = r/1.2 * sin(bla) * cos(theta);
      float y = r/1.2 * sin(bla) * sin(theta);
      float z = r/1.2 * cos(bla);
      point(z,y,x);
   }
    }

  for(float deg1=0; deg1<360; deg1 +=80){
    strokeWeight(2);
     for (int x = 10; x < mouseX/4; x+=20) {
   for (int y = 10; y < mouseY/4; y+=20) {
    stroke(y+x/2, 0, x+y/2);   
   }
 } ;
 

   float theta = radians(deg1);
   for(float deg2 = 0; deg2 < 360; deg2 += 3){ 
   
      float bla = radians(deg2);
      float x = r/2 * sin(bla) * cos(theta);
      float y = r/2 * sin(bla) * sin(theta);
      float z = r/3 * cos(bla);
      point(x,z,y);
   }
    }
}
