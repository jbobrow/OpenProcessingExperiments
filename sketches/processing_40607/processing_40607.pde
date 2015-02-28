
float [] x = new float [3000];


void setup(){
  size (800,600);
  smooth();
  noStroke();
  for(int i = 0; i< x.length; i++){
    x[i] = random(-10000, 200);
  }
}

void draw(){
  background(255);
  for(int i = 0; i <x.length; i++){
    x[i] += 0.5;
    float y = i * 0.4;
  
   fill(#FF0000);//red ellipse
ellipse (x[i],y,70,70);
  }
  
  
    for(int z = 0; z <x.length; z++){
    x[z] += 0.7;
    float y = z * 0.6;
 fill(#FF4800);//orange ellipse
 ellipse (x[z],y,70,70);
    }
    
    
      for(int j = 0; j <x.length; j++){
    x[j] += 0.8;
    float y = j * 0.7;

 fill(#FEFF00);//yellow ellipse
 ellipse(x[j], y,70,70);
      }
      
      
      
        for(int p = 0; p <x.length; p++){
    x[p] += 0.9;
    float y = p * 0.8;
 fill(#00FF46);// green ellipse
 ellipse(x[p],y,70,70);
        }
        
        
          for(int v = 0; v <x.length; v++){
    x[v] += 1;
    float y = v * .9;
 fill(#0024FF);//blue ellipse
 ellipse(x[v],y,70,70);
          }
          
          
            for(int h = 0; h <x.length; h++){
    x[h] += 1.5;
    float y = h * 1;
  fill(#6100FF);// indigo ellipse
 ellipse(x[h],y,70,70);
  }
  
}

