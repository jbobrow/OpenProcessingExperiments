

//http://tetraleaf.com/p5_reference_alpha/

int eSize = 10;

size(400, 565);
background(234,232,232);
smooth();

rect(50,200,300,200);


 fill(240,148,148);
strokeWeight(3);

stroke(255);
ellipse(200, 200, 90, 90); 
ellipse(200, 200, 60, 60); 
ellipse(200, 200, 30, 30); //maru1



ellipse(130, 300, 100, 100); 
ellipse(130, 300, 80, 80); //maru2


fill(240,148,148,127);
strokeWeight(3);

ellipse(250, 400, 70, 70); 
ellipse(250, 400, 30, 30); //maru2

for(int x=0; x<=width; x+=30){
 
  if(x < 80){  
    fill(227,0,0,127); 
     noStroke(); 
  }
  else{    
    fill(10, 33, 142, 127);  
  }
  ellipse(x, 50, eSize, eSize);
}

for(int x=0; x<=width; x+=30){
 
  if(x < 120){  
    fill(227,0,0,127); 
     noStroke(); 
  }
  else{    
    fill(10, 33, 142, 127);  
  }
  ellipse(x, 100, eSize, eSize);   //blue
}


fill(255,0,0);
rect(0, 60,400,30);

fill(10,33,142);
rect(0, 63,400,25);



  
for(int x=0; x<=width; x+=30){
 
  if(x < 80){  
    fill(227,0,0,127); 
     noStroke(); 
  }
  else{    
    fill(0,0,0,127);  
  }
  ellipse(x, 460, eSize, eSize);
}
 //6

for(int x=0; x<=width; x+=30){
 
  if(x < 120){  
    fill(227,0,0,127); 
     noStroke(); 
  }
  else{    
    fill(0,0,0, 127);  
  }
  ellipse(x, 500, eSize, eSize);  //black
}

fill(255,0,0);
rect(0,467,565,27);

fill(0);
rect(0,469,565,23);










  
noStroke();   //blue sannkaku base 
fill(10, 33, 142); 
triangle(0, 0, 270, 0, 0, 175);

noStroke();    //white maru kage
fill(234,232,232);   
ellipse(105, 110, 130, 130);


noStroke();    //blue maru kage
fill(10, 33, 142);   
ellipse(100, 110, 130, 130);



noStroke();    //red maru base
fill(255, 0, 0);   
ellipse(90, 100, 130, 130);


noStroke();    //white maru 
fill(234,232,232);   
ellipse(130, 140, 80, 80);


noStroke();    
fill(0);   
//ellipse(220, 190, 5, 5);

noStroke();    // sannkaku 1 kage
fill(10, 33, 142); 
//triangle(130, 140, 160, 200, 225, 195);


noStroke();    // sannkaku 1
fill(255, 0, 0); 
triangle(117, 127, 147, 187, 217, 187);


noStroke();    // sannkaku 2 kage
fill(10, 33, 142); 
triangle(245, 215, 165, 255, 125, 205);



noStroke();    // sannkaku 2
fill(255, 0, 0); 
triangle(240, 210, 160, 250, 120, 200);



noStroke();    // sannkaku 3 kage
fill(10, 33, 142); 
triangle(155, 265, 60, 280, 125, 305);


noStroke();    // sannkaku 3
fill(255, 0, 0); 
triangle(150, 260, 60, 280, 120, 300);

noStroke();    // sannkaku 4 kage
fill(10, 33, 142); 
triangle(155, 285, 60, 385, 195, 305);

noStroke();    // sannkaku 5 kage
fill(12, 22, 124); 
triangle(190, 325, 140, 355, 190, 345);

//for(int x=0; x<=width; x+=30){
 
 // if(x <= 230){  
    fill(227,0,0,127); 
     noStroke(); 
 // }
 // else{    
    fill(12, 22, 124,127);  
 // }
 // ellipse(x, 350, eSize, eSize);
//} 
  //4

noStroke();    // sannkaku 4
fill(255, 0, 0); 
triangle(150, 280, 55, 380, 190, 300);



noStroke();    // sannkaku 5
fill(255, 0, 0); 
triangle(190, 320, 140, 350, 180, 340);

noStroke();    // sannkaku 6
fill(255, 0, 0); 
triangle(190, 320, 140, 350, 200, 340);


noStroke();   //black sannkaku base 
fill(0); 
triangle(400, 565, 130, 565, 400, 390);

noStroke();   //white shikaku/2 (2) 
fill(255); 
triangle(300, 480, 260, 480, 307, 450);

noStroke();  //black shikaku/2 (2)  
fill(0); 
triangle(307, 450, 260, 450, 260, 480);

  
noStroke();   //black shikaku/2 (1)
fill(0); 
triangle(280, 410, 260, 445, 230, 440);
 
noStroke();   //red shikaku/2 (1)
fill(255, 0, 0); 
triangle(280, 410, 230, 400, 230, 440);

noStroke(); //red shikaku kage  
fill(0);   
quad(205, 385, 230, 365, 230, 395, 205, 405);
 
noStroke(); //red shikaku   
fill(255, 0, 0);   
quad(200, 380, 225, 360, 225, 390, 200, 400);  
  

stroke(12, 22, 124);     
strokeWeight(6); 
line(20, 20, 20, 155);

stroke(12, 22, 124);     
strokeWeight(6); 
line(20, 20, 215, 20);

stroke(12, 22, 124);     
strokeWeight(6); 
line(0, 0, 22, 22); //ue fuchi

stroke(36,36,39);     
strokeWeight(6); 
line(380, 543, 380, 410); 

stroke(36,36,39);     
strokeWeight(6); 
line(380, 545, 180, 545);

stroke(36,36,39);     
strokeWeight(6); 
line(400, 565, 378, 543); //shita fuchi
  

  

  

 
   //fill(134,196,18,127);


  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  




