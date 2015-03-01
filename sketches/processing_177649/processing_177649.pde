
int slider,slider1=110,animat;
PFont font;
void setup(){size(800,600);
background(0);
}
void draw(){
  animat++;
  slider++;  slider1++;
background(0);
  noStroke();
 terrain(250 , 50 ,10)    ;  
    stroke(250,40);
    


    
line(0,0,mouseX-10,mouseY);
line(800,600,mouseX,mouseY+10);

line(800,0,mouseX,mouseY-10);
line(0,600,mouseX+10,mouseY);
grid(100);


aniellipse(2,9,100,250,150,25);
aniellipse(4,7,100,250,50,250);
index(250 ,250 );
//circle(550,250,30);
customgrid(0,0,10,600);
customgrid(400,400,10,600);


graph1(50,150,500,10);
graph1(10,650,525,10);

text("terreain",150,400);rect(250,400,600,2);

pushStyle();
font = loadFont("StarlinerBTN-48.vlw");
textFont(font, 15);
text("housegamejam",600,constrain(slider*20,0,450));
popStyle();}


void aniellipse(int starter,int end ,int x ,int y,int size,color col){
fill(col);
  if(millis()>starter*100)
ellipse(x,y,constrain(slider1*20,0,size),constrain(slider1*20,0,size));

}

void graph1(int num,int x ,int y ,int size){

for(int index =0;index<num;index++){
//rect(x+index*10,y,5,constrain(slider,0,100+num)%100*0.004*sin(slider+40+index)*80*size);
fill(x+index*10,num*sin(slider/760%(num*40)+index*num)*cos(slider%(num*40)*00.05+index*100)*size,(slider%(num*40))*1.5);
rect(x+index*10,y,2,num*sin(slider/760%(num*40)+index*num)*sin(slider%(num*40)*00.05+index*100)/8.8*size);
}
}

void circle(int x,int y,int size)
{
for(int index=0;index<180;index+=20){rect(x+cos(index)*145,y+sin(index)*145,
size/10,
index/2);
text(index,x+cos(index)*145,-100+y+sin(index)*145);
}
println(slider);
}
void grid(int size){for (int index=0;index<800;index++){
  stroke(250,50);
line(index*size,0,index*size,constrain(slider*20,0,800));
line(0,index*size,constrain(slider*20,0,800),index*size);
}
}
void index(int x ,int y ){
  stroke(50);
    fill(50);
line(x,y,x+25,y-25);
line(x+25,y-25,x+100,y-25);
text("ok",x+100,y-30);
}

void customgrid(int x , int y, int size,int size2){for (int index=0;index<size2/size;index++){
  stroke(250,50);
line(x+index%size2*size,y,+x+index%size2*size,constrain(slider*20,y,y+size2));

line(x,y+index*size,
constrain(slider*20,x,x+size2),y+index*size);

}}
 
            float E2 =int( random(1000000)*100000); 
            int E3 =int( random(1000000)*100000); 

int oo=int (random(10,14 ));
void terrain(int x , int y ,int resolution){
int num=60;



noStroke();
 

String bignum=""+E2;
String bignum1=""+E3;


//println(bignum+" " +second);

String res="";
for(int dx=0;dx <100;dx++)
for(int dy=0;dy <100;dy++){

String second =bignum.substring(((((slider/2+dx*dy)/oo)%12)),((slider/4+dx*dy)/oo%12)+1); 
String second1 =bignum1.substring(7/10,(7/ 10)+1); 

//println(bignum+" " +second);
int m = int(map(int(second), 0, 9, 0, 250));
int m1 = int(map(int(second1), 0, 9, 0, 250));
int index=dx*dy;int size=4;   
//println(m1*m);
fill(150,0,105);
fill(int(map(int(m1*m), 0, 10000, 0, 250)),m*m1*m1,m/m1);
rect(10+x+(10*4+(x+3*dx))%(300),y+3*dy,3,3);
//rect(10+x+(slider*4+(x+3*dx))%(300),y+3*dy,3,3);

}
}
