
//szkielet funkcji
int stareMouseX=0;
int stareMouseY = 0;
int ilosc = 250;
float [] px = new float [ilosc];
float [] py =  new float [ilosc];
float [] pz =  new float [ilosc];
float []vx = new float [ilosc];
float []vy = new float [ilosc];
float []vz = new float [ilosc];

float atraktorx=300;
float atraktory=300;
float atraktorz=150;


void setup()
{
  size(1200, 800, P3D);
  //inicjaliz agentow
  for (int i=1;i<ilosc;i++) {
    px[i] = random(width);
    py[i] = random(height);
    pz[i] = random(height);
    
    vx[i] = random(-100, 100)/100.0;//losowa wart wektora
    vy[i] = random(-100, 100)/100.0;
    vz[i] = random(-100, 100)/100.0;
  }
  initMesh();
}
void draw()
{ 
  
  
  background(255);
  
  //nawigacja za pomoca myszki 3D
  
  translate(width/2, height/2+200,0);
  rotateY(-mouseX*0.01);
  rotateX(-mouseY*0.01);
  translate(-width/2, -height/2,0);
  
  
  fill(255);
  rect(0,0,width, height);
  
  translate(0,0,1);
  
  showMesh();
  
  //wyswietlamy atraktor
  kostka3d(atraktorx,atraktory,atraktorz, 5);
  
  //reset tła
  //wyswietlanie i ruch agentow
  for (int i=0;i<ilosc;i++) {
    fill(0);
    
  
    //kostka3d(px[i], py[i], pz[i], 5);
    line(px[i], py[i],pz[i],
    px[i]+vx[i]*10, py[i]+vy[i]*10, pz[i]+vz[i]*10);

    float predkosc = 7.0;
    //przes agnt
    px[i] = px[i]+vx[i]*predkosc;
    py[i] = py[i]+vy[i]*predkosc;
    pz[i] = pz[i]+vz[i]*predkosc;
    //odbicie od scian
//    if (px[i]<0) {
//      px[i] = 0;
//      vx[i] = -vx[i];
//    }
//    if (py[i]<0) {
//      py[i] = 0;
//      vy[i] = -vy[i];
//    }
//    if(px[i]>width){px[i] = width;vx[i] = -vx[i];}
//    if(py[i]>height){py[i] = height;vy[i] = -vy[i];}
   if(pz[i]<0) {pz[i]=0; vz[i]=-vz[i];}
   
    float vecx = 0;
    float vecy = 0;
    float vecz = 0;
    
    //interakcja z atraktorem
    
      float atrvx = px[i] - atraktorx;
      float atrvy = py[i] - atraktory;
      float atrvz = pz[i] - atraktorz;
      
      float d4 = dist(0,0,0, atrvx, atrvy, atrvz);
      
      float f2= 80/d4; //moc atr
      
      
      //przesun agenta wzgledem atraktora
      vecx = vecx - atrvx/d4*f2;
      vecy = vecy - atrvy/d4*f2;
      vecz = vecz - atrvz/d4*f2;    
      
      
    //gdzie ida sasiedzi
   
    for (int j=0;j<ilosc;j++)
      if (j!=i) {
        //odl miedzy agentami 'i i 'j
        float d = dist(px[i], py[i],pz[i], px[j], py[j], pz[j]);
        if (d<50) { //promin sprawdzania sasiadow
          //zwieksz o wartosc wek sasiada
          vecx += vx[j];
          vecy += vy[j];
          vecz+=vz[j];
        }
        if(d<30){
          //odpychanie
          float vektorekx = px[j]-px[i];
          float vektoreky = py[j]-py[i];
          float vektorekz = pz[j]-pz[i];
          float d3 = dist(0,0,0, vektorekx,vektoreky,vektorekz+0.01);
          float f = 50/d3;
          //normalizujemy
          vektorekx = vektorekx/d3;
          vektoreky = vektoreky/d3;
          vektoreky = vektorekz/d3;
          
          px[j]+= vektorekx*f;
          py[j]+= vektoreky*f;
          pz[j]+= vektorekz*f;
          
          px[i]-= vektorekx*f;
          py[i]-= vektoreky*f;
          pz[i]-= vektorekz*f;
        }
      }
    //po nazbieraniu kier sasiada, normalizujemy go
    //mierzenie dl wek
    float d2 = dist(0, 0,0, vecx, vecy,vecz);
    if(d2>2);
    {
    vecx= vecx/d2;
    vecy = vecy/d2;
    vecz = vecz/d2;
    }
    //bedzie zawsze rowne 1
    vx[i] = vx[i]*0.7+vecx*0.3 +random(-10,10)*0.01;
    vy[i] = vy[i]*0.7+vecy*0.3 +random(-10,10)*0.01;
    vz[i] = vz[i]*0.7+vecz*0.3 +random(-10,10)*0.01;
    
    //usrednienie przez dodanie wagi, musi zawsze dac w sumie 1
  }//koniec petli i
  stareMouseX = mouseX;
  stareMouseY = mouseY;

deformMesh();
}



