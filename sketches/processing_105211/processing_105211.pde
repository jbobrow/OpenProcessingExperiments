
PImage cookie;
 PImage boy;
 PImage broccoli;
float[]c=new float [100];
float[]v=new float [100];
float[]e=new float [100];
 int m = 0;
int bx= 50 ;
int by= 50 ;
int cx= 50 ;
int score= 0;
int start = 1;
int L=0;
int y1= 0;
int y2= 0;
int y3= 0;
int y4= 0;
int y6= 0;
int y5= 0;
int y7= 0;
int y8= 0;
int y9= 0;
int y11= 0;
int y12= 0;
int y13= 0;
int y14= 0;
int y16= 0;
int y15= 0;
int y17= 0;
int y18= 0;
int y19= 0;
int y10= 0;
   int y = 0;
int points=0 ;

 
 
void setup(){
size(800,700);

cookie=loadImage("Unknown-1.jpeg");
cookie.resize(70,70);
broccoli=loadImage("Unknown.jpeg");
broccoli.resize(20,20);


   if (keyPressed==true){
     start=1;
   }
   if (start==1){
     startpage();
     setMillis();
   }
     
}
  
 


//every thing on the start page
void startpage(){ 
PImage cookieb;
//the b in cookieb is for the background
cookieb=loadImage("images.jpeg");
cookieb.resize(800,700);
background(cookieb);
//image(boy,400,400);
PImage boy;
boy = loadImage("Unknown.png");
boy.resize(70,120);
image(boy,400,500);
fill(0);
textSize(30);
text("Welcome to Cookie Catcher!",0,100);
text("Use the arrow keys to move and eat cookies. ",0,300);
text("Press the space to start.",0,200);
text("Your score is how many nibbles you took of the cookie. ",0,400);
}

void level_1(){

image(cookie,8,0);
boy = loadImage("Unknown.png");
boy.resize(70,120);
        rect(200,150,500,50);
  background(57,34,34);
   image(cookie,c[1],y+5);

  start=0;
   if(millis()>m+0){
      image(cookie,c[0],y++);
   }
if(millis()>m+9000){
         image(cookie,c[2],y1++);
}
points=score;
    if(millis()>m+7000){
            image(cookie,c[3],y2++);
    }
    if(millis()>m+10000){
               image(cookie,c[1],y3++);
    }
    textSize(30);
    text("Level 1",50,50);
             text("score:"+points,650,50);
   image(boy,bx,by);
   by=580; 
 if(by>y-70&&by<y+70&&bx>c[0]-70&&bx<c[0]+70){
   score++;
   
}
 if(by>y1-70&&by<1+70&&bx>c[2]-70&&bx<c[2]+70){
   score++;
   
}
 if(by>y2-70&&by<y2+70&&bx>c[3]-70&&bx<c[3]+70){
   score++;
   
}
 if(by>y3-70&&by<y3+70&&bx>c[1]-70&&bx<c[1]+70){
   score++;
   
}
if(y>701&&y1>701&&y2>701&&y3>701&&score<75){
  deathpage();
}
if(score>75){
level_2();

}
}
//level2
void level_2(){
println("level2");
image(cookie,8,0);
boy = loadImage("Unknown.png");
boy.resize(70,120);
        rect(200,150,500,50);
  background(57,0,0);
   image(cookie,c[1],y+5);
   textSize(30);
text("Points needed: 605",350,50);
  start=0;
   if(millis()>m+0){
    
points=score;
     
      if(millis()>m+14000){
               image(cookie,c[4],y4++);
    }
      if(millis()>m+17000){
               image(cookie,c[5],y5++);
    }
      if(millis()>m+20000){
               image(cookie,c[6],y6++);
    }
    textSize(30);
    text("Level 2",50,50);
             text("score:"+points,650,50);
   image(boy,bx,by);
   by=580; 
 if(by>y-70&&by<y+70&&bx>c[0]-70&&bx<c[0]+70){
   score++;
   
}
 if(by>y1-70&&by<1+70&&bx>c[2]-70&&bx<c[2]+70){
   score++;
   
}
 if(by>y2-70&&by<y2+70&&bx>c[3]-70&&bx<c[3]+70){
   score++;
   
}
 if(by>y3-70&&by<y3+70&&bx>c[1]-70&&bx<c[1]+70){
   score++;
   
}
 if(by>y4-70&&by<y4+70&&bx>c[4]-70&&bx<c[4]+70){
   score++;
   
}
 if(by>y5-70&&by<y4+70&&bx>c[5]-70&&bx<c[5]+70){
   score++;
   
}
 if(by>y6-70&&by<y4+70&&bx>c[6]-70&&bx<c[6]+70){
   score++;
   
}
if(y>701&&y1>701&&y2>701&&y3>701&&score<605&&y4>701&&y5>701&&y6>701){
  deathpage();
}
if(score>305){
level_3();

}
}
}
void level_3(){
println("level3");
image(cookie,8,0);
boy = loadImage("Unknown.png");
boy.resize(70,120);
        rect(200,150,500,50);
  background(57,0,0);
   image(cookie,c[1],y+5);
   textSize(30);
text("Points needed: 1005",350,50);
  start=0;

      if(millis()>m+24000){
               image(cookie,c[7],y7++);
    }
      if(millis()>m+27000){
               image(cookie,c[8],y8++);
    }
      if(millis()>m+30000){
               image(cookie,c[9],y9++);
    }
      if(millis()>m+33000){
               image(cookie,c[10],y10++);
    }
    textSize(30);
    text("Level 3",50,50);
             text("score:"+points,650,50);
   image(boy,bx,by);
   by=580; 
 if(by>y-70&&by<y+70&&bx>c[0]-70&&bx<c[0]+70){
   score++;
   
}
 if(by>y1-70&&by<1+70&&bx>c[2]-70&&bx<c[2]+70){
   score++;
   
}
 if(by>y2-70&&by<y2+70&&bx>c[3]-70&&bx<c[3]+70){
   score++;
   
}
 if(by>y3-70&&by<y3+70&&bx>c[1]-70&&bx<c[1]+70){
   score++;
   
}
 if(by>y4-70&&by<y4+70&&bx>c[4]-70&&bx<c[4]+70){
   score++;
   
}
 if(by>y5-70&&by<y5+70&&bx>c[5]-70&&bx<c[5]+70){
   score++;
   
}
 if(by>y6-70&&by<y4+70&&bx>c[6]-70&&bx<c[6]+70){
   score++;
   
}
 if(by>y7-70&&by<y7+70&&bx>c[7]-70&&bx<c[7]+70){
   score++;
   
}
 if(by>y8-70&&by<y8+70&&bx>c[8]-70&&bx<c[8]+70){
   score++;
   
}
 if(by>y9-70&&by<y9+70&&bx>c[9]-70&&bx<c[9]+70){
   score++;
   
}
 if(by>y10-70&&by<y10+70&&bx>c[10]-70&&bx<c[10]+70){
   score++;
   
}
if(y7>701&&y8>701&&y9>701&&y10>701&&score<1005){
  deathpage();
}
if(score>1005){
level_4();

}
}
void level_4(){
println("level4");
image(cookie,8,0);
boy = loadImage("Unknown.png");
boy.resize(70,120);
        rect(200,150,500,50);
  background(57,0,0);
   image(cookie,c[1],y+5);
   textSize(30);
text("Points needed: 2000",350,50);
  start=0;


points=score;

    
   
    if(millis()>m+27000){
            image(cookie,c[11],y11++);
    }
    if(millis()>m+30000){
               image(cookie,c[12],y12++);
    }
      if(millis()>m+34000){
               image(cookie,c[13],y13++);
    }
      if(millis()>m+37000){
               image(cookie,c[14],y14++);
    }
      if(millis()>m+40000){
               image(cookie,c[15],y15++);
    }
      if(millis()>m+44000){
               image(cookie,c[16],y16++);
    }
      if(millis()>m+47000){
               image(cookie,c[17],y17++);
    }
      if(millis()>m+50000){
               image(cookie,c[18],y18++);
    }
      if(millis()>m+53000){
               image(cookie,c[19],y19++);
    }
    textSize(30);
    text("Level 4",50,50);
             text("score:"+points,650,50);
   image(boy,bx,by);
   by=580; 
 if(by>y-70&&by<y+70&&bx>c[0]-70&&bx<c[0]+70){
   score++;
   
}
 if(by>y1-70&&by<1+70&&bx>c[2]-70&&bx<c[2]+70){
   score++;
   
}
 if(by>y2-70&&by<y2+70&&bx>c[3]-70&&bx<c[3]+70){
   score++;
   
}
 if(by>y3-70&&by<y3+70&&bx>c[1]-70&&bx<c[1]+70){
   score++;
   
}
 if(by>y4-70&&by<y4+70&&bx>c[4]-70&&bx<c[4]+70){
   score++;
   
}
 if(by>y5-70&&by<y5+70&&bx>c[5]-70&&bx<c[5]+70){
   score++;
   
}
 if(by>y6-70&&by<y4+70&&bx>c[6]-70&&bx<c[6]+70){
   score++;
   
}
 if(by>y7-70&&by<y7+70&&bx>c[7]-70&&bx<c[7]+70){
   score++;
   
}
 if(by>y8-70&&by<y8+70&&bx>c[8]-70&&bx<c[8]+70){
   score++;
   
}
 if(by>y9-70&&by<y9+70&&bx>c[9]-70&&bx<c[9]+70){
   score++;
   
}
 if(by>y10-70&&by<y10+70&&bx>c[10]-70&&bx<c[10]+70){
   score++;
   
}
 if(by>y11-70&&by<y11+70&&bx>c[11]-70&&bx<c[11]+70){
   score++;
   
}
 if(by>y12-70&&by<y12+70&&bx>c[12]-70&&bx<c[12]+70){
   score++;
   
}
 if(by>y13-70&&by<y13+70&&bx>c[13]-70&&bx<c[13]+70){
   score++;
   
}
 if(by>y14-70&&by<y14+70&&bx>c[14]-70&&bx<c[14]+70){
   score++;
   
}
 if(by>y15-70&&by<y15+70&&bx>c[15]-70&&bx<c[15]+70){
   score++;
   
}
 if(by>y16-70&&by<y16+70&&bx>c[16]-70&&bx<c[16]+70){
   score++;
   
}
 if(by>y17-70&&by<y17+70&&bx>c[17]-70&&bx<c[17]+70){
   score++;
   
}
 if(by>y18-70&&by<y18+70&&bx>c[18]-70&&bx<c[18]+70){
   score++;
   
}
 if(by>y19-70&&by<y19+70&&bx>c[19]-70&&bx<c[19]+70){
   score++;
   
}


if(y17>701&&y18>701&&y19>701&&y11>701&&score<2000){
  deathpage();
}
if(score>2000){
winpage();

}
}



  void draw(){ 

    if (keyPressed==true&&key==' '){         

  L=1;
}
if(L!=0){
  level_1();
}
if(keyPressed==true){
  

if(keyCode == RIGHT){
  bx=bx+5;
} 
if(keyCode== LEFT){
  
    bx = bx-5;
}
}
  }






void winpage(){
  background(0,255,0);
  textSize(20);
  text("You won my game!!",50,50);
}
void deathpage(){

  background(255,0,0);
 
  textSize(25);
  text("You failed the game,press any key to reset. ",100,100);
  if(key!=' '){
start++;  
L=1;
m = 0;
 bx= 50 ;
by= 50 ;
cx= 50 ;
 score= 0;
//start = 1;
L=0;
y1= 0;
 y2= 0;
 y3= 0;
y4= 0;
y6= 0;
y5= 0;
y7= 0;
 y8= 0;
 y9= 0;
 y11= 0;
 y12= 0;
 y13= 0;
 y14= 0;
 y16= 0;
y15= 0;
 y17= 0;
 y18= 0;
 y19= 0;
 y10= 0;
y = 0;
 points=0 ;
} 

if(start>0){
  startpage();
  setMillis();
 // start=0;
}
}
        
void setMillis(){
m = millis(); 
for(int p =0;p<99;p++){
  c[p]=random(700);
    v[p]=c[p]-50;
        e[p]=c[p]+50;


}
}



