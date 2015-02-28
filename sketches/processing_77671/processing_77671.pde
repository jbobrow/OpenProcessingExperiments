
String[] pop;
String[] death;
boolean displayOn;
int mo; 
PImage  cemetary;
void setup(){
  size(600,700);
  colorMode(HSB,360,100,100,100);
  int mo=3;
boolean displayOn=false;
pop = loadStrings ("Population.csv");
 death = loadStrings ("Deaths List B unadj.csv");
  println(death[1]);
 cemetary=loadImage("Cemetery.png");


  }
   void draw(){
       
        for(int i=1; i< 46 ; i++){
      
   String [] pieces = split (pop[i],",");
        float D=i*13;
        float date =parseFloat(pieces[0]);
    float gender =parseFloat(pieces[1]);
    float e0 = parseFloat(pieces[2]);
      float e14 = parseFloat(pieces[3]);
      float e59 = parseFloat(pieces[4]);
            float e1014 = parseFloat(pieces[5]);
                  float e1519 = parseFloat(pieces[6]);
                        float e2024 = parseFloat(pieces[7]);
                              float e2529 = parseFloat(pieces[8]);
                                    float e3034 = parseFloat(pieces[9]);
                                          float e3539 = parseFloat(pieces[10]);
                                                float e4044 = parseFloat(pieces[11]);
                                                      float e4549 = parseFloat(pieces[12]);
                                                            float e5054 = parseFloat(pieces[13]);
                                                                  float e5559 = parseFloat(pieces[14]);
                                                                        float e6064 = parseFloat(pieces[15]);
                                                                              float e6569 = parseFloat(pieces[16]);
                                                                                    float e7074 = parseFloat(pieces[17]);
                                                                                          float e7579 = parseFloat(pieces[18]);
                                                                                                float e8084 = parseFloat(pieces[19]);
                                                                                                      float e85 = parseFloat(pieces[20]);
                                                                                                      float total = parseFloat(pieces[21]);
          
          
          
   
float d=i*13; 
date=map(date,0,2010,0,width);  
e0=map(e0,0,100000,0,width);
e59=map(e59,0,1000000,0,width);
e14=map(e14,0,1000000,0,width);
e1014=map(e1014,0,1000000,0,width);
e1519=map(e1519,0,1000000,0,width);
e2024=map(e2024,0,1000000,0,width);
e2529=map(e2529,0,1000000,0,width);
e3034=map(e3034,0,1000000,0,width);
e3539=map(e3539,0,1000000,0,width);
e4044=map(e4044,0,1000000,0,width);
e4549=map(e4549,0,1000000,0,width);
e5054=map(e5054,0,1000000,0,width);
e5559=map(e5559,0,1000000,0,width);
e6064=map(e6064,0,1000000,0,width);
e6569=map(e6569,0,1000000,0,width);
e7074=map(e7074,0,1000000,0,width);
e7579=map(e7579,0,1000000,0,width);
e8084=map(e8084,0,1000000,0,width);
e8084=map(8084,0,1000000,0,width);
e85=map(e85,0,1000000,0,width);
total=map(total,0,1000000,0,width);

  //Bar graphs
//lightblue
 if(i%5==0){
   fill(198,18,96,25);
rect(D,0,10,e0);
 }


   fill(198,35,63,25);
rect(D,e14,10,e14);



   fill(198,46,73,25);
rect(D,e59,10,e59);
 

   fill(223,31,93,25);
rect(D+10,e1014,10,e1014);
 
 

   fill(223,37,60,25);
rect(D+10,e1519,10,e1519);

 

   fill(223,88,48,14);
rect(D+10,e2024,10,e2024);
 
 

   fill(253,16,99,25);
rect(D+20,e2529,10,e2529);


   fill(253,41,61,25);
rect(D+20,e3034,10,e3034);

   fill(253,49,36,25);
rect(D+20,e3539,10,e3539);



   fill(275,18,99,25);
rect(D+30,e4044,10,e4044);



   fill(275,69,60,25);
rect(D+30,e4549,10,e4549);


   fill(275,78,25,25);
rect(D+30,e5054,10,e5054);

 

   fill(286,25,96,25);
rect(D+40,e5559,10,e5559);

 

   fill(286,78,86,25);
rect(D+40,e6064,10,e6064);

  

   fill(286,25,96,25);
rect(D+40,e6569,10,e6569);
 
 
  
 
   fill(336,23,97,25);
rect(D+50,e7074,10,e7074);

  

   fill(336,84,50,25);
rect(D+50,e7579,10,e7579);

   fill(336,90,24,25);
rect(D+50,e8084,10,e8084);
 
 if(mouseY>height/2){
fill(271,1,99,100);
    rect(mouseX,mouseY,total,10); 
 }    
   
 

 }




   

 
 

          
          for(int i=1; i< 46 ; i++){
              String [] pieces = split (death[i],",");
              int d =i*13;
              int l = i*10;
              float date =parseFloat(pieces[0]);
             
    float cause =parseFloat(pieces[3]);
    float d0 = parseFloat(pieces[4]);
      float d14 = parseFloat(pieces[5]);
      float d59 = parseFloat(pieces[6]);
            float d1014 = parseFloat(pieces[7]);
                  float d1519 = parseFloat(pieces[8]);
                        float d2024 = parseFloat(pieces[9]);
                              float d2529 = parseFloat(pieces[10]);
                                    float d3034 = parseFloat(pieces[11]);
                                          float d3539 = parseFloat(pieces[12]);
                                                float d4044 = parseFloat(pieces[13]);
                                                      float d4549 = parseFloat(pieces[14]);
                                                            float d5054 = parseFloat(pieces[15]);
                                                                  float d5559 = parseFloat(pieces[16]);
                                                                        float d6064 = parseFloat(pieces[17]);
                                                                              float d6569 = parseFloat(pieces[18]);
                                                                                    float d7074 = parseFloat(pieces[19]);
                                                                                          float d7579 = parseFloat(pieces[20]);
                                                                                                float d8084 = parseFloat(pieces[21]);
                                                                                                      float d85 = parseFloat(pieces[22]);
                                                                                                            float total = parseFloat(pieces[23]);
                                                                                                            
                                                                                                





                                                                                   





 
   fill(138,15,99,25);
rect(d,d0,10,d0);
 

   fill(138,52,54,25);
rect(d,d14,10,d14);
 

   fill(138,45,46,25);
rect(d,d59,10,d59);

 //med blue

   fill(153,31,98,25);
rect(d+10,0,10,d1014);

 
   fill(153,45,54,25);
rect(d+10,d1519,10,d1519);

 

   fill(153,35,25,25);
rect(d+10,d2024, 10,d2024);

 

   fill(169,29,99,30);
rect(d+20,d2529,20,d2529);
 




   fill(169,43,33,100);
rect(d+20,d3539,10,d3539);



   fill(184,10,99,100);
rect(d+30,d4044,10,d4044);
 

   fill(184,29,62,25);
rect(d+30,d4549,10,d4549);
 

   fill(184,37,31,100);
rect(d+30,d5054,10,d5054);


   fill(193,83,99,100);
rect(d+40,d5559,10,d5559);

  

   fill(193,82,60,100);
rect(d+40,d6064,10,d6064);

  

   fill(193,81,30,100);
rect(d+40,d6569,10,d6569);

 
  
  
   fill(200,84,99,100);
rect(d+50,d7074,10,d7074);
 
  

   fill(200,77,61,100);
rect(d+50,d7074,10,d7579);
 

   fill(200,51,34,100);
rect(d+50,d8084,10,d8084);
          
             if(mouseX>width/2){
      if(i%50==0){
     text(pieces[3],mouseX,d++);
   }
             }
   
   
   
 rectMode(CENTER);
       if(mouseY<height/2){
         fill(345,0,0);
         rectMode(CENTER);
         rect(mouseX,mouseY,total,10);
       }
      

  
            
       }     

     
   }
   


