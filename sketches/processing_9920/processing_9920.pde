
void setup (){
  
 size ( 600, 800); 
background (0); 
smooth(); 
stroke(255); 
strokeWeight(2); 
  
; 
}



void draw () {
  
  
  
  
   

//line (0,height/7, width,height/7); 

//line (0, (height/8)*2, width,(height/8)*2); 

//line (0, (height/7)*3, width, (height/7)*3); 

//line (0, height/7*4, width,height/7*4); 

//line (0,height/6*4, width,height/6*4);

//line (0, height/6*5, width,height/6*5); 


for (int i=0; i<=width; i+=3){
//Reihe 1
translate(i,0); 
line (random(0,25),0, random(0,25),height/7);
line (random(0,50),0, random(0,50),height/7);
line (random(0,70),0, random(30,100),height/7);

//Reihe 2
line (random(0,25),height/7, random(0,25),(height/8)*2); 
line (random(0,50),height/7, random(0,50),(height/8)*2);
line (random(0,70),height/7, random(30,100),(height/8)*2);

//Reihe 3
line (random(0,25),(height/8)*2, random(0,25),(height/7)*3); 
line (random(0,50),(height/8)*2, random(0,50),(height/7)*3);
line (random(0,70),(height/8)*2, random(30,100),(height/7)*3);


//Reihe 4
line (random(0,25),(height/7)*3, random(0,25),(height/7*4)); 
line (random(0,50),(height/7)*3, random(0,50),(height/7*4));
line (random(0,70),(height/7)*3, random(30,100),(height/7*4));


//Reihe 5
line (random(0,25),(height/7*4), random(0,25),(height/6*4)); 
line (random(0,50),(height/7*4), random(0,50),(height/6*4));
line (random(0,70),(height/7*4), random(30,100),(height/6*4));

//Reihe 5
line (random(0,25),(height/6*4), random(0,25),(height/6*5)); 
line (random(0,50),(height/6*4), random(0,50),(height/6*5));
line (random(0,70),(height/6*4), random(30,100),(height/6*5));


//Reihe 5
line (random(0,25),(height/6*5), random(0,25),height); 
line (random(0,50),(height/6*5), random(0,50),height);
line (random(0,70),(height/6*5), random(30,100),height);

}

noLoop(); 
}



