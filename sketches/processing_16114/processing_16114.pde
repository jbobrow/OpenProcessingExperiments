
float a=0;
float b = 0;
float speed1=1;
float speed = 1;
boolean carmoves = true ;
float c=width;
float d=height;
float speed2=-1;
float speed3=-1;

void setup()
{
  
  size (500,500);
  smooth();
      
}
void draw() {
  background (0);
  stroke(255);
  
  
  for (int i = 0 ; i < width ; i = i+20) { 
    if((i > width/2-60) && (i < width/2+40)) {
    stroke(0);    //Set color to black
  } else {
    stroke(255);  //Set color to white
  }// Set the beginning and end locations of horizontal ellipses
  for (int j = height/height + 25 ; j < height ; j = j+50) { //Set the beginning and end locations of vertical ellipses
    
    line(i, height/2, i+10, height/2);
    line(width/2,i,width/2,i+10);
    
    }
    }
  line(width/2-40,0,width/2-40,height/2-40);
    line(width/2+40,0,width/2+40,height/2-40);
      line(width/2-40,height,width/2-40,height/2+40);
      line(width/2+40,height,width/2+40,height/2+40);
      line(0,height/2-40,width/2-40,height/2-40);
      line(0,height/2+40,width/2-40,height/2+40);
      line(width,height/2-40,width/2+40,height/2-40);
      line(width,height/2+40,width/2+40,height/2+40);
      fill(30,90,30);
      rectMode(CORNER);
  rect(0,0,width/2-40,height/2-40);
  rect(width/2+40,0,width/2-40,height/2-40);
  rect(0,height/2+40,width/2-40,height/2-40);
  rect(width/2+40,height/2+40,width/2-40,height/2-40);
      
      
  rectMode(CENTER);
  a= a + speed;
  b=b + speed1;
  c=c+speed2;
  d=d+speed3;
  fill(100);
  stroke(40);
  //fill(200,40,0.140);
  fill(30);
  rect(a+1,height/2+20, 33,20 );
  fill(255);
  rect(a-5,height/2+20,15,14);
  fill(0);
  
  
  
  //rect(a+3,height/2+22,25,16);
  fill(0,18,80);
  noStroke();
  stroke(30);
  rect(width/2-20,b,20,34);
  strokeWeight(3);//The Front Glass RED CAR
  stroke(0);
  line(a+5,height/2+26,a+5,height/2+15);
  strokeWeight(1);
  stroke(30);
  fill(230);
  rect(width/2-20,b-5,15,20);
  
  fill(188,18,18);
  rect(c,height/2-20,35,20);
  strokeWeight(3);//The Front Glass RED CAR
  stroke(30);
  line(c-6,height/2-26,c-6,height/2-13);
  strokeWeight(1);
  stroke(170);
  
  fill(0,20,100);
  rect(c+5,height/2-20,20,14);
  
  
  
  stroke(30);
  fill(245);
  
  rect(width/2+20,d,20,32); //WHITE MINI
  fill(20);
  noStroke();
  rect(width/2+20.5,d+4,16,19);
  strokeWeight(1);
  fill(255);
  rect(a-5,height/2+20,18,14);
  
  //The Hood Shadows
  stroke(20);
  line(c-11,height/2-26,c-20,height/2-25);
  line(c-11,height/2-14,c-20,height/2-15);
  
  line(a+11,height/2+26,a+20,height/2+25);
  line(a+11,height/2+14,a+20,height/2+15);
  
  line(width/2-26,b+10,width/2-27,b+16);
  line(width/2-15,b+10,width/2-14,b+16);
  
  line(width/2+24,d-11,width/2+25,d-16);
  line(width/2+16,d-11,width/2+15,d-16);
  
  //HOOD Stripes
  strokeWeight(2);
  stroke(210);
  line(width/2-22,b+7,width/2-22,b+16);
  line(width/2-18,b+7,width/2-18,b+16);

  //ROOF STRIPES
  strokeWeight(3);
   stroke(20);
  line(a-15,height/2+18,a+2,height/2+18);
  line(a-15,height/2+22,a+2,height/2+22);
  strokeWeight(2);
  stroke(245);
  line(a+9,height/2+18,a+16,height/2+18);
  line(a+9,height/2+22,a+16,height/2+22);
  
  strokeWeight(2);
   stroke(200);
  line(width/2+22,d-2,width/2+22,d+12);
  line(width/2+18,d-2,width/2+18,d+12);
  
  strokeWeight(1);
   stroke(200);
  line(c+14,height/2-14,c-5,height/2-26); // Red car white stripes
  line(c+14,height/2-27,c-5,height/2-14);
  
  strokeWeight(2);
 line(c+5,height/2-14,c+5,height/2-26); // Red car white stripes CROSS
  line(c+15,height/2-20,c-4,height/2-20);
  
  
  
  noStroke();
  strokeWeight(1);
  
  fill(240,240,20,110);
  quad(a+20,height/2+14,a+70,height/2+4,a+70,height/2+26,a+20,height/2+14);
  quad(a+20,height/2+26,a+70,height/2+14,a+70,height/2+36,a+20,height/2+26);
   quad(c-20,height/2-14,c-70,height/2-4,c-70,height/2-26,c-20,height/2-14);
   quad(c-20,height/2-26,c-70,height/2-14,c-70,height/2-36,c-20,height/2-26);
    quad(width/2-14,b+20,width/2-4,b+70,width/2-36,b+70,width/2-26,b+70);
    quad(width/2-26,b+20,width/2-14,b+70,width/2-48,b+70,width/2-36,b+70);
     quad(width/2+14,d-20,width/2+4,d-70,width/2+36,d-70,width/2+26,d-70);
     quad(width/2+26,d-20,width/2+14,d-70,width/2+48,d-70,width/2+36,d-70);
     
  
  if (a> width+25) {
    a = -70;
    
  }
  if (b> height+25) {
    b = -70;
    
  }
  if (c<- 30){
    c=width+70;
  }
  if (d< - 30){
    d=height+70;
  }
  if(keyPressed){
    switch(key) {
      case'a':
      
  speed=0;
  break;
  case'w':
  speed1=0;
  break;
  case'd':
  speed2=0;
  break;
  case's':
  speed3=0;
  break;
  case'l':
  size(350,350);
  break;
  case'u':
  size(500,500);
}
}

  for (int speed = 1; speed < width; speed += 2) 
{
  boolean carmoves = true; 

if (!carmoves) { 
  a = a + speed;
} 
carmoves = false; 
if (carmoves) { 
  speed = 0;
  
}


}



}
void keyReleased() {
  switch(key){
    case'a':
  carmoves = false ;
  speed=random(2.3,6.3);
  break;
  case'w':
  speed1=random(2.3,6.3);;
  break;
  case'd':
  speed2=random(-3.3,-6.3);
  break;
  case's':
  speed3=random(-3.3,-6.3);
}
}


