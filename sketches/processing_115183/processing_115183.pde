
float x,y,dist,randx,randy,randz,cirkelx,cirkely;
int point = 0;
int cirkler = 0;
int counter = 0;


void setup(){
  size (1280,720);
  frameRate(60);
  cirkelx = 640;
  cirkely = 360;
  background(255,255,255);
}

void draw(){    
  textSize(32);
  x = mouseX;
  y = mouseY;
  randx =random(1,255);
  randy=random(1,255);
  randz=random(1,255);
    dist = sqrt((x-cirkelx)*(x-cirkelx)+(y-cirkely)*(y-cirkely));


  if (dist<=65+counter && dist>=50 ){
    cirkelx = random(70,1230);
    cirkely = random(90,670);
    fill(0,0,0);
    ellipse(cirkelx,cirkely,100,100);
    noFill();
    background(255,255,255);
      }
    else if(dist<50 && mousePressed==true){
      point++;
      counter++;
      }
    fill(0,0,0);
   text("POINT " + " " + point,20,40);
   println(dist);
    fill(0,0,0);
      ellipse(cirkelx,cirkely,100,100);
    noFill();
  if(keyPressed==true){
     background(255,255,255);
   } 
   line(900,100,1100,100);
   line(900,150,1100,150);
   line(900,100,900,150);
   line(1100,100,1100,150);
   if(point>=0 && point<=100){
   fill(randx,randy,randz);
     rect(900,100,point*2,50);
   }
   noFill();
   if(point>=100){
   text("DU HAR VUNDET", 900,50);
   point= 100;
   }
}

  
