


goutte[] gouttes = new goutte[0];

class goutte{
  int x, y;float l;
  goutte(){
    x = floor(random(width));
    y = floor(random(height));
    l=0;
    //line(x,0,x,y);
    gouttes = (goutte[]) append(gouttes, this);
  }
  void dessine(){
    l+=0.05; l*=1.08;
    stroke(255,  (255-l));
    ellipse(x,y, l, l*0.20);
  }
  
}
class goccia{
float vy;
float ay;
float px, py;
float kx;
float oldx,oldy;
float w,h;
float d,dx;
float ky = random (0,1);
float kBounce,kkx,kSw;

void update(){

 vy+=ay;
  py+=vy;

/*  d = dist (mouseX,mouseY,px,py);

 dx = (mouseX-px);

 if (dx<0){

 px+=pow((1/d)*100,4);
 }
 if(dx>0){
   px-=pow((1/d)*100,4);
 }



if(py > height-ky){

 vy = -(vy/5);
 //py=height-50;
 kx = random (-5,5);
 

 //for (int i=0; i< 5; i++){


 w = random(5,50);
 h = random(2,10);
 noFill();
 stroke (0,20);
 ellipse (px,py,w,h);


 // }
}
*/
 if(py > height-105){
       vy = -(vy/(1*kBounce));
    kx = random (-5,5);
    py = random (height);
   }
 
  if(vy < 1){

       kx = random (0,0);
   }
}
void render(){
 
   stroke (250);
   strokeWeight(0.001+kSw);  
   line (px-kkx-kx,py,px+kkx+kx,py);
}

void init (){
 oldy = py = 0;
 oldx = px = random (0,width);
 ay = random (0.3,0.9);
 kx=0;
   }
}

int nPioggia = 100;
int frame;
int kkx,kSw;
goccia[] pioggia = new goccia [nPioggia];

 


void setup (){
 


 size (1024,576);


 for (int i=0;i<nPioggia;i++){
   pioggia[i] = new goccia();
 }


 for (int i=0;i<nPioggia;i++){
   pioggia[i].init();
}

}



void draw(){

  background(0);
  int n = int(random(1,1));
  for(int a=0;a<n;a++){
  new goutte();
  }
  for(int a=0; a<gouttes.length;a++){
    gouttes[a].dessine();
  }
  while (gouttes[0].l>50){
     gouttes = (goutte[]) subset(gouttes, 1);
  }


   if (frameCount % 1 == 0){
   frame++;
   int indice = frame % nPioggia;
   pioggia[indice].init();
   }
 


fill(0, 0, 0,30);
noStroke();
rect(0,0,width,height);

for (int i=0; i<nPioggia;i++){
pioggia[i].update();
pioggia[i].render();
}

//interazioni

if (keyPressed==true){
//incrementa lunghezza linee  
    if(key=='v'){
       for (int i=0; i<nPioggia;i++){
       pioggia[i].kkx+=1;
       }
     }
    if(key=='f'){
       for (int i=0; i<nPioggia;i++){
       pioggia[i].kkx=random(-1,20);
       pioggia[i].kSw=0.01;  
       }
     }      
    if(key=='p'){
      for (int i=0; i<nPioggia;i++){
         //if ((pioggia[i].py>300) && (pioggia[i].py<303)){
          noStroke();
          fill(255);
          rect(pioggia[i].px-1,pioggia[i].py-1,2,2);
          pioggia[i].kSw=0;
        //}
      }  
    }
    if(key=='d'){
      for (int i=0; i<nPioggia;i++){
          pioggia[i].kBounce=random(1,100);
         if (pioggia[i].vy<=0){
          pioggia[i].kSw=3;
         
          }
      }  
    }    
}    
   else{
   for (int i=0; i<nPioggia;i++){
   pioggia[i].kkx=0.01;
   pioggia[i].kSw=0;
   pioggia[i].kBounce=3;
   }  
}

//smooth();
//saveFrame("line-####.tif");
}

 void keyReleased() {
   if (keyCode == BACKSPACE) {
      for (int i=0; i<nPioggia;i++){
         pioggia[i].init();
         }
    }
     

 }
   

