




void setup(){


   size (500,500);
 
  background(0);
  
  smooth();
  
}
void draw(){
  
  pushMatrix();
  //tamaño de cara y margenes de los ojos
    ellipse(250,250,250,250);
  
     ellipse(300,200,40,40);
     ellipse(200,200,40,40);
     
   popMatrix();

pushMatrix();
//relleno de los ojos
    fill(50,50,50);
     ellipse(198,200,15,15);
     ellipse(298,200,15,15); 
   
popMatrix();

pushMatrix();
// boca
translate(0,200);
    noStroke();
    ellipse(250,100,150,75);
    fill(255);
    rect(175,20,150,75);
    
 pushMatrix();
 
 //lengua
  /*   
     fill(255,0,0,200);
    translate(220,130);
    rotate(40);
     ellipse(0,0,65,40);
     
  popMatrix();
*/
   pushMatrix();
//nariz
    stroke(1);
    noFill();
    translate(250,50);
    ellipse(0,0,50,35);
    
    popMatrix();
    
 //bigote
 
 pushMatrix();
     noFill();
     stroke(20);
     
     for(int i=173; i<=320; i=i+8){
     rect(i,80,10,15);
     //rect(250,95,10,15);
     }
  popMatrix();
  
  // orejas
  
  pushMatrix();
    fill(255);
    noStroke(); 
    ellipse(120,20,50,60);
    ellipse(380,20,50,60);
    
    popMatrix();
    
 //pelo
 pushMatrix();
     //fill(255,0,0);
     stroke(255);
     for(int a=135; a<=360; a= a+5){
      line(a,-90,a,-8);
     
     } 
       
       
}    

 
  
  
     
     
  


 
    
    
    
       
     
  
     
     
   
     
     

     
     
     
     
    
    
  
  



  
   
  
  



