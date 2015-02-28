
PFont f;
String period="";
String semester="";
int ht1=0;
int ht2=0;
void setup(){
  size(300,190);
  f=loadFont("DialogInput-42.vlw");

}

void draw(){
  background(0,0,255);
  int h=hour();
  int m=minute();
  int s=second();
  String hs=Integer.toString(h);
  String ms=Integer.toString(m);
  String ss=Integer.toString(s);
  int mnth=month();
  int d=day();
  int y=year();
  int hta=ht1+ht2;
  String htas=Integer.toString(hta);
  int st=60-s;
  String sts=Integer.toString(st);

  if(hour()>12){
    h=h-12;
  }
  fill(255);
  rect(10,10,280,170);
  fill(0,0,255);
  textFont(f,39);
  if(hta<10){
    htas="0"+htas;
  }
  if(st<10){
    sts="0"+sts;
  }
  if(h<10){
    hs="0"+h;
  }
  if(m<10){
    ms="0"+m;
  }
  if(s<10){
    ss="0"+s;
  }
  text("Time:"+hs+":"+ms+":"+ss,12,45);
  if(hour()>12){
    h=h+12;
  }
  textFont(f,20);
  text("Period:"+period,12,70);
  text("Semester:"+semester,12,110);
  text("Year:"+y,12,130);
  //Summer
  if(((mnth==6)&&(d>12))||((mnth>=7)&&(mnth<=8))||((mnth==9)&&(d<6))){
    period="Out";
    text("Summer!",12,170);
    hta=0;
    st=0;
  }else{
    if(((mnth==1)&&(d<=27))||(mnth>=9)){
      semester="1";
    }else{
      semester="2";
    }
  //Period
    if(((h==8)&&(m>=55))||((h==9)&&(m<30))){
      period="1";
      if(h==8){
        ht1=60-m;
        ht2=30;
      }
      if(h==9){
        ht1=0;
        ht2=30-m;
      }
    }else{
      if(((h==9)&&(m>=35))||((h==10)&&(m<25))){
        period="2";
        if(h==9){
          ht1=60-m;
          ht2=25;
        }
        if(h==10){
          ht1=0;
          ht2=25-m;
        }
      }else{
        if(((h==10)&&(m>=30))||((h==11)&&(m<20))){
          period="3";
          if(h==10){
            ht1=60-m;
            ht2=20;
          }
          if(h==11){
            ht1=0;
            ht2=20-m;
          }
        }else{
          if(((h==11)&&(m>=25))||((h==12)&&(m<15))){
            period="4";
            if(h==11){
              ht1=60-m;
              ht2=15;
            }
            if(h==12){
              ht1=0;
              ht2=15-m;
            }
          }else{
            if(((h==12)&&(m>=55))||((h==13)&&(m<45))){
              period="5 (for first lunch)";
            if(h==12){
              ht1=60-m;
              ht2=45;
            }
            if(h==13){
              ht1=0;
              ht2=45-m;
              if((m>=10)&&(m<15)){
                period="5 (for first lunch)/Passing";
              }
            }
            }else{
              if(((h==12)&&(m>=20))||((h==13)&&(m<10))){
                period="5 (for second lunch)";
                if(h==12){
                  ht1=60-m;
                  ht2=10;
                  if((m>=50)&&(m<55)){
                    period="5 (for second lunch)/Passing";
                  }
                }
                if(h==13){
                  ht1=0;
                  ht2=10-m;
                }
              }else{
                if(((h==13)&&(m>=50))||((h==14)&&(m<40))){
                  period="6";
                  if(h==13){
                    ht1=60-m;
                    ht2=40;
                  }
                  if(h==14){
                    ht1=0;
                    ht2=40-m;
                  }
                }else{
                  if(((h==14)&&(m>=45))||((h==15)&&(m<35))){
                    period="7";
                    if(h==14){
                      ht1=60-m;
                      ht2=35;
                    }
                    if(h==15){
                      ht1=0;
                      ht2=35-m;
                    }
                  }else{
                    //Out
                    if(h<=7){
                      text("School's Out!!!",12,170);
                      period="Out";
                      hta=0;
                      st=0;

                    }else{
                      if(h==8){
                        if(m<=35){
                          text("School's Out",12,170);
                          period="Out";
                          hta=0;
                          st=0;

                        }
                      }else{
                        if(h==15){
                          if(m>=35){
                            text("School's Out",12,170);
                            period="Out";
                            hta=0;
                            st=0;

                          }
                        }else{
                          if(h>=16){
                            text("School's Out",12,170);
                            period="Out";
                            hta=0;
                            st=0;

                          }else{
                          //Passing
                            period="Passing";
                            hta=0;
                            st=0;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  text("End of Period in:"+htas+":"+sts,12,150);

  //Meal
  if((h==8)&&((m<50)&&(m>=35))){
    text("Breakfast",12,90);
  }else{
    if((h==12)&&((m>=20)&&(m<50))){
      text("First Lunch",12,90);
    }else{
      if((h==13)&&((m<45)&&(m>=15))){
        text("Second Lunch",12,90);
      }else{
        text("No Meals Right Now",12,90);
      }
    }
  }
}


