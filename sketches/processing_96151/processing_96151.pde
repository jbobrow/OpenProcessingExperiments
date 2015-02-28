
PImage month;
PImage date;
PImage hour;
PImage minute;
PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PImage six;
PImage seven;
PImage eight;
PImage nine;
PImage ten;
PImage zero;
int mo = month();
int da = day();
int ho = hour();
int mi = minute();


void setup(){
  size(900, 600);
  month=loadImage("month.png");
  date=loadImage("date.png");
  hour=loadImage("hour.png");
  minute=loadImage("minute.png");
  one=loadImage("1.png");
  two=loadImage("2.png");
  three=loadImage("3.png");
  four=loadImage("4.png");
  five=loadImage("5.png");
  six=loadImage("6.png");
  seven=loadImage("7.png");
  eight=loadImage("8.png");
  nine=loadImage("9.png");
  ten=loadImage("10.png");
  zero=loadImage("0.png");
}
void draw(){
  background(225,225,225);
  strokeWeight(10);
  image(month, 240, height/5, 70, 70);
  image(date, 520, height/5, 70, 70);
  image(hour, 300, height/3, 120, 120);
  image(minute, 700, height/3, 120, 120);
  pushMatrix();
  noFill();
  ellipse(width/2, height, 500, 500);
  ellipse(width/2, height, 300, 300);
  ellipse(width/2,height,150,150);
  popMatrix();
  if(mo == 1){
    image(one, 170, height/5, 70, 70);
  }else if(mo == 2){
    image(two, 170, height/5, 70, 70);
  }else if(mo == 3){
    image(three, 170, height/5, 70, 70);
  }else if(mo == 4){
    image(four, 170, height/5, 70, 70);
  }else if(mo == 5){
    image(five, 170, height/5, 70, 70);
  }else if(mo == 6){
    image(six, 170, height/5, 70, 70);    
  }else if(mo == 7){
    image(seven, 170, height/5, 70, 70);    
  }else if(mo == 8){
    image(eight, 170, height/5, 70, 70);    
  }else if(mo == 9){
    image(nine, 170, height/5, 70, 70);    
  }else if(mo == 10){
    image(ten, 170, height/5, 70, 70);  
  }else if(mo == 11){
    image(one, 170, height/5, 70, 70);
    image(ten, 100, height/5, 70, 70);   
  }else if(mo == 12){
    image(two, 170, height/5, 70, 70);
    image(ten, 100, height/5, 70, 70);   
  }
   if(da ==1){
    image(one, 450, height/5, 70, 70);
     }else if(da ==2){
     image(two, 450, height/5, 70, 70);
     }else if(da ==3){
     image(three, 450, height/5, 70, 70);
     }else if(da ==4){
     image(four, 450, height/5, 70, 70);
     }else if(da ==5){
     image(five, 450, height/5, 70, 70);
     }else if(da ==6){
     image(six, 450, height/5, 70, 70);
     }else if(da ==7){
     image(seven, 450, height/5, 70, 70);
     }else if(da ==8){
     image(eight, 450, height/5, 70, 70);
     }else if(da ==9){
     image(nine, 450, height/5, 70, 70);
     }else if(da ==10){
     image(ten, 450, height/5, 70, 70);
     }else if(da ==11){
     image(one, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     }else if(da ==12){
     image(two, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     }else if(da ==13){
     image(three, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     }else if(da ==14){
     image(four, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     }else if(da ==15){
     image(five, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     }else if(da ==16){
     image(six, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     }else if(da ==17){
     image(seven, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     }else if(da ==18){
     image(eight, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     }else if(da ==19){
     image(nine, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     }else if(da ==20){
     image(ten, 450, height/5, 70, 70);
     image(two, 380, height/5, 70, 70);
     }else if(da ==21){
     image(one, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     image(two, 310, height/5, 70 ,70);
     }else if(da ==22){
     image(two, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     image(two, 310, height/5, 70 ,70);
     }else if(da ==23){
     image(three, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     image(two, 310, height/5, 70 ,70);
     }else if(da ==24){
     image(four, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     image(two, 310, height/5, 70 ,70);
     }else if(da ==25){
     image(five, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     image(two, 310, height/5, 70 ,70);
     }else if(da ==26){
     image(six, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     image(two, 310, height/5, 70 ,70);
     }else if(da ==27){
     image(seven, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     image(two, 310, height/5, 70 ,70);
     }else if(da ==28){
     image(eight, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     image(two, 310, height/5, 70 ,70);
     }else if(da ==29){
     image(nine, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     image(two, 310, height/5, 70 ,70);
     }else if(da ==30){
     image(ten, 450, height/5, 70, 70);
     image(three, 380, height/5, 70, 70);
     }else if(da ==31){
     image(one, 450, height/5, 70, 70);
     image(ten, 380, height/5, 70, 70);
     image(three, 310, height/5, 70 ,70);
     }
     if(ho == 1){
       image(one,200, height/3, 120, 120);
       }else if(ho == 2){
       image(two, 200, height/3, 120, 120);
       }else if(ho == 3){
       image(three, 200, height/3, 120, 120);
       }else if(ho == 4){
       image(four, 200, height/3, 120, 120);
       }else if(ho == 5){
       image(five, 200, height/3, 120, 120);
       }else if(ho == 6){
       image(six, 200, height/3, 120, 120);
       }else if(ho == 7){
       image(seven, 200, height/3, 120, 120);
       }else if(ho == 8){
       image(eight, 200, height/3, 120, 120);
       }else if(ho == 9){
       image(nine, 200, height/3, 120, 120);
       }else if(ho == 10){
       image(ten, 200, height/3, 120, 120);
       }else if(ho == 11){
       image(one, 200, height/3, 120, 120);
       image(ten, 100, height/3, 120, 120);
       }else if(ho == 12){
       image(two, 200, height/3, 120, 120);
       image(ten, 100, height/3, 120, 120);
       }else if(ho ==13){
       image(one, 200, height/3, 120, 120);
       }else if(ho ==14){
       image(two, 200, height/3, 120, 120);
       }else if(ho ==15){
       image(three, 200, height/3, 120, 120);
       }else if(ho ==16){
       image(four, 200, height/3, 120, 120);
       }else if(ho ==17){
       image(five, 200, height/3, 120, 120);
       }else if(ho ==18){
       image(six, 200, height/3, 120, 120);
       }else if(ho ==19){
       image(seven, 200, height/3, 120, 120);
       }else if(ho ==20){
       image(eight, 200, height/3, 120, 120);
       }else if(ho ==21){
         image(nine, 200, height/3, 120, 120);
       }else if(ho ==22){
       image(ten, 200, height/3, 120, 120);
       }else if(ho ==23){
       image(one, 200, height/3, 120, 120);
       image(ten, 100, height/3, 120, 120);
       }else if(ho ==24){
       image(two, 200, height/3, 120, 120);
       image(ten, 100, height/3, 120, 120);
       }
       if(mi == 0){
         image(zero,600,height/3,120,120);
         }else if(mi == 1){
         image(one, 600, height/3,120,120);
         }else if(mi == 2){
         image(two, 600, height/3,120,120);
         }else if(mi == 3){
         image(three, 600, height/3,120,120);
         }else if(mi == 4){
         image(four, 600, height/3,120,120);
         }else if(mi == 5){
         image(five, 600, height/3,120,120);
         }else if(mi == 6){
         image(six, 600, height/3,120,120);
         }else if(mi == 7){
         image(seven, 600, height/3,120,120);
         }else if(mi == 8){
         image(eight, 600, height/3,120,120);
         }else if(mi == 9){
         image(nine, 600, height/3,120,120);
         }else if(mi == 10){
         image(ten, 600, height/3,120,120);
         }else if(mi == 11){
           image(one, 600, height/3, 120, 120);
           image(ten, 500, height/3, 120, 120);
         }else if(mi == 12){
           image(two, 600, height/3, 120, 120);
           image(ten, 500, height/3, 120, 120);
         }else if(mi == 13){
           image(three, 600, height/3, 120, 120);
           image(ten, 500, height/3, 120, 120);
           }else if(mi == 14){
           image(four, 600, height/3, 120, 120);
           image(ten, 500, height/3, 120, 120);
           }else if(mi == 15){
           image(five, 600, height/3, 120, 120);
           image(ten, 500, height/3, 120, 120);
           }else if(mi == 16){
           image(six, 600, height/3, 120, 120);
           image(ten, 500, height/3, 120, 120);
           }else if(mi == 17){
           image(seven, 600, height/3, 120, 120);
           image(ten, 500, height/3, 120, 120);
           }else if(mi == 18){
           image(eight, 600, height/3, 120, 120);
           image(ten, 500, height/3, 120, 120);
           }else if(mi == 19){
           image(nine, 600, height/3, 120, 120);
           image(ten, 500, height/3, 120, 120);
           }else if(mi == 20){
           image(ten, 600, height/3, 120, 120);
           image(two, 500, height/3, 120, 120);
           }else if(mi == 21){
             image(one, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(two, 400, height/3, 120, 120);
             }else if(mi == 22){
             image(two, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(two, 400, height/3, 120, 120);
             }else if(mi == 23){
             image(three, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(two, 400, height/3, 120, 120);
             }else if(mi == 24){
             image(four, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(two, 400, height/3, 120, 120);
             }else if(mi == 25){
             image(five, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(two, 400, height/3, 120, 120);
             }else if(mi == 26){
             image(six, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(two, 400, height/3, 120, 120);
             }else if(mi == 27){
             image(seven, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(two, 400, height/3, 120, 120);
             }else if(mi == 28){
             image(eight, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(two, 400, height/3, 120, 120);
             }else if(mi == 29){
             image(nine, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(two, 400, height/3, 120, 120);
             }else if(mi == 30){
             image(ten, 600, height/3, 120, 120);
             image(three, 500, height/3, 120, 120);
             }else if(mi == 31){
             image(one, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(three, 400, height/3, 120, 120);
             }else if(mi == 32){
             image(two, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(three, 400, height/3, 120, 120);
             }else if(mi == 33){
             image(three, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(three, 400, height/3, 120, 120);
             }else if(mi == 34){
             image(four, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(three, 400, height/3, 120, 120);
             }else if(mi == 35){
             image(five, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(three, 400, height/3, 120, 120);
             }else if(mi == 36){
             image(six, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(three, 400, height/3, 120, 120);
             }else if(mi == 37){
             image(seven, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(three, 400, height/3, 120, 120);
             }else if(mi == 38){
             image(eight, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(three, 400, height/3, 120, 120);
             }else if(mi == 39){
             image(nine, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(three, 400, height/3, 120, 120);
             }else if(mi == 40){
               image(ten, 600, height/3, 120, 120);
               image(four, 500, height/3, 120, 120);
             }else if(mi == 41){
             image(one, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(four, 400, height/3, 120, 120);
             }else if(mi == 42){
             image(two, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(four, 400, height/3, 120, 120);
             }else if(mi == 43){
             image(three, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(four, 400, height/3, 120, 120);
             }else if(mi == 44){
             image(four, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(four, 400, height/3, 120, 120);
             }else if(mi == 45){
             image(five, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(four, 400, height/3, 120, 120);
             }else if(mi == 46){
             image(six, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(four, 400, height/3, 120, 120);
             }else if(mi == 47){
             image(seven, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(four, 400, height/3, 120, 120);
             }else if(mi == 48){
             image(eight, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(four, 400, height/3, 120, 120);
             }else if(mi == 49){
             image(nine, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(four, 400, height/3, 120, 120);
             }else if(mi == 50){
             image(ten, 600, height/3, 120, 120);
             image(five, 500, height/3, 120, 120);
             }else if(mi == 51){
             image(one, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(five, 400, height/3, 120, 120);
             }else if(mi == 51){
             image(one, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(five, 400, height/3, 120, 120);
             }else if(mi == 52){
             image(two, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(five, 400, height/3, 120, 120);
             }else if(mi == 53){
             image(three, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(five, 400, height/3, 120, 120);
             }else if(mi == 54){
             image(four, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(five, 400, height/3, 120, 120);
             }else if(mi == 55){
             image(five, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(five, 400, height/3, 120, 120);
             }else if(mi == 56){
             image(six, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(five, 400, height/3, 120, 120);
             }else if(mi == 57){
             image(seven, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(five, 400, height/3, 120, 120);
             }else if(mi == 58){
             image(eight, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(five, 400, height/3, 120, 120);
             }else if(mi == 59){
             image(nine, 600, height/3, 120, 120);
             image(ten, 500, height/3, 120, 120);
             image(five, 400, height/3, 120, 120);
             }
             if(da<=3 || da>28){
               pushMatrix();
               fill(0);
               ellipse(width/2, height, 100, 100);
               popMatrix();
             }else if(da>3 && da<=8){
              fill(225, 225, 225);
              arc(180, 530 ,100, 100, PI+HALF_PI,TWO_PI+HALF_PI);
              arc(180, 530, 50, 100, PI+HALF_PI, TWO_PI+HALF_PI);
             }else if(da>8 && da<=13){
               fill(225,225,225);
               arc(280, 400, 100, 100, PI+HALF_PI, TWO_PI+HALF_PI, CHORD);
             }else if(da>13 && da<=18){
               fill(225,225,225);
               ellipse(width/2,height-250 , 100, 100);
             }else if(da>18 && da<=23){
               fill(225,225,225);
               arc(620, 400, 100, 100, HALF_PI, PI+HALF_PI, CHORD);
             }else if(da>23 && da<=28){
               fill(225,225,225);
               arc(720, 530, 100, 100, HALF_PI, PI+HALF_PI);
               arc(720, 530, 50, 100, HALF_PI, PI+HALF_PI);
             }  
           

     
}
  
  



