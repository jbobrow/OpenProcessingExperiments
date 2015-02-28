
int bad=0;
int i=0,j=0;
int grow=325;
int number =10;
PImage img;
PImage img2;
float[] s= new float [grow];


void draw() {
  float q =random(150, 255);
 
  
   //cordinates
  println("mouse x: ");
  println(mouseX);
  println("mouse y: ");
  println(mouseY);
  
  if(bad==0)
  {
   
    image(img, 0, 0);
  }
  if(bad==1)
  {
    image(img2, 0, 0);
    
    //right eye
    fill( q, 25, 60);
    ellipse(290,199,50,50);
    fill(random(48, 89), random(118,189), random(0,71));
    ellipse(290,199,10,50);
    
    //left eye
    fill( q, 25, 60);
    ellipse(396, 199, 50, 50);
    fill(random(48, 89), random(118,189), random(0,71));
    ellipse(396, 199, 10, 50);
    
    //fangs
    int i = 200;
    while (i<grow) {
    fill(random(0,255),0,0); //colour circle blue
    triangle(292,324,306,324,298, s[i]+329);
    triangle(332, 326, 353, 329, 344, s[i]+329);
    if (s[i] <700) {
      s[i] = s[i] + 1;
 
    i++;
  }
    }

  }
    
  if(bad==2)
  {
   stroke(random(0,255));
   //Color Stream Breath
   float m = (500.0 - mouseY) / -mouseX;
   float b = mouseY - (m * mouseX);
    
    for(int i=0; i<100; i++) {
      float x= random(0, 800);
      float y =  random(0, 800);
      strokeWeight(random(0, 8));
      fill(random(50, 255), random(50, 255), random(50, 255));
      ellipse(random(0, 800), random(0, 800), random(50, 80), random(50, 80));
      rect(x, y, random(50, 80), random(50, 80));
    }
    fill(0,0,0);
    textSize(150);
    
    text("I", 23,100);
    
    text("SAID", 128, 251);
    
    text("NO",462, 507);
   
    text("CLICKING", 61, 753);
  }
  if(bad==3){

  frameRate(300);
  
  New();
   
  do{
    fill(random(300),random(300),random(300),(500-i));
    rect(j,i,20,20);
    i+=20;
    if(i>800){
     j=j+20;
     i=0;
    }
    if(j>=800){
      i=0;
      j=0;
    }
   }while(0!=0);   /*bucle infinito*/
    stroke(random(0,255));
    strokeWeight(random(0,3));
    fill(255);  
    
      fill(random(0,255), random(0,255), random(0,255));
  pushMatrix();
 translate(random(0,800),random(00,800));
 rotate(radians(random(0,360)));
 
  beginShape();
  vertex( 400, 400 );
  vertex(399, 404);
  vertex( 395, 395 );
  vertex( 28, 26 );
  vertex( 405, 405 );
  vertex( -64, -20 );
  vertex(400, 410);
  endShape(CLOSE);
popMatrix();
 
}
  }
void setup() {
 size(800, 800); 
 img = loadImage("Puppy.jpg"); 
 img2 = loadImage("Puppy2.jpg");
}

void mouseReleased(){
  if(bad < 3) {
    bad++;
  }
    else
    bad=0;
}
  
void New(){
  if(number==10){
  background(0,0,0);
  number++;
  }
}


