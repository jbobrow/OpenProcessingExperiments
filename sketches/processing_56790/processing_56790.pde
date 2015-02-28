
/*
simple pattern
 */
float R, G, B;                           
float cOff = 0.0;
float wOff = 0.0;                      
int w = 25;                              

void setup() {

  size(880, 880);                        
  smooth();                              
  rectMode(CORNER);  
     
  background(120); 
  
                                      
  R = 100;                               
  G = 20;                                 
  B = 100;                                 


  for (int i = w/2; i < width; i = i + 90) {
    for (int j = w/2; j < height; j = j + 50) {
      

      cOff += 0.9;                       
      wOff += 0.02;                      

      float n = noise(cOff) * 255;       
      //float n_w = noise(wOff) * w;
      R = n+100;
      G = 0+300;
      B = n=800;
      fill(R, G, B);                     
      //rotate(TWO_PI * j);
      ellipse(j, i, w, w);   
      noStroke();
         
      R = n+100;
      G = 0+200;
      B = n=80;
      fill(G, G, G);                     
      //rotate(TWO_PI * j);
      rect(j, i, i, w);   
      noStroke();
      smooth();  
       R = n+100;
      G = 0+300;
      B = n=800;
      fill(B, B, B);                     
      //rotate(TWO_PI * j);
      ellipse(j, w, w, w);   
      noStroke();
     
     
    }
  }
//  saveFrame("cadre"+timestamp()+".png"); //  ----- I save my screen into a png file
}
//
//String timestamp() {                     //  ----- A method with return (here a String) to catch the time and the date a which you save your file
//  Calendar now = Calendar.getInstance();
//  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
//}


