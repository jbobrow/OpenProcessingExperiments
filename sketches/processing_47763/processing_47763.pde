
// > greater than
// >= greater or equal to 

// < less than
// <= less than or equal to 

// == is equal to 
// != is not equal to

// && = and
// || = or 


void setup() { 
  
  size(300,300); 
  
  // create a score between 0 and 100
  float score = random(100); 
  // print it to the console
  println(score); 
  
  // make a grade variable
  char grade = 'b'; 
  
  // if grade is 'b' or 'a' then tell me I'm awesome
  // || is OR
  if((grade == 'b') || (grade == 'a')) { 
     println("YAY! You are teh awesomez!!1!1!"); 
  }
  
  // single check between values 
  // && is AND
  if((score>40) && (score<60)) { 
  
       println("YOU GOT C"); 
   
  }
  
 // multiple if... else if... else example
  
  if(score <= 20) { 
    
    println("FAIL"); 
    
  } else if(score < 40) { 
    
    println("D - RUBBISH");  
    
  } else if(score < 60) { 
    
    println("C - boring"); 
    
  } else if (score < 80) { 
    
    println("B - soo close"); 
    
  } else {
    
    println("A - show off!");  
    
  }
  
  
 
  
}

void draw() {
  
  // change colour dependent on mouseX position
  
  if(mouseX< width/3) { 
    
    background(255,255,0); 
    
  } else if(mouseX<width*2/3) {
    
    background(255,0,255); 
    
  } else { 
  
    background(0,255,255); 
  }  
  
  
}
                
