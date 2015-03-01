
int r=0,g=0,b=0; 
//rzone 12-50     yzone 50-100     gzong 100-125   cyzon 125-150 
//bzone 150-175    pzone175-infinity    white zone 0-12   

void setup(){

  size(1280,755);
  rectMode(CENTER);
}

void draw(){
  
  background(0);
  
  
  
  int c=8;
  for (int i=0;i<151;i++){
     int a=8;
    for(int j=0;j<250;j++){
      noStroke();
      //float d= sqrt((mouseX -a)*(mouseX-a) +(mouseY -c)*(mouseY-c)); 
      float d= sqrt((640 -a)*(640-a) +(377 -c)*(377-c));
      float dxy= sqrt((mouseX -a)*(mouseX-a) +(mouseY -c)*(mouseY-c));
      
      if(dxy<=20){ //black center
        float m= map(dxy, 0,12,0, 100); 
        fill(m,0,0); 
        //fill(255); 
        if(d>250){
          float ax= constrain( a, 500,750);
          float cx= constrain ( c, 250, 500); 
          ellipse(ax, cx, 5,5); 
        }else{
          ellipse(a,c,5,5);
        }
      } else if( dxy<=50){ // white to red region
        float m= map(dxy, 20,50,100, 255); 
        fill(m, 0, 0); 
        if(d>250){
         float ax= constrain( a, 500,750);
          float cx= constrain ( c, 250, 500); 
         ellipse(ax, cx, 5,5); 
        }else{
          ellipse(a,c,5,5);
        }
      }else if( dxy<=100){ // red to yellow region
        float m= map(dxy, 60, 100, 0, 255); 
        fill(255,m, 0);
         if(d>250){
          float ax= constrain( a, 500,750);
          float cx= constrain ( c, 250, 500); 
          ellipse(ax, cx, 5,5); 
        }else{
          ellipse(a,c,5,5);
        }
      }else if(dxy<=112){ //black ring
        fill(0);
        if(d>250){
          float ax= constrain( a, 480,725);
          float cx= constrain ( c, 250, 500); 
          ellipse(ax, cx, 5,5); 
        }else{
          ellipse(a,c,5,5);
        }
      } else if( d<=125){ //yellow to green region 
        //float m= 255- map(d, 100, 125, 0, 255); 
        float m= map(dxy, 100, 125, 0, 255); 
        //fill(m, 255, 0); 
        fill(255, 255, m); 
         ellipse(a,c,5,5);
      }else if( d<=150){  // green to cyan region 
        //float m= map(d, 125, 150, 0, 255); 
        //fill(0,255, m); 
         fill(255);
        ellipse(a,c,5,5);
      }else if( d<=175){  //cyan to blue region 
        //float m= 255- map( d, 150, 175, 0,255); 
        //fill(0,m, 255); 
         fill(255);
         ellipse(a,c,5,5);
      }else if (d<=225){ //blue to purple region 
        //float m= map(d, 175, 225, 0, 255); 
        //fill(m, 0, 255); 
        fill(255);
         ellipse(a,c,5,5);
      }
      
     // if(d>225){
     //   fill(0);
     //    ellipse(a,c,8,8);
      //}
      
      
      a+=5; 
    }
    c+=5;
  }
  
  
}






