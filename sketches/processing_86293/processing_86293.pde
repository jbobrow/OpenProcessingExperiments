
float changement;
float ah1;
float av1;
float bh1;
float bv1;
float ch1;
float cv1;
float dh1;
float dv1;
float eh1;
float ev1;

float ah2;
float av2;
float bh2;
float bv2;
float ch2;
float cv2;
float dh2;
float dv2;
float eh2;
float ev2;

float ah3;
float av3;
float bh3;
float bv3;
float ch3;
float cv3;
float dh3;
float dv3;
float eh3;
float ev3;

float ah4;
float av4;
float bh4;
float bv4;
float ch4;
float cv4;
float dh4;
float dv4;
float eh4;
float ev4;

float av5;
float bv5;
float cv5;
float dv5;
float ev5;


float cah1;
float cav1;
float cah2;
float cav2;


void setup (){
  size (500,500);
  smooth ();
  background (255);
  
  
  
  //   PLACEMENT ALEATOIRE DES FLOATS
  
  
  
  
  
  //   H 1
  
  ah1 = random (0,4);
  bh1 = random (0,4);
  ch1 = random (0,4);
  dh1 = random (0,4);
  eh1 = random (0,4);
  
  //   V 1
  
  av1 = random (0,4);
  bv1 = random (0,4);
  cv1 = random (0,4);
  dv1 = random (0,4);
  ev1 = random (0,4);
  
  //   H 2
  
  ah2 = random (0,4);
  bh2 = random (0,4);
  ch2 = random (0,4);
  dh2 = random (0,4);
  eh2 = random (0,4);
  
  //   V 2
  
  av2 = random (0,4);
  bv2 = random (0,4);
  cv2 = random (0,4);
  dv2 = random (0,4);
  ev2 = random (0,4);
  
  //   H 3
  
  ah3 = random (0,4);
  bh3 = random (0,4);
  ch3 = random (0,4);
  dh3 = random (0,4);
  eh3 = random (0,4);
  
  //   V 3
  
  av3 = random (0,4);
  bv3 = random (0,4);
  cv3 = random (0,4);
  dv3 = random (0,4);
  ev3 = random (0,4);
  
  //   H 4
  
  ah4 = random (0,4);
  bh4 = random (0,4);
  ch4 = random (0,4);
  dh4 = random (0,4);
  eh4 = random (0,4);
  
  //   V 4
  
  av4 = random (0,4);
  bv4 = random (0,4);
  cv4 = random (0,4);
  dv4 = random (0,4);
  ev4 = random (0,4);
  
  
  //   CH
  
  cah1 = 0;
  cah2 = width*2;
  
  //   CV
  
  cav1 = 0;
  cav2 = height*2;
  
}

void draw (){
  
  background (0);
  //noStroke ();
  //fill (0);
  //rect (0,0,width,height);
  
  
  
  
  
  //   REPOSITIONNEMENT DES FLOATS
  
  
  
  
  
  //   CHANGEMENT
  
  
  
  
  
  changement = changement+1;
  if (changement>100){
    changement = 0;
  ah1 = random (0,4);
  bh1 = random (0,4);
  ch1 = random (0,4);
  dh1 = random (0,4);
  eh1 = random (0,4);
  av1 = random (0,4);
  bv1 = random (0,4);
  cv1 = random (0,4);
  dv1 = random (0,4);
  ev1 = random (0,4);
  ah2 = random (0,4);
  bh2 = random (0,4);
  ch2 = random (0,4);
  dh2 = random (0,4);
  eh2 = random (0,4);
  av2 = random (0,4);
  bv2 = random (0,4);
  cv2 = random (0,4);
  dv2 = random (0,4);
  ev2 = random (0,4);
  ah3 = random (0,4);
  bh3 = random (0,4);
  ch3 = random (0,4);
  dh3 = random (0,4);
  eh3 = random (0,4);
  av3 = random (0,4);
  bv3 = random (0,4);
  cv3 = random (0,4);
  dv3 = random (0,4);
  ev3 = random (0,4);
  ah4 = random (0,4);
  bh4 = random (0,4);
  ch4 = random (0,4);
  dh4 = random (0,4);
  eh4 = random (0,4);
  av4 = random (0,4);
  bv4 = random (0,4);
  cv4 = random (0,4);
  dv4 = random (0,4);
  ev4 = random (0,4);
  av5 = random (0,4);
  bv5 = random (0,4);
  cv5 = random (0,4);
  dv5 = random (0,4);
  ev5 = random (0,4);}
  
  
  
  
  
  //   H1
  
  
  
  if (ah1>-2){
    if (ah1<1){
    ah1 = 0;}}
  if (ah1>1){
    if (ah1<2){
    ah1 = 1;}}
  if (ah1>2){
    if (ah1<3){
    ah1 = 2;}}
  if (ah1>3){
    if (ah1<4){
    ah1 = 3;}}
  if (ah1>4){
    ah1 = 4;}
  
  if (bh1>-2){
    if (bh1<1){
    bh1 = 0;}}
  if (bh1>1){
    if (bh1<2){
    bh1 = 1;}}
  if (bh1>2){
    if (bh1<3){
    bh1 = 2;}}
  if (bh1>3){
    if (bh1<4){
    bh1 = 3;}}
  if (bh1>4){
    bh1 = 4;}
  
  if (bh1<ah1+1){
    if (bh1>ah1-1){
    bh1 = random (-1,5);}}
  
  if (ch1>-2){
    if (ch1<1){
    ch1 = 0;}}
  if (ch1>1){
    if (ch1<2){
    ch1 = 1;}}
  if (ch1>2){
    if (ch1<3){
    ch1 = 2;}}
  if (ch1>3){
    if (ch1<4){
    ch1 = 3;}}
  if (ch1>4){
    ch1 = 4;}
  
  if (ch1<ah1+1){
    if (ch1>ah1-1){
    ch1 = random (-1,5);}}
  if (ch1<bh1+1){
    if (ch1>bh1-1){
    ch1 = random (-1,5);}}
  
  if (dh1>-2){
    if (dh1<1){
    dh1 = 0;}}
  if (dh1>1){
    if (dh1<2){
    dh1 = 1;}}
  if (dh1>2){
    if (dh1<3){
    dh1 = 2;}}
  if (dh1>3){
    if (dh1<4){
    dh1 = 3;}}
  if (dh1>4){
    dh1 = 4;}
  
  if (dh1<ah1+1){
    if (dh1>ah1-1){
    dh1 = random (-1,5);}}
  if (dh1<bh1+1){
    if (dh1>bh1-1){
    dh1 = random (-1,5);}}
  if (dh1<ch1+1){
    if (dh1>ch1-1){
    dh1 = random (-1,5);}}
  
  if (eh1>-2){
    if (eh1<1){
    eh1 = 0;}}
  if (eh1>1){
    if (eh1<2){
    eh1 = 1;}}
  if (eh1>2){
    if (eh1<3){
    eh1 = 2;}}
  if (eh1>3){
    if (eh1<4){
    eh1 = 3;}}
  if (eh1>4){
    eh1 = 4;}
  
  if (eh1<ah1+1){
    if (eh1>ah1-1){
    eh1 = random (-1,5);}}
  if (eh1<bh1+1){
    if (eh1>bh1-1){
    eh1 = random (-1,5);}}
  if (eh1<ch1+1){
    if (eh1>ch1-1){
    eh1 = random (-1,5);}}
  if (eh1<dh1+1){
    if (eh1>dh1-1){
    eh1 = random (-1,5);}}
  
  
  
  //   V1
  
  
  
  if (av1>-2){
    if (av1<1){
    av1 = 0;}}
  if (av1>1){
    if (av1<2){
    av1 = 1;}}
  if (av1>2){
    if (av1<3){
    av1 = 2;}}
  if (av1>3){
    if (av1<4){
    av1 = 3;}}
  if (av1>4){
    av1 = 4;}
  
  if (bv1>-2){
    if (bv1<1){
    bv1 = 0;}}
  if (bv1>1){
    if (bv1<2){
    bv1 = 1;}}
  if (bv1>2){
    if (bv1<3){
    bv1 = 2;}}
  if (bv1>3){
    if (bv1<4){
    bv1 = 3;}}
  if (bv1>4){
    bv1 = 4;}
  
  if (bv1<av1+1){
    if (bv1>av1-1){
    bv1 = random (-1,5);}}
  
  if (cv1>-2){
    if (cv1<1){
    cv1 = 0;}}
  if (cv1>1){
    if (cv1<2){
    cv1 = 1;}}
  if (cv1>2){
    if (cv1<3){
    cv1 = 2;}}
  if (cv1>3){
    if (cv1<4){
    cv1 = 3;}}
  if (cv1>4){
    cv1 = 4;}
  
  if (cv1<av1+1){
    if (cv1>av1-1){
    cv1 = random (-1,5);}}
  if (cv1<bv1+1){
    if (cv1>bv1-1){
    cv1 = random (-1,5);}}
  
  if (dv1>-2){
    if (dv1<1){
    dv1 = 0;}}
  if (dv1>1){
    if (dv1<2){
    dv1 = 1;}}
  if (dv1>2){
    if (dv1<3){
    dv1 = 2;}}
  if (dv1>3){
    if (dv1<4){
    dv1 = 3;}}
  if (dv1>4){
    dv1 = 4;}
  
  if (dv1<av1+1){
    if (dv1>av1-1){
    dv1 = random (-1,5);}}
  if (dv1<bv1+1){
    if (dv1>bv1-1){
    dv1 = random (-1,5);}}
  if (dv1<cv1+1){
    if (dv1>cv1-1){
    dv1 = random (-1,5);}}
  
  if (ev1>-2){
    if (ev1<1){
    ev1 = 0;}}
  if (ev1>1){
    if (ev1<2){
    ev1 = 1;}}
  if (ev1>2){
    if (ev1<3){
    ev1 = 2;}}
  if (ev1>3){
    if (ev1<4){
    ev1 = 3;}}
  if (ev1>4){
    ev1 = 4;}
  
  if (ev1<av1+1){
    if (ev1>av1-1){
    ev1 = random (-1,5);}}
  if (ev1<bv1+1){
    if (ev1>bv1-1){
    ev1 = random (-1,5);}}
  if (ev1<cv1+1){
    if (ev1>cv1-1){
    ev1 = random (-1,5);}}
  if (ev1<dv1+1){
    if (ev1>dv1-1){
    ev1 = random (-1,5);}}
  
  
  
  
  //   H2
  
  
  
  if (ah2>-2){
    if (ah2<1){
    ah2 = 0;}}
  if (ah2>1){
    if (ah2<2){
    ah2 = 1;}}
  if (ah2>2){
    if (ah2<3){
    ah2 = 2;}}
  if (ah2>3){
    if (ah2<4){
    ah2 = 3;}}
  if (ah2>4){
    ah2 = 4;}
  
  if (bh2>-2){
    if (bh2<1){
    bh2 = 0;}}
  if (bh2>1){
    if (bh2<2){
    bh2 = 1;}}
  if (bh2>2){
    if (bh2<3){
    bh2 = 2;}}
  if (bh2>3){
    if (bh2<4){
    bh2 = 3;}}
  if (bh2>4){
    bh2 = 4;}
  
  if (bh2<ah2+1){
    if (bh2>ah2-1){
    bh2 = random (-1,5);}}
  
  if (ch2>-2){
    if (ch2<1){
    ch2 = 0;}}
  if (ch2>1){
    if (ch2<2){
    ch2 = 1;}}
  if (ch2>2){
    if (ch2<3){
    ch2 = 2;}}
  if (ch2>3){
    if (ch2<4){
    ch2 = 3;}}
  if (ch2>4){
    ch2 = 4;}
  
  if (ch2<ah2+1){
    if (ch2>ah2-1){
    ch2 = random (-1,5);}}
  if (ch2<bh2+1){
    if (ch2>bh2-1){
    ch2 = random (-1,5);}}
  
  if (dh2>-2){
    if (dh2<1){
    dh2 = 0;}}
  if (dh2>1){
    if (dh2<2){
    dh2 = 1;}}
  if (dh2>2){
    if (dh2<3){
    dh2 = 2;}}
  if (dh2>3){
    if (dh2<4){
    dh2 = 3;}}
  if (dh2>4){
    dh2 = 4;}
  
  if (dh2<ah2+1){
    if (dh2>ah2-1){
    dh2 = random (-1,5);}}
  if (dh2<bh2+1){
    if (dh2>bh2-1){
    dh2 = random (-1,5);}}
  if (dh2<ch2+1){
    if (dh2>ch2-1){
    dh2 = random (-1,5);}}
  
  if (eh2>-2){
    if (eh2<1){
    eh2 = 0;}}
  if (eh2>1){
    if (eh2<2){
    eh2 = 1;}}
  if (eh2>2){
    if (eh2<3){
    eh2 = 2;}}
  if (eh2>3){
    if (eh2<4){
    eh2 = 3;}}
  if (eh2>4){
    eh2 = 4;}
  
  if (eh2<ah2+1){
    if (eh2>ah2-1){
    eh2 = random (-1,5);}}
  if (eh2<bh2+1){
    if (eh2>bh2-1){
    eh2 = random (-1,5);}}
  if (eh2<ch2+2){
    if (eh2>ch2-1){
    eh2 = random (-1,5);}}
  if (eh2<dh2+1){
    if (eh2>dh2-1){
    eh2 = random (-1,5);}}
  
  
  
  //   V2
  
  
  
  if (av2>-2){
    if (av2<1){
    av2 = 0;}}
  if (av2>1){
    if (av2<2){
    av2 = 1;}}
  if (av2>2){
    if (av2<3){
    av2 = 2;}}
  if (av2>3){
    if (av2<4){
    av2 = 3;}}
  if (av2>4){
    av2 = 4;}
  
  if (bv2>-2){
    if (bv2<1){
    bv2 = 0;}}
  if (bv2>1){
    if (bv2<2){
    bv2 = 1;}}
  if (bv2>2){
    if (bv2<3){
    bv2 = 2;}}
  if (bv2>3){
    if (bv2<4){
    bv2 = 3;}}
  if (bv2>4){
    bv2 = 4;}
  
  if (bv2<av2+1){
    if (bv2>av2-1){
    bv2 = random (-1,5);}}
  
  if (cv2>-2){
    if (cv2<1){
    cv2 = 0;}}
  if (cv2>1){
    if (cv2<2){
    cv2 = 1;}}
  if (cv2>2){
    if (cv2<3){
    cv2 = 2;}}
  if (cv2>3){
    if (cv2<4){
    cv2 = 3;}}
  if (cv2>4){
    cv2 = 4;}
  
  if (cv2<av2+1){
    if (cv2>av2-1){
    cv2 = random (-1,5);}}
  if (cv2<bv2+1){
    if (cv2>bv2-1){
    cv2 = random (-1,5);}}
  
  if (dv2>-2){
    if (dv2<1){
    dv2 = 0;}}
  if (dv2>1){
    if (dv2<2){
    dv2 = 1;}}
  if (dv2>2){
    if (dv2<3){
    dv2 = 2;}}
  if (dv2>3){
    if (dv2<4){
    dv2 = 3;}}
  if (dv2>4){
    dv2 = 4;}
  
  if (dv2<av2+1){
    if (dv2>av2-1){
    dv2 = random (-1,5);}}
  if (dv2<bv2+1){
    if (dv2>bv2-1){
    dv2 = random (-1,5);}}
  if (dv2<cv2+1){
    if (dv2>cv2-1){
    dv2 = random (-1,5);}}
  
  if (ev2>-2){
    if (ev2<1){
    ev2 = 0;}}
  if (ev2>1){
    if (ev2<2){
    ev2 = 1;}}
  if (ev2>2){
    if (ev2<3){
    ev2 = 2;}}
  if (ev2>3){
    if (ev2<4){
    ev2 = 3;}}
  if (ev2>4){
    ev2 = 4;}
  
  if (ev2<av2+1){
    if (ev2>av2-1){
    ev2 = random (-1,5);}}
  if (ev2<bv2+1){
    if (ev2>bv2-1){
    ev2 = random (-1,5);}}
  if (ev2<cv2+1){
    if (ev2>cv2-1){
    ev2 = random (-1,5);}}
  if (ev2<dv2+1){
    if (ev2>dv2-1){
    ev2 = random (-1,5);}}
  
  
  
  //   H3
  
  
  
  if (ah3>-2){
    if (ah3<1){
    ah3 = 0;}}
  if (ah3>1){
    if (ah3<2){
    ah3 = 1;}}
  if (ah3>2){
    if (ah3<3){
    ah3 = 2;}}
  if (ah3>3){
    if (ah3<4){
    ah3 = 3;}}
  if (ah3>4){
    ah3 = 4;}
  
  if (bh3>-2){
    if (bh3<1){
    bh3 = 0;}}
  if (bh3>1){
    if (bh3<2){
    bh3 = 1;}}
  if (bh3>2){
    if (bh3<3){
    bh3 = 2;}}
  if (bh3>3){
    if (bh3<4){
    bh3 = 3;}}
  if (bh3>4){
    bh3 = 4;}
  
  if (bh3<ah3+1){
    if (bh3>ah3-1){
    bh3 = random (-1,5);}}
  
  if (ch3>-2){
    if (ch3<1){
    ch3 = 0;}}
  if (ch3>1){
    if (ch3<2){
    ch3 = 1;}}
  if (ch3>2){
    if (ch3<3){
    ch3 = 2;}}
  if (ch3>3){
    if (ch3<4){
    ch3 = 3;}}
  if (ch3>4){
    ch3 = 4;}
  
  if (ch3<ah3+1){
    if (ch3>ah3-1){
    ch3 = random (-1,5);}}
  if (ch3<bh3+1){
    if (ch3>bh3-1){
    ch3 = random (-1,5);}}
  
  if (dh3>-2){
    if (dh3<1){
    dh3 = 0;}}
  if (dh3>1){
    if (dh3<2){
    dh3 = 1;}}
  if (dh3>2){
    if (dh3<3){
    dh3 = 2;}}
  if (dh3>3){
    if (dh3<4){
    dh3 = 3;}}
  if (dh3>4){
    dh3 = 4;}
  
  if (dh3<ah3+1){
    if (dh3>ah3-1){
    dh3 = random (-1,5);}}
  if (dh3<bh3+1){
    if (dh3>bh3-1){
    dh3 = random (-1,5);}}
  if (dh3<ch3+1){
    if (dh3>ch3-1){
    dh3 = random (-1,5);}}
  
  if (eh3>-2){
    if (eh3<1){
    eh3 = 0;}}
  if (eh3>1){
    if (eh3<2){
    eh3 = 1;}}
  if (eh3>2){
    if (eh3<3){
    eh3 = 2;}}
  if (eh3>3){
    if (eh3<4){
    eh3 = 3;}}
  if (eh3>4){
    eh3 = 4;}
  
  if (eh3<ah3+1){
    if (eh3>ah3-1){
    eh3 = random (-1,5);}}
  if (eh3<bh3+1){
    if (eh3>bh3-1){
    eh3 = random (-1,5);}}
  if (eh3<ch3+2){
    if (eh3>ch3-1){
    eh3 = random (-1,5);}}
  if (eh3<dh3+1){
    if (eh3>dh3-1){
    eh3 = random (-1,5);}}
  
  
  
  //   V3
  
  
  
  if (av3>-2){
    if (av3<1){
    av3 = 0;}}
  if (av3>1){
    if (av3<2){
    av3 = 1;}}
  if (av3>2){
    if (av3<3){
    av3 = 2;}}
  if (av3>3){
    if (av3<4){
    av3 = 3;}}
  if (av3>4){
    av3 = 4;}
  
  if (bv3>-2){
    if (bv3<1){
    bv3 = 0;}}
  if (bv3>1){
    if (bv3<2){
    bv3 = 1;}}
  if (bv3>2){
    if (bv3<3){
    bv3 = 2;}}
  if (bv3>3){
    if (bv3<4){
    bv3 = 3;}}
  if (bv3>4){
    bv3 = 4;}
  
  if (bv3<av2+1){
    if (bv3>av2-1){
    bv3 = random (-1,5);}}
  
  if (cv3>-2){
    if (cv3<1){
    cv3 = 0;}}
  if (cv3>1){
    if (cv3<2){
    cv3 = 1;}}
  if (cv3>2){
    if (cv3<3){
    cv3 = 2;}}
  if (cv3>3){
    if (cv3<4){
    cv3 = 3;}}
  if (cv3>4){
    cv3 = 4;}
  
  if (cv3<av3+1){
    if (cv3>av3-1){
    cv3 = random (-1,5);}}
  if (cv3<bv3+1){
    if (cv3>bv3-1){
    cv3 = random (-1,5);}}
  
  if (dv3>-2){
    if (dv3<1){
    dv3 = 0;}}
  if (dv3>1){
    if (dv3<2){
    dv3 = 1;}}
  if (dv3>2){
    if (dv3<3){
    dv3 = 2;}}
  if (dv3>3){
    if (dv3<4){
    dv3 = 3;}}
  if (dv3>4){
    dv3 = 4;}
  
  if (dv3<av3+1){
    if (dv3>av3-1){
    dv3 = random (-1,5);}}
  if (dv3<bv3+1){
    if (dv3>bv3-1){
    dv3 = random (-1,5);}}
  if (dv3<cv3+1){
    if (dv3>cv3-1){
    dv3 = random (-1,5);}}
  
  if (ev3>-2){
    if (ev3<1){
    ev3 = 0;}}
  if (ev3>1){
    if (ev3<2){
    ev3 = 1;}}
  if (ev3>2){
    if (ev3<3){
    ev3 = 2;}}
  if (ev3>3){
    if (ev3<4){
    ev3 = 3;}}
  if (ev3>4){
    ev3 = 4;}
  
  if (ev3<av3+1){
    if (ev3>av3-1){
    ev3 = random (-1,5);}}
  if (ev3<bv3+1){
    if (ev3>bv3-1){
    ev3 = random (-1,5);}}
  if (ev3<cv3+1){
    if (ev3>cv3-1){
    ev3 = random (-1,5);}}
  if (ev3<dv3+1){
    if (ev3>dv3-1){
    ev3 = random (-1,5);}}
  
  
  
  //   H4
  
  
  
  if (ah4>-2){
    if (ah4<1){
    ah4 = 0;}}
  if (ah4>1){
    if (ah4<2){
    ah4 = 1;}}
  if (ah4>2){
    if (ah4<3){
    ah4 = 2;}}
  if (ah4>3){
    if (ah4<4){
    ah4 = 3;}}
  if (ah4>4){
    ah4 = 4;}
  
  if (bh4>-2){
    if (bh4<1){
    bh4 = 0;}}
  if (bh4>1){
    if (bh4<2){
    bh4 = 1;}}
  if (bh4>2){
    if (bh4<3){
    bh4 = 2;}}
  if (bh4>3){
    if (bh4<4){
    bh4 = 3;}}
  if (bh4>4){
    bh4 = 4;}
  
  if (bh4<ah4+1){
    if (bh4>ah4-1){
    bh4 = random (-1,5);}}
  
  if (ch4>-2){
    if (ch4<1){
    ch4 = 0;}}
  if (ch4>1){
    if (ch4<2){
    ch4 = 1;}}
  if (ch4>2){
    if (ch4<3){
    ch4 = 2;}}
  if (ch4>3){
    if (ch4<4){
    ch4 = 3;}}
  if (ch4>4){
    ch4 = 4;}
  
  if (ch4<ah4+1){
    if (ch4>ah4-1){
    ch4 = random (-1,5);}}
  if (ch4<bh4+1){
    if (ch4>bh4-1){
    ch4 = random (-1,5);}}
  
  if (dh4>-2){
    if (dh4<1){
    dh4 = 0;}}
  if (dh4>1){
    if (dh4<2){
    dh4 = 1;}}
  if (dh4>2){
    if (dh4<3){
    dh4 = 2;}}
  if (dh4>3){
    if (dh4<4){
    dh4 = 3;}}
  if (dh4>4){
    dh4 = 4;}
  
  if (dh4<ah4+1){
    if (dh4>ah4-1){
    dh4 = random (-1,5);}}
  if (dh4<bh4+1){
    if (dh4>bh4-1){
    dh4 = random (-1,5);}}
  if (dh4<ch4+1){
    if (dh4>ch4-1){
    dh4 = random (-1,5);}}
  
  if (eh4>-2){
    if (eh4<1){
    eh4 = 0;}}
  if (eh4>1){
    if (eh4<2){
    eh4 = 1;}}
  if (eh4>2){
    if (eh4<3){
    eh4 = 2;}}
  if (eh4>3){
    if (eh4<4){
    eh4 = 3;}}
  if (eh4>4){
    eh4 = 4;}
  
  if (eh4<ah4+1){
    if (eh4>ah4-1){
    eh4 = random (-1,5);}}
  if (eh4<bh4+1){
    if (eh4>bh4-1){
    eh4 = random (-1,5);}}
  if (eh4<ch4+2){
    if (eh4>ch4-1){
    eh4 = random (-1,5);}}
  if (eh4<dh4+1){
    if (eh4>dh4-1){
    eh4 = random (-1,5);}}
  
  
  
  //   V4
  
  
  
  if (av4>-2){
    if (av4<1){
    av4 = 0;}}
  if (av4>1){
    if (av4<2){
    av4 = 1;}}
  if (av4>2){
    if (av4<3){
    av4 = 2;}}
  if (av4>3){
    if (av4<4){
    av4 = 3;}}
  if (av4>4){
    av4 = 4;}
  
  if (bv4>-2){
    if (bv4<1){
    bv4 = 0;}}
  if (bv4>1){
    if (bv4<2){
    bv4 = 1;}}
  if (bv4>2){
    if (bv4<3){
    bv4 = 2;}}
  if (bv4>3){
    if (bv4<4){
    bv4 = 3;}}
  if (bv4>4){
    bv4 = 4;}
  
  if (bv4<av4+1){
    if (bv4>av4-1){
    bv4 = random (-1,5);}}
  
  if (cv4>-2){
    if (cv4<1){
    cv4 = 0;}}
  if (cv4>1){
    if (cv4<2){
    cv4 = 1;}}
  if (cv4>2){
    if (cv4<3){
    cv4 = 2;}}
  if (cv4>3){
    if (cv4<4){
    cv4 = 3;}}
  if (cv4>4){
    cv4 = 4;}
  
  if (cv4<av4+1){
    if (cv4>av4+1){
    cv4 = random (-1,5);}}
  if (cv4<bv4+1){
    if (cv4>bv4-1){
    cv4 = random (-1,5);}}
  
  if (dv4>-2){
    if (dv4<1){
    dv4 = 0;}}
  if (dv4>1){
    if (dv4<2){
    dv4 = 1;}}
  if (dv4>2){
    if (dv4<3){
    dv4 = 2;}}
  if (dv4>3){
    if (dv4<4){
    dv4 = 3;}}
  if (dv4>4){
    dv4 = 4;}
  
  if (dv4<av4+1){
    if (dv4>av4-1){
    dv4 = random (-1,5);}}
  if (dv4<bv4+1){
    if (dv4>bv4-1){
    dv4 = random (-1,5);}}
  if (dv4<cv4+1){
    if (dv4>cv4-1){
    dv4 = random (-1,5);}}
  
  if (ev4>-2){
    if (ev4<1){
    ev4 = 0;}}
  if (ev4>1){
    if (ev4<2){
    ev4 = 1;}}
  if (ev4>2){
    if (ev4<3){
    ev4 = 2;}}
  if (ev4>3){
    if (ev4<4){
    ev4 = 3;}}
  if (ev4>4){
    ev4 = 4;}
  
  if (ev4<av4+1){
    if (ev4>av4-1){
    ev4 = random (-1,5);}}
  if (ev4<bv4+1){
    if (ev4>bv4-1){
    ev4 = random (-1,5);}}
  if (ev4<cv4+1){
    if (ev4>cv4-1){
    ev4 = random (-1,5);}}
  if (ev4<dv4+1){
    if (ev4>dv4-1){
    ev4 = random (-1,5);}}
  
  
  
  //   V5
  
  
  
  if (av5>-2){
    if (av5<1){
    av5 = 0;}}
  if (av5>1){
    if (av5<2){
    av5 = 1;}}
  if (av5>2){
    if (av5<3){
    av5 = 2;}}
  if (av5>3){
    if (av5<5){
    av5 = 3;}}
  if (av5>4){
    av5 = 4;}
  
  if (bv5>-2){
    if (bv5<1){
    bv5 = 0;}}
  if (bv5>1){
    if (bv5<2){
    bv5 = 1;}}
  if (bv5>2){
    if (bv5<3){
    bv5 = 2;}}
  if (bv5>3){
    if (bv5<4){
    bv5 = 3;}}
  if (bv5>4){
    bv5 = 4;}
  
  if (bv5<av5+1){
    if (bv5>av5-1){
    bv5 = random (-1,5);}}
  
  if (cv5>-2){
    if (cv5<1){
    cv5 = 0;}}
  if (cv5>1){
    if (cv5<2){
    cv5 = 1;}}
  if (cv5>2){
    if (cv5<3){
    cv5 = 2;}}
  if (cv5>3){
    if (cv5<4){
    cv5 = 3;}}
  if (cv5>4){
    cv5 = 4;}
  
  if (cv5<av5+1){
    if (cv5>av5+1){
    cv5 = random (-1,5);}}
  if (cv5<bv5+1){
    if (cv5>bv5-1){
    cv5 = random (-1,5);}}
  
  if (dv5>-2){
    if (dv5<1){
    dv5 = 0;}}
  if (dv5>1){
    if (dv5<2){
    dv5 = 1;}}
  if (dv5>2){
    if (dv5<3){
    dv5 = 2;}}
  if (dv5>3){
    if (dv5<4){
    dv5 = 3;}}
  if (dv5>4){
    dv5 = 4;}
  
  if (dv5<av5+1){
    if (dv5>av5-1){
    dv5 = random (-1,5);}}
  if (dv5<bv5+1){
    if (dv5>bv5-1){
    dv5 = random (-1,5);}}
  if (dv5<cv5+1){
    if (dv5>cv5-1){
    dv5 = random (-1,5);}}
  
  if (ev5>-2){
    if (ev5<1){
    ev5 = 0;}}
  if (ev5>1){
    if (ev5<2){
    ev5 = 1;}}
  if (ev5>2){
    if (ev5<3){
    ev5 = 2;}}
  if (ev5>3){
    if (ev5<4){
    ev5 = 3;}}
  if (ev5>4){
    ev5 = 4;}
  
  if (ev5<av5+1){
    if (ev5>av5-1){
    ev5 = random (-1,5);}}
  if (ev5<bv5+1){
    if (ev5>bv5-1){
    ev5 = random (-1,5);}}
  if (ev5<cv5+1){
    if (ev5>cv5-1){
    ev5 = random (-1,5);}}
  if (ev5<dv5+1){
    if (ev5>dv5-1){
    ev5 = random (-1,5);}}
  
  
  
  
  
  //   INT   INT   INT   INT  INT   INT   INT   INT   INT  INT   INT   INT   INT   INT  INT
  
  
  
  
  
  //   ESPACEMENT HORIZONTAL
  int espch;
  espch = 20;
  
  //   ESPACEMENT VERTICAL
  int espcv;
  espcv = 50;
  
  //   POINT HORIZONTAL DE DEPART
  int phd;
  phd = (width-espch*20)/2;
  
  //   POINT VERTICAL DE DEPART
  int pvd;
  pvd = (height-espcv*4)/2;
  
  //   EPAISSEUR DES LIGNES
  int epsl;
  epsl = 5;
  
  //   EPAISSEUR DES ELLIPSES
  int epse;
  epse = epsl*2;
  
  //   VITESSE DE DEPLACEMENT DES POINTS
  
  int vite;
  vite = 1;
  
  
  
  
  
  //   FLOAT ELLIPSE
  
  
  
    //   ELLIPSE FLOAT
  
  
  //   C 1
  
  if (cah1<1){
    cah1 = phd+espch*0-espch;}
  
  if (cah1 > phd+espch*0-espch-1){
    if (cah1 < width*2-1){
      cah1 = cah1+vite;}}
  if (cah1 > phd+ah1*espch){
    cah1 = width*3;}
  
  if (cav2 > pvd+espcv*av1-1){
    if (cav2 < width*2-1){
    cah1 = width*2;}}
  
  
  if (cav1<1){
    cav1 = pvd+espcv*av1;}
  
  //   C 2
  
  if (av1<av2){
  
  if (cah1>width*2+10){
    cav2 = pvd+espcv*av1;}
  
  if (cah1 > width*2-1){
    if (cah1 < width*2+1){
      cav2 = cav2+vite;}}}
  
  if (av1>av2){
  
  if (cah1>width*2+10){
    cav2 = pvd+espcv*av1;}
  
  if (cah1 > width*2-1){
    if (cah1 < width*2+1){
      cav2 = cav2-vite;}}}
  
  
  
  if (cah1>width*2){
    cah2 = phd+ah1*espch;}
  
  
  
  
  
  //   DRAW
  
  
  
  
  
  noFill ();
  strokeWeight (epsl);
  
  
  
  //   FIL 1, FIL JAUNE
  stroke (255,255,0);
  line (phd+espch*0-espch,pvd+espcv*av1,phd+ah1*espch,pvd+espcv*av1);
  line (phd+ah1*espch,pvd+espcv*av1,phd+ah1*espch,pvd+espcv*av2+(espcv/2));
  line (phd+ah1*espch,pvd+espcv*av2+(espcv/2),phd+ah2*espch+espch*5,pvd+espcv*av2+(espcv/2));
  line (phd+ah2*espch+espch*5,pvd+espcv*av2+(espcv/2),phd+ah2*espch+espch*5,pvd+espcv*av3);
  line (phd+ah2*espch+espch*5,pvd+espcv*av3,phd+ah3*espch+espch*10,pvd+espcv*av3);
  line (phd+ah3*espch+espch*10,pvd+espcv*av3,phd+ah3*espch+espch*10,pvd+espcv*av4+(espcv/2));
  line (phd+ah3*espch+espch*10,pvd+espcv*av4+(espcv/2),phd+ah4*espch+espch*15,pvd+espcv*av4+(espcv/2));
  line (phd+ah4*espch+espch*15,pvd+espcv*av4+(espcv/2),phd+ah4*espch+espch*15,pvd+espcv*av5);
  line (phd+ah4*espch+espch*15,pvd+espcv*av5,width-phd+espch*0+espch,pvd+espcv*av5);
  
  
  //   FIL 2, FIL ROUGE
  stroke (255,0,0);
  line (phd+espch*0-espch,pvd+espcv*bv1,phd+bh1*espch,pvd+espcv*bv1);
  line (phd+bh1*espch,pvd+espcv*bv1,phd+bh1*espch,pvd+espcv*bv2+(espcv/2));
  line (phd+bh1*espch,pvd+espcv*bv2+(espcv/2),phd+bh2*espch+espch*5,pvd+espcv*bv2+(espcv/2));
  line (phd+bh2*espch+espch*5,pvd+espcv*bv2+(espcv/2),phd+bh2*espch+espch*5,pvd+espcv*bv3);
  line (phd+bh2*espch+espch*5,pvd+espcv*bv3,phd+bh3*espch+espch*10,pvd+espcv*bv3);
  line (phd+bh3*espch+espch*10,pvd+espcv*bv3,phd+bh3*espch+espch*10,pvd+espcv*bv4+(espcv/2));
  line (phd+bh3*espch+espch*10,pvd+espcv*bv4+(espcv/2),phd+bh4*espch+espch*15,pvd+espcv*bv4+(espcv/2));
  line (phd+bh4*espch+espch*15,pvd+espcv*bv4+(espcv/2),phd+bh4*espch+espch*15,pvd+espcv*bv5);
  line (phd+bh4*espch+espch*15,pvd+espcv*bv5,width-phd+espch*0+espch,pvd+espcv*bv5);
  
  
  //   FIL3, FIL VERT
  stroke (175,255,25);
  line (phd+espch*0-espch,pvd+espcv*cv1,phd+ch1*espch,pvd+espcv*cv1);
  line (phd+ch1*espch,pvd+espcv*cv1,phd+ch1*espch,pvd+espcv*cv2+(espcv/2));
  line (phd+ch1*espch,pvd+espcv*cv2+(espcv/2),phd+ch2*espch+espch*5,pvd+espcv*cv2+(espcv/2));
  line (phd+ch2*espch+espch*5,pvd+espcv*cv2+(espcv/2),phd+ch2*espch+espch*5,pvd+espcv*cv3);
  line (phd+ch2*espch+espch*5,pvd+espcv*cv3,phd+ch3*espch+espch*10,pvd+espcv*cv3);
  line (phd+ch3*espch+espch*10,pvd+espcv*cv3,phd+ch3*espch+espch*10,pvd+espcv*cv4+(espcv/2));
  line (phd+ch3*espch+espch*10,pvd+espcv*cv4+(espcv/2),phd+ch4*espch+espch*15,pvd+espcv*cv4+(espcv/2));
  line (phd+ch4*espch+espch*15,pvd+espcv*cv4+(espcv/2),phd+ch4*espch+espch*15,pvd+espcv*cv5);
  line (phd+ch4*espch+espch*15,pvd+espcv*cv5,width-phd+espch*0+espch,pvd+espcv*cv5);
  
  
  //   FIL3, FIL ORANGE
  stroke (255,150,0);
  line (phd+espch*0-espch,pvd+espcv*dv1,phd+dh1*espch,pvd+espcv*dv1);
  line (phd+dh1*espch,pvd+espcv*dv1,phd+dh1*espch,pvd+espcv*dv2+(espcv/2));
  line (phd+dh1*espch,pvd+espcv*dv2+(espcv/2),phd+dh2*espch+espch*5,pvd+espcv*dv2+(espcv/2));
  line (phd+dh2*espch+espch*5,pvd+espcv*dv2+(espcv/2),phd+dh2*espch+espch*5,pvd+espcv*dv3);
  line (phd+dh2*espch+espch*5,pvd+espcv*dv3,phd+dh3*espch+espch*10,pvd+espcv*dv3);
  line (phd+dh3*espch+espch*10,pvd+espcv*dv3,phd+dh3*espch+espch*10,pvd+espcv*dv4+(espcv/2));
  line (phd+dh3*espch+espch*10,pvd+espcv*dv4+(espcv/2),phd+dh4*espch+espch*15,pvd+espcv*dv4+(espcv/2));
  line (phd+dh4*espch+espch*15,pvd+espcv*dv4+(espcv/2),phd+dh4*espch+espch*15,pvd+espcv*dv5);
  line (phd+dh4*espch+espch*15,pvd+espcv*dv5,width-phd+espch*0+espch,pvd+espcv*dv5);
  
  /*
  //   FIL3, FIL BLANC
  stroke (255);
  line (phd+espch*0-espch,pvd+espcv*ev1,phd+eh1*espch,pvd+espcv*ev1);
  line (phd+eh1*espch,pvd+espcv*ev1,phd+eh1*espch,pvd+espcv*ev2+(espcv/2));
  line (phd+eh1*espch,pvd+espcv*ev2+(espcv/2),phd+eh2*espch+espch*5,pvd+espcv*ev2+(espcv/2));
  line (phd+eh2*espch+espch*5,pvd+espcv*ev2+(espcv/2),phd+eh2*espch+espch*5,pvd+espcv*ev3);
  line (phd+eh2*espch+espch*5,pvd+espcv*ev3,phd+eh3*espch+espch*10,pvd+espcv*ev3);
  line (phd+eh3*espch+espch*10,pvd+espcv*ev3,phd+eh3*espch+espch*10,pvd+espcv*ev4+(espcv/2));
  line (phd+eh3*espch+espch*10,pvd+espcv*ev4+(espcv/2),phd+eh4*espch+espch*15,pvd+espcv*ev4+(espcv/2));
  line (phd+eh4*espch+espch*15,pvd+espcv*ev4+(espcv/2),phd+eh4*espch+espch*15,pvd+espcv*ev5);
  line (phd+eh4*espch+espch*15,pvd+espcv*ev5,width-phd+espch*0+espch,pvd+espcv*ev5);
  */
  
  
  
  
  //   ELLIPSE
  
  
  /*
  //   E 1
  noStroke ();
  fill (255,255,0);
  ellipse (cah1,cav1,epse,epse);
  ellipse (cah2,cav2,epse,epse);
  */
  
}
