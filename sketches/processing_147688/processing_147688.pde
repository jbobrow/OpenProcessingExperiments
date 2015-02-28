

// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: WOO Eunhye
// ID:201420091

int radius = 90;  


color[] colortheme = {  


  #FCF8D9, #598376, #56A798,  

  #C4DEAF, #405F57, #ACE395, 

  #2A8B68, #7CB291 


}; 


  


void setup(){ 


  size(1024, 768); 

  noStroke(); 

  smooth(); 


} 


  


  


  


void draw(){ 


  //background(0); 


    


  for(int y = height; y >= -radius; y=y-radius/2){ 


    for(int x = -radius; x < width+radius; x=x+radius){ 


      fill(getRamdom()); 

      int even = int(y % 2); 

      if(even == 0){ 


        ellipse(x, y, radius, radius); 

      } else { 


        ellipse(x+radius/2, y, radius, radius); 


      } 


    } 


  } 


    


  noLoop(); 


} 

color getRamdom(){ 

  int indice = int(random(colortheme.length));  

  return colortheme[indice]; 


} 


  


void mousePressed(){ 

  redraw(); 


} 

