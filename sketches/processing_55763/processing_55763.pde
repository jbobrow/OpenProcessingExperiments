
class Bicho{
  
  float par1; float par2; float par3; float par4;
  float R; 
  float xpos;
  float ypos;
  float F =1;
  int aaa = 200;
  color[] paleta = {#FF9E00, #2A66DB, #262983, #FF0808};    //paleta de colores
  
  Bicho(int Rarg, float Xarg, float Yarg){
    R = Rarg;
    xpos = Xarg;
    ypos = Yarg;
    /* /REVISAR //////////////////////////
    par1 = R/3 + random(0.5)*R;  
    par2 = R/3 + random(0.5)*R;
    par3 = R/3 + random(0.5)*R;
    par4 = R/3 + random(0.5)*R;
    //REVISAR ////////////////////////// */
    par1 = 20;
    par2 = 25;
    par3 = 22;
    par4 = 30;

 }
 
 void display(float Z_){
       
    F = map(noise(xpos*0.003,ypos*0.003,Z_),0,1,-0.5,2);  //factor de deformación noise
    // F = dist(xpos,ypos,mouseX,mouseY)/400;  //factor de deformación mouse
    
    pushMatrix();
    translate(xpos,ypos);
        
    //REVISAR //////////////////////////
    fill(paleta[2],aaa);
    quad(0,0,par1*F,abs(par3-par2),par2*F,par3*F,0,par4*F);
    
    fill(paleta[1],aaa);
    quad(R,0,R,(par1/2)*F,(par2/2)*F,(par3/2)*F,par4/2,0);
    
    fill(paleta[0],aaa);
    quad(R,R,par1-R/5*F,par3,par2,(par3-R/5)*F,R,par4-R/5);
      
    fill(paleta[3],aaa);
    quad(0,R,R/2*F,(R-par4)*F,R*F,par3*F,(par2-R/8)*F,R);
    //REVISAR //////////////////////////
    
    popMatrix();
 }
    
}


