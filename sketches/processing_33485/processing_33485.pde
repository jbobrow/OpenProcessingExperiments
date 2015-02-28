
 float lidPos = 50;


void setup(){
 size(800,800);
 background(0);
 smooth(); 

  
  
  
}

void draw(){



    
    
    stroke(0);
    strokeWeight(3);
    fill(random(255),random(255),random(255));
    ellipse(300,300,150,75);
    fill(255);
    ellipse(300,300,75,75);
    
    

    
    
float leftEyePos = map(mouseX,0,width,275,325);

        fill(0);    
    noStroke();
    ellipse(leftEyePos,300,25,25);
    
    
  
    
    
    stroke(0);
    strokeWeight(3);
    fill(random(255),random(255),random(255));
    ellipse(500,300,150,75);
    fill(255);
    ellipse(500,300,75,75);
    
    

    
    
float leftEyePos2 = map(mouseX,0,width,475,525);

        fill(0);    
    noStroke();
    ellipse(leftEyePos2,300,25,25);
    

    
    
    
    
    fill(255);
    ellipse(400,400,20,60);
    
        stroke(255);
    line(300,500,500,500);
    
     
     

    
     
     
     if(keyPressed){
       
       if(key == 'a'){
    
      
    beginShape();

fill(230,30,30);
vertex(300, 500);
bezierVertex(350,550,470,550,500,500);

endShape();
        
       }
       
       
       else if(key == 'b'){
         
       
    beginShape();

fill(random(255),random(255),random(255),100);
vertex(300, 500);
bezierVertex(350,550,470,550,500,500);

endShape();
     }
     
     else if(key == 'c'){
     noFill();
       stroke(random(255),random(255),random(255));
     ellipse(400,400,mouseX,mouseY);}
     
     else if(key == 'd'){
     
     background(0);
     }
     
     }
 
   
 
   


        
     
     
     
  

println("leftEye" + leftEyePos);
println("rightEye" + leftEyePos2);


     if(mousePressed == true){
       
       noStroke();
   fill(0);
   
   float leftEyePos3 = map(mouseY,0,height,250,335);
   rect(0,0,width,leftEyePos3); 
   
     
}


}





        
        
   
    


     
 
  
   
    






    

    
    
    

    



