
float[] graph=new float[700];
int[] wave=new int[700];
int x=1; 
int w;
int q;
String v;
int f;
String d;
float b;
int p=190;


void setup(){
  size(700,400);
  background(255);  
  smooth();

  //////////////////generates numbers/////////////////////
  for (int i=0 ; i<width ; i++){
    w=x*2;
    d=str(w);
    q=floor((d.length()/2)/2);
    if (d.length()>4){
      v= d.substring(q,q+4);          
    }
    else{
      v=d;
    }
    //// Test if random number begins with 0/////
    //// if number begins with zero q=q-1    ///
    //// re slice and re test

    /*  while(v.startsWith("0")){
     q=q-1;
     v= d.substring(q,q+4);          
     }*/

    ///////////////////////////////////////////////




    f=int(v);
    b=map(f,1,9999,0,height);
    ///////////////////////////////////////////////

    /* 
     //Out put debug for generated values
     println(w);
     println(d);
     println(q);
     println(v);
     println(f);
     println(b);
     */
    graph[i]=b;


    x=f;  



  }





  /////////// Creates Noise Wave ////////////////
  // height plus one if previous value is lower//
  // heigth minus one if previous value higher///

  for (int i=1;i<width-2;i++){

    if (graph[i+1]<graph[i]){
      p=p+1;
    }
    else{
      p=p-1;
    }
    wave[i]=p;
  }

  ////////////////////////////////////////////////
}



void draw(){

  ///////// draws generated numbers as points/////////
  for (int i=0; i<width; i++){
    ellipse(i,graph[i],20,20);
  }
  ///////////////////////////////////////////////////

  ////////draws noise wave//////////////////////////
  for (int i=0; i<width-2; i++){
    ellipse(i,wave[i],2,2);
  }
  //////////////////////////////////////////////////
}





























