
PFont font;

String s = "  Go to the farm, Pigs! Birds like to play there.  ";


PImage cage;
PImage explode;
PImage bird;
PImage pig;
PImage dance;
PImage shape1;
PImage shape2;
PImage shape3;
PImage shape4;
PImage explosion;
PImage brainbow1;
PImage brainbow2;
PImage farm;


void setup()
{ 
 noLoop();
 
  cage = loadImage ("carnal2.png");
  explode = loadImage ("carnal3.png");
    bird = loadImage ("carnal4.png");
     pig = loadImage ("carnal5.png");
      dance = loadImage ("carnal6.png");
       shape1 = loadImage ("carnal7.png");
        shape2 = loadImage ("carnal8.png");
         shape3 = loadImage ("carnal9.png");
         shape4 = loadImage ("carnal10.png");
         explosion = loadImage ("carnal11.png");
         brainbow1 = loadImage ("carnal12.png");
         brainbow2= loadImage("carnal13.png");
         farm= loadImage ("carnal14.png");
    font = loadFont("ChaparralPro-Bold-30.vlw");
    textFont(font);
    
         
 smooth();        
 size(660,480);        
}

void draw()

{background(118,229,182);

  float r = random(0,9);
  
  if (r>2){
    pushMatrix();
image(farm,0,0);
fill (118,229,182);
noStroke();
rect(0,200,width,100);
popMatrix();
  }



      
     if (r<1) {
      pushMatrix();
    noStroke();
    int radius4 = 110;
    
    for(int deg3 = 0; deg3 <360; deg3+= 24) {
      float angle3 = radians(deg3);
      float x3 = 50 + (cos(angle3) * radius4);
      float y3 = 50 + (sin(angle3) * radius4);
      
      image(shape1,x3+150,y3,300,350);}
      popMatrix();
     }
      
      if (r<2){
       
      
      pushMatrix();
       translate(width/2, height/2);
     for(int i = 0; i < 18; i++){
      rotate(i*PI/12);
      image(cage,10,0,300,350);}
      popMatrix();
      }
      
      if (r>8){
       
       pushMatrix();
       translate(width/2, height/2);
     for(int i = 0; i < 18; i++){
      rotate(i*PI/12);
      image(dance,10,0,300,350);}
      popMatrix();
      }
      
      if (r>7) {
        
        pushMatrix();
       translate(width/2, height/2);
     for(int i = 0; i < 18; i++){
      rotate(i*PI/12);
      image(shape3,10,0,300,350);}
      popMatrix();
      }
if (r>5){      

         pushMatrix(); 
       translate(width/2, height/2);
     for(int i = 0; i < 18; i++){
      rotate(i*PI/12);
      image(shape4,-50,0,300,350);}
      popMatrix();
     
} 
if (r<5){
 
       pushMatrix();
        
    noStroke();
    int radius3 = 110;
    for(int deg3 = 0; deg3 <360; deg3+= 24) {
      float angle3 = radians(deg3);
      float x3 = 50 + (cos(angle3) * radius3);
      float y3 = 50 + (sin(angle3) * radius3);
      image(shape2,x3+190,y3+20,300,350);}
      popMatrix();
}
else{
  
       pushMatrix();
    
       int radius2 = 190;
    for(int deg2 = 0; deg2 <360; deg2+= 36) {
      float angle2 = radians(deg2);
      float x2 = 50 + (cos(angle2) * radius2);
      float y2 = 50 + (sin(angle2) * radius2);
      image(bird,x2+60,y2+90,300,350);}
      popMatrix();  
}
 if (r> 6){   
  
    pushMatrix();
    noStroke();
    int radius = 150;
    for(int deg = 0; deg <360; deg+= 36) {
      float angle = radians(deg);
      float x = 50 + (cos(angle) * radius);
      float y = 50 + (sin(angle) * radius);
      image(pig,x+140,y+140,300,350);}
      popMatrix();}
      
if (r <2){
int len=s.length(); 
int rad=100; 

for(int i=0;i<len;i++)
{  
  fill(255);
float x=sin(-TWO_PI/len*i+PI)*rad; 
float y=cos(-TWO_PI/len*i+PI)*rad;     
pushMatrix();  
translate(2*x+width/2,2*y+height/2); 
rotate(TWO_PI/len*i);  
char c=s.charAt(i);  
text(c,0,0); 
popMatrix();} 
}
 }

  

void mousePressed() {
  redraw();
}
       
    
  
  
  
//  background(118,229,182);
//  image(brainbow1,0,40);
//  image(brainbow2,0,-20);
//  image(cage,0,0);
//    image(explode,0, 0);
//      image(bird,0,0);
//        image(pig,10),10);
//         image(dance,10),10);
//          image(dance,1,1);
//         image(shape1,10,10);
//           image(shape1,20),20);
//         image(shape2,0,0);
//         image(shape3,0,0);
//         image(shape4,0,0);
//         image(explosion,0,0);
//       
//}


