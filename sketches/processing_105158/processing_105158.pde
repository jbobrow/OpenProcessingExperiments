
void setup(){
  size(900,1000);
  
}

float X = 450;
float Y = 500;
int []count = new int[50];

//arrays for rectangles

int []rectx = {350,425,425,350,425,250,275,625,550,250,110,110,250,
110,110,550,715,715,550,715,715,250};

int []recty = {425,50,800,250,300,250,350,250,350,125,125,250,
800,800,700,125,125,250,800,800,700,625};

int []rectw = {200,50,50,200,50,25,75,25,75,100,75,75,100,75,75,
100,75,75,100,75,75,400};

int []recth = {150,150,150,50,50,200,25,200,25,75,75,50,75,75,50,
75,75,50,75,75,50,125};

//arrays for lines

int []LX1 = {50,50,850,50,50,850,50,200,50,200,200,200,850,850,700,700,700,700};
int []LY1 = {50,50,50,950,950,950,350,350,650,650,450,550,350,650,350,650,450,550};
int []LX2 = {850,50,850,850,50,850,200,200,200,200,0,0,700,700,700,700,900,900};
int []LY2 = {50,350,350,950,650,650,350,450,650,550,450,550,350,650,450,550,450,550};



void draw(){ 
  fill(255,255,0);
  arc(X,Y,50,50,QUARTER_PI,5.5);
  background(0);


 if(keyPressed){
   if (key == CODED) {
     if(keyCode == UP ){
       checkCoordUp();
       //lineBoarders(X,Y);
     Y=Y-5;
    fill(255,255,0);
    arc(X,Y,50,50,QUARTER_PI,5.5);
  }
  if(keyCode == DOWN){
    checkCoordDown();
    //lineBoarders(X,Y);
    Y=Y+5;
    fill(255,255,0);
arc(X,Y,50,50,QUARTER_PI,5.5);
  }
  if(keyCode == RIGHT){
    checkCoordRight();
    //lineBoarders(X,Y);
    X=X+5;
    fill(255,255,0);
 arc(X,Y,50,50,QUARTER_PI,5.5);
  }
  if(keyCode == LEFT){
    checkCoordLeft();
    //lineBoarders(X,Y);
    X=X-5;
    fill(255,255,0);
  arc(X,Y,50,50,QUARTER_PI,5.5);
  }
  
  if(X > 950){
    X = 0;
  }
  
  if(X < -50){
    X = 900;
  }
  
  if(Y > 1050){
    Y = 0;
  }
  
  if(Y < -0){
    Y = 1000;
  }
    
}
}

  
  
  
  size(900,1000);
background(0);
strokeWeight(5);
stroke(0,0,255);
noFill();



line(50,50,850,50);
line(50,50,50,350);

line(850,50,850,350);

line(50,950,850,950);
line(50,950,50,650);

line(850,950,850,650);

line(50,350,200,350);

line(200,350,200,450);

line(50,650,200,650);

line(200,650,200,550);
line(200,450,0,450);
line(200,550,0,550);

line(850,350,700,350);
line(850,650,700,650);

line(700,350,700,450);
line(700,650,700,550);
line(700,450,900,450);
line(700,550,900,550);

/*rect(350,425,200,150);
rect(425,50,50,150);
rect(425,800,50,150);

rect(350,250,200,50);
rect(425,300,50,50);

rect(250,250,25,200);
rect(275,350,75,25);

rect(625,250,25,200);
rect(550,350,75,25);

rect(250,125,100,75);
rect(110,125,75,75);
rect(110,250,75,50);

rect(250,800,100,75);
rect(110,800,75,75);
rect(110,700,75,50);

rect(550,125,100,75);
rect(715,125,75,75);
rect(715,250,75,50);

rect(550,800,100,75);
rect(715,800,75,75);
rect(715,700,75,50);

rect(250,625,400,125);*/

/*int []rectx = {350,425,425,350,425,250,275,625,550,250,110,110,250,
110,110,550,715,715,550,715,250};

int []recty = {425,50,800,250,300,250,350,250,350,125,125,250,
800,800,700,125,125,250,800,800,700,625};

int []rectw = {200,50,50,200,50,25,75,25,75,100,75,75,100,75,75,
100,75,75,100,75,75,400};

int []recth = {150,150,150,50,50,200,25,200,25,75,75,50,75,75,50,
75,75,50,75,75,50,125};

*/


for (int h=0;h<22;h++){
rect(rectx[h],recty[h],rectw[h],recth[h]);
}


fill(250,240,0);
noStroke();



ellipse(50,500,7,7);
ellipse(100,500,7,7);
ellipse(150,500,7,7);
ellipse(200,500,7,7);
ellipse(250,500,7,7);
ellipse(300,500,7,7);
ellipse(600,500,7,7);
ellipse(650,500,7,7);
ellipse(700,500,7,7);
ellipse(750,500,7,7);
ellipse(800,500,7,7);
ellipse(850,500,7,7);

ellipse(80,90,7,7);
ellipse(80,136,7,7);
ellipse(80,185,7,7);
ellipse(80,230,7,7);
ellipse(80,277,7,7);
ellipse(80,323,7,7);

ellipse(820,90,7,7);
ellipse(820,136,7,7);
ellipse(820,185,7,7);
ellipse(820,230,7,7);
ellipse(820,277,7,7);
ellipse(820,323,7,7);

ellipse(80,680,7,7);
ellipse(80,726,7,7);
ellipse(80,772,7,7);
ellipse(80,818,7,7);
ellipse(80,865,7,7);
ellipse(80,910,7,7);

ellipse(820,680,7,7);
ellipse(820,726,7,7);
ellipse(820,772,7,7);
ellipse(820,818,7,7);
ellipse(820,865,7,7);
ellipse(820,910,7,7);

ellipse(172.5,230,7,7);
ellipse(265,230,7,7);
ellipse(357.5,230,7,7);
ellipse(450,230,7,7);
ellipse(542.5,230,7,7);
ellipse(635,230,7,7);
ellipse(727.5,230,7,7);

ellipse(172.5,770,7,7);
ellipse(265,770,7,7);
ellipse(357.5,770,7,7);
ellipse(450,770,7,7);
ellipse(542.5,770,7,7);
ellipse(635,770,7,7);
ellipse(727.5,770,7,7);


//restrictions

if(Y<=65){
  Y=65;
}

if(Y>935){
  Y=935;
}

if(X<70 && Y<410){
  X=X;
  Y=Y;
}

float[] y ={500,500,500,500,500,500,500,500,500,500,500,500,
90,136,185,230,277,323,90,136,185,230,277,323,
680,726,772,818,865,910,680,726,772,818,865,910,
230,230,230,230,230,230,230,770,770,770,770,770,770,770};

float[] x = new float[50];
x[0]=50;
x[1]=100;
x[2]=150;
x[3]=200;
x[4]=250;
x[5]=300;
x[6]=600;
x[7]=650;
x[8]=700;
x[9]=750;
x[10]=800;
x[11]=850;
x[12]=80;
x[13]=80;
x[14]=80;
x[15]=80;
x[16]=80;
x[17]=80;
x[18]=820;
x[19]=820;
x[20]=820;
x[21]=820;
x[22]=820;
x[23]=820;
x[24]=80;
x[25]=80;
x[26]=80;
x[27]=80;
x[28]=80;
x[29]=80;
x[30]=820;
x[31]=820;
x[32]=820;
x[33]=820;
x[34]=820;
x[35]=820;
x[36]=172.5;
x[37]=265;
x[38]=357.5;
x[39]=450;
x[40]=542.5;
x[41]=635;
x[42]=727.5;
x[43]=172.5;
x[44]=265;
x[45]=357.5;
x[46]=450;
x[47]=542.5;
x[48]=635;
x[49]=727.5;
for(int i=0;i<50;i++){
  if(X > x[i]-20 && X < x[i]+20 && Y > y[i]-20 && Y < y[i]+20){
  count[i]=1;

}
for(int j=0;j<50;j++){
if(count[j] == 1){
fill(0);
  ellipse(x[j],y[j],15,15);
}
}
}




stroke(0);
line(430,49,470,49);
line(430,51,470,51);
line(430,949,470,949);
line(430,951,470,951);
line(430,299,470,299);
line(430,301,470,301);
line(276,355,276,370);
line(274,355,274,370);
line(624,355,624,370);
line(626,355,626,370);



  fill(255,255,0);
  noStroke();
  arc(X,Y,25,25,QUARTER_PI,5.5);
  
}


/*void lineBoardersUD(float xTemp,float yTemp){
  for(int l=0;l<18;l++){
    if(X>LX2[l]-20 && X<LX1[l]+20 && Y<LY2[l]+20 && Y>LY1[l]+20){
      X = xTemp ;
      Y = yTemp;
      println("on line");
    }
  }
}

void lineBoardersLR(){
  for(int l=0;l<18;l++){
    if(){
      
      
      
    }
  }
}*/


void checkCoordUp(){
  println("inC");
    for(int z=0;z<22;z++){
   if(X>rectx[z]-5 && X<rectx[z] + rectw[z]+5 && Y<recty[z] + recth[z] + 20 && Y>recty[z] + recth[z] -20){
   Y = recty[z]+recth[z]+20;
   println("X "+rectx[z]+"Y "+recty[z]+"h "+recth[z]);  
   
  }
 }
}
void checkCoordDown(){
for(int z=0;z<22;z++){
if(X>rectx[z]-5 && X<rectx[z] + rectw[z]+5 && Y>recty[z]-20 && Y<recty[z]+5  ){
   Y = recty[z]-20;
   println("X "+rectx[z]+"Y "+recty[z]+"h "+rectw[z]);
      
  }
 }
}

void checkCoordLeft(){
for(int z=0;z<22;z++){
if(X<rectx[z]+rectw[z]+20 &&X>rectx[z]+rectw[z]-20 && Y>recty[z]-5 && Y<recty[z] + recth[z]+5){
  X = rectx[z]+rectw[z]+20;
  
  }
 }
}

void checkCoordRight(){
for(int z=0;z<22;z++){
if(X<rectx[z]+20 &&X>rectx[z]-20 && Y>recty[z] && Y<recty[z] + recth[z]){
  X = rectx[z]-20;
  
  }
 }
}






