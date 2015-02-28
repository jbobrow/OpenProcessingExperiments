
int type[];
int locx[];
int locy[];
int out[];
int reqa[];
int reqb[];
int i;
int num =2;
boolean presseda[];
boolean go;
int typeb;
int from;
int connecter;
int toa;
int tob;
int bfrom;
int btoa;
int btob;
int sel=-1;
int a=1;
boolean active;
 void setup(){
 size(900,800);
 fill(0);
 background(220);
 type = new int[500] ;
locx = new int [500] ;
locy = new int [500] ;
out = new int [500] ;
reqa = new int [500] ;
reqb = new int [500] ;
presseda= new boolean[30];
line(0,100,1000,100);
fill(0,255,0);
rect(0,0,50,100);
fill(0);
text("inverter",5,30);
fill(255,0,0);
rect(50,0,50,100);
fill(0);
text("and",55,30);
fill(0,0,255);
rect(100,0,50,100);
fill(0);
text("or",120,30);

fill(150);
ellipse(175,50,50,50);
fill(0);
text("button",160,50);

fill(255,255,0);
rect(200,0,50,100);
fill(0);
text("xor",220,50);

fill(255,255,255);
rect(250,0,50,100);
fill(0);
text("detector",255,50);

out[0]=0;
out[1]=1;

         typeb = 1;
fill(0);
text(from,470,50);
stroke(0);

fill(0);
text(toa,520,50);
stroke(0);

fill(0);
text(tob,570,50);
stroke(0);

}
 void draw(){
   for(i=0;i<num;i++){
     if(locx[i]==0 && locy[i]==0){}
   else{
     if(type[i]==1){
   inverter();}
 
 if(type[i]==2){
 and();
 }
 if(type[i]==3){
 or();}
  if(type[i]==5){
 xor();}
 if(type[i]==6){
 det();}
 }}
 
 buttont(0,0,50,100);
 if(presseda[1]==true){
   typeb=1;
 }
 else{}
 buttont(50,0,50,100);
 if(presseda[2]==true){
   typeb=2;
 }
 else{}
 buttont(100,0,50,100);
 if(presseda[3]==true){
   typeb=3;
 }
 else{}
 buttont(150,0,50,100);
 if(presseda[4]==true){
   typeb=4;
 } 
 else{}
  buttont(200,0,50,100);
 if(presseda[5]==true){
   typeb=5;
 } 
 else{}
   buttont(250,0,50,100);
 if(presseda[6]==true){
   typeb=6;
 } 
 else{}
    

  if(mouseX>450 && mouseX<500 && mouseY<100){
   sel=0;}
if(mouseX>500 && mouseX<550 && mouseY<100){   
   sel=1;}
 if(mouseX>550 && mouseX<600 && mouseY<100){
   sel=2;}
 

 fill(150);
ellipse(175,50,50,50);
fill(0);


}
 
 void inverter(){
   out[i]=1-out[reqa[i]];
   if (out[i] == 1){
   fill(0,255,0);}
   else{fill(0,127,0);}
   if(locx[i]==0 && locy[i]==0){}
   else{
   rect(locx[i],locy[i],15,15);}
   noStroke();
   fill(220);
   rect(locx[i],locy[i]-11,10,10);
   stroke(0);
   fill(0);
   textSize(10);
   text(i,locx[i],locy[i]-1);
   }
   void and(){
     
     if(locx[i]==0 && locy[i]==0){}
   else{
   if(out[reqa[i]] == 1 && out[reqb[i]] ==1){
     out[i]=1;}
     else{out[i] =0;}
     fill(200+((255-200)*out[i]),0,0);
     rect(locx[i],locy[i],15,15);
        noStroke();
   fill(220);
   rect(locx[i],locy[i]-11,10,10);
   stroke(0);
      fill(0);
   textSize(10);
   text(i,locx[i],locy[i]-1);
 }}
 
    void or(){
     
     if(locx[i]==0 && locy[i]==0){}
   else{
   if(out[reqa[i]] == 1 || out[reqb[i]] ==1){
     out[i]=1;}
     else{out[i] =0;}
     fill(30,30,150+(105*out[i]));
     rect(locx[i],locy[i],15,15);
        noStroke();
   fill(220);
   rect(locx[i],locy[i]-11,10,10);
   stroke(0);
      fill(0);
   textSize(10);
   text(i,locx[i],locy[i]-1);
 }}
 
 
     void xor(){
     
     if(locx[i]==0 && locy[i]==0){}
   else{
   if((out[reqa[i]] == 1 || out[reqb[i]] ==1) && (!(out[reqa[i]] == 1 && out[reqb[i]] ==1) )){
     out[i]=1;}
     else{out[i] =0;}
     fill(155+100*(out[i]),155+100*(out[i]),0);
     rect(locx[i],locy[i],15,15);
        noStroke();
   fill(220);
   rect(locx[i],locy[i]-11,10,10);
   stroke(0);
      fill(0);
   textSize(10);
   text(i,locx[i],locy[i]-1);
 }}
   
   
   void det(){
     
     if(locx[i]==0 && locy[i]==0){}
   else{
     out[i]=out[reqa[i]]; }
if(out[i]==1){
  fill(255);
     rect(locx[i],locy[i],15,15);
     fill(255,255,0);
     ellipse(locx[i]+7.5,locy[i]+7.5,15,15);
     fill(0,255,255);
     ellipse(locx[i]+7.5,locy[i]+7.5,5,5);}
     else{
       fill(255);
     rect(locx[i],locy[i],15,15);
     fill(0,0,0);
     ellipse(locx[i]+7.5,locy[i]+7.5,15,15);
     fill(0,255,255);
     ellipse(locx[i]+7.5,locy[i]+7.5,5,5);}
        noStroke();
   fill(220);
   rect(locx[i],locy[i]-11,10,10);
   stroke(0);
      fill(0);
   textSize(10);
   text(i,locx[i],locy[i]-1);
 }
   
  void buttons(int gate){
   if( mouseX>locx[gate] && mouseX<(locx[gate]+15) && mouseY>locy[gate] && mouseY<(locy[gate]+15) && mousePressed){
    
   println("true");
      out[i] = 1-out[i];
      println(out[i]);
      println(i);}     
      fill(255);  
     rect(locx[i],locy[i],15,15);
           fill(0);
           textSize(12);
   text(out[i],locx[i]+3,locy[i]+12);
      noStroke();
   fill(220);
   rect(locx[i],locy[i]-11,10,10);
   stroke(0);
  fill(0);
   textSize(10);
   text(i,locx[i],locy[i]-1);}
   
   

void connect(int connectfrom,int connectto){
reqa[connectfrom]=connectto;
if (connectto>1){
  stroke(255,0,0);
line(locx[connectfrom],locy[connectfrom],(locx[connectto]+15+locx[connectfrom])/2,(locy[connectto]+15+locy[connectfrom])/2);
stroke(0,0,255);
line(locx[connectto]+15,locy[connectto]+15,(locx[connectto]+15+locx[connectfrom])/2,(locy[connectto]+15+locy[connectfrom])/2);
stroke(0);
}
}
void connect(int connectfrom,int connectto, int secondconnect){
reqa[connectfrom]=connectto;
reqb[connectfrom]=secondconnect;
if (connectto>1){
  stroke(255,0,0);
line(locx[connectfrom],locy[connectfrom],(locx[connectto]+15+locx[connectfrom])/2,(locy[connectto]+15+locy[connectfrom])/2);
stroke(0,0,255);
line(locx[connectto]+15,locy[connectto]+15,(locx[connectto]+15+locx[connectfrom])/2,(locy[connectto]+15+locy[connectfrom])/2);
stroke(0);}
if (secondconnect>1){
  stroke(255,0,0);
line(locx[connectfrom]+15,locy[connectfrom],(locx[secondconnect]+15+locx[connectfrom]+15)/2,(locy[secondconnect]+15+locy[connectfrom])/2);
stroke(0,0,255);
line(locx[secondconnect]+15,locy[secondconnect]+15,(locx[secondconnect]+15+locx[connectfrom]+15)/2,(locy[secondconnect]+15+locy[connectfrom])/2);
stroke(0);}}

void gate(int style, int x, int y){
  type[num]=style;
  locx[num]=x;
  locy[num]=y;
num++;}

  void mousePressed(){ 
      fill(255);
    rect(850,0,50,100);
    fill(0);
    if(mouseX>850 && mouseX<900 && mouseY<100){
      active=!active;}
    if(active==true){
      text("active",855,50);}
      else{text("inactive",855,50);}
        if (mouseButton==RIGHT){
        gate(typeb,mouseX,mouseY);}
        
     for(i=0;i<500;i++){
       if(type[i]==4){
         buttons();}}

   if(mouseButton==CENTER) {
       a++;}
  if(active==false){
  if(mouseY>100){
  if(mousePressed){
  if(mouseButton == LEFT){
 for(int i=0;i<500;i++){

   if(type[i]==4){
 
           buttons(i);}
       if(locx[i]<mouseX && locy[i]<mouseY && locx[i]+15>mouseX && locy[i]+15>mouseY){
         
         

         
         if(a==1){
           toa=i;}
           if(a==2){
           tob=i;}
           if(a==3){
           from=i;}
         a++;
       if(a>3){a=1;}}}}}}}
       textSize(12);
fill(220);
rect(550,0,50,100);
fill(0);
text(from,570,50);
stroke(0);
fill(220);
rect(500,0,50,100);
fill(0);
text(tob,520,50);
stroke(0);
fill(220);
rect(450,0,50,100);
fill(0);
text(toa,470,50);
stroke(0);

   }
         
          void buttont(int xl,int yl,int leg, int wid){
   if (mousePressed){
   if (mouseX>xl && mouseX<(xl+leg) && mouseY>yl && mouseY<(yl+wid))
   {presseda[(xl/50)+1]=true;}
   else{presseda[(xl/50)+1]=false;}}}
   
   void keyPressed(){
    textSize(12);
    if (key == 32){
      connect(from,toa,tob);
      bfrom = from;
      btoa = toa;
      btob = tob;
      toa=0;
      tob=0;
      from=0;}
      buttont(450,0,50,100);
    
      if(key == 'c'){
      from=0;
      toa=0;
      tob=0;
    a=1;}
    
      
if(mouseY<100){
if(sel==0){
   if (key>=48){
toa*=10;
toa+=key-48;}}

 
   if(sel==1){
if (key>=48){
tob*=10;
tob+=key-48;}}




   if(sel==2){
if (key>=48){
from*=10;
from+=key-48;}}

if(key=='m'){
  sel++;}
}
fill(220);
rect(550,0,50,100);
fill(0);
text(from,570,50);
stroke(0);
fill(220);
rect(500,0,50,100);
fill(0);
text(tob,520,50);
stroke(0);
fill(220);
rect(450,0,50,100);
fill(0);
text(toa,470,50);
stroke(0);
clean();

}
void clean(){
      if (key-48==0){
      for(int i=2;i<500;i++){
type[i]=0;
locx[i]=0;
locy[i]=0;
out[i]=0;
reqa[i]=0;
reqb[i]=0;}
noStroke();
num=2;
fill(220);
  rect(0,101,1000,1000);
  stroke(0);}}
