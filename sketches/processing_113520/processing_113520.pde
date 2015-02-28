
int eSize=5;
float x,y,z,g=0;

size(800,800);
colorMode(HSB,360,100,100,100);
background(220,65,30);
noStroke();
smooth();

//-----haikei-----
for(int re=0; re<=600; re+=5){//re:rect.takasa
  fill(220,50,-5+g);//g:gurade-syon
  rect(0,re,800,5);
  g+=0.4;
}

//----usiro-----
for(int b=0; b<35; b+=1){//b:basyo
  x=random(801);//x:yoko
  y=random(501);//y:tate
  z=random(61);//z:ironoususa
  for(int a=40; a>=10; a-=10){//a:ookisa
    fill(130,100-a,100-a,z);
    ellipse(x,y,a,a);
    if(y>=350){//hansya
      fill(130,90-a,90-a,z-30);
      ellipse(x,1200-y,a,a);
    }
  }
}

//-----mae-----
for(int b=0; b<20; b+=1){//b:basyo
  x=random(801);//x:yoko
  y=random(501);//y:tate
  z=random(101);//z:ironoususa
  for(int a=50; a>=20; a-=10){//a:ookisa
    fill(130,110-a,110-a,z);
    ellipse(x,y,a,a);
    if(y>=350){//hansya
      fill(130,90-a,90-a,z-30);
      ellipse(x,1200-y,a,a);
    }
  }
}




