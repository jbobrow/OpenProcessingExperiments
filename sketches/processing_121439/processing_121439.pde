
Dot[] dots; 
int counter=0;
int yearcount=1800;
int popu=100000;
PImage img;
int totalDots=0;



void setup() {
  size(1420,860);
  img = loadImage("world.jpg");
  dots = new Dot[6390];
  frameRate(30);

}
  void draw() {
    // Text + counter
    background(img);
    dots[totalDots] = new Dot();
    totalDots+=3;
    counter++;
    if (counter % 10 == 0 && counter <= 2130) {
    yearcount+=1;
  }
     
    // pop number display changing
     
    if (counter <= 100) {
      popu+=25;
    } else if (counter > 100 && counter <= 400) {
      popu+=51;
    } else if (counter > 400 && counter <= 600) {
      popu+=75;
    } else if (counter > 600 && counter <= 1000) {
      popu+=101;
    } else if (counter > 1000 && counter <= 1400) {
      popu+=125;
    } else if (counter > 1400 && counter <= 1500) {
      popu+=167;
    } else if (counter > 1500 && counter <= 1600) {
      popu+=183;
    } else if (counter > 1600 && counter <= 1700) {
      popu+=342;
    } else if (counter > 1700 && counter <= 1800) {
      popu+=712;
    } else if (counter > 1800 && counter <= 1900) {
      popu+=999;
    } else if (counter > 1900 && counter <= 2000) {
      popu+=1031;
    } else if (counter > 2000 && counter <= 2130) {
      popu+=1123;
    }
   
    

    //println(totalDots);
    //println(counter);


   for (int i=0; i<totalDots; i+=3) {
     dots[i].display();
    }
   
    
  strokeWeight(5);
  fill(0);
  textSize(40);
  text("Population Growth from 1800-2013." ,width/2-200, 3*height/4);
  text("Each dot represents 1 000 000 people.", width/2-160, 3*height/4+45);
  text("Starting population not represented with dots.", width/2-220,3*height/4+145);
  
  fill(255,0,0);
  textSize(60);
  text("Year:",width/20-60,height/2+height/5+70);
  text("Pop.:",width/20-60,height/2+height/5+130);
  text(yearcount,width/20+85,height/2+height/5+70);
  text(popu,width/20+85,height/2+height/5+130);
  textSize(40);
  text("x 10 000",width/20+305, height/2+height/5+130);
  textSize(30);
}
//void mouseClicked() {
//  println ("Mouse X Position: "+ mouseX +", Mouse Y Position: " + mouseY);
//}







    
  






/* 1800 - 1 000 000 000 1
1810 - 1 025 000 000 2
1820 - 1 075 000 000 3
1830 - 1 125 000 000 4
1840 - 1 200 000 000 5
1850 - 1 275 000 000 6
1860 - 1 350 000 000 7
1870 - 1 450 000 000 8
1880 - 1 550 000 000 9
1890 - 1 650 000 000 10
1900 - 1 775 000 000 11
1910 - 1 900 000 000 12
1920 - 2 025 000 000 13
1930 - 2 150 000 000 14
1940 - 2 333 000 000 15
1950 - 2 500 000 000 16
1960 - 3 000 000 000 17
1970 - 3 500 000 000 18
1980 - 4 500 000 000 19
1990 - 5 000 000 000 20
2000 - 6 000 000 000 21
2010 - 7 000 000 000 22

Difference of 6 billion to show
Could make an object that represents maybe 1 000 000 people? Each year will be represented by two 
seconds real time, 2013-1800=213. 213*2=426 seconds total simulation time. Too Long? maybe cut
in half, even in three maybe. 

Let's say reduce it by a factor of three: 142 seconds total, seems reasonable.

So every year takes 1/3 of a second. 


Rate of change(per 10 years):

Each point represents 10 years passed --> 100 frames.

                    Frames (at 30fps):
1)   25 000 000     100
2)   50 000 000     200
3)   50 000 000     300
4)   50 000 000     400
5)   75 000 000     500
6)   75 000 000     600
7)  100 000 000     700
8)  100 000 000     800
9)  100 000 000     900
10) 125 000 000     1000
11) 125 000 000     1100
12) 125 000 000     1200
13) 125 000 000     1300
14) 183 000 000     1400
15) 167 000 000     1500
16) 500 000 000     1600
17) 500 000 000     1700
18)1000 000 000     1800
19)1000 000 000     1900
20)1000 000 000     2000
21)1000 000 000     2100



Points Used:

Mouse X Position: 110, Mouse Y Position: 119
Mouse X Position: 213, Mouse Y Position: 132
Mouse X Position: 302, Mouse Y Position: 130
Mouse X Position: 256, Mouse Y Position: 181
Mouse X Position: 269, Mouse Y Position: 227
Mouse X Position: 318, Mouse Y Position: 245
Mouse X Position: 302, Mouse Y Position: 305
Mouse X Position: 446, Mouse Y Position: 425
Mouse X Position: 458, Mouse Y Position: 482
Mouse X Position: 503, Mouse Y Position: 492
Mouse X Position: 469, Mouse Y Position: 551
Mouse X Position: 705, Mouse Y Position: 342
Mouse X Position: 807, Mouse Y Position: 466
Mouse X Position: 373, Mouse Y Position: 256
Mouse X Position: 720, Mouse Y Position: 301
Mouse X Position: 804, Mouse Y Position: 333
Mouse X Position: 805, Mouse Y Position: 536
Mouse X Position: 800, Mouse Y Position: 197
Mouse X Position: 861, Mouse Y Position: 165
Mouse X Position: 924, Mouse Y Position: 156
Mouse X Position: 1016, Mouse Y Position: 149
Mouse X Position: 1233, Mouse Y Position: 128
Mouse X Position: 1010, Mouse Y Position: 229
Mouse X Position: 1029, Mouse Y Position: 290
Mouse X Position: 1147, Mouse Y Position: 281
Mouse X Position: 424, Mouse Y Position: 204
Mouse X Position: 502, Mouse Y Position: 525
Mouse X Position: 447, Mouse Y Position: 601
Mouse X Position: 757, Mouse Y Position: 364
Mouse X Position: 842, Mouse Y Position: 403
Mouse X Position: 787, Mouse Y Position: 417
Mouse X Position: 809, Mouse Y Position: 504
Mouse X Position: 697, Mouse Y Position: 377
Mouse X Position: 875, Mouse Y Position: 278
Mouse X Position: 943, Mouse Y Position: 270
Mouse X Position: 974, Mouse Y Position: 190
Mouse X Position: 971, Mouse Y Position: 144
Mouse X Position: 826, Mouse Y Position: 171
Mouse X Position: 1098, Mouse Y Position: 276
Mouse X Position: 1104, Mouse Y Position: 317
Mouse X Position: 1021, Mouse Y Position: 325
Mouse X Position: 1191, Mouse Y Position: 558
Mouse X Position: 1089, Mouse Y Position: 162
Mouse X Position: 1137, Mouse Y Position: 165
Mouse X Position: 1213, Mouse Y Position: 201
Mouse X Position: 1168, Mouse Y Position: 212
Mouse X Position: 1136, Mouse Y Position: 242
Mouse X Position: 1100, Mouse Y Position: 258
Mouse X Position: 1101, Mouse Y Position: 291
Mouse X Position: 1081, Mouse Y Position: 229
Mouse X Position: 1230, Mouse Y Position: 549
Mouse X Position: 1273, Mouse Y Position: 566
Mouse X Position: 811, Mouse Y Position: 376
Mouse X Position: 458, Mouse Y Position: 455
Mouse X Position: 498, Mouse Y Position: 458
Mouse X Position: 443, Mouse Y Position: 175
Mouse X Position: 320, Mouse Y Position: 188
Mouse X Position: 372, Mouse Y Position: 203
Mouse X Position: 1169, Mouse Y Position: 125
Mouse X Position: 1297, Mouse Y Position: 118
Mouse X Position: 1067, Mouse Y Position: 183
Mouse X Position: 1179, Mouse Y Position: 176
Mouse X Position: 896, Mouse Y Position: 334
Mouse X Position: 1067, Mouse Y Position: 129
Mouse X Position: 1112, Mouse Y Position: 134
Mouse X Position: 943, Mouse Y Position: 228
Mouse X Position: 1108, Mouse Y Position: 186 

*/
int q;
class Dot {
  float x,y;
  float r;
  color c;
  
  Dot() {
    //int g = int(random(1,15));  
    int[] pX = {110,213,302,256,269,318,302,446,458,503,469,705,807,373,720,804,805,
  800,861,924,1016,1233,1010,1029,1147,424,502,447,757,842,787,809,697,875,943,974,971,826,1098,
1104,1021,1191,1089,1137,1213,1168,1136,1100,1101,1081,1230,1273,811,458,498,443,320,372,1169,1297,
1067,1179,896,1067,1112,943,1108};
    int indexX=int(random(pX.length));
    q=(pX[indexX]);
    x=q+random(-25,25);
    c = color(255,10,10);

// Coordinates
if (q==110) {
      y=122+random(-30,30);
    }
    if (q==213) {
      y=132+random(-20,20);
    }
    if (q==302) {
      y=130+random(-30,30);
    }
    if (q==256) {
      y=181+random(-30,30);
    }
    if (q==269) {
      y=227+random(-30,30);
    }
    if (q==318) {
      y=245+random(-20,20);
    }
    if (q==302) {
      y=305+random(-20,20);
    }
    if (q==446) {
      y=425+random(-20,20);
    }
    if (q==458) {
      y=482+random(-20,20);
    }
    if (q==503) {
      y=492+random(-20,20);
    }
    if (q==469) {
      y=551+random(-20,20);
    }
    if (q==705) {
      y=342+random(-20,20);
    }
    if (q==807) {
      y=466+random(-20,20);
    }
    if (q==373) {
      y=256+random(-20,20);
    }
    if (q==720) {
      y=301+random(-20,20);
    }
    if (q==804) {
      y=333+random(-20,20);
    }
    if (q==805) {
      y=536+random(-20,20);
    }
    if (q==800) {
      y=197+random(-20,20);
    }
    if (q==861) {
      y=165+random(-20,20);
    }
    if (q==924) {
      y=156+random(-20,20);
    }
    if (q==1016) {
      y=149+random(-20,20);
    }
    if (q==1233) {
      y=128+random(-20,20);
    }
    if (q==1010) {
      y=229+random(-20,20);
    }
    if (q==1029) {
      y=290+random(-20,20);
    }
    if (q==1147) {
      y=281+random(-20,20);
    }
    if (q==424) {
      y=204+random(-20,20);
    }
    if (q==502) {
      y=525+random(-20,20);
    }
    if (q==447) {
      y=601+random(-20,20);
    }
    if (q==757) {
      y=364+random(-20,20);
    }
    if (q==842) {
      y=403+random(-20,20);
    }
    if (q==787) {
      y=417+random(-20,20);
    }
    if (q==809) {
      y=504+random(-20,20);
    }
    if (q==697) {
      y=377+random(-20,20);
    }
    if (q==875) {
      y=278+random(-20,20);
    }
    if (q==943) {
      y=270+random(-20,20);
    }
    if (q==974) {
      y=190+random(-20,20);
    }
    if (q==971) {
      y=144+random(-20,20);
    }
    if (q==826) {
      y=171+random(-20,20);
    }
    if (q==1098) {
      y=276+random(-20,20);
    }
    if (q==1104) {
      y=317+random(-20,20);
    }
    if (q==1021) {
      y=325+random(-20,20);
    }
    if (q==1191) {
      y=558+random(-20,20);
    }
    if (q==1089) {
      y=1137+random(-20,20);
    }
    if (q==1213) {
      y=201+random(-20,20);
    }
    if (q==1168) {
      y=212+random(-20,20);
    }
    if (q==1136) {
      y=242+random(-20,20);
    }
    if (q==1100) {
      y=258+random(-20,20);
    }
    if (q==1101) {
      y=291+random(-20,20);
    }
    if (q==1081) {
      y=229+random(-20,20);
    }
    if (q==1230) {
      y=549+random(-20,20);
    }
    if (q==1273) {
      y=566+random(-20,20);
    }
    if (q==811) {
      y=376+random(-20,20);
    }
    if (q==458) {
      y=455+random(-20,20);
    }
    if (q==498) {
      y=458+random(-20,20);
    }
    if (q==443) {
      y=175+random(-20,20);
    }
    if (q==320) {
      y=188+random(-20,20);
    }
    if (q==372) {
      y=203+random(-20,20);
    }
    if (q==1169) {
      y=125+random(-20,20);
    }
    if (q==1297) {
      y=118+random(-20,20);
    }
    if (q==1067) {
      y=183+random(-20,20);
    }
    if (q==1179) {
      y=176+random(-20,20);
    }
    if (q==896) {
      y=334+random(-20,20);
    }
    if (q==1067) {
      y=129+random(-20,20);
    }
    if (q==1112) {
      y=134+random(-20,20);
    }
    if (q==943) {
      y=228+random(-20,20);
    } 
    if (q==1108) {
      y=186+random(-20,20);
    }


  }
  
  void display() {
    fill(c);
    noStroke();
    ellipse(x,y,5,5);
    
  }
}



