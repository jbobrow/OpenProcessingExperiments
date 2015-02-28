

       /*==/          i     i          \==_
     /XX/            |\___/|            \XX\
   /XXXX\            |XXXXX|            /XXXX\
  |XXXXXX\_         _XXXXXXX_         _/XXXXXX|
 XXXXXXXXXXXxxxxxxxXXXXXXXXXXXxxxxxxxXXXXXXXXXXX
|XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
|XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|
 XXXXXX/^^^^"\XXXXXXXXXXXXXXXXXXXXX/^^^^^\XXXXXX
  |XXX|       \XXX/^^\XXXXX/^^\XXX/       |XXX|
    \XX\       \X/    \XXX/    \X/       /XX/
       "\       "      \X/      "      */
       

//Clock[] cl;
//Clock[] dl;
//int 
//import ddf.minim.*;AudioPlayer player;Minim minim;

  int w;
  DClock dc = new DClock();


float[][][] Font={ 
                 { {6,15},{6,0},{12,15},{6,45},{6,0},{12,45} },         //0
                 { {7.5,38},{7.5,38},{7.5,38},{6,30},{12,30},{12,0}},//1
                 { {3,15},{6,15},{12,15},{6,45},{12,45},{9,45}},//2
                 { {3,15},{3,15},{3,15},{6,45},{12,45},{12,45} },//3
                 { {6,30},{12,15},{7.5,38},{6,30},{12,45},{12,0} },//4
                 { {6,15},{12,15},{3,15},{9,45},{6,45},{12,45} },//5
                 { {6,15},{12,15},{3,0},{9,45},{6,45},{9,0} },//6
                 { {3,15},{7.5,38},{7.5,38},{6,45},{12,30},{12,0} },//7
                 { {6,15},{12,15},{12,15},{6,45},{12,45},{12,45} },//8
                 { {6,15},{12,15},{3,15},{6,45},{12,45},{12,45} },//9

                };
int count=-1;

void setup() {
 
  w=60;

  size(1000,400);
  
//minim=new Minim(this);
//player=minim.loadFile("paipai.mp3",1024);

  //clock[0]=new Clock();
}

void draw() {

  background(255); 
  fill(250); 
  if(count==-1){dc.cl[13].drawClock();}else dc.drawClock();
}

void mouseClicked() {
//player.play();

switch(count) {
      //normal
    case -1:{break;}
    case 0:{dc.changeMode(1);break;}
    case 2:{dc.setDay();break;}
    case 1:{dc.setYear();break;}
    default :{ dc.setTime();count=0;}

  }
  count++;
}

boolean cop(float x,float y,int a,float b){

//  x=x%a;
//  y=y%a;
  
  return ( (x+b)>y )&&( (x-b<y) );


}
class DClock {
  int x, y;
  float min, hou;
  int mode;
  Clock[] cl= new Clock[24];
  int w;

  DClock() {
    w=60;
    mode=0;
    for (int j=0;j<4;j++) {
      for (int i=0;i<3;i++) {
        cl[i+j*6]=new Clock(10+w+4*(w)*j, 10+w+2*(w)*i);
        cl[i+3+j*6]=new Clock(10+w*3+4*(w)*j, 10+w+2*(w)*i);
        // println(w);
      }
    }
  }
  void drawClock() {
    switch(mode) {
      //normal
    case 0:
      {
        for (int i=0;i<24;i++) {
          cl[i].drawClock();
        }
        break;
      }
    case 1:
      {


        for (int i=0;i<6;i++) {
          cl[i].setTime(Font[ int(hour()/10) ][i][0], Font[ int(hour()/10) ][i][1], 200);
          cl[i+6].setTime(Font[ int(hour()%10) ][i][0], Font[ int(hour()%10) ][i][1], 200);
          cl[i+12].setTime(Font[ int(minute()/10) ][i][0], Font[ int(minute()/10) ][i][1], 200);
          cl[i+18].setTime(Font[ int(minute()%10) ][i][0], Font[ int(minute()%10) ][i][1], 200);
        }
        //println(mode);

        for (int i=0;i<24;i++) {
          cl[i].drawClock();
        }

        break;
      }
    case 2:
      {
        for (int i=0;i<24;i++) {
          cl[i].drawClock();
        }
        if(this.min!=minute())this.mode=1;
        break;
      }
    }
  }
  void setDay() {
    for (int i=0;i<6;i++) {
      cl[i].setTime(Font[ int(month()/10) ][i][0], Font[ int(month()/10) ][i][1], 300);
      cl[i+6].setTime(Font[ int(month()%10) ][i][0], Font[ int(month()%10) ][i][1], 300);
      cl[i+12].setTime(Font[ int(day()/10) ][i][0], Font[ int(day()/10) ][i][1], 300);
      cl[i+18].setTime(Font[ int(day()%10) ][i][0], Font[ int(day()%10) ][i][1], 300);
    }
    
    this.mode=0;
  }
  void setYear() {
    for (int i=0;i<6;i++) {
      cl[i].setTime(Font[ int(year()/1000) ][i][0], Font[ int(year()/1000) ][i][1], 300);
      cl[i+6].setTime(Font[ int(year()%10/100) ][i][0], Font[ int(year()%10/100) ][i][1], 300);
      cl[i+12].setTime(Font[ int(year()/10%10) ][i][0], Font[ int(year()/10%10) ][i][1], 300);
      cl[i+18].setTime(Font[ int(year()%10) ][i][0], Font[ int(year()%10) ][i][1], 300);
    }
    
    this.mode=0;
  }
  void setTime() {
    for (int i=0;i<6;i++) {
      cl[i].setTime(Font[ int(hour()/10) ][i][0], Font[ int(hour()/10) ][i][1], 300);
      cl[i+6].setTime(Font[ int(hour()%10) ][i][0], Font[ int(hour()%10) ][i][1], 300);
      cl[i+12].setTime(Font[ int(minute()/10) ][i][0], Font[ int(minute()/10) ][i][1], 300);
      cl[i+18].setTime(Font[ int(minute()%10) ][i][0], Font[ int(minute()%10) ][i][1], 300);
    }
    this.min=minute();
    this.mode=2;
  }



  void changeMode(int mode) {
    for (int i=0;i<24;i++) {
      cl[i].mode=mode;
    }
    this.mode=mode;
  }


  void plus() {

    if (mouseButton == LEFT) {
      if (count>9)count=0;
      if (count<0)count=9;
      for (int i=0;i<6;i++) {
        cl[i].mode=1;
        cl[i].setTime(Font[count][i][0], Font[count][i][1], 200);
      }
      count++;
    }
    else {
      if (count>9)count=0;
      if (count<0)count=9;
      for (int i=0;i<6;i++) {
        cl[i].mode=1;
        cl[i].setTime(Font[count][i][0], Font[count][i][1], 50);
      }
      count--;
    }
  }
}

class Clock {

  int x, y;
  float min, hou, Dmin, Dhou, t, Xmin, Xhou;
  int mode;

  //0.normal 1.settime 2.random 中文

  Clock(int x, int y) {
    this.x=x;
    this.y=y;
    this.mode=1;
    this.min=int(random(60));
    this.hou=int(random(12));
    Xmin=random(3);
    Xhou=random(0.03);
    Dmin=-10;
    Dhou=-10;
    
  }

  void drawClock() {
    strokeWeight(2);
    //noStroke();
    stroke(150);
    rect(x-w, y-w, w*2, w*2, 10);
    stroke(100);
     for(int i=0;i<12;i++)
     line(cos(TWO_PI*(i)/12- HALF_PI) * w*0.8 + x, sin(TWO_PI*(i)/12- HALF_PI) * w*0.8 + y, cos(TWO_PI*(i)/12- HALF_PI) * w*0.9 + x, sin(TWO_PI*(i)/12- HALF_PI) * w*0.9 + y);


  stroke(0);
    //    ellipse(x, y, 160, 160); 
  
//println(w+"--------");
    strokeCap(PROJECT);
    strokeWeight( 10 );



    switch(mode) {
      //normal
    case 0:
      {
        
         //strokeWeight( 1 );
        //line(x, y, cos( TWO_PI*second()/60- HALF_PI) * w*0.9 + x, sin(TWO_PI*second()/60- HALF_PI) * w*0.9 + y);
         strokeWeight( 10 );
        line(x, y, cos( TWO_PI*minute()/60- HALF_PI) * w*0.8 + x, sin(TWO_PI*minute()/60- HALF_PI) * w*0.8 + y);
        line(x, y, cos(TWO_PI*(hour()%12)/12- HALF_PI) * w*0.7 + x, sin(TWO_PI*(hour()%12)/12- HALF_PI) * w*0.7 + y);

        break;
      }
      //settime
    case 1:
      {
        //orz(:◎)≡
      boolean O,M,G;
      O=cop(hou,Dhou,12,0.1);
      M=cop(min,Dmin,60,Xmin*10);
      G=cop(min,Dmin,60,0.5);
      if(O&&t!=200)hou=Dhou;
      
        if ( O && (M||G) ) {
          hou=Dhou;
          min=Dmin;
          line(x, y, cos( TWO_PI*Dmin/60- HALF_PI) * w*0.8 + x, sin(TWO_PI*Dmin/60- HALF_PI) * w*0.8 + y);
          line(x, y, cos( TWO_PI*(Dhou%12)/12- HALF_PI) * w*0.7 + x, sin(TWO_PI*(Dhou%12)/12- HALF_PI) * w*0.7 + y);
//player.close();
//minim.stop();
//super.stop();
//          println(min+"@"+Dmin);
        }
        else {

          if (hou>12)hou=hou-12;
          if (min>60)min=min-60;

          hou=hou+Xhou;
          min=min+Xmin;
          //         hou=Dhou;
          // <-hou  min-> 
          line(x, y, cos( TWO_PI*min/60- HALF_PI) * w*0.8 + x, sin(TWO_PI*min/60- HALF_PI) * w*0.8 + y);
          line(x, y, cos( TWO_PI*(hou%12)/12- HALF_PI) * w*0.7 + x, sin(TWO_PI*(hou%12)/12- HALF_PI) * w*0.7 + y);
// println(min+"-"+Dmin+"-"+Xmin);
//          println(hou+"-"+Dhou+"-"+Xhou);
//          println( (int(( (hou+0.2) %12)*10+0.2)+"+"+int((Dhou%12)*10)) );




          break;
        }
      }
      //random
    case 2:
      {
        
        break;
      }
    }
  }

  void setTime(float Dhou, float Dmin, float t) {
    this.Dmin=Dmin;
    this.Dhou=Dhou;
    this.t=t;
    if (Dhou<hou)Dhou=Dhou+12;
    Xhou=(Dhou-hou)/t;
    if (Dmin<min)Dmin=Dmin+60;
    Xmin=(Dmin-min+int(Dhou-hou)*60)/t;
    //if(Xmin<0.01)Xmin=0.01;
    //if(Xhou<0.01)Xhou=0.01;
    // println(Xmin);
  }
}



