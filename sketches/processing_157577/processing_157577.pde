
/*
"Quadro Pendola" by Lorenzo, licensed under Creative Commons Attribution-Share Alike 3.0. 
*/
int[]step= {// 16 beats _ b1=(b0+140)
  50, 190, 330, 470, 610, 750, 890, 1030, 1170, 1310, 1450, 1590, 1730, 1870, 1990, 2130
};
float V = 2.8; // VelocitÃ  della battuta
int N = 16; // Durata per Battuta
int a = 20; // margine sinistro? _ punto 0
int b = step[0]; // lato riquadro
float z = a; // coordinata orizzontale
float B = a;// coordinataX - Pendola

void setup() 
{
  size (550, 550);
  //  noLoop();
}

void draw() 
{
  background(90);
  noStroke();
  if (z>(a+b)*2*N+a)//// Durata del Loop
  { ////////////////////
    z=a;//// ripati da 0 
  }/////////////////////
  z= z+V; //////////////
  fill(255);// Spie scorrevoli: 
  rect(z+a, step[0]+b, b, 10);//oriz
  rect(step[0]+b, z/4+2*a, 10, b);//vert
  for (int p=0;p<N;p++)////////////////////////////////
  {///////////////////////////////////////////////////
    fill(170);//////////////// Riquadri o Steps
    rect(step[p], step[0], b, b); // 90
    rect(step[p], step[1], b, b); // 190
    rect(step[p], step[2], b, b); // 290
    rect(step[p], step[3], b, b); // 390
    fill(0);
    rect(B+30, 40, b, 10);/////// binarPendolo
    if ((z > step[0])&&(z<step[0]+b+a))////////// beat 0
    {///////////////////////////////////////////
      fill(255);//
      rect(step[0], step[0], b, b); //
      B=a;
      fill(170);
      rect(B+30, 40, b, 10);//
    }
    if ((z > step[1])&&(z<step[1]+b+a))////////// beat 1
    {///////////////////////////////////////////
      fill(0);
      rect(step[0], step[0], b, b); //
      fill(255);//
      rect(step[1], step[0], b, b); //
      B=B+0.35;
    }
    if ((z > step[2])&&(z<step[2]+b+a))////////// b 2
    {///////////////////////////////////////////
      fill(0);
      rect(step[1], step[0], b, b); //
      fill(255);//
      rect(step[2], step[0], b, b); //
      B=B-0.35;
    }
    if ((z > step[3])&&(z<step[3]+b+a))////////// b 3
    {///////////////////////////////////////////
      fill(0);
      rect(step[0], step[0], b, b); //
      rect(step[1], step[0], b, b); //
      fill(255);//
      rect(step[3], step[0], b, b); //
      B=B+0.7;
    }
    if ((z > step[4])&&(z<step[4]+b+a))////////// 4
    {///////////////////////////////////////////
      fill(0);
      rect(step[2], step[0], b, b); //
      fill(255);//
      rect(step[0], step[1], b, b); ////
      B=B-0.7;//z-140*2;
    }
    if ((z > step[5])&&(z<step[5]+b+a))////////// 5
    {///////////////////////////////////////////
      fill(0);
      rect(step[0], step[0], b, b); //
      rect(step[2], step[0], b, b); //
      fill(255);//
      rect(step[1], step[1], b, b); ////
      B=B+0.35;
    }
    if ((z > step[6])&&(z<step[6]+b+a))////////// 6
    {///////////////////////////////////////////
      fill(0);
      rect(step[1], step[0], b, b); //
      rect(step[2], step[0], b, b); //
      fill(255);//
      rect(step[2], step[1], b, b); ////
      B=B+0.35;
    }
    if ((z > step[7])&&(z<step[7]+b+a))////////// 7
    {///////////////////////////////////////////
      fill(0);
      rect(step[0], step[0], b, b); //
      rect(step[1], step[0], b, b); //
      rect(step[2], step[0], b, b); //
      fill(255);//
      rect(step[3], step[1], b, b); ////
      B=B+0.35;
    }
    if ((z > step[8])&&(z<step[8]+b+a))////////// 8
    {///////////////////////////////////////////
      fill(0);
      rect(step[3], step[0], b, b); //
      fill(255);//
      rect(step[0], step[2], b, b); //////
      B=B-1.05;
    }
    if ((z > step[9])&&(z<step[9]+b+a))////////// 9
    {///////////////////////////////////////////
      fill(0);
      rect(step[0], step[0], b, b); //
      rect(step[3], step[0], b, b); //
      fill(255);//
      rect(step[1], step[2], b, b); //////
      B=B+0.35;
    }
    if ((z > step[10])&&(z<step[10]+b+a))//////// 10
    {///////////////////////////////////////////
      fill(0);
      rect(step[1], step[0], b, b); //
      rect(step[3], step[0], b, b); //
      fill(255);//
      rect(step[2], step[2], b, b); //////
      B=B-0.35;
    }
    if ((z > step[11])&&(z<step[11]+b+a))//////// 11
    {///////////////////////////////////////////
      fill(0);
      rect(step[0], step[0], b, b); //
      rect(step[1], step[0], b, b); //
      rect(step[3], step[0], b, b); //
      fill(255);//
      rect(step[3], step[2], b, b); //////
      B=B+0.7;
    }
    if ((z > step[12])&&(z<step[12]+b+a))//////// 12
    {///////////////////////////////////////////
      fill(0);
      rect(step[2], step[0], b, b); //
      rect(step[3], step[0], b, b); //
      fill(255);//
      rect(step[0], step[3], b, b); ////////
      B=B-0.7;
    }
    if ((z > step[13])&&(z<step[13]+b+a))//////// 13
    {///////////////////////////////////////////
      fill(0);
      rect(step[0], step[0], b, b); //
      rect(step[2], step[0], b, b); //
      rect(step[3], step[0], b, b); //
      fill(255);//
      rect(step[1], step[3], b, b); ////////
      B=B+0.35;
    }
    if ((z > step[14])&&(z<step[14]+b+a))//////// 14
    {///////////////////////////////////////////
      fill(0);
      rect(step[1], step[0], b, b); //
      rect(step[2], step[0], b, b); //
      rect(step[3], step[0], b, b); //
      fill(255);//
      rect(step[2], step[3], b, b); ////////
      B=B+0.7;
    }
    if ((z > step[15])&&(z<step[15]+b+a))//////// 15
    {///////////////////////////////////////////
      fill(0);
      rect(step[0], step[0], b, b); //
      rect(step[1], step[0], b, b); //
      rect(step[2], step[0], b, b); //
      rect(step[3], step[0], b, b); //
      fill(255);//
      rect(step[3], step[3], b, b); ////////
      B=B+0.35;
    }
    if (B>width-b) {
      B=-10-b;
    }
  }
}

