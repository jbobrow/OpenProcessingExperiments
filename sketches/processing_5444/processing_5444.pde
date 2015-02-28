
int num=30; //anzahl der kugeln
float atrac=0.0001;
float radius=45;
float geschw=0.2;
Module[] mods;


//-------------------------------------setup
void setup() 
{
  size(800, 800);
  background(176);
  stroke(0);
  geschw=0.2*30/num;
 // frameRate (30);
  mods = new Module[40];//vorsorglich, damit im laufenden Betrieb num bis auf 40 erhöht werden kann, die schleifen werden aber nur bis num durchlaufen
  for (int i = 0; i < 40; i++) {
    mods[i] = new Module(random(-geschw,geschw),random(-geschw,geschw),random(10,790) ,random(10,790) ,-1 ); //-1 steht für keine verbindung eingegangen 
  }
}//---------------------------------ende setup

void draw() //------------------------draw
{
  if (keyPressed==true){//anziehungskraft und reichweite verändern
    if (key=='A'){
      atrac=atrac*1.1;
    }
     if (key=='a'){
      atrac=atrac/1.1;
    }
    if (key=='R'){
      radius=radius*1.02;
    }
    if (key=='r'){
      radius=radius/1.02;
    }
    if (key=='n'){
      num=constrain(num-1,2,40);
      background(176);
       geschw=0.2*30/num;
  for (int i = 0; i < num; i++) {
    mods[i] = new Module(random(-geschw,geschw),random(-geschw,geschw),random(10,790) ,random(10,790) ,-1 ); //-1 steht für keine verbindung eingegangen 
  } 
    }
    if (key=='N'){
     num=constrain(num+1,2,40);
     background(176);
      geschw=0.2*30/num;
  for (int i = 0; i < num; i++) {
    mods[i] = new Module(random(-geschw,geschw),random(-geschw,geschw),random(10,790) ,random(10,790) ,-1 ); //-1 steht für keine verbindung eingegangen 
  } 
    }
  }
  fill(176,150);
  rect(0,0,800,800);

  for (int i = 0; i < num; i++) {
    mods[i].update();//bewegen und spiegeln an den wänden
    mods[i].conect();//auf verbindungen checken
    mods[i].draw();//zeichnen der linien und kreise
  }
}//----------------------------------ende draw


class Module {//----------------------def. module
  float mx, my;//x- und y-geschwindigketi
  float x, y ;//koordinaten
  int con; //array-nummer des bindungspartners
  float distanz=10000; 


  Module(float imx, float imy, float ix, float iy, int icon) {
    mx = imy;
    my = imx;
    x = ix;
    y = iy;
    con = icon;
  }

  void conect() {//---------module-methode conect
    for(int i=0; i < num; i++) {
      for(int j=i+1; j < num; j++) { // es muss nicht in beiden richtungen der abstand geprüft werden und der
        //abstand zu sich selbst darf nicht geprüft werden, sonst hieße das bindung mit sich selbst, daher ab i+1

        distanz=(mods[i].x-mods[j].x)*(mods[i].x-mods[j].x)+(mods[i].y-mods[j].y)*(mods[i].y-mods[j].y);
        //einfacher: quadrat der entfernung von mods[i] und mods[j]
       if(distanz <radius*radius&& mods[i].con==-1&&mods[j].con==-1){//falls in diesem durchlauf einer von beiden schon als bindungspartner gewählt, dann schluss
          //if(distanz < radius*radius){ //kein check auf mehrfachbindung!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          mods[j].con=i;//eintragung als bindungspartner
          mods[i].con=j;
        }
      }
    }

  }//------ende---module-methode conect

  // ---------------------module-methode update
  void update() {
    //hier kommmt das gummiband:
    float deltax,deltay,v2;
    for(int i=0; i < num; i++) {
      for(int j=i+1; j < num; j++) {
        if(mods[i].con==j&&mods[j].con==i){
          deltax=mods[i].x-mods[j].x;
          deltay=mods[i].y-mods[j].y;
          // die anziehung der bindungspartner 
          mods[i].mx=mods[i].mx-atrac*deltax;
          mods[j].mx=mods[j].mx+atrac*deltax;
          mods[i].my=mods[i].my-atrac*deltay;
          mods[j].my=mods[j].my+atrac*deltay;

        }
        v2=mods[j].mx*mods[j].mx+mods[j].my*mods[j].my;

        if(v2>geschw*geschw){//hier kommt die daempfung für zu große geschwindigkeiten
          //prop. zum geschwindigkeitsquadrat
          mods[j].mx=mods[j].mx*(geschw*geschw/v2);
          mods[j].my=mods[j].my*(geschw*geschw/v2);


        }
      }
    }

    for(int i=0; i < num; i++) {
      mods[i].x=mods[i].x+mods[i].mx;
      mods[i].y=mods[i].y+mods[i].my;

      if(mods[i].x>800){
        mods[i].mx=-mods[i].mx;
      }

      if(mods[i].y>800){
        mods[i].my=-mods[i].my;

      } 

      if(mods[i].x<0){
        mods[i].mx=-mods[i].mx;

      }

      if(mods[i].y<0){
        mods[i].my=-mods[i].my;

      }
    }
  } // -----------ende----------module-methode update

  // ------------------------module methode draw
  void draw() {
    fill(50,100,200);
    if(con >-1){
      fill(200,50,50);
    }
    ellipse(x,y,10,10);
    noFill();
    stroke(200);
    ellipse(x,y,radius,radius); 
    stroke(0);
    if(con>-1){
      line(x,y,mods[con].x,mods[con].y);
    }
  }  // ------------ende------------module methode draw
}//---------------------ende def. module



void mouseClicked(){//neustart
  background(176);
   geschw=0.2*30/num;
  for (int i = 0; i < num; i++) {
    mods[i] = new Module(random(-geschw,geschw),random(-geschw,geschw),random(10,790) ,random(10,790) ,-1 ); //-1 steht für keine verbindung eingegangen 
  } 
}
















