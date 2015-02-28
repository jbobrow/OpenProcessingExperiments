
float x;
float counter;
void setup(){
  size(600,400);

}

void draw()
{
  background(206,255,251);
 float sec = map(second(), 0, 59, 0, 599);
 float min = map(minute(), 0, 59, 0, 599);
 float mx = map(mouseX, 0, 600, 0, 360);
 float z = map(hour(), 0, 23, 0, 270-11.25);
 float s = map(hour(), 0, 23, 0, 540-22.5);
 float e = map(hour(), 0, 23, 0, 345);
 float x=e;

 if(mousePressed){
   x=mx;
 }
if(x<0){
   x=0;
 }else if(x>360){
   x=360;
 }
   
pushMatrix();//--------------------------------Himmel
fill(206,255,251);
rect(0,0,width,height);
if(mousePressed){
  if((x>=75&&x<=100)||(x>=255&&x<=280)){
 
  colorMode(HSB,360,100,100);
  fill(50,40,97,255);
  rect(0,0,width,height);
  translate(0,height/1.5);


  for (int k=25; k<97; k+=1){
    float f=97-k;
    colorMode(HSB,360,100,100);
    fill(30,k,97);
    noStroke();
    rect(0,-f,width,height/2);
    colorMode(RGB,255,255,255);
  }
  
  }else if(x<75||x>280){
 
  fill(0,127);
  noStroke();
rect(0,0,width,height);
  }else if((x>100&&x<255)) {
 
fill(206,255,251);
rect(0,0,width,height);
}
}else{
if(hour()==8||hour()==16){
 
colorMode(HSB,360,100,100);
fill(50,40,97,255);
rect(0,0,width,height);
translate(0,height/1.5);


for (int k=25; k<97; k+=1){
    float f=97-k;
    colorMode(HSB,360,100,100);
  fill(30,k,97);
  noStroke();
  rect(0,-f,width,height/2);
  colorMode(RGB,255,255,255);
  }
  

}else if(hour()<8||hour()>16){
  fill(0,127);
  noStroke();
rect(0,0,width,height);


}else if((hour()>8&&hour()<16)) {
 
fill(206,255,251);
rect(0,0,width,height);
}
}
popMatrix();



pushMatrix();//----------------------------Mond
translate(width/2,height/1.5);
if (mousePressed){
   rotate(radians(x));
   } else {
     if(hour()<=8){
   rotate(radians(z));
     }else{
       rotate(radians(z+90));
     }
   }
translate(0,-200);
noStroke();
fill(255);
ellipse(0,0,50,50);
fill(240);
ellipse(0,0,10,10);
ellipse(5,5,10,10);
ellipse(-10,0,20,10);
ellipse(-5,5,10,10);
ellipse(5,-15,10,10);
popMatrix();

pushMatrix(); //------------------------sonne
translate(width/2,height/1.5);
rotate(radians(90));
if (mousePressed){
   rotate(radians(x+90));
   } else {
     if(hour()==0){
       rotate(radians(90));
     }else if(hour()<=16){
   rotate(radians(s));
     }else{
       rotate(radians(90));
     }
   }
translate(0,-200);
for (int k=80; k>10; k-=1){
  float f=k-120;
  colorMode(HSB,360,100,100);
  fill(51,-f,100);
  ellipse(0,0,k,k);
  }
  colorMode(RGB,255,255,255);
popMatrix();

pushMatrix();//----------------------------haus
translate(width/2,height/1.5);
noStroke();

fill(0);
rect(-75,-99,150,41);

fill(255);
rect(-77,-101,154,10,10);

fill(200);
translate(-51,-85);
rotate(radians(-45));
rect(0,0,14,14);
rotate(radians(45));
translate(51,85);
translate(29,-85);
rotate(radians(-45));
rect(0,0,14,14);
rotate(radians(45));
translate(-29,85);
rect(30,-85,18,18);
rect(-50,-85,18,18);
rect(-75,-59,150,60);

if(mousePressed){
  if(x>270&&x<340){
  fill(#F0E73C);
  }else{
  fill(127);
}
}else{
  if((hour()>16&&hour()<22)){
  fill(#F0E73C);
  }else{
  fill(127);
}
}

rect(33,-82,12,12);
rect(-50,-40,18,18);
rect(32,-40,18,18);
rect(-47,-82,12,12);

if(mousePressed){
  if(x>=340||x<15){
  float b = map(sin(counter),-1,1,0,360);
  colorMode(HSB,360,100,100);
  fill(b,100,100);
  counter += 0.1;
  colorMode(RGB,255,255,255);
  }
}
else{
  if(hour()>=22||hour()<1){
  float b = map(sin(counter),-1,1,0,360);
  colorMode(HSB,360,100,100);
  fill(b,100,100);
  counter += 0.1;
  colorMode(RGB,255,255,255); 
  }
}

rect(-47,-82,12,12);

fill(255);
rect(-width/2,0,width,height/2);
fill(50);
rect(-10,-30,20,30);

fill(0);
rect(-5,0,10,height/2);
popMatrix();

pushMatrix();//---------------wolke
translate(600-min,50);
fill(255);
noStroke();
ellipse(0,0,40,40);
ellipse(60,0,80,40);
ellipse(30,20,80,40);
ellipse(20,-10,20,20);
popMatrix();

pushMatrix();
translate(sec,150);//------------------Vogel
fill(0);
rotate(radians(-45));
rect(0,-2,10,2);
rotate(radians(45));
rect(-10,-3,10,2);
ellipse(0,0,5,5);
popMatrix();


}
