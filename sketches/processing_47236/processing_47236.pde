
float data[] = {4.9,6.0,5.6,8,9,10,3.3};
float data1[] = {5.8,7.0,5.5,6.8,5.7,6.9,5.3,5.5};
float data2[] = {5.7,5.7,6.4,4.7,4.9,6.6,9.9};
float data3[] = {5.7,7.0,5.3};
float data4[] = {7.2,5.4,5.9,6.9,7.7,10,9.9};
float data5[] = {5.0,5.0,5.0,5.0,6.0,6.0,9.0};

PImage beer;


void setup(){
  size(600,600);
  smooth(); 
  beer = loadImage ("beerbottle.png");
  
  
}

void draw(){
   background(0);
   
  
 for(int j = 0; j < data1.length; j++){
    float c = map(data1[j], 0, 20, 200,50);
    image(beer,j*50+1,100, c, c);
    fill(255);
    //text(data1[j],j*80+10,400);
    
  } 
   for(int k = 0; k < data2.length; k++){
    float d = map(data2[k], 0, 20, 250,100);
    image(beer,k*50+1,100, d, d);
    fill(255);
    //text(data2[k],k*80+10,420);
    
  } 
  
  for(int n = 0; n < data5.length; n++){
    float g = map(data5[n], 0, 20, 400,250);
    image(beer,n*50+1,100, g, g);
    fill(255);
    //text(data5[n],n*80+10, 440);
    
  } 
  
  for(int m = 0; m < data4.length; m++){
    float f = map(data4[m], 0, 20, 350,200);
    image(beer,m*50+1,100, f, f);
    fill(255);
    //text(data4[m],m*80+10, 460);
    
  } 
  for(int I = 0; I < data.length; I++){
    float b = map(data[I], 0, 20, 150,0);
    image(beer,I*50+1,100, b, b);
    fill(255);
    //text(data[I],I*80+10,480);
    
  }
  
  
 for(int l = 0; l < data3.length; l++){
    float e = map(data3[l], 0, 20, 300,150);
    image(beer,l*50+1,100, e, e);
    fill(255);
   // text(data3[l],l*80+10, 500);
    
  } 
 
 
 
 
 
  
}


