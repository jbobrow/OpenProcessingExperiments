
PFont f;
String period="";
String semester="";
void setup(){
  size(300,170);
  f=loadFont("DialogInput-42.vlw");

}

void draw(){
  background(0,0,255);
  int h=hour();
  int m=minute();
  int s=second();
  int mnth=month();
  int d=day();
  int y=year();
  if(hour()>12){
    h=h-12;
  }
  fill(255);
  rect(10,10,280,150);
  fill(0,0,255);
  textFont(f,39);
  text("Time: "+h+":"+m+":"+s,12,45);
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
    text("Summer!",12,150);
    semester="0";
  }else{
    if(((mnth==1)&&(d<=27))||(mnth>=9)){
      semester="1";
    }else{
      semester="2";
    }
  //Period
    if(((h==8)&&(m>=55))||((h==9)&&(m<30))){
      period="1";
    }else{
      if(((h==9)&&(m>=35))||((h==10)&&(m<25))){
        period="2";
      }else{
        if(((h==10)&&(m>=30))||((h==11)&&(m<20))){
          period="3";
        }else{
          if(((h==11)&&(m>=25))||((h==12)&&(m<15))){
            period="4";
          }else{
            if(((h==12)&&(m>=55))||((h==13)&&(m<45))){
              period="5 (for first lunch)";
            }else{
              if(((h==12)&&(m>=20))||((h==13)&&(m<10))){
                period="5 (for second lunch)";
              }else{
                if(((h==13)&&(m>=50))||((h==14)&&(m<40))){
                  period="6";
                }else{
                  if(((h==14)&&(m>=45))||((h==15)&&(m<35))){
                    period="7";
                  }else{
                    //Out
                    if(h<=7){
                      text("School's Out!!!",12,150);
                      period="Out";
                    }else{
                      if(h==8){
                        if(m<=35){
                          text("School's Out",12,150);
                          period="Out";
                        }
                      }else{
                        if(h==15){
                          if(m>=35){
                            text("School's Out",12,150);
                            period="Out";
                          }
                        }else{
                          if(h>=16){
                            text("School's Out",12,150);
                            period="Out";
                          }else{
                            //Passing
                            period="Passing";
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
