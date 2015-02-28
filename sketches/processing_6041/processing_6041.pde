
//Original Sketch - Fotinos "Color" Sketch and edited sketch created by Laura Song
PFont fontA; 
 
float x[] = new float[100]; //x position 
float y[] = new float[100]; //y position 
float s[] = new float[100]; //size of particles 
int hmd = 4000; 
int counter = hmd; 
float xd[] = new float[hmd]; //x dusks position 
float yd[] = new float[hmd]; //y dusks position 
float rd[] = new float[hmd]; //y dusks position 
float gd[] = new float[hmd]; //y dusks position 
 
 
float ed[] = new float[hmd]; //e 
float ux; //speedx 
float uy; //speedy 
float maxs = 150; //max particle size 
float mins = 5;  //min particle size 
int i,j = 0; //counters 
int hm = 10; //how many ellipses 
int pressed = 0; //0 = not pressed, 1 = pressed 
int d = 1; //triger 
float ppx,ppy; 
float closer; 
int a; 
 
void setup(){ 
  size(600,600); 
   
  fontA = loadFont("BodoniOrnamentsITCTT-48.vlw"); 
  textAlign(CENTER); 
  textFont(fontA, 32); 
   
  ellipseMode(CENTER); 
  noStroke(); 
  smooth(); 
   
  for(i = 0; i<hmd; i++){ 
    xd[i] = random(0,width); 
    yd[i] = random(0,height);     
    ed[i] = 1; 
  } 
 
//start with random values 
  for(i = 0; i<40; i++){ 
   x[i] = random(0,height); 
   y[i] = random(0,height); 
   s[i] = random(mins,maxs);  
  }  
  hm = 40; 
//background(50,80,150); 
} 
 
void draw(){ 
  //println(hm); 
  //background(50,80,150); 
  fill(55,10,10,100); 
  ellipse(-1,-1,width+6,height+6); 
   
 
   
  float sumx=0,sumy=0,sums=0; 
  for(i = 0; i<hm; i++){ 
    ifoutofthescetch(); 
    if (s[i] > maxs){s[i] = maxs;} 
    if (s[i] < mins){s[i] = mins;} 
    sums = sums+s[i]; 
    sumx = sumx+x[i]*s[i];//*s[i]; 
    sumy = sumy+y[i]*s[i];//*s[i]; 
    spherescreation(); 
    //linescreation(); 
     
    ux = dist(x[i],0,ppx,0)-map(s[i],mins,maxs,40,0); 
    uy = dist(y[i],0,ppy,0)-map(s[i],mins,maxs,40,0); 
    float dia = 500; 
    float minus = 1; 
    if (x[i] < ppx-minus){ x[i] = x[i] + ux/dia;} 
    if (y[i] < ppy+minus){ y[i] = y[i] + uy/dia;} 
    if (x[i] > ppx-minus){ x[i] = x[i] - ux/dia;} 
    if (y[i] > ppy+minus){ y[i] = y[i] - uy/dia;} 
     
    closer = 5000; 
    for(j = 0; j<hm; j++){ 
      if (j!=i){ 
        nocolision();  
        closerline(); 
      } 
    } 
    mousemoove(); 
     
    closerlineshow(); 
 
  }    
    noStroke(); 
    ellipse(x[hm],y[hm],s[hm],s[hm]); 
   
   
  //center of gravity 
  if (hm>0){ 
    ppx = sumx/sums; 
    ppy = sumy/sums; 
  } 
  addellipse(); 
  dust(); 
 
 
//  noStroke(); 
//  fill(70,100,170,255); 
//  rect(width-100,400,500,200); 
//   
//  fill(50,80,150,250); 
//  text(counter,width-50,height/2+10); 
} 
 
void dust(){ 
 for(i = 0; i<hmd; i++){ 
   if (ed[i] == 1){ 
     for (j = 0; j<hm; j++){ 
        
       if (dist(xd[i],yd[i],x[j],y[j])<+(s[j])/2){ 
         rd[i]=255; 
         gd[i]=map(s[j],mins,maxs,10,255); 
         float plus = -dist(xd[i],yd[i],x[j],y[j]) +(s[j])/2+random(-4,4); 
         float xk = 0; 
         if(xd[i]<x[j]+xk){xd[i]=xd[i]-plus;} 
         if(yd[i]<y[j]+xk){yd[i]=yd[i]-plus;} 
         if(xd[i]>x[j]-xk){xd[i]=xd[i]+plus;} 
         if(yd[i]>y[j]-xk){yd[i]=yd[i]+plus;} 
       }  
           
     } 
     if (yd[i]>height){yd[i]=random(0,width); xd[i] = random(0,10);} 
     if (xd[i]>height){xd[i]=0;} 
     if (xd[i]<0){yd[i]=random(0,width); xd[i] = random(0,10);} 
     if (yd[i]<0){yd[i]=height-100;} 
      
     xd[i] = xd[i] + 5+random(-1,1); 
     yd[i]=yd[i]+random(-1,1); 
      
     if (rd[i]>10){rd[i]=rd[i]-4;} 
     if (gd[i]>10){gd[i]=gd[i]-4;} 
      
     fill(rd[i],map(xd[i],0,width,0,255),255-gd[i]); 
     ellipse(xd[i],yd[i],2,2);  
   } 
 } 
 
} 
 
void ifoutofthescetch(){ 
   
  if (x[i]<0){x[i]=width;} 
  if (y[i]<0){y[i]=height;} 
  if (x[i]>width){x[i]=0;} 
  if (y[i]>height){y[i]=0;} 
   
} 
 
void closerlineshow(){ 
 stroke(50,80,150); 
 line(x[i],y[i],x[a],y[a]);   
} 
 
void closerline(){ 
   
 if (closer > dist(x[i],y[i],x[j],y[j])){closer = dist(x[i],y[i],x[j],y[j]); a=j;} 
 
   
   
} 
 
void nocolision(){ 
  //for(int b=0; b<4; b++){ 
    if (dist(x[i],y[i],x[j],y[j])<+(s[i]+s[j])/2){ 
      float plus = -dist(x[i],y[i],x[j],y[j]) +(s[i]+s[j])/3+1;//20; 
      float xk = 0; 
      if(x[i]<x[j]+xk){x[i]=x[i]-plus;} 
      if(y[i]<y[j]+xk){y[i]=y[i]-plus;} 
      if(x[i]>x[j]-xk){x[i]=x[i]+plus;} 
      if(y[i]>y[j]-xk){y[i]=y[i]+plus;} 
      stroke(255,50); 
      noFill(); 
      rect(x[i],y[i],s[i],s[i]); 
      noStroke(); 
       
      float pl=1; 
      s[i]=s[i] + pl; 
      s[j]=s[j] - pl; 
      if (s[j]>s[i]){s[i] = s[i] - 2*pl; s[j] = s[j] + 2*pl;} 
 
    } 
  //} 
} 
 
void mousemoove(){ 
  if (mousePressed && (mouseButton == LEFT)) { 
    d=0; 
    if (dist(mouseX,mouseY,x[i],y[i])<s[i]/2){ 
      x[i] = mouseX; 
      y[i] = mouseY; 
    }   
  } 
} 
 
void addellipse(){ 
  if (hm<100){ 
  if (pressed == 0){ 
    if (mousePressed && (mouseButton == LEFT)) { 
      d=1; 
      x[hm] = mouseX; 
      y[hm] = mouseY;  
      pressed = 1; 
    } 
  } 
    if (mousePressed && (mouseButton == LEFT)) {  
    ellipse(x[hm],y[hm],dist(mouseX,mouseY,x[hm],y[hm])*2,dist(mouseX,mouseY,x[hm],y[hm])*2); 
  } 
  } 
} 
 
void mouseReleased() { 
if (hm<98){ 
  if (d==1){ 
    s[hm] = dist(mouseX,mouseY,x[hm],y[hm])*2; 
    if (s[hm] > maxs){s[hm] = maxs;} 
    if (s[hm] < mins){s[hm] = mins;} 
    pressed = 0; 
    hm++; 
  }   
} 
} 
 
void spherescreation(){ 
  noStroke(); 
  fill(20+map(s[i],10,200,0,255),20,map(s[i],mins,maxs,0,20),150); 
  ellipse(x[i],y[i],s[i],s[i]); 
   
  //fill(map(s[i],10,200,100,255),60,map(s[i],mins,maxs,0,30),100); 
  //ellipse(x[i]+random(-2,2),y[i]+random(-2,2),s[i]+random(-2,20),s[i]+(random(-2,20))); 
} 
 
void linescreation(){ 
  stroke(255-map(dist(x[i],y[i],ppx,ppy),0,(width+height)/2,0,255),0,0,250); 
  line(x[i],y[i],ppx,ppy); 
  noStroke(); 
} 


