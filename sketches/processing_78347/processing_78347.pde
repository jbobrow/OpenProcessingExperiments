
Worm[] worm=new Worm[10];
Mandi2[] mandi2=new Mandi2[7];
Pulpo[] pulpo=new Pulpo[6];


void setup(){
  size(800,800);
smooth();
ellipseMode(CENTER);
for(int i=0;i<worm.length;i++){
worm[i]=new Worm();
}
for(int i=0;i<pulpo.length;i++){
pulpo[i]=new Pulpo();
}
for(int i=0;i<mandi2.length;i++){
mandi2[i]=new Mandi2();
}


}
void draw(){
 background(0);
 
worm[0].display();
mandi2[0].display();
pulpo[0].display();
for(int i=0;i<worm.length;i++){

  worm[i].bewegung();

  
}
  for(int i=0;i<mandi2.length;i++){
    mandi2[i].bewegung();

  }
  
  for(int i=0;i<pulpo.length;i++){
    pulpo[i].bewegung();

  }
  

  

 }


 
  

class Mandi{
  float theta =0.0;
   float lm=0;
float ym;
float y3;
float theta3;
float compr3;
int xspacing = 1;   // How far apart should each horizontal location be spaced
float dx;
float period =1; 
float xm=0;
float transX;
float angle; 
float turnY=0;
  float angulo;
  float b;
  float adj;
  float opp;
  float y;
  float x;
  float l;
  float slope;
  
  
 Mandi(float _angulo,float _b,float _adj,float _opp,float _slope){
   
    slope=_slope;
  angulo=_angulo;
  b=_b;
  adj=_adj;
  opp=_opp;
      dx = (TWO_PI / period) * xspacing;

  
 }


void display(float slope){
  
  transX+=1;
  xm+=.15;

scale(.5);


 pushMatrix();
           // rotate(angulo);

    translate(adj*b,opp*b);
       rotate(radians(angle));

  
    

 pushMatrix();
  fill(250,200);
  stroke(250);

 rectMode(CENTER);
    translate(0,0+y3);
rotate(ym/2.5);
 beginShape();
 vertex(-10,-10);
 vertex(-10,-6);
 vertex(-17,-6);
 vertex(-27,-2);
 vertex(-20,-10);
 endShape(CLOSE);
 
 beginShape();
 vertex(-10,10);
 vertex(-10,6);
 vertex(-17,6);
 vertex(-27,2);
 vertex(-20,10);
 endShape(CLOSE);
 
 rect(0,0,20,20);
     y3=cos(theta3)*40;
compr3=sin(theta3)*.048;
    theta3+=.1;//+noise(theta3)*.01;
    theta3+=dx;

  cuerpo(20,0,21);//+compr*5);
 popMatrix();
 
 theta+=0.1;
 
 
 
popMatrix();
 
 }


void cuerpo(int cel,float pos,float rest){
  if(cel>=1){
    pushMatrix();
       rotate(ym*0.05);

   translate(pos+rest,ym);
   //pushMatrix();
      rect(pos,0,cel,cel);
  ellipse(pos,0,2,2);

   //popMatrix();
  cuerpo(cel-1,pos+20-rest,rest);
  pushMatrix();
  stroke(255);
    line(pos-rest,0,pos,0);
popMatrix();
   ym=sin(theta)*0.8;//coletazo

  popMatrix();
  }

}
}

 
 



class Mandi2{
  float theta =0.0;
   float l=0;
       float b=0;
       float count=0;
       int bew=0;
       float opp=0;
       float angulo;
       float slope=0;
float d=0.001;
float hyp=25;
float adj=0;
float prueb;
float prueby;
float xspeed=.1;
float yspeed=.1;
float dy=0.001;
Mandi mandi;

 Mandi2(){
       float x =theta;
       mandi = new Mandi(d,b,adj,opp,slope);

 } 
  void  bewegung(){
      
    if(keyPressed){
  if(key=='e'||key=='E'){
     fill(200,0,0);
     ellipse(0,0,10,10);

     dy+=0.1;
 }
 if(key=='k'||key=='K'){

     dy-=0.1;
     
 }
    }
    pushMatrix();
    b+=0.01;
    prueb+=xspeed+d;
    prueby+=yspeed+dy;
    
    
        translate(prueb,prueby);
        slope=d+dy;
        println(slope);
        
        angulo=atan(dy/d);
        pushMatrix();
        translate(0,0);
        
        
        popMatrix();
    count=(count+1)% random(300,500);
    if(count<=2){
             d+=random(-0.5,0.1);
             dy+=random(-0.5,0.1);
    }
    
    
      float x =theta;
if(prueb>width){
  prueb=0;
}
if(prueby>height){
  prueby=0;
}
if(prueb<=0){
  prueb=width;
}
if(prueby<=0){
  prueby=height;
}

    theta +=0.07;
 noStroke();
     fill(250,200);
  rotate(angulo);
  mandi.display(slope);
//worm2.update();
      popMatrix();
stroke(250);



  }
  void display(){
    
   
  
  }
  
  
}
  
  

class Pulpo{
  
  
    float theta =0.0;
   float l=0;
       float b=0;
       float count=0;
       int bew=0;
       float opp=0;
       float angulo;
       float slope=0;
float d=0.001;
float hyp=25;
float adj=0;
float prueb;
float prueby;
float xspeed=.1;
float yspeed=.1;
float dy=0.001; 
  Pulpo2 pulpo2;
  
  
  Pulpo(){
    
     float x =theta;
       pulpo2 = new Pulpo2(d,b,adj,opp,slope);
    
  }
  
  void  bewegung(){
    pushMatrix();
    b+=0.01;
    prueb+=xspeed+d;
    prueby+=yspeed+dy;
    
    if(keyPressed){
  if(key=='p'||key=='P'){
     fill(200,0,0);
     ellipse(0,0,10,10);

     dy+=0.1;
 }
 if(key=='ñ'||key=='Ñ'){

     dy-=0.1;
     
 }
    }  
    
        translate(prueb,prueby);
        slope=d+dy;
        println(slope);
        
        angulo=atan(dy/d);
        println(dy);
        pushMatrix();
        translate(0,0);
        
        
        popMatrix();
    count=(count+1)% random(300,500);
    if(count<=2){
             d+=random(-0.5,0.1);
             dy+=random(-0.5,0.1);
    }
    
    
      float x =theta;
if(prueb>width){
  prueb=0;
}
if(prueby>height){
  prueby=0;
}
if(prueb<=0){
  prueb=width;
}
if(prueby<=0){
  prueby=height;
}

    theta +=0.07;
 noStroke();
     fill(250,200);
  rotate(angulo);
  pulpo2.display(slope);
//worm2.update();
      popMatrix();
stroke(250);


pushMatrix();
translate(750,60);
angulo=degrees(angulo);
rotate(radians(angulo));

ellipse(0,0,50,50);
line(0,0,25,0);





popMatrix();
  }
  void display(){
    
   
  
  }
  
  
  
  
  
}
class Pulpo2{
  
  
  
  
  float theta =0.0;
float theta2 =0.0;
float r;

   float l=0;
float y;
float y2;

float x1;
float y1;
float cx1;
float cy1;
float cx2;
float cy2;
float x2;
float y2b;
float expansion=10;
float retroceso=-1;
float xSpeed=1;
float xSpeedR=1;
float retroceso2;
float totalSpeed=10;
float change=3;
float changeR=1;
float xSpeedT=-1;
float changeT=0;
float head;

float slope;
  
  float angulo;
  float b;
  float adj;
  float opp;
  
  
  
  
  
  
  
  
  
  
  
  
  


 Pulpo2(float _angulo,float _b,float _adj,float _opp,float _slope){
  
  
    slope=_slope;
  angulo=_angulo;
  b=_b;
  adj=_adj;
  opp=_opp;
  
  
  
}

void display(float slope){
  
  
 scale(0.3);
    totalSpeed-=xSpeedT*changeT;

 
 //ellipse(totalSpeed,0,80,20);
 translate(-totalSpeed,0);
 pushMatrix();
 fill(200,50,50,80);
 stroke(255);

 println(totalSpeed);
  translate(-xSpeed,0);

 rectMode(CENTER);

 beginShape();
 vertex(-10,-10);
 vertex(-10,-6);
 vertex(-17,-6);
 vertex(-27,-2);
 vertex(-20,-10);
 endShape(CLOSE);
 
 beginShape();
 vertex(-10,10);
 vertex(-10,6);
 vertex(-17,6);
 vertex(-27,2);
 vertex(-20,10);
 endShape(CLOSE);
 head=map(retroceso,-63,127,12,40);

 ellipse(0,0,40,head);
 //cuerpo(200,0,0);
 x1=0;
 y1=0;
 cx1=26;
 cy1=21;
 cx2=26;
 cy2=21;
 x2=10;
 y2b=0;
 
// cx2=mouseX/8;
// cy2=mouseY/8;
// print(cx2);
// print(",");
// println(cy2);
// 
 if (mousePressed==true){
   cx1=mouseX/8;
 cy1=mouseY/8;
 
 }
 

expansion+=xSpeed*change;
retroceso -=xSpeedR*changeR;

retroceso2=map(retroceso,-63,127,0,-200);
if(expansion>=200){
  change=-1;
  
    changeR=-1;
    changeT=1;
}
if(expansion<=10){
    change=8;
    changeR=8;
changeT=8;

}


float ending;
ending=map(retroceso,-63,127,0,10);



stroke(250);
 noFill();
 for(int i=0;i<6;i++){
    
    
    
   bezier(x1, y1-i*.5, cx1, cy1-(i*5)-retroceso2, cx2, cy2-(i*5), x2+expansion, y2-i*.5);
      bezier(x1, y1+i*.5, cx1, -cy1+(i*5)+retroceso2, cx2, -cy2+(i*5), x2+expansion, y2+i*.5);

bezier(x1, y1-i*.5, cx1, cy1-(i*5)-retroceso2*.3, cx2, cy2-(i*5), x2+expansion, y2-i*.5);
bezier(x1, y1+i*.5, cx1, -cy1+(i*5)+retroceso2*.3, cx2, -cy2+(i*5), x2+expansion, y2+i*.5);

   int steps = 10;

   for (int j = 0; j <= steps; j++) {
  float t = j / float(steps);
//  float x = bezierPoint(x2+expansion, cx2, cx1,x1 , t);
//  float y = bezierPoint(y2-i*.5,cy2-(i*5) , cy1-(i*5)-retroceso2,y1-i*.5 ,t);
//  
//  float xp = bezierPoint(x2+expansion, cx2, cx1, x1, t);
//  float yp = bezierPoint(y2-i*.5, -cy2+(i*5), -cy1+(i*5)+retroceso2, y1+i*.5, t);
//  
//  float xc = bezierPoint(x2+expansion, cx2, cx1, x1, t);
//  float yc= bezierPoint(y2-i*.5, cy2-(i*5), cy1-(i*5)-retroceso2*.3, y1-i*.5, t);
//  
//  float xd = bezierPoint(x2+expansion, cx2, cx1, x1, t);
//  float yd= bezierPoint(y2+i*.5, -cy2+(i*5), -cy1+(i*5)+retroceso2*.3, y1+i*.5, t);
//  
//  fill(200,50,50,50);
//  ellipse(x, y,1+j, 1+j);
//    ellipse(xp, yp,1+j, 1+j);
//        ellipse(xc, yc,1+j, 1+j);
//        ellipse(xd, yd,1+j, 1+j);
//                ellipse(xd, 0,1+j, 1+j);




} 
 }
 popMatrix();
 theta+=0.01;
 theta2+=0.1;

 }
  
}

class Worm{
  float theta =0.0;
   float l=0;
       float b=0;
       float count=0;
       int bew=0;
       float opp=0;
       float angulo;
       float slope=0;
float d=0.001;
float hyp=25;
float adj=0;
float prueb;
float prueby;
float xspeed=.1;
float yspeed=.1;
float dy=0.001;
Worm2 worm2;

 Worm(){
       float x =theta;
       worm2 = new Worm2(d,b,adj,opp,slope);

 } 
  void  bewegung(){
    pushMatrix();
    b+=0.01;
    prueb+=xspeed+d;
    prueby+=yspeed+dy;
    
    if(keyPressed){
  if(key=='r'||key=='R'){
     fill(200,0,0);
     ellipse(0,0,10,10);

     dy+=0.1;
 }
 if(key=='l'||key=='L'){

     dy-=0.1;
     
 }
    }  
    
        translate(prueb,prueby);
        slope=d+dy;
        println(slope);
        
        angulo=atan(dy/d);
        println(dy);
        pushMatrix();
        translate(0,0);
        
        
        popMatrix();
    count=(count+1)% random(300,500);
    if(count<=2){
             d+=random(-0.5,0.5);
             dy+=random(-0.5,0.5);
    }
    
    
      float x =theta;
if(prueb>width){
  prueb=0;
}
if(prueby>height){
  prueby=0;
}
if(prueb<=0){
  prueb=width;
}
if(prueby<=0){
  prueby=height;
}

    theta +=0.07;
 noStroke();
     fill(250,200);
  rotate(angulo);
  worm2.display(slope);
//worm2.update();
      popMatrix();
stroke(250);



  }
  void display(){
    
   
  
  }
  
  
  
  
  
}
class Worm2{
  float angulo;
  float b;
  float adj;
  float opp;
  float y;
  float x;
  float l;
  float slope;
  
 Worm2(float _angulo,float _b,float _adj,float _opp,float _slope){
   slope=_slope;
  angulo=_angulo;
  b=_b;
  adj=_adj;
  opp=_opp;
 } 
  
  void display(float slope){
    scale(.5);
        pushMatrix();
           // rotate(angulo);

    translate(adj*b,opp*b);
    
    
    for(int i=0;i<20;i++){
    fill(250,50);

   x+=0.005+abs(slope*.005);
   l+=0.0007;
   float p=0;//(sin(l))*10;
   //println(p);
   float y=(sin(x)*4/2)+5;
   ellipse(i*1,p,16+y*1.2,16+y*1.2);
      ellipse(i*2,p,16+y*4/5,16+y*4/5);
      ellipse(i*2-10,p,16+y*4/5,16+y*4/5);
fill(0,50);
 ellipse(108-70+y*0.5,p+2.8,2,2);
  ellipse(108-70+y*.5,p-2.8,2,2);

  }
      fill(0,200,0,50);

    ellipse(10,0,40,7);
    
        popMatrix();

    
    
    
  }
  
  void update(){
    

    
  }
  
}


