
void setup(){
size(500,500);
background(255);
frameRate(6);
}
float click=0;
color cielo=255;
void mouseReleased(){
if (cielo>=5){
cielo=0;
} 
else{
cielo=255;
}
}

void draw(){
float x1=mouseX;
float y1=mouseY;
float x2;
float y2=10;
float z;
float z2;
float zy2;
float zx2;
float zy3;
float rx;
float ry;
float grad;
float nsin;
float ncos;
float col=random(100,255);


 fill(cielo,230);
 noStroke();
 rect(0,0,width, height); 


for(float n=click; n<100; n+=random(30)){
  grad=random(2*PI);
  ncos=n*cos(grad);
  nsin=n*sin(grad);
  rx=x1+ncos;
  ry=y1+nsin;
     stroke(width/2-x1/2,col, height/2-y1/2);
  strokeWeight(n/20);
  line(x1,y1,rx,ry);
  //---------linea de sombra----------------
      stroke(width/2-x1/2,col, height/2-y1/2,50);
      strokeWeight(n/8);
      line(x1,y1,rx,ry);
  //--------------------------
  z=random(5);
  z2=random(6);
  x1=rx;
   y1=ry;
  if(z<4){
     stroke(width/2-x1/2,col, height/2-y1/2);
   strokeWeight(2);
   zx2=x1+random(-50,50);
   zy2=y1+random(-50,50);
   line(x1,y1,zx2,zy2);
   //---------linea de sombra----------------
     stroke(width/2-x1/2,col, height/2-y1/2,100);
     strokeWeight(4);
     line(x1,y1,zx2,zy2);
   //--------------------------
        if(z2<6){
     stroke(width/2-x1/2,col, height/2-y1/2);
     strokeWeight(1);
     line(zx2,zy2,zx2+random(-50,50),zy2+random(30));
   //  line(zx2,zy2,zx2+random(-50,50),zy2+random(20));
     }
}
}
}


