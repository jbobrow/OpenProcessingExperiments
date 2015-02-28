
int i,j,b=0,x=50,y=50;
float ang1=QUARTER_PI,ang2=(TWO_PI-QUARTER_PI);


void setup(){
background(0);
size(600,300);
frameRate(15);
smooth();
}


void draw(){
stroke(0,0,255);
strokeWeight(7);
noFill();
background(0);
rect(25,25,550,250);
noStroke();

//PUNTITOS
fill(255);
 for (  i=50; i<=250; i+=50){
   for (j=50; j<=550; j+=50){
 
      if (i<y) fill(0);
      else if(i<=y && j<=x) fill(0);
      else fill(255);
     ellipse(j,i,10,10);
   }
  }
  


//PAC-MAN BOCA
if(b==0){
  fill(255,255,0);
  arc(x,y,40,40,0,TWO_PI);
  b+=1;
}
  else{
    fill(255,255,0);
    arc(x,y,40,40,ang1,ang2);
    b-=1;
  }
  
//AVANZA
if(x<=540 && y<=250){
 
  x+=10;
}
else {
    if (y<250)  {
     x=50;
      y+=50;
    }
    else {
    strokeWeight(10);
    stroke(200,0,255);
    line(150,50,200,150);
    line(250,50,200,150);
    line(200,150,200,250);    

    line(300,250,350,50);
    line(350,50,400,250);
    line(325,175,375,175);
    
    line(450,50,450,200);
    ellipse (450,225,10,10);
    }
  
}

}
