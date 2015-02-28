
/* Arthur Tomaz
   7/11/2013    
    
  Uma representação super complexa de halloween de  uma abobora que... pisca! */
    
                                    
                                                                      
                                                                      
                                              
                                                                      
int cor = 0;
 
  void setup(){
  size(500, 500);
  background (40);
  rectMode(CENTER);
  fill(#057904);
  rect(240, 100, 30, 50, 7);
  
  fill(#F0960F); 
  ellipseMode(CENTER);
  ellipse(250, 250, 300, 300);
 
  
}
 
void draw(){
  frameRate(1500);
  cor ++;
  if(cor > 255){
  cor = 0;
    
}
  fill(255, 255, cor, cor);
  println(cor);
  strokeWeight(4);
  triangle(165, 180, 150, 220, 180, 220);
  triangle(335, 180, 320, 220, 350, 220);
  triangle(250, 250, 235, 290, 265, 290);
  arc(250, 330, 100, 100, 0, PI, PIE );
}


