
PImage img;
PImage img2;
PImage img3;
PImage img4;

int anzahl = 10;

float [] x = new float [anzahl];
float [] y = new float [anzahl];
float [] speedX = new float [anzahl];
float [] speedY = new float [anzahl];

void setup(){
   img = loadImage("ponies2.jpg");
   img2 = loadImage ("Batman2.png");
   img3 = loadImage ("Thor.png");
   img4 = loadImage ("hulk.png");
   
size(500,375);
smooth();
frameRate (1); 

for (int i = 0; i<anzahl;i++) {
    x [i] = random (0,width);
    y [i] = random (0,height);
    speedX [i] = random (5,15);
    speedY [i] = random (5,15);
}
}

void draw(){
  
   image(img, 0, 0);
   
  for (int i = 0; i<anzahl;i++) {
   image (img3,x[i],y[i],100,100);
 image (img4, x[i]-100,y[i]-50,100,100);
 
  x[i]= x[i]+speedX[i];
  y[i]= y[i]+speedY[i];
  
  if (x[i]>width)speedX[i]=speedX[i]*-1;
  
  if (y[i]>height) speedY[i] =speedY[i] *-1;
  if (x[i]<0)speedX[i]= speedX[i]*-1;
  if (y[i]<0)speedY[i]= speedY [i]* -1;
  }
     
 //armbandlöcher
  
 strokeWeight (2.5);
  stroke (37,64,143);
 fill (0);
  rect (0,135,120,100); //Armband links
  rect (380,135,120,100); //Armband rechts
  noFill ();
   fill (255);
  ellipse (15,185,10,10);
  ellipse (50,185,10,10);
    ellipse (85,185,10,10);
  //Mittelteil
  fill (0);
  ellipse (250,187,300,300); 
    
  fill (100);
  fill (255);
  ellipse (250,187,190,190); 

for(int i = 0; i<60;i++){

pushMatrix(); 
translate(width/2,height/2);
rotate(radians(360/60*i));
fill(247,200,14);

if(i%5==0){
 
  fill (0);

ellipse(0,100,40,40); // stundendinger
}

else{
 
ellipse(50,100,10,10);
}

popMatrix();

}

pushMatrix();
noStroke();
translate(width/2,height/2);
rotate(radians(360/60*second()));

fill(random (255),random (255),random (255));
ellipse(0,0,100,100);
fill (247,200,14);

image (img2,-25,-100,80,100);

noFill ();
fill (247,200,14);
popMatrix();

pushMatrix();
noStroke();
translate(width/2,height/2);
rotate(radians(360/60*minute())-HALF_PI);

fill(0);
rect(0,-2,130,6);
fill(247,200,14);

popMatrix();

pushMatrix();
noStroke();
translate(width/2,height/2);
rotate(radians(360/60*hour())+PI);
fill(0);
rect(0,-2,70,4);
fill(0);
ellipse (0,0,20,20);

popMatrix();
}



