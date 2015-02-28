
//import processing.opengl.*;

PFont futrfw;
float sizea=600;    //area size
int bmax=256;      //max no. of simultaneous bullets
int bcount;       //bullet counter (to bmax)
int firing=1;     //which weapon is firing? set to 1 for menu
int weapon=1;
int maxweapon=1;
int special=1;
int maxspecial=1;
int spesh=0;
int speshcount=0;
int firecount=0;
int firerate=9;   ///must decrease in threes
int speshrate=100*firerate;
float sidespray=0;
float invulnb=1;
float homing=1;
float hitbox=5;
int active=1;
int powrate=1200;
float speed=9;
float px=sizea/2;                                        //initial ship position x
float py=sizea/2;                                        //initial ship position y    
float fr=60;                                             //framerate
float ts=20;                                             //ship size (radius)
int lives=3;
float level=1;
float health=100;
int score=0;
float cfb=-0.9;
float recoil=0.11;
float gravity=0;
int bounce=1;
float afb=1;
int spawnE=0;
int spawnP=0;
int emax=256;  //set to 256
int pmax=16;
int pcount=0;
int[] hiscores=new int[5];
String[] hinames=new String[5];
float[] powerups=new float[11];
int elevel=1;
int ecount;
int efirecount;
int deathcount=0;
int gamemode=1;
int frame;
String[] initials={"*","*","*"};
float[] ehealth=new float[emax]; 
float[] eradius=new float[emax];
float[] eactive=new float[emax]; 
float[] etype=new float[emax];
float[] eax=new float[emax];
float[] evx=new float[emax];
float[] epx=new float[emax]; //enemy data arrays for x
float[] eay=new float[emax];
float[] evy=new float[emax];
float[] epy=new float[emax]; //enemy data arrays for y

float r,ax,ay,vx,vy,bv=1-0.75/fr; //rotation,rotation vev,accel, accel x, accel y, vel x, vel y, braking coeff

float[] bactive=new float[bmax];
float[] bax=new float[bmax];
float[] bvx=new float[bmax];
float[] bpx=new float[bmax]; //bullet data arrays for x
float[] bay=new float[bmax];
float[] bvy=new float[bmax];
float[] bpy=new float[bmax]; //bullet data arrays for y

float pradius=15;
float[] pactive=new float[pmax]; 
float[] ptype=new float[pmax]; 
int[] pcounter=new int[pmax];
float[] pax=new float[pmax];
float[] pvx=new float[pmax];
float[] ppx=new float[pmax]; //enemy data arrays for x
float[] pay=new float[pmax];
float[] pvy=new float[pmax];
float[] ppy=new float[pmax]; //enemy data arrays for y


void setup(){  
  //size(int(sizea),int(sizea),OPENGL);      
  size(int(sizea),int(sizea));  //draw area
  frameRate(fr);                                         //set framerate
  noCursor();
  smooth();
  futrfw = createFont("Futurist Fixed-width", 32);
  textFont(futrfw);
  String[] hisc=loadStrings("scores.dat");hiscores=int(hisc);
  hinames=loadStrings("names.dat");
  for(int i=0;i<5;i++){print(hinames[i]);print(hiscores[i]);}
}

void draw(){
  fill(255,200);rect(0,0,sizea,sizea);
  stroke(230);for(int g=1;g<sizea;g+=50){line(g,0,g,sizea);line(0,g,sizea,g);}  //grid
  stroke(0);
  
  if ((gamemode==1)||(gamemode==3)||(gamemode==4)){
    frame++;
    if ((firing==1)&&(firecount==0)){   //if LMB pressedand ok to fire
      bax[bcount]=0;
      bay[bcount]=0;
      bvx[bcount]=-sin(r)*10;               //initial bullet x speed
      bvy[bcount]=-cos(r)*10;               //initial bullet y speed
      bpx[bcount]=px; 
      bpy[bcount]=py;       //initial bullet position=ship position
      bactive[bcount]=1;
      bcount++;                             //increase array index for next bullet
      bcount%=bmax;                         //if max index exceeded, restart
      firing=0;
    }
    //ENEMY CREATION---------------------------------------------------------------------------------------------------------------------
      int enemies=0;
    for (int efl=0;efl<emax;efl++){
      if (eactive[efl]==1){
        enemies++;
      }
    }
    if (enemies<10){
      spawnE=1+round(random(5));
      px=random(sizea);
      py=random(sizea);
    }
    int rxy;
    if (spawnE==1){
      rxy=round(random(1));
      epx[ecount]=rxy*round(random(1))*sizea+abs(rxy-1)*random(0,sizea);
      epy[ecount]=abs(rxy-1)*round(random(1))*sizea+rxy*random(0,sizea);
      evx[ecount]=random(-5,5);
      evy[ecount]=random(-5,5);
      eax[ecount]=0;
      eay[ecount]=0;
      ehealth[ecount]=3;
      eradius[ecount]=10;
      eactive[ecount]=1;
      etype[ecount]=1;
      spawnE=0;
      ecount++;
      ecount%=emax;
    }
    if (spawnE==2){
      rxy=round(random(1));
      epx[ecount]=rxy*round(random(1))*sizea+abs(rxy-1)*random(0,sizea);
      epy[ecount]=abs(rxy-1)*round(random(1))*sizea+rxy*random(0,sizea);
      evx[ecount]=0;
      evy[ecount]=0;
      eax[ecount]=0;
      eay[ecount]=0;
      ehealth[ecount]=9;
      eradius[ecount]=20;
      eactive[ecount]=1;
      etype[ecount]=2;
      spawnE=0;
      ecount++;
      ecount%=emax;                         
    }
    if (spawnE==3){
      rxy=round(random(1));
      epx[ecount]=rxy*round(random(1))*sizea+abs(rxy-1)*random(0,sizea);
      epy[ecount]=abs(rxy-1)*round(random(1))*sizea+rxy*random(0,sizea);
      evx[ecount]=0;
      evy[ecount]=0;
      eax[ecount]=0;
      eay[ecount]=0;
      ehealth[ecount]=6;
      eradius[ecount]=15;
      eactive[ecount]=1;
      etype[ecount]=3;
      spawnE=0;
      ecount++;
      ecount%=emax;                         
    }
    if (spawnE==4){
      rxy=round(random(1));
      epx[ecount]=rxy*round(random(1))*sizea+abs(rxy-1)*random(0,sizea);
      epy[ecount]=abs(rxy-1)*round(random(1))*sizea+rxy*random(0,sizea);
      evx[ecount]=0;
      evy[ecount]=0;
      eax[ecount]=0;
      eay[ecount]=0;
      ehealth[ecount]=12;
      eradius[ecount]=10+ehealth[ecount]*2;
      eactive[ecount]=1;
      etype[ecount]=4;
      spawnE=0;
      ecount++;
      ecount%=emax;   
    }
    if (spawnE==5){
      rxy=round(random(1));
      epx[ecount]=rxy*round(random(1))*sizea+abs(rxy-1)*random(0,sizea);
      epy[ecount]=abs(rxy-1)*round(random(1))*sizea+rxy*random(0,sizea);
      evx[ecount]=0;
      evy[ecount]=0;
      eax[ecount]=0;
      eay[ecount]=0;
      ehealth[ecount]=6;
      eradius[ecount]=15;
      eactive[ecount]=1;
      etype[ecount]=5;
      spawnE=0;
      ecount++;
      ecount%=emax;   
    }
    if (spawnE==6){
      rxy=round(random(1));
      epx[ecount]=rxy*round(random(1))*sizea+abs(rxy-1)*random(0,sizea);
      epy[ecount]=abs(rxy-1)*round(random(1))*sizea+rxy*random(0,sizea);
      evx[ecount]=random(-2.5,2.5);
      evy[ecount]=random(-2.5,2.5);
      eax[ecount]=0;
      eay[ecount]=0;
      ehealth[ecount]=24;
      eradius[ecount]=30;
      eactive[ecount]=1;
      etype[ecount]=6;
      spawnE=0;
      ecount++;
      ecount%=emax;   
    }  


    //UPDATE AND DRAW BULLETS------------------------------------------------------------------------------------------------------------
      fill(0);                                 //color of bullets
    for (int bfl=0;bfl<bmax;bfl++){                                                  //for each bullet
      if (bactive[bfl]==1){                                                          //that is active:

        if (homing==1){
          float sedist=600;                                                        //
          int sedisti=0;          
          for (int efl=0;efl<emax;efl++){                                            //check all enemies
            if (eactive[efl]==1){                                                    //that are active
              float edist=sqrt(pow(epx[efl]-bpx[bfl],2)+pow(epy[efl]-bpy[bfl],2));   //
              if (edist<sedist){
                sedist=edist;
                sedisti=efl;
              }                           //for which is nearest
            }
          }
          if (sedist!=600){
            bax[bfl]=-(1/.9)*sin(atan2((bpx[bfl]-epx[sedisti]),(bpy[bfl]-epy[sedisti])));
            bay[bfl]=-(1/.9)*cos(atan2((bpx[bfl]-epx[sedisti]),(bpy[bfl]-epy[sedisti])));
            bvx[bfl]*=0.9;
            bvy[bfl]*=0.9;
          }
          else{
            bax[bfl]=0;
            bay[bfl]=0;
          }
        } 

        bvx[bfl]+=bax[bfl];
        bpx[bfl]+=bvx[bfl];
        bvx[bfl]*=afb;
        bvy[bfl]+=bay[bfl];
        bpy[bfl]+=bvy[bfl];
        bvy[bfl]*=afb;

        if (bounce==1){
          if(bpx[bfl]>sizea){
            bpx[bfl]=sizea;
            bvx[bfl]*=cfb;
          }
          if(bpy[bfl]>sizea){
            bpy[bfl]=sizea;
            bvy[bfl]*=cfb;
          } //collision rules
          if(bpx[bfl]<0){
            bpx[bfl]=0;
            bvx[bfl]*=cfb;
          }
          if(bpy[bfl]<0){
            bpy[bfl]=0;
            bvy[bfl]*=cfb;
          }    
        }
        else{
          if(bpx[bfl]>sizea){
            bactive[bfl]=0;
          }
          if(bpy[bfl]>sizea){
            bactive[bfl]=0;
          } //collision rules
          if(bpx[bfl]<0){
            bactive[bfl]=0;
          }
          if(bpy[bfl]<0){
            bactive[bfl]=0;
          }      
        }
        strokeWeight(5);
        point(bpx[bfl],bpy[bfl]);          //and draw them
        strokeWeight(1);
      }
    }

    //UPDATE AND DRAW ENEMIES------------------------------------------------------------------------------------------------------------
      for (int efl=0;efl<emax;efl++){
      if (eactive[efl]==1){
        if (etype[efl]==1){
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl];
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==2){
          eax[efl]=-.1*sin(atan2((epx[efl]-px),(epy[efl]-py)));
          eay[efl]=-.1*cos(atan2((epx[efl]-px),(epy[efl]-py)));
          evx[efl]*=0.95;
          evy[efl]*=0.95;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl];
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==3){
          eax[efl]=-.1*sin(atan2((epx[efl]-px),(epy[efl]-py)));
          eay[efl]=-.1*cos(atan2((epx[efl]-px),(epy[efl]-py)));
          evx[efl]*=0.99;
          evy[efl]*=0.99;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl];
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==4){
          eax[efl]=-.01*sin(atan2((epx[efl]-px),(epy[efl]-py)));
          eay[efl]=-.01*cos(atan2((epx[efl]-px),(epy[efl]-py)));
          evx[efl]*=0.99;
          evy[efl]*=0.99;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl];
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==41){
          eax[efl]=-.1*sin(atan2((epx[efl]-px),(epy[efl]-py)));
          eay[efl]=-.1*cos(atan2((epx[efl]-px),(epy[efl]-py)));
          evx[efl]*=0.99;
          evy[efl]*=0.99;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl];
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==5){
          eax[efl]=-.1*sin(atan2((epx[efl]-px),(epy[efl]-py)));
          eay[efl]=-.1*cos(atan2((epx[efl]-px),(epy[efl]-py)));
          evx[efl]*=0.99;
          evy[efl]*=0.99;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl];
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==51){
          eax[efl]=-.1*sin(atan2((epx[efl]-px),(epy[efl]-py)));
          eay[efl]=-.1*cos(atan2((epx[efl]-px),(epy[efl]-py)));
          evx[efl]*=0.99;
          evy[efl]*=0.99;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl];
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==52){
          eax[efl]=-.1*sin(atan2((epx[efl]-px),(epy[efl]-py)));
          eay[efl]=-.1*cos(atan2((epx[efl]-px),(epy[efl]-py)));
          evx[efl]*=0.99;
          evy[efl]*=0.99;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl];
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==6){
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl];
          epy[efl]+=evy[efl];
          if (efirecount==0){
            epx[ecount]=epx[efl];
            epy[ecount]=epy[efl];
            evx[ecount]=10*sin(random(1)*2*PI);
            evy[ecount]=10*cos(random(1)*2*PI);
            eax[ecount]=0;
            eay[ecount]=0;
            ehealth[ecount]=2;
            eradius[ecount]=5;
            eactive[ecount]=1;
            etype[ecount]=41;
            ecount++;
            ecount%=emax;
            efirecount=30;
          }
          if (efirecount>0){
            efirecount--;
          }
        }

        //ENEMY WALL COLLISION RULES---------------------------------------------------------------------------------------------------------
          if(epx[efl]>sizea-eradius[efl]){
          epx[efl]=sizea-eradius[efl];
          evx[efl]*=cfb;
        }
        if(epy[efl]>sizea-eradius[efl]){
          epy[efl]=sizea-eradius[efl];
          evy[efl]*=cfb;
        } 
        if(epx[efl]<eradius[efl]){
          epx[efl]=eradius[efl];
          evx[efl]*=cfb;
        }
        if(epy[efl]<eradius[efl]){
          epy[efl]=eradius[efl];
          evy[efl]*=cfb;
        }

        //BULLET COLLISIONS WITH ENEMIES-----------------------------------------------------------------------------------------------------
          fill(255,127);
        for (int bfl=0;bfl<bmax;bfl++){        
          if (bactive[bfl]==1){
            if(sqrt(pow(epx[efl]-bpx[bfl],2)+pow(epy[efl]-bpy[bfl],2))<eradius[efl]+hitbox){        
              ehealth[efl]-=1;
              if (invulnb!=1){
                bactive[bfl]=0;
              }
              if (etype[efl]==4){
                eradius[efl]=10+ehealth[efl]*2;
              }
              fill(0);
            }
          }
        }
        if (ehealth[efl]<0){         //enemy death rules here
          eactive[efl]=0;            //switch off enemy  
          if (etype[efl]==4){        //special rules for blimp
            int swarmcount=0;
            while(swarmcount<16){
              epx[ecount]=epx[efl];
              epy[ecount]=epy[efl];
              evx[ecount]=10*sin(random(1)*2*PI);
              evy[ecount]=10*cos(random(1)*2*PI);
              eax[ecount]=0;
              eay[ecount]=0;
              ehealth[ecount]=2;
              eradius[ecount]=5;
              eactive[ecount]=1;
              etype[ecount]=41;
              swarmcount++;
              ecount++;
              ecount%=emax;
            }
          }
          if (etype[efl]==5){        //special rules for doubler
            int swarmcount=0;
            while(swarmcount<2){
              epx[ecount]=epx[efl];
              epy[ecount]=epy[efl];
              evx[ecount]=5*sin(PI*(swarmcount-.5)+atan2((epx[efl]-px),(epy[efl]-py)));
              evy[ecount]=5*cos(PI*(swarmcount-.5)+atan2((epx[efl]-px),(epy[efl]-py)));
              eax[ecount]=0;
              eay[ecount]=0;
              ehealth[ecount]=6;
              eradius[ecount]=15;
              eactive[ecount]=1;
              etype[ecount]=51;
              spawnE=0;
              swarmcount++;
              ecount++;
              ecount%=emax;
            }
          }
          if (etype[efl]==51){        //special rules for doubler
            int swarmcount=0;
            while(swarmcount<2){
              epx[ecount]=epx[efl];
              epy[ecount]=epy[efl];
              evx[ecount]=5*sin(PI*(swarmcount-.5)+atan2((epx[efl]-px),(epy[efl]-py)));
              evy[ecount]=5*cos(PI*(swarmcount-.5)+atan2((epx[efl]-px),(epy[efl]-py)));
              eax[ecount]=0;
              eay[ecount]=0;
              ehealth[ecount]=6;
              eradius[ecount]=15;
              eactive[ecount]=1;
              etype[ecount]=52;
              spawnE=0;
              swarmcount++;
              ecount++;
              ecount%=emax;   
            }
          }
        }
        //DRAW VARIOUS ENEMIES, STARTING WITH A CIRCLE---------------------------------------------------------------------------------------
          ellipse(epx[efl],epy[efl],eradius[efl]*2,eradius[efl]*2);                                     
        if(etype[efl]==2){
          line(epx[efl]+eradius[efl],epy[efl],epx[efl]-eradius[efl],epy[efl]);
        }
        if(etype[efl]==3){
          line(epx[efl]+eradius[efl],epy[efl],epx[efl]-eradius[efl],epy[efl]);
          line(epx[efl],epy[efl]+eradius[efl],epx[efl],epy[efl]-eradius[efl]);
        }
        if(etype[efl]==4){
          for(float inners=0;inners<16;inners++){
            ellipse(epx[efl]+eradius[efl]*sin((inners/16)*2*PI),epy[efl]+eradius[efl]*cos((inners/16)*2*PI),10,10);
          }
        }
        if(etype[efl]==5||etype[efl]==51||etype[efl]==52){
          ellipse(epx[efl],epy[efl],eradius[efl],eradius[efl]);
        }
        if(etype[efl]==6){
          ellipse(epx[efl],epy[efl],10,10);
        }
      }
    }

    fill(255,127);
    rect(0,0,sizea,sizea);
    fill(0);
    textFont(futrfw);
    if (gamemode==1){
      text("NEW GAME", 18, 300);
      text("HIGH SCORES", 18, 400);
      text("SCORE:",18,50);
      text(str(score),206,50);
    }
    if (gamemode==3){
      for(int sfl=0;sfl<5;sfl++){
        text(hiscores[sfl], 300, 500-(sfl*100));
        text(hinames[sfl], 100, 500-(sfl*100));
      }
      text("BACK", 18, 582);
    }
    if (gamemode==4){
      text("NEW HIGH SCORE!", 65, 100);
      text("TYPE INITIALS", 95, 175);
      text("AND CLICK DONE", 80, 225);
      noFill();
      rect(200,260,200,80);
      fill(0);
      text("DONE", 237, 400);
      text(join(initials,""),250,310);
    }
    line(mouseX,mouseY-10,mouseX,mouseY+10);
    line(mouseX-10,mouseY,mouseX+10,mouseY);

  }
  if (gamemode==2){
    
    //BULLET CREATION--------------------------------------------------------------------------------------------------------------------
      if (active==1){  
      for (float ss=-sidespray;ss<sidespray+1;ss++){
        if ((firing==1)&&(firecount==0)){   //if LMB pressedand ok to fire
          bax[bcount]=0;
          bay[bcount]=0;
          bvx[bcount]=-sin(r+ss*.25)*10;               //initial bullet x speed
          bvy[bcount]=-cos(r+ss*.25)*10;               //initial bullet y speed
          bpx[bcount]=px; 
          bpy[bcount]=py;       //initial bullet position=ship position
          bactive[bcount]=1;
          bcount++;                             //increase array index for next bullet
          bcount%=bmax;                         //if max index exceeded, restart
          vx+=recoil*sin(r);
          vy+=recoil*cos(r);        //recoil
          firecount=firerate;
          //player.play();      
        }
        if ((firing==2)&&(firecount==0)){
          bax[bcount]=0;
          bay[bcount]=0;
          bax[(bcount+1)%bmax]=0;
          bay[(bcount+1)%bmax]=0;
          bvx[bcount]=-sin(r+ss*.25)*10; 
          bvx[(bcount+1)%bmax]=-sin(r+ss*.25)*10;    
          bvy[bcount]=-cos(r+ss*.25)*10; 
          bvy[(bcount+1)%bmax]=-cos(r+ss*.25)*10;           
          bpx[bcount]=px+sin(r+PI*.5)*5; 
          bpy[bcount]=py+cos(r+PI*.5)*5;                       //initial bullet position=ship position
          bpx[(bcount+1)%bmax]=px+sin(r-PI*.5)*5; 
          bpy[(bcount+1)%bmax]=py+cos(r-PI*.5)*5;     //initial bullet position=ship position
          bactive[bcount]=1;
          bactive[(bcount+1)%bmax]=1;
          bcount+=2;                             //increase array index for next bullet
          bcount%=bmax;                         //if max index exceeded, restart
          vx+=recoil*sin(r);
          vy+=recoil*cos(r);        //recoil
          firecount=firerate;
        }
        if ((firing==3)&&(firecount==0)){
          bax[bcount]=0;
          bay[bcount]=0;
          bvx[bcount]=-sin(r+ss*.25+random(-.2,.2))*10;               //initial bullet x speed
          bvy[bcount]=-cos(r+ss*.25+random(-.2,.2))*10;               //initial bullet y speed
          bpx[bcount]=px; 
          bpy[bcount]=py;       //initial bullet position=ship position
          bactive[bcount]=1;
          bcount++;                             //increase array index for next bullet
          bcount%=bmax;                         //if max index exceeded, restart
          vx+=(recoil/3)*sin(r);
          vy+=(recoil/3)*cos(r);        //recoil
          firecount=firerate/3;
        }
        if (firecount>0){
          firecount--;
        }
      }

      if ((spesh==1)&&(speshcount==0)){
        int bfl;
        for(bfl=0;bfl<64;bfl++){
          float bflf=bfl;
          bax[(bcount+bfl)%bmax]=0;               
          bay[(bcount+bfl)%bmax]=0;
          bvx[(bcount+bfl)%bmax]=vx*.5+10*sin((bflf/64)*2*PI);               
          bvy[(bcount+bfl)%bmax]=vy*.5+10*cos((bflf/64)*2*PI);
          bpx[(bcount+bfl)%bmax]=px; 
          bpy[(bcount+bfl)%bmax]=py;
          bactive[(bcount+bfl)%bmax]=1;
        }
        bcount=(bcount+bfl)%bmax;
        speshcount=speshrate; 
      }
      if ((spesh==2)&&(speshcount==0)){
        int bfl;
        for(bfl=0;bfl<64;bfl++){
          float bflf=bfl;
          bax[(bcount+bfl)%bmax]=-0.1*sin((bflf/64)*2*PI+.05);               
          bay[(bcount+bfl)%bmax]=-0.1*cos((bflf/64)*2*PI+.05);
          bvx[(bcount+bfl)%bmax]=6*sin((bflf/64)*2*PI);               
          bvy[(bcount+bfl)%bmax]=6*cos((bflf/64)*2*PI);
          bpx[(bcount+bfl)%bmax]=px; 
          bpy[(bcount+bfl)%bmax]=py;
          bactive[(bcount+bfl)%bmax]=1;
        }
        bcount=(bcount+bfl)%bmax;
        speshcount=speshrate; 
      }
      if ((spesh==3)&&(speshcount==0)){
        int bfl=0;
        for (int efl=0;efl<emax;efl++){                                            //check all enemies
          if (eactive[efl]==1){                                 
            for(bfl=0;bfl<10;bfl++){
              bax[(bcount+bfl)%bmax]=0;               
              bay[(bcount+bfl)%bmax]=0;          
              bvx[(bcount+bfl)%bmax]=-25*sin(atan2((px-epx[efl]),(py-epy[efl]))+0.1-bfl*0.02);
              bvy[(bcount+bfl)%bmax]=-25*cos(atan2((px-epx[efl]),(py-epy[efl]))+0.1-bfl*0.02);
              bpx[(bcount+bfl)%bmax]=px;
              bpy[(bcount+bfl)%bmax]=py;
              bactive[(bcount+bfl)%bmax]=1;
            }
          }
          bcount=(bcount+bfl)%bmax;
        }
        speshcount=speshrate; 
      }
      if (speshcount>0){
        speshcount--;
      }

      //ENEMY CREATION---------------------------------------------------------------------------------------------------------------------
        int rxy;
      if (spawnE==1){
        rxy=round(random(1));
        epx[ecount]=rxy*round(random(1))*sizea+abs(rxy-1)*random(0,sizea);
        epy[ecount]=abs(rxy-1)*round(random(1))*sizea+rxy*random(0,sizea);
        evx[ecount]=random(-5,5);
        evy[ecount]=random(-5,5);
        eax[ecount]=0;
        eay[ecount]=0;
        ehealth[ecount]=3;
        eradius[ecount]=10;
        eactive[ecount]=1;
        etype[ecount]=1;
        spawnE=0;
        ecount++;
        ecount%=emax;                         
      }
      if (spawnE==2){
        rxy=round(random(1));
        epx[ecount]=rxy*round(random(1))*sizea+abs(rxy-1)*random(0,sizea);
        epy[ecount]=abs(rxy-1)*round(random(1))*sizea+rxy*random(0,sizea);
        evx[ecount]=0;
        evy[ecount]=0;
        eax[ecount]=0;
        eay[ecount]=0;
        ehealth[ecount]=9;
        eradius[ecount]=20;
        eactive[ecount]=1;
        etype[ecount]=2;
        spawnE=0;
        ecount++;
        ecount%=emax;                         
      }
      if (spawnE==3){
        rxy=round(random(1));
        epx[ecount]=rxy*round(random(1))*sizea+abs(rxy-1)*random(0,sizea);
        epy[ecount]=abs(rxy-1)*round(random(1))*sizea+rxy*random(0,sizea);
        evx[ecount]=0;
        evy[ecount]=0;
        eax[ecount]=0;
        eay[ecount]=0;
        ehealth[ecount]=6;
        eradius[ecount]=15;
        eactive[ecount]=1;
        etype[ecount]=3;
        spawnE=0;
        ecount++;
        ecount%=emax;                         
      }
      if (spawnE==4){
        rxy=round(random(1));
        epx[ecount]=rxy*round(random(1))*sizea+abs(rxy-1)*random(0,sizea);
        epy[ecount]=abs(rxy-1)*round(random(1))*sizea+rxy*random(0,sizea);
        evx[ecount]=0;
        evy[ecount]=0;
        eax[ecount]=0;
        eay[ecount]=0;
        ehealth[ecount]=12;
        eradius[ecount]=10+ehealth[ecount]*2;
        eactive[ecount]=1;
        etype[ecount]=4;
        spawnE=0;
        ecount++;
        ecount%=emax;   
      }
      if (spawnE==5){
        rxy=round(random(1));
        epx[ecount]=rxy*round(random(1))*sizea+abs(rxy-1)*random(0,sizea);
        epy[ecount]=abs(rxy-1)*round(random(1))*sizea+rxy*random(0,sizea);
        evx[ecount]=0;
        evy[ecount]=0;
        eax[ecount]=0;
        eay[ecount]=0;
        ehealth[ecount]=6;
        eradius[ecount]=15;
        eactive[ecount]=1;
        etype[ecount]=5;
        spawnE=0;
        ecount++;
        ecount%=emax;   
      }
      if (spawnE==6){
        rxy=round(random(1));
        epx[ecount]=rxy*round(random(1))*sizea+abs(rxy-1)*random(0,sizea);
        epy[ecount]=abs(rxy-1)*round(random(1))*sizea+rxy*random(0,sizea);
        evx[ecount]=random(-2.5,2.5);
        evy[ecount]=random(-2.5,2.5);
        eax[ecount]=0;
        eay[ecount]=0;
        ehealth[ecount]=24;
        eradius[ecount]=30;
        eactive[ecount]=1;
        etype[ecount]=6;
        spawnE=0;
        ecount++;
        ecount%=emax;   
      }  

      //POWERUP CREATION-------------------------------------------------------------------------------------------------------------------
        if (spawnP!=0){
        rxy=round(random(1));
        ppx[pcount]=rxy*round(random(1))*sizea+abs(rxy-1)*random(0,sizea);
        ppy[pcount]=abs(rxy-1)*round(random(1))*sizea+rxy*random(0,sizea);
        pvx[pcount]=random(-2.5,2.5);
        pvy[pcount]=random(-2.5,2.5);
        pax[pcount]=0;
        pay[pcount]=0;
        pactive[pcount]=1;
        if (spawnP==1){ptype[pcount]=1;}
        if (spawnP==2){ptype[pcount]=2;}
        if (spawnP==3){ptype[pcount]=3;}
        if (spawnP==4){ ptype[pcount]=4;}
        if (spawnP==5){ ptype[pcount]=5;}
        if (spawnP==6){ptype[pcount]=6;}
        if (spawnP==7){ptype[pcount]=7;}
        if (spawnP==8){ptype[pcount]=8;}
        if (spawnP==9){ptype[pcount]=9;}
        if (spawnP==10){ptype[pcount]=10;}
        if (spawnP==11){ptype[pcount]=11;}
        spawnP=0;
        pcount++;
        pcount%=pmax;                         
      }

      //UPDATE SHIP POSITION---------------------------------------------------------------------------------------------------------------

        r=atan2(px-mouseX,py-mouseY); //update rotation: rotation from mouse
      vx+=ax; 
      vx*=bv; 
      px+=vx;       //update pos x: a from keypressed             
      vy+=ay+gravity*.75; 
      vy*=bv; 
      py+=vy;       //update pos y: a from keypressed 
      if(px>sizea-ts){
        px=sizea-ts;
        vx*=cfb;
      }
      if(py>sizea-ts){
        py=sizea-ts;
        vy*=cfb;
      } //collision rules
      if(px<ts){
        px=ts;
        vx*=cfb;
      }
      if(py<ts){
        py=ts;
        vy*=cfb;
      }                 //collision rules
    }

    //UPDATE AND DRAW POWERUPS-----------------------------------------------------------------------------------------------------------
      for (int pfl=0;pfl<pmax;pfl++){                                                  //for each bullet
      if (pactive[pfl]==1){
        pvx[pfl]+=pax[pfl];
        ppx[pfl]+=pvx[pfl];
        pvy[pfl]+=pay[pfl]+gravity;
        ppy[pfl]+=pvy[pfl];
        if(ppx[pfl]>sizea-pradius){
          ppx[pfl]=sizea-pradius;
          pvx[pfl]*=cfb;
        }
        if(ppy[pfl]>sizea-pradius){
          ppy[pfl]=sizea-pradius;
          pvy[pfl]*=cfb;
        } 
        if(ppx[pfl]<pradius)      {
          ppx[pfl]=pradius;      
          pvx[pfl]*=cfb;
        }
        if(ppy[pfl]<pradius)      {
          ppy[pfl]=pradius;      
          pvy[pfl]*=cfb;
        }

        fill(0);
        ellipse(ppx[pfl],ppy[pfl],pradius*2,pradius*2);
        fill(255);
        strokeWeight(3);
        stroke(255);
        if(ptype[pfl]==4){
          point(ppx[pfl]-10,ppy[pfl]+4);
          point(ppx[pfl],ppy[pfl]+2);
          point(ppx[pfl]+10,ppy[pfl]);
          point(ppx[pfl],ppy[pfl]-2);
          point(ppx[pfl]-10,ppy[pfl]-4);
        }
        if(ptype[pfl]==3){
          point(ppx[pfl]-10,ppy[pfl]);
          point(ppx[pfl],ppy[pfl]);
          point(ppx[pfl]+5,ppy[pfl]);
          point(ppx[pfl]+7.5,ppy[pfl]);
          point(ppx[pfl]+8.75,ppy[pfl]);
        }
        if(ptype[pfl]==1){
          line(ppx[pfl],ppy[pfl]-10,ppx[pfl]+0,ppy[pfl]+10);
          line(ppx[pfl]-5,ppy[pfl]+5,ppx[pfl],ppy[pfl]+10);
          line(ppx[pfl]+5,ppy[pfl]+5,ppx[pfl],ppy[pfl]+10);
        }
        if(ptype[pfl]==8){
          line(ppx[pfl],ppy[pfl]-10,ppx[pfl]+0,ppy[pfl]+10);
          line(ppx[pfl]-5,ppy[pfl]-5,ppx[pfl],ppy[pfl]-10);
          line(ppx[pfl]+5,ppy[pfl]-5,ppx[pfl],ppy[pfl]-10);
        }
        if(ptype[pfl]==6){
          point(ppx[pfl]-10,ppy[pfl]);
          point(ppx[pfl],ppy[pfl]);
          point(ppx[pfl],ppy[pfl]+3);
          point(ppx[pfl],ppy[pfl]-3);
          point(ppx[pfl]+10,ppy[pfl]);
          point(ppx[pfl]+10,ppy[pfl]+6);
          point(ppx[pfl]+10,ppy[pfl]-6);
        }
        if(ptype[pfl]==5){
          point(ppx[pfl]-6,ppy[pfl]+5);
          point(ppx[pfl]-3,ppy[pfl]-1);
          point(ppx[pfl],ppy[pfl]-3);
          point(ppx[pfl]+3,ppy[pfl]-1);
          line(ppx[pfl]+3,ppy[pfl]+3,ppx[pfl]+8,ppy[pfl]+8);
          line(ppx[pfl]+3,ppy[pfl]+8,ppx[pfl]+8,ppy[pfl]+3);
        }
        if(ptype[pfl]==2){
          point(ppx[pfl]-10,ppy[pfl]);
          point(ppx[pfl]-5,ppy[pfl]);
          point(ppx[pfl]+5,ppy[pfl]);
          point(ppx[pfl]+10,ppy[pfl]);
          line(ppx[pfl]-3,ppy[pfl]-3,ppx[pfl]+3,ppy[pfl]+3);
          line(ppx[pfl]-3,ppy[pfl]+3,ppx[pfl]+3,ppy[pfl]-3);
        }
        if(ptype[pfl]==7){
          line(ppx[pfl]-10,ppy[pfl],ppx[pfl]+10,ppy[pfl]);
          line(ppx[pfl],ppy[pfl]-10,ppx[pfl],ppy[pfl]+10);
        }
        if((ptype[pfl]==9)||(ptype[pfl]==10)||(ptype[pfl]==11)){
          triangle(ppx[pfl]+10,ppy[pfl],ppx[pfl]-10,ppy[pfl]+4,ppx[pfl]-10,ppy[pfl]-4);
        }
        fill(0);
        strokeWeight(1);
        stroke(0);
      }
    }
    //UPDATE AND DRAW BULLETS------------------------------------------------------------------------------------------------------------
    
      fill(0);                                 //color of bullets
    for (int bfl=0;bfl<bmax;bfl++){                                                  //for each bullet
      if (bactive[bfl]==1){                                                          //that is active:

        if (homing==1){
          float sedist=1000;
          int sedisti=0;  
          for (int efl=0;efl<emax;efl++){                                            //check all enemies
            if (eactive[efl]==1){                                                //that are active
              float edist=sqrt(pow(epx[efl]-bpx[bfl],2)+pow(epy[efl]-bpy[bfl],2));   //
              if (edist<sedist){
                sedist=edist;
                sedisti=efl;
              }                           //for which is nearest
            }
          }
          if (sedist!=1000){
            bax[bfl]=-(1/.9)*sin(atan2((bpx[bfl]-epx[sedisti]),(bpy[bfl]-epy[sedisti])));
            bay[bfl]=-(1/.9)*cos(atan2((bpx[bfl]-epx[sedisti]),(bpy[bfl]-epy[sedisti])))+gravity;
            bvx[bfl]*=.9;
            bvy[bfl]*=.9;
          }
          else{
            bax[bfl]=0;      //problem here for special 2, resets accels to 0 when it shouldn't
            bay[bfl]=0+gravity;
          }
        }
        
        

        bvx[bfl]+=bax[bfl];
        bpx[bfl]+=bvx[bfl];
        bvx[bfl]*=afb;
        bvy[bfl]+=bay[bfl]+gravity;
        bpy[bfl]+=bvy[bfl];
        bvy[bfl]*=afb;

        if (bounce==1){
          if(bpx[bfl]>sizea){
            bpx[bfl]=sizea;
            bvx[bfl]*=cfb;
          }
          if(bpy[bfl]>sizea){
            bpy[bfl]=sizea;
            bvy[bfl]*=cfb;
          } //collision rules
          if(bpx[bfl]<0){
            bpx[bfl]=0;
            bvx[bfl]*=cfb;
          }
          if(bpy[bfl]<0){
            bpy[bfl]=0;
            bvy[bfl]*=cfb;
          }    
        }
        else{
          if(bpx[bfl]>sizea){
            bactive[bfl]=0;
          }
          if(bpy[bfl]>sizea){
            bactive[bfl]=0;
          } //collision rules
          if(bpx[bfl]<0){
            bactive[bfl]=0;
          }
          if(bpy[bfl]<0){
            bactive[bfl]=0;
          }      
        }
        strokeWeight(5);
        point(bpx[bfl],bpy[bfl]);          //and draw them
        strokeWeight(1);
        //line(bpx[bfl],bpy[bfl],bpx[abs(bfl-1)],bpy[abs(bfl-1)]);line(bpx[bfl],bpy[bfl],px,py);  //fun to look at
      }
    }

    //UPDATE AND DRAW ENEMIES------------------------------------------------------------------------------------------------------------
      for (int efl=0;efl<emax;efl++){
      if (eactive[efl]==1){
        float sat=sin(atan2((epx[efl]-px),(epy[efl]-py)));
        float cat=cos(atan2((epx[efl]-px),(epy[efl]-py)));
        if (etype[efl]==1){
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl]+gravity;
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==2){
          eax[efl]=-.1*sat;
          eay[efl]=-.1*cat;
          evx[efl]*=0.95;
          evy[efl]*=0.95;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl]+gravity;
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==3){
          eax[efl]=-.1*sat;
          eay[efl]=-.1*cat;
          evx[efl]*=0.99;
          evy[efl]*=0.99;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl]+gravity;
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==4){
          eax[efl]=-.01*sat;
          eay[efl]=-.01*cat;
          evx[efl]*=0.99;
          evy[efl]*=0.99;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl]+gravity;
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==41){
          eax[efl]=-.1*sat;
          eay[efl]=-.1*cat;
          evx[efl]*=0.99;
          evy[efl]*=0.99;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl]+gravity;
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==5){
          eax[efl]=-.1*sat;
          eay[efl]=-.1*cat;
          evx[efl]*=0.99;
          evy[efl]*=0.99;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl]+gravity;
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==51){
          eax[efl]=-.1*sat;
          eay[efl]=-.1*cat;
          evx[efl]*=0.99;
          evy[efl]*=0.99;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl]+gravity;
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==52){
          eax[efl]=-.1*sat;
          eay[efl]=-.1*cat;
          evx[efl]*=0.99;
          evy[efl]*=0.99;
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl]+gravity;
          epy[efl]+=evy[efl];
        }
        if (etype[efl]==6){
          evx[efl]+=eax[efl];
          epx[efl]+=evx[efl];
          evy[efl]+=eay[efl]+gravity;
          epy[efl]+=evy[efl];
          if (efirecount==0){
            epx[ecount]=epx[efl];
            epy[ecount]=epy[efl];
            evx[ecount]=10*sin(random(1)*2*PI);
            evy[ecount]=10*cos(random(1)*2*PI);
            eax[ecount]=0;
            eay[ecount]=0;
            ehealth[ecount]=2;
            eradius[ecount]=5;
            eactive[ecount]=1;
            etype[ecount]=41;
            ecount++;
            ecount%=emax;
            efirecount=60;
          }
          if (efirecount>0){
            efirecount--;
          }
        }


        //ENEMY WALL COLLISION RULES---------------------------------------------------------------------------------------------------------
          if(epx[efl]>sizea-eradius[efl]){
          epx[efl]=sizea-eradius[efl];
          evx[efl]*=cfb;
        }
        if(epy[efl]>sizea-eradius[efl]){
          epy[efl]=sizea-eradius[efl];
          evy[efl]*=cfb;
        } 
        if(epx[efl]<eradius[efl]){
          epx[efl]=eradius[efl];
          evx[efl]*=cfb;
        }
        if(epy[efl]<eradius[efl]){
          epy[efl]=eradius[efl];
          evy[efl]*=cfb;
        }

        //BULLET COLLISIONS WITH ENEMIES-----------------------------------------------------------------------------------------------------

          fill(255,127);
        for (int bfl=0;bfl<bmax;bfl++){        
          if (bactive[bfl]==1){
            if(sqrt(pow(epx[efl]-bpx[bfl],2)+pow(epy[efl]-bpy[bfl],2))<eradius[efl]+hitbox){        
              ehealth[efl]-=1;
              if (invulnb!=1){
                bactive[bfl]=0;
              }
              if (etype[efl]==4){
                eradius[efl]=10+ehealth[efl]*2;
              }
              fill(0);
            }
          }
        }
        if (ehealth[efl]<0){         //enemy death rules here
          eactive[efl]=0;            //switch off enemy  
          if (etype[efl]==1){
            score+=30;
          }  
          if (etype[efl]==2){
            score+=40;
          }   
          if (etype[efl]==3){
            score+=50;
          }       
          if (etype[efl]==4){        //special rules for blimp
            int swarmcount=0;
            while(swarmcount<16){
              epx[ecount]=epx[efl];
              epy[ecount]=epy[efl];
              evx[ecount]=10*sin(random(1)*2*PI);
              evy[ecount]=10*cos(random(1)*2*PI);
              eax[ecount]=0;
              eay[ecount]=0;
              ehealth[ecount]=2;
              eradius[ecount]=5;
              eactive[ecount]=1;
              etype[ecount]=41;
              swarmcount++;
              ecount++;
              ecount%=emax;
            }
            score+=40;
          }
          if (etype[efl]==41){
            score+=10;
          }
          if (etype[efl]==5){        //special rules for doubler
            int swarmcount=0;
            while(swarmcount<2){
              epx[ecount]=epx[efl];
              epy[ecount]=epy[efl];
              evx[ecount]=5*sin(PI*(swarmcount-.5)+atan2((epx[efl]-px),(epy[efl]-py)));
              evy[ecount]=5*cos(PI*(swarmcount-.5)+atan2((epx[efl]-px),(epy[efl]-py)));
              eax[ecount]=0;
              eay[ecount]=0;
              ehealth[ecount]=6;
              eradius[ecount]=15;
              eactive[ecount]=1;
              etype[ecount]=51;
              swarmcount++;
              ecount++;
              ecount%=emax;
            }
            score+=50;
          }
          if (etype[efl]==51){        //special rules for doubler
            int swarmcount=0;
            while(swarmcount<2){
              epx[ecount]=epx[efl];
              epy[ecount]=epy[efl];
              evx[ecount]=5*sin(PI*(swarmcount-.5)+atan2((epx[efl]-px),(epy[efl]-py)));
              evy[ecount]=5*cos(PI*(swarmcount-.5)+atan2((epx[efl]-px),(epy[efl]-py)));
              eax[ecount]=0;
              eay[ecount]=0;
              ehealth[ecount]=6;
              eradius[ecount]=15;
              eactive[ecount]=1;
              etype[ecount]=52;
              swarmcount++;
              ecount++;
              ecount%=emax;   
            }
            score+=50;
          }
          if (etype[efl]==52){
            score+=50;
          }
          if (etype[efl]==6){
            score+=100;
          }
        }
        //DRAW VARIOUS ENEMIES, STARTING WITH A CIRCLE---------------------------------------------------------------------------------------

          ellipse(epx[efl],epy[efl],eradius[efl]*2,eradius[efl]*2);                                     
        if(etype[efl]==2){
          line(epx[efl]+eradius[efl],epy[efl],epx[efl]-eradius[efl],epy[efl]);
        }
        if(etype[efl]==3){
          line(epx[efl]+eradius[efl],epy[efl],epx[efl]-eradius[efl],epy[efl]);
          line(epx[efl],epy[efl]+eradius[efl],epx[efl],epy[efl]-eradius[efl]);
        }
        if(etype[efl]==4){
          for(float inners=0;inners<16;inners++){
            ellipse(epx[efl]+eradius[efl]*sin((inners/16)*2*PI),epy[efl]+eradius[efl]*cos((inners/16)*2*PI),10,10);
          }
        }
        if(etype[efl]==5||etype[efl]==51||etype[efl]==52){
          ellipse(epx[efl],epy[efl],eradius[efl],eradius[efl]);
        }
        if(etype[efl]==6){
          ellipse(epx[efl],epy[efl],10,10);
        }
      }
    }

    //EVALUATE SHIP HEALTH---------------------------------------------------------------------------------------------------------------

      fill(255);
    for (int efl=0;efl<emax;efl++){
      if (eactive[efl]==1){
        if(sqrt(pow(epx[efl]-px,2)+pow(epy[efl]-py,2))<eradius[efl]+ts){                //ENEMY COLLISIONS WITH SHIP-------------------------------------------------------------------------------------
          if(active==1){
            health-=1;
          }
          fill(255,0,0);
        }
      }
    }
    for (int pfl=0;pfl<pmax;pfl++){
      if (pactive[pfl]==1){
        if(sqrt(pow(ppx[pfl]-px,2)+pow(ppy[pfl]-py,2))<pradius+ts){                //POWERUP COLLISIONS WITH SHIP-------------------------------------------------------------------------------------
          pactive[pfl]=0;
          if (ptype[pfl]==4){bounce=1;}    //weighting positions
          if (ptype[pfl]==3){afb=0.96;}
          if (ptype[pfl]==1){gravity=10/fr;} 
          if (ptype[pfl]==8){gravity=-10/fr;}  
          if (ptype[pfl]==6){sidespray=2;}
          if (ptype[pfl]==5){homing=1;}
          if (ptype[pfl]==2){invulnb=1;}
          
          if (ptype[pfl]!=7){powerups[int(ptype[pfl])-1]=powrate;}
          if (ptype[pfl]==7){
            health+=50;
            if(health>100){
              health=100;
            }
          }
          if (ptype[pfl]==9){
            firerate-=3;
            speshrate=100*firerate;
            if(firerate<3){firerate=3;speshrate=100*firerate;}
          } 
          if (ptype[pfl]==10){
            speed+=3;
            if(speed>15){speed=15;}
          }
          if (ptype[pfl]==11){
            recoil-=0.05;
            if(recoil<0.01){recoil=0.01;}
          }    
        }
      }
    }
    for (int pfl=0;pfl<8;pfl++){
      if (powerups[pfl]>0){
        powerups[pfl]--;
      }
      if (powerups[pfl]==1){
        if (pfl==3){bounce=0;}
        if (pfl==2){afb=1;}
        if (pfl==0){gravity=0;} 
        if (pfl==7){gravity=0;}  
        if (pfl==5){sidespray=0;}
        if (pfl==4){homing=0;for (int bfl=0;bfl<bmax;bfl++){if (bactive[bfl]==1){bax[bfl]=0;bay[bfl]=0+gravity;}}}
        if (pfl==1){invulnb=0;}
      }
    }
    if(health<0){                                                           //DEATH RULES HERE--------------------------------------------------------
      active=0;
      lives-=1;
      deathcount=120;
      health=0;
      int bfl;
      for(bfl=0;bfl<64;bfl++){
        float bflf=bfl;
        bax[(bcount+bfl)%bmax]=0;
        bay[(bcount+bfl)%bmax]=0;
        bvx[(bcount+bfl)%bmax]=vx*.5+10*sin((bflf/64)*2*PI);
        bvy[(bcount+bfl)%bmax]=vy*.5+10*cos((bflf/64)*2*PI);
        bpx[(bcount+bfl)%bmax]=px; 
        bpy[(bcount+bfl)%bmax]=py;
        bactive[(bcount+bfl)%bmax]=1;
      }
      bcount=(bcount+bfl)%bmax;
    } 
    if (deathcount>0){
      deathcount--;
    }

    if (deathcount==1){
      active=1;
      health=100;
      px=sizea/2;
      py=sizea/2;
      vx=0;
      vy=0;
      if (lives<1){                  //GAME OVER HERE
        gamemode=1;lives=3;
        homing=1;bounce=1;invulnb=1;sidespray=0;afb=1;gravity=0;
        firing=1;
        maxweapon=1;weapon=1;special=1;
        firerate=9;speed=9;recoil=0.11;speshrate=100*firerate;      
        
        int[] temp;
        temp=append(hiscores,score);
        temp=subset(sort(temp),1);
        int scorefound=0;int i=0;
        while((scorefound==0)&&(i<5)){
          if(hiscores[i]!=temp[i]){
            scorefound=1;
            hiscores=temp;
            gamemode=4;
          }
          i++;
        }
        
        for (int pfl=0;pfl<8;pfl++){
          powerups[pfl]=1;
        }                          //deactivate all active effects on game over, but not on death
      }
      for (int efl=0;efl<emax;efl++){
        if (eactive[efl]==1){
          eactive[efl]=0;
        }
      }    //deactivate all enemies
      for (int bfl=0;bfl<bmax;bfl++){
        if (bactive[bfl]==1){
          bactive[bfl]=0;
        }
      }    //deactivate all bullets
      for (int pfl=0;pfl<pmax;pfl++){
        if (pactive[pfl]==1){
          pactive[pfl]=0;
        }
      }    //deactivate all powerups
    }  

    //DRAW SHIP--------------------------------------------------------------------------------------------------------------------------
      if (active==1){
      ellipse(px,py,ts*2,ts*2);
      fill(0);
      triangle(px+ts*sin(r+PI*.125),py+ts*cos(r+PI*.125),px+ts*sin(r+PI),py+ts*cos(r+PI),px+ts*sin(r-PI*.125),py+ts*cos(r-PI*.125));
      stroke(0);
    }
    strokeWeight(2);
    stroke(0,127);
    line(mouseX,mouseY-10,mouseX,mouseY+10);
    line(mouseX-10,mouseY,mouseX+10,mouseY);                          //crosshair
    strokeWeight(5);
    stroke(255,0,0,127);
    line(10,10,10+health*0.005*(sizea-40),10);                                            //health bar
    stroke(0,0,255,127);
    line(10,15,(sizea-20)*.5-(sizea-40)*.5*float(speshcount)/float(speshrate),15);   //special charge bar
    stroke(0,127);
    line(10,10,10,15);
    line((sizea-20)*.5,10,(sizea-20)*.5,15);
    stroke(0,255,0,127);
    float powdraw=0;
    for(int pfl=0;pfl<8;pfl++){
      if(powerups[pfl]!=0){
        line(sizea-10,10+5*powdraw,sizea-10-powerups[pfl]*(sizea-40)*.5/powrate,10+5*powdraw);
        powdraw++;
      }  
    }
    if(powdraw!=0){
      stroke(0,127);
      line(sizea-10,10,sizea-10,10+5*(powdraw-1));
      line((sizea+20)*.5,10,(sizea+20)*.5,10+5*(powdraw-1));
    }
    strokeWeight(1);
    stroke(0);
    fill(0,127);
    text(str(score), 2, 50);
    stroke(0,127);
    for (int lifedraw=0;lifedraw<lives;lifedraw++){
      fill(255,127);
      ellipse(15+lifedraw*20,60,10,10);
      fill(0,127);
      triangle(15+lifedraw*20,55,13+lifedraw*20,65,17+lifedraw*20,65);
    }
    fill(0);
    stroke(0);

    //AUTOMATIC GENERATION OF POWERUPS AND ENEMIES BASED ON SCORE
    float levelchange=level;
    level=1+ceil(score/500);
    if(levelchange!=level){
      if (level==8){weapon=2;special=2;maxweapon=2;if(firing!=0){firing=2;}}
      if (level==10){spawnP=9;}if (level==13){spawnP=10;}if (level==16){spawnP=11;}
      if (level==20){weapon=3;special=3;maxweapon=3;if(spesh!=0){spesh=2;}}
      if (level==22){spawnP=9;}if (level==24){spawnP=10;}if (level==26){spawnP=11;}
      elevel=min(6,ceil(sqrt(level)-1)+1);
    }

    int enemies=0;
    for (int efl=0;efl<emax;efl++){
      if (eactive[efl]==1){
        enemies++;
      }
    }
    float echance=random(1);
    if (enemies<level+2){
      if (echance<(0.01+0.0005*elevel)){
        spawnE=round(random(1,elevel));
      }
    }
    int powers=0;
    for (int pfl=0;pfl<pmax;pfl++){
      if (pactive[pfl]==1){
        powers++;
      }
    }
    float pchance=random(1);
    if (powers<4){
      if (pchance<(0.001)){
        spawnP=round(random(1,5))+round(random(1,4))-1;
      }
    }
  }
}

//KEY CONTROL------------------------------------------------------------------------------------------------------------------------
void keyReleased(){
  if ((key=='w')||(key=='W')){ay=0;}              //if w pressed, y accel is -go
  if ((key=='s')||(key=='S')){ay=0;}               //if s pressed, y accel is go
  if ((key=='a')||(key=='A')){ax=0;}
  if ((key=='d')||(key=='D')){ax=0;}
}

void mouseReleased(){
  if (gamemode==2){
    if (mouseButton==LEFT){firing=0;}
    if (mouseButton==RIGHT){spesh=0;}
  }
}

void keyPressed(){
  if (key==' '){saveFrame("Screen######.tif");}
  if (gamemode==2){
    if ((key=='w')||(key=='W')){ay=-speed/fr;}              //if w pressed, y accel is -go
    if ((key=='s')||(key=='S')){ay=speed/fr;}               //if s pressed, y accel is go
    if ((key=='a')||(key=='A')){ax=-speed/fr;}
    if ((key=='d')||(key=='D')){ax=speed/fr;}
    if (key=='1'){weapon=1;if(firing!=0){firing=1;}}
    if (maxweapon>1){if (key=='2'){weapon=2;if(firing!=0){firing=2;}}}
    if (maxweapon>2){if (key=='3'){weapon=3;if(firing!=0){firing=3;}}}
    if (key=='4'){special=1;if(spesh!=0){spesh=1;}}
    if (maxweapon>1){if (key=='5'){special=2;if(spesh!=0){spesh=2;}}}
    if (maxweapon>2){if (key=='6'){special=3;if(spesh!=0){spesh=3;}}}
  }
  if (gamemode==4){
    initials[0]=initials[1];
    initials[1]=initials[2];
    initials[2]=str(key);
  }
}

void mousePressed(){
  if (mouseButton==LEFT){
    if (gamemode==2){
      firing=weapon;
    }
    if (gamemode==1){
      if ((mouseY<300)&&(mouseY>268)){
        gamemode=2;
        homing=0;
        bounce=0;
        invulnb=0;
        px=sizea*.5;
        py=sizea*.5;
        firing=0;
        score=0;
        for (int efl=0;efl<emax;efl++){
          if (eactive[efl]==1){
            eactive[efl]=0;
          }
        }          //deactivate all menu enemies
        for (int bfl=0;bfl<bmax;bfl++){
          if (bactive[bfl]==1){
            bactive[bfl]=0;
          }
        }          //deactivate all menu bullets
      }
      if ((mouseY<400)&&(mouseY>368)){
        gamemode=3;
      }
    }
    if (gamemode==3){
      if ((mouseY<582)&&(mouseY>550)){
        gamemode=1;
      }
    }
    if (gamemode==4){
      if ((mouseY<400)&&(mouseY>374)){
        String[] hisc=str(hiscores);
        //saveStrings("scores.dat", hisc);
        int i=0;int scorefound=0;
        while(scorefound==0){
          if (score==hiscores[i]){
            String name=join(initials,"");
            hinames=splice(hinames,name,i+1);
            hinames=subset(hinames,1);
            //saveStrings("names.dat", hinames);
            scorefound=1;
          }
          i++;
        }
        gamemode=1;
      }
    }
  }
  if (mouseButton==RIGHT){
    spesh=special;
  }
}

