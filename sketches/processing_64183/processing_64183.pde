
PVector [] liste;
int n=6;




void setup(){
  size(500,500);
  liste=new PVector[n+1];
  smooth();
}




void draw(){

  for(int i=0;i<width;i=i+100){
   line(i,0,i,height);
   }
  for(int i=0;i<height;i=i+100){
   line(0,i,width,i);
   }
 if (mousePressed){println("  ");delay(100); background(100);
  for(int i=0;i<width;i=i+100){
   line(i,0,i,height);
   }
  for(int i=0;i<height;i=i+100){
   line(0,i,width,i);
   }
 fill(255);
 poly();
 println(liste);
 trace();
 fill(0);
 text(str(aire()),width/2,height/2);
 }
}

int test(PVector A,PVector B,PVector C){
    if (-(B.y-A.y)*(C.x-A.x)+(B.x-A.x)*(C.y-A.y)<0){return -1;}
    if (-(B.y-A.y)*(C.x-A.x)+(B.x-A.x)*(C.y-A.y)>0){return 1;}
   return 0; 
  
}

boolean tester(int u){

    for(int i=0;i<u-2;i++){
      if (test(liste[i],liste[i+1],liste[u])*test(liste[i],liste[i+1],liste[i+2])<0){return false;}
    }

    if (test(liste[u-2],liste[u-1],liste[0])*test(liste[u-2],liste[u-1],liste[u])<0){return false;}
   
    for(int i=1;i<u-1;i++){
      if (test(liste[u-1],liste[u],liste[0])*test(liste[u-1],liste[u],liste[i])<0){return false;}
    } 

    for(int i=2;i<u;i++){
      if (test(liste[0],liste[u],liste[1])*test(liste[0],liste[u],liste[i])<0){return false;}
    } 

    return true;
}

void poly(){
  liste[0]= rand(0);
  liste[n]=new PVector(liste[0].x,liste[0].y);

  liste[1]= rand(1);

  liste[2]= rand(2);

 
  int i=3;
  while (i<n){
      print("  "+str(i));
      int nbtest=0;
      liste[i]=rand(i);
      
      while (!tester(i) && nbtest<30){
        nbtest=nbtest+1;
        liste[i]=rand(i);
      }  
    if (nbtest==30 && i>2){i=i-1;}else{i=i+1;}
    
  } 
   
  
}

void trace(){
  pushMatrix();
  translate(width/2,height/2); 
  beginShape();
  for(int i=0;i<n;i++){
   vertex(liste[i].x,liste[i].y);
  }
  endShape(CLOSE);
  popMatrix();
}

PVector rand(int a){
  int r=int(random(width/2));

  return new PVector(int(r*cos(radians(a*360.0/n))),int(r*sin(radians(a*360.0/n))));
}
  
float aire(){
  float aire=0;
   for(int i=0;i<n;i++){
    aire=aire+liste[i].x*liste[i+1].y-liste[i].y*liste[i+1].x; 
   }
   return abs(aire/2);
  
}

 void keyPressed(){
save("loading.gif");   
 }
   

