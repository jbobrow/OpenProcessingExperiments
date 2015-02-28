
trin[] trinss;
public int x,y,xre=0,yre=200,j,dis,pdis,xdis,pausa=0;
public int t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17,t18;//esto lo hice ps se me hace mas facil llamarlos asi que como un vector 
  void setup() {
  size (800,450);
  trinss = new trin[18];//HANS GARCIA
  pdis=0;               //LAURA NAVARRO
x=90;
y=150;
  for (int index = 0; index < trinss.length; index++) {
    if(x>=690){
      x=90;
      y=y-50;
    }
    trinss[index] = new trin(x, y);
    x=x+100;
  }
}


void draw() {
  if(pausa==0){//para terminar el programa
 PImage b = loadImage("fondo.jpg");
  image(b, 0, 0);
fill(255,255,0,255);
arc(mouseX,370,60,60,radians(0),radians(270));//Pacman :D
smooth();
fill(0,0,10,255);//Ojo del Pacman
ellipse(mouseX-10,364,7,7);
fill(255);
    rect(xre,yre,100,10);
        rect(xre+10,yre-9,80,8);
    rect(xre+180,yre,100,10);
        rect(xre+190,yre-9,80,8);//Bloqueadores!!!!!
    rect(xre+360,yre,100,10);
        rect(xre+370,yre-9,80,8);
    rect(xre+540,yre,100,10);
        rect(xre+550,yre-9,80,8);
      xre+=3;//velocidad de bloqueadores
      if(xre>=150){
      xre=0;
      yre+=10;//Bloqueadore!!!!
    }
if(t1==0 ){
  trinss[0].pintar();
    if(xdis>=90 && xdis<=150 && 340-dis==150){
      t1=1; 
      pdis=0;
    }
}
if(t2==0){
  trinss[1].pintar();
      if(xdis>=190 && xdis<=250 && 340-dis==150){
      t2=1; 
      pdis=0;
    }
}
if(t3==0){
  trinss[2].pintar();
        if(xdis>=290 && xdis<=350 && 340-dis==150){
          t3=1; 
          pdis=0;
        }
   }
if(t4==0){
  trinss[3].pintar();
          if(xdis>=390 && xdis<=450 && 340-dis==150){
          t4=1; 
          pdis=0;
        }
   }
if(t5==0){
  trinss[4].pintar();
          if(xdis>=490 && xdis<=550 && 340-dis==150){
          t5=1; 
          pdis=0;
        }
   }
if(t6==0){
  trinss[5].pintar();//Triangulitooossss!!!
          if(xdis>=590 && xdis<=650 && 340-dis==150){
          t6=1; 
          pdis=0;
        }
   }
if(t7==0){
  trinss[6].pintar();
          if(xdis>=90 && xdis<=150 && 340-dis==100){
          t7=1; 
          pdis=0;
        }
   }
if(t8==0){
  trinss[7].pintar();
          if(xdis>=190 && xdis<=250 && 340-dis==100){
          t8=1; 
          pdis=0;
        }
   }
if(t9==0){
  trinss[8].pintar();
          if(xdis>=290 && xdis<=350 && 340-dis==100){
          t9=1; 
          pdis=0;
        }
   }
if(t10==0){
  trinss[9].pintar();
          if(xdis>=390 && xdis<=450 && 340-dis==100){
          t10=1; 
          pdis=0;
        }
   }
if(t11==0){
  trinss[10].pintar();
          if(xdis>=490 && xdis<=550 && 340-dis==100){
          t11=1; 
          pdis=0;
        }
   }
if(t12==0){
  trinss[11].pintar();
          if(xdis>=590 && xdis<=650 && 340-dis==100){
          t12=1; 
          pdis=0;
        }
   }
if(t13==0){
  trinss[12].pintar();
          if(xdis>=90 && xdis<=150 && 340-dis==50){
          t13=1; 
          pdis=0;
        }
   }
if(t14==0){
  trinss[13].pintar();
          if(xdis>=190 && xdis<=250 && 340-dis==50){
          t14=1; 
          pdis=0;
        }
   }
if(t15==0){
  trinss[14].pintar();
          if(xdis>=290 && xdis<=350 && 340-dis==50){
          t15=1; 
          pdis=0;
        }
   }
if(t16==0){
  trinss[15].pintar();
          if(xdis>=390 && xdis<=450 && 340-dis==50){
          t16=1; 
          pdis=0;
        }
   }
if(t17==0){
  trinss[16].pintar();
          if(xdis>=490 && xdis<=550 && 340-dis==50){
          t17=1; 
          pdis=0;
        }
   }
if(t18==0){
  trinss[17].pintar();
          if(xdis>=590 && xdis<=650 && 340-dis==50){
          t18=1; 
          pdis=0;
        }
   }
  if( mousePressed && pdis==0 ){
    pdis=1;
    xdis=mouseX-10;//disparo!!!!!!
    dis=0;    
  }
      disparo();
  if(pdis==1)
  {
    strokeWeight(7);
    stroke(255,0,0,255);
       dis+=10;
    line(xdis,360-dis,xdis,340-dis);
   if(dis>=320) pdis=0;
  }

  strokeWeight(1);
  stroke(0,0,0,0);
  }
 if(yre>=340)     
        {
      fill(255,0,0,255);
      arc(450,225,200,200,radians(0),radians(270));//Pacman :D
      smooth();
      fill(0,0,10,255);//Ojo del Pacman
      ellipse(400,200,15,15);
      pausa=1;
    }
    if(t1==1 && t2==1 && t3==1 && t4==1 && t5==1 && t6==1 && t7==1 && t8==1 && t9==1 && t10==1 && t11==1 && t12==1 && t13==1 && t14==1 && t15==1 && t16==1 && t17==1 && t18==1) 
    {
      fill(255,255,0,255);
      arc(450,225,200,200,radians(0),radians(270));//Pacman :D
      smooth();
      fill(0,0,10,255);//Ojo del Pacman
      ellipse(400,200,15,15);
      pausa=1;
    } 
}

void disparo(){
  if(xre<=xdis && (xre+100)>=xdis && yre==(340-dis) ) pdis=0;
  if(xre+180<=xdis && (xre+180+100)>=xdis && yre==(340-dis) ) pdis=0;
  if(xre+360<=xdis && (xre+360+100)>=xdis && yre==(340-dis) ) pdis=0;//BLOQUEADORES PARAN DISPAROS!!!!!
  if(xre+540<=xdis && (xre+540+100)>=xdis && yre==(340-dis) ) pdis=0;
  
}



class trin {
  float xj, yj; //una posición

  trin(float iX, float iY) {
    xj = iX;
    yj = iY;
  }
  void pintar() {
    strokeCap(ROUND);
    float rcolor = random(20, 255);
    float gcolor = random(20, 255);
    float bcolor = random(50, 100);//Pintar Triangulitossss
    fill(rcolor,gcolor,bcolor,255);
    triangle (xj, yj, xj+60, yj,xj+30,yj-30);
  }
}

