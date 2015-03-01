
int midax, miday;
int numdibuixos;
int form=1;
  
void setup()
{
  size(700, 700);
  numdibuixos = 20;
  midax = width/numdibuixos;
  miday = height/numdibuixos;
 
  
  
}
  
void draw()
{
  background(0);
   if(form==1){
    for (int j = 0; (j < height/numdibuixos); j++)
    {
      for (int i = 0; i < width/numdibuixos; i++)
      {
            fill(#FF9DFE);
        quad(i*midax,j*miday,i*midax+midax/4, j*miday+miday/4,i*midax+midax/4, j*miday+miday/2,i*midax,j*miday+miday/4);
        quad(i*midax+midax/2, j*miday+miday/4,i*midax+midax/2, j*miday,i*midax+3*midax/4, j*miday+miday/4,i*midax+3*midax/4, j*miday+miday/2);
        quad(i*midax,j*miday+3*miday/4,i*midax+midax/4, j*miday+miday/2,i*midax+midax/4, j*miday+3*miday/4,i*midax,j*miday+4*miday/4);
        quad(i*midax+midax/2, j*miday+3*miday/4,i*midax+midax/2, j*miday+4*miday/4,i*midax+3*midax/4, j*miday+3*miday/4,i*midax+3*midax/4, j*miday+miday/2);
       
       
        quad(i*midax+midax/4, j*miday+miday/4,i*midax+midax/4, j*miday+miday/2,i*midax+midax/2, j*miday+miday/4,i*midax+midax/2, j*miday);
         
        quad(i*midax+3*midax/4, j*miday+miday/4,i*midax+3*midax/4, j*miday+miday/2,i*midax+4*midax/4, j*miday+miday/4,i*midax+4*midax/4, j*miday);
         
        quad(i*midax+midax/4, j*miday+miday/2,i*midax+midax/4, j*miday+3*miday/4,i*midax+midax/2, j*miday+4*miday/4,i*midax+midax/2, j*miday+3*miday/4);
        
       quad(i*midax+3*midax/4, j*miday+miday/2,i*midax+3*midax/4, j*miday+3*miday/4,i*midax+4*midax/4, j*miday+4*miday/4,i*midax+4*midax/4, j*miday+3*miday/4);
        
             
       }
    }
}
else{
  for (int j = 0; (j < height/numdibuixos); j++)
    {
      for (int i = 0; i<=j; i++)
      {
            fill(#92009B);
             quad(i*midax,j*miday,i*midax+midax/4, j*miday+miday/4,i*midax+midax/4, j*miday+miday/2,i*midax,j*miday+miday/4);
        quad(i*midax+midax/2, j*miday+miday/4,i*midax+midax/2, j*miday,i*midax+3*midax/4, j*miday+miday/4,i*midax+3*midax/4, j*miday+miday/2);
        quad(i*midax,j*miday+3*miday/4,i*midax+midax/4, j*miday+miday/2,i*midax+midax/4, j*miday+3*miday/4,i*midax,j*miday+4*miday/4);
        quad(i*midax+midax/2, j*miday+3*miday/4,i*midax+midax/2, j*miday+4*miday/4,i*midax+3*midax/4, j*miday+3*miday/4,i*midax+3*midax/4, j*miday+miday/2);
        
       
        quad(i*midax+midax/4, j*miday+miday/4,i*midax+midax/4, j*miday+miday/2,i*midax+midax/2, j*miday+miday/4,i*midax+midax/2, j*miday);
         
        quad(i*midax+3*midax/4, j*miday+miday/4,i*midax+3*midax/4, j*miday+miday/2,i*midax+4*midax/4, j*miday+miday/4,i*midax+4*midax/4, j*miday);
         
        quad(i*midax+midax/4, j*miday+miday/2,i*midax+midax/4, j*miday+3*miday/4,i*midax+midax/2, j*miday+4*miday/4,i*midax+midax/2, j*miday+3*miday/4);
        
       quad(i*midax+3*midax/4, j*miday+miday/2,i*midax+3*midax/4, j*miday+3*miday/4,i*midax+4*midax/4, j*miday+4*miday/4,i*midax+4*midax/4, j*miday+3*miday/4);
            
        }
      }
  
}
} 
void keyPressed(){
 
    if (key == 'j')  form = 2;
  else form = 1;
}
