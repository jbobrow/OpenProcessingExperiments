
int c=0;
int x1=26;
int x2=30;
int x3= 23;
int x4=18;
int x5=40;
int x6=55;
int x7=90;
int x8=80;
int x9=100;
int x10=70;
int x11=30;
int x12=110;
int x13=14;
int x14=63;
int x15=20;
int x16=34;
int x17=30;
int x18=90;
int x19=75;
int x20=104;
int x21=200;
int x22=50;
int x23=34;
int x24=100;
int x25=120;
int x26=120;



float b=400;
PFont myfont;

void setup(){
 size(650,650);
 myfont= loadFont("AndaleMono-48.vlw");
 
}

void draw(){
  background(255,255,255);

  fill(211,224,232);
  
  textFont(myfont);
  textSize(x1);
  text("Space Available",10,30);    

  textSize(x2);
  text("Space Available",64,70);   
  
  textSize(x3);
  text("Space Available",220,35);   
  
   textSize(x4);
  text("Space Available",500,30);   
  
   textSize(x5);
  text("Space Available",380,64);   
  
   textSize(x6);
  text("Space Available",10,119);   
  
   textSize(x7);
  text("Space Available",510,150);   
  
   textSize(x8);
  text("Space Available",-390,200);      
  
   textSize(x9);
  text("Space Available",340,214);   
  
   textSize(x10);
  text("Space Available",-60,265);   
  
   textSize(x11);
  text("Space Available",300,300);   
  
   textSize(x12);
  text("Space Available",580,310);   
  
   textSize(x13);
  text("Space Available",17,283);   
  
   textSize(x14);
  text("Space Available",45,335);   
  
   textSize(x15);
  text("Space Available",135,300);   
  
   textSize(x16);
  text("Space Available",330,140);   
  
   textSize(x17);
  text("Space Available",23,147);   
  
   textSize(x18);
  text("Space Available",360,440);   
  
  textSize(x19);
  text("Space Available",1,455); 
  
  textSize(x20);
  text("Space Available",-41,510); 
  
  textSize(x21);
  text("Space Available",230,600); 
  
  textSize(x22);
  text("Space Available",-60,550); 
  
  textSize(x23);
  text("Space Available",50,580); 
 
  textSize(x24);
  text("Space Available",-110,637); 
 
  textSize(x25);
  text("Space Available",3,400); 
 
  textSize(x26);
  text("Space Available",3,400); 
  
  
}

void keyPressed(){
  if(c==0){x1=0;}
   else if(c==10){x2=0;}
    else if(c==20){x3=0;}
     else if(c==3){x4=0;}
     else if(c==4){x5=0;}
     else if(c==5){x6=0;}
     else if(c==19){x7=0;}
     else if(c==17){x8=0;}
     else if(c==8){x9=0;}
     else if(c==6){x10=0;}
     else if(c==21){x11=0;}
     else if(c==11){x12=0;}
     else if(c==12){x13=0;}
     //else if(c==13){x14=0;}
     else if(c==14){x15=0;}
     else if(c==15){x16=0;}
     else if(c==16){x17=0;}
     else if(c==7){x18=0;}
     else if(c==18){x19=0;}
     else if(c==9){x20=0;}
     else if(c==2){x21=0;}
     else if(c==1){x22=0;}
     else if(c==22){x23=0;}
     else if(c==23){x24=0;}
     else if(c==24){x25=0;}
     else if(c==25){x26=0;}
     
     
  c = c + 1; //c++;
}


